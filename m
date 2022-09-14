Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879A45B845A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 11:11:05 +0200 (CEST)
Received: from localhost ([::1]:34114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYOQC-0000qU-5M
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 05:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1oYONL-0007ea-77
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 05:08:07 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1oYON4-0003cC-Pt
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 05:08:06 -0400
Received: by mail-wr1-x42b.google.com with SMTP id k9so24688290wri.0
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 02:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date;
 bh=S3hbsnsO8bUP9TSp7ZglWfwWoT4ej0T3vP2Vf4axeRY=;
 b=G7jMJbsndfm2/QKZljNIpEuHp+Nieo2q5dF44Ga2Gd7uQyl4bDAB4lpIV97YVjZUNG
 5l2wpV4wp59OQrqv1gzPkT4A1SFJEDOjCzUpAQCJN60PCuz1hHUrmuVV5feyVOo27ja7
 tT8HOSzVz58NlbGZD1sw2PYQH00itM5CRhaVShG1+4/nSbu+2loATpGlSY1wjCVO4W/9
 avKIktGjEkFiV1Om8Qu2A+Vuu9ZiMayZmxsflrcIFwpa0d9BNgqnVfTVMbNelkPCludl
 POhE8/XFnLAxKapqupXD35EQFrUr9Lx0YPYXsluxELh7TzXdtxpftT/3VdHgG+B7Kf/6
 GG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=S3hbsnsO8bUP9TSp7ZglWfwWoT4ej0T3vP2Vf4axeRY=;
 b=U53DA5QUoBvKouNWX0V0TwbBYZILdqQ0siUwGJvbiSPx5Wm7f6cV8N3Qdq08ZT+DBp
 gs3SliB8psKqNmUmnnpy0JD0TjwA6r8AwhCo3BDEfw7vTQTY+lNa1eiXmgnjyeHMO9G3
 0Vdrsku55m55sis8k9ldvXX5AYyaHYH++drjV+kYcgRmfmo51VtB/VCR7wfkdysOnAzC
 qaF7bbMMpasvm2TH61FTZ8GN8gdySJdHDY8HnDiyIYmz2N7tZ9gC6luFTZUBKUJFN4UB
 Nl5Ffccxp7zgeHgNmUnSUu44BtaKHMiGKuaSl8VuDv7yiLxrhrcAs2aR+6IpqYaua+aB
 wxng==
X-Gm-Message-State: ACgBeo3WRnx59uWE5esT9kAdX6UKWvywpX4BC0MZLXz1OpQqcf8jAV/F
 ZPtkEvFNtn0L9jNlMgddvNE=
X-Google-Smtp-Source: AA6agR7d57jlvfQGD4mmVzestJI6g+JSFVhlnr9SWQBdqsNpL7CF9bwHEO3iRUr/ROcB4KuBgxJNjw==
X-Received: by 2002:adf:a70b:0:b0:226:e1f5:7889 with SMTP id
 c11-20020adfa70b000000b00226e1f57889mr20199977wrd.108.1663146464747; 
 Wed, 14 Sep 2022 02:07:44 -0700 (PDT)
Received: from [172.20.8.228] ([167.98.135.4])
 by smtp.gmail.com with ESMTPSA id
 z13-20020adfec8d000000b0022a297950cesm13462479wrn.23.2022.09.14.02.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Sep 2022 02:07:44 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <8be84a25-c31d-fd88-f913-c03c15046a55@xen.org>
Date: Wed, 14 Sep 2022 10:07:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough device
To: "Ji, Ruili" <Ruili.Ji@amd.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "Liu, Aaron" <Aaron.Liu@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <BL1PR12MB599341DC55BA53FE588DE14E9B7E9@BL1PR12MB5993.namprd12.prod.outlook.com>
 <BL1PR12MB5993C52DD9A881FACE6FA28D9B419@BL1PR12MB5993.namprd12.prod.outlook.com>
 <BL1PR12MB5993DC46EDF5D01ED20E2E179B479@BL1PR12MB5993.namprd12.prod.outlook.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <BL1PR12MB5993DC46EDF5D01ED20E2E179B479@BL1PR12MB5993.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.628, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/09/2022 04:02, Ji, Ruili wrote:
> [AMD Official Use Only - General]
> 
> 
> Hi Paul,
> 
> Could you help to review this patch?
> 

LGTM. You can add my R-b to it.

   Paul

> Thanks
> 
> *From:* Ji, Ruili
> *Sent:* 2022年9月7日 9:04
> *To:* 'Paul Durrant' <paul@xen.org>; 'qemu-devel@nongnu.org' 
> <qemu-devel@nongnu.org>
> *Cc:* Liu, Aaron <Aaron.Liu@amd.com>; 'xen-devel@lists.xenproject.org' 
> <xen-devel@lists.xenproject.org>
> *Subject:* RE: [PATCH] hw/xen: set pci Atomic Ops requests for 
> passthrough device
> 
> FYI
> 
> *From:* Ji, Ruili
> *Sent:* 2022年9月6日 15:40
> *To:* qemu-devel@nongnu.org <mailto:qemu-devel@nongnu.org>
> *Cc:* Liu, Aaron <Aaron.Liu@amd.com <mailto:Aaron.Liu@amd.com>>
> *Subject:* [PATCH] hw/xen: set pci Atomic Ops requests for passthrough 
> device
> 
>  From c54e0714a1e1cac7dc416bd843b9ec7162bcfc47 Mon Sep 17 00:00:00 2001
> 
> From: Ruili Ji ruili.ji@amd.com <mailto:ruili.ji@amd.com>
> 
> Date: Tue, 6 Sep 2022 14:09:41 +0800
> 
> Subject: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough device
> 
> Make guest os access pci device control 2 reg for passthrough device
> 
> as struct XenPTRegInfo described in the file hw/xen/xen_pt.h.
> 
> /* reg read only field mask (ON:RO/ROS, OFF:other) */
> 
> uint32_t ro_mask;
> 
> /* reg emulate field mask (ON:emu, OFF:passthrough) */
> 
> uint32_t emu_mask;
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1196 
> <https://gitlab.com/qemu-project/qemu/-/issues/1196>
> 
> Signed-off-by: Aaron.Liu@amd.com <mailto:Aaron.Liu@amd.com>
> 
> Signed-off-by: ruili.ji@amd.com <mailto:ruili.ji@amd.com>
> 
> ---
> 
> hw/xen/xen_pt_config_init.c | 4 ++--
> 
> 1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
> 
> index c5c4e943a8..adc565a00a 100644
> 
> --- a/hw/xen/xen_pt_config_init.c
> 
> +++ b/hw/xen/xen_pt_config_init.c
> 
> @@ -985,8 +985,8 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] = {
> 
>           .offset     = 0x28,
> 
>           .size       = 2,
> 
>           .init_val   = 0x0000,
> 
> -        .ro_mask    = 0xFFE0,
> 
> -        .emu_mask   = 0xFFFF,
> 
> +        .ro_mask    = 0xFFA0,
> 
> +        .emu_mask   = 0xFFBF,
> 
>           .init       = xen_pt_devctrl2_reg_init,
> 
>           .u.w.read   = xen_pt_word_reg_read,
> 
>           .u.w.write  = xen_pt_word_reg_write,
> 
> -- 
> 
> 2.34.1
> 


