Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9586B9EB3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 19:36:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc9UK-00023l-HX; Tue, 14 Mar 2023 14:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pc9UH-00023U-QU
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 14:35:06 -0400
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pc9UF-0003fo-Gj
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 14:35:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678818903; x=1710354903;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cXqmczWjn19LHKxt2MSOXLTC9XRnbMsRrIEQk6Zso9U=;
 b=SsKoEZHqx0KyEu8fxj2X7ywxacS8Z14lPFtvi+fykpoOYKyewGaALO6M
 rNl3npUce/FFjyvwWdQDWhgCmCg9EXwCbS/FArqqXBG6SaBnB+InlShaw
 0urBHixHZsGq8JWKJeqagyDsedk9WaR1T4yonD/HYAZPPmu3SBOWusQE2
 FIyyT3MGwSFAg33ApST5+1oIJ4IgN7MFNuwCfKpn9YEXVvbJaj3xAcAxV
 +ly2WfeCWmryDMXKDLvJJdRZGh1OSmTo8ELu3d1KICVflWTCgCUPXGDRb
 rs5BcKmjVV9GNn5588/Fxred21Db2YR68A42MHr1UbQXJ4hjqSpSAa1tO w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="317162234"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="317162234"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 11:35:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="681530813"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="681530813"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO [10.212.15.215])
 ([10.212.15.215])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 11:34:59 -0700
Message-ID: <cdb8b864-98c3-b4d4-ceec-b0e71fefb10c@intel.com>
Date: Tue, 14 Mar 2023 11:34:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [qemu PATCH] hw/cxl/cxl_device: Replace magic number in CXLError
 definition
Content-Language: en-US
To: Fan Ni <fan.ni@samsung.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Cc: "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 "alison.schofield@intel.com" <alison.schofield@intel.com>,
 "dave@stgolabs.net" <dave@stgolabs.net>,
 Adam Manzanares <a.manzanares@samsung.com>,
 "bwidawsk@kernel.org" <bwidawsk@kernel.org>,
 "gregory.price@memverge.com" <gregory.price@memverge.com>,
 "hchkuo@avery-design.com.tw" <hchkuo@avery-design.com.tw>,
 "cbrowy@avery-design.com" <cbrowy@avery-design.com>,
 "ira.weiny@intel.com" <ira.weiny@intel.com>
References: <CGME20230314165324uscas1p231d1f8aeceb1b8c118abb76e915e7614@uscas1p2.samsung.com>
 <20230314165317.1550986-1-fan.ni@samsung.com>
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20230314165317.1550986-1-fan.ni@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=dave.jiang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 3/14/23 9:53 AM, Fan Ni wrote:
> Replace the magic number 32 with CXL_RAS_ERR_HEADER_NUM for better code
> readability and maintainability.
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>   include/hw/cxl/cxl_device.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> index d589f78202..34fde62eac 100644
> --- a/include/hw/cxl/cxl_device.h
> +++ b/include/hw/cxl/cxl_device.h
> @@ -235,7 +235,7 @@ REG64(CXL_MEM_DEV_STS, 0)
>   typedef struct CXLError {
>       QTAILQ_ENTRY(CXLError) node;
>       int type; /* Error code as per FE definition */
> -    uint32_t header[32];
> +    uint32_t header[CXL_RAS_ERR_HEADER_NUM];
>   } CXLError;
>   
>   typedef QTAILQ_HEAD(, CXLError) CXLErrorList;

