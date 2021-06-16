package com.newdeal.footballMaster.model;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
@Builder
public class MainBanner {


	private String id;
	private String link;
	private String image_m;
	private String image;

}
