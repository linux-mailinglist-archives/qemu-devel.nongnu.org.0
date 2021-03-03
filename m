Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A3532B994
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 18:50:02 +0100 (CET)
Received: from localhost ([::1]:41212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHVdI-00035d-Hr
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 12:50:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lHVcF-0002V9-Qq
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:48:55 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lHVcD-00075Y-UX
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:48:55 -0500
Received: by mail-wm1-x330.google.com with SMTP id u125so7125864wmg.4
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 09:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fTSpjDILTyJ0Rw3B8UwbNDlFjh7OVwpFX37SmRuOmOs=;
 b=tpaAf5oH6dpjOkXfBfSHh4nZcAxoZj1hn8K2vEx02J16b3TwtiWkgsjbonhR8KrGL1
 I2O+wsv82uu5RTjPpNpGZFsohVU/PdLDbj0Dr9jDpkP8TbXhubSQ/crTeIGrBuYIS6rr
 86BxFmTx7aMQIQ5ZcXwx2DXkk62Xm99pjuUale3GBomOj9GpCMcPfVm+XMLStD6PHWhZ
 rUSpaD3ZKgw9T6AUuVoVsIWbUBXJ4b0sr6ciTzXA0XmdNG4jK6Ko/DPVpmZxkk8aeCLh
 uOuWk7YQ9y7q92ZpKqlXCzDMWYb0tnkf2NG+vu/Ta+miuFyRs4NQCIjXtYyWLTcmA24S
 UlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fTSpjDILTyJ0Rw3B8UwbNDlFjh7OVwpFX37SmRuOmOs=;
 b=QvMX58Wp6cmWoDGk9YshY6RS1Up9wlispzXB4JHsHBrcDk44v9s59SZVrVSrrpTD8H
 cyptEmx2nrnQja7mFJHUt3pSn0b+n2KG1oEI3gakU/lqxh76gwdd4O/tmKOKBBmVGMn8
 9YcDmwtr+rqRkQngU+cDKnyuSM0Z3B+iWdFtsE0CsxpcW66usFZIWhxAPzF3Y5OLBYbi
 qnf2DLXqQKq+l0t4eglo4ekyDKUyKVPy5h7Va7sS6o0EzFOMF6u5OJB5wByhC+O5VOgq
 V2ZemZYYyDj7ZKz50YnQhOpIqhzNtF8CVFh/itaNTeevOSZGAJ3tWYTGgCMG+vAiVft7
 wZ3w==
X-Gm-Message-State: AOAM533wmXIXz6k4/u6Ps4Yu70Md/kDvcig8jCXQzw0Kg61EW/RV3bvt
 nueSmoa6mckuL5h4f5NMKF/6Iw==
X-Google-Smtp-Source: ABdhPJxfGrtzjZfxfBDBGxlB0WNwMsc7AkuWMMY8UsaofEbFfp6SfaOGBJKOTK0MTBS3PewHP7Le/w==
X-Received: by 2002:a1c:7513:: with SMTP id o19mr166631wmc.94.1614793731317;
 Wed, 03 Mar 2021 09:48:51 -0800 (PST)
Received: from vanye (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id v13sm7794719wrt.45.2021.03.03.09.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 09:48:50 -0800 (PST)
Date: Wed, 3 Mar 2021 17:48:49 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: Re: [PATCH] arm: bump amount of PMU counters to pass SBSA ACS
Message-ID: <20210303174849.GF1664@vanye>
References: <20210303151634.3421880-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303151634.3421880-1-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 03, 2021 at 16:16:34 +0100, Marcin Juszkiewicz wrote:
> Arm BSA (Base System Architecture) specification says:
> 
> B_PE_09: PEs must implement the FEAT_PMUv3p1 extension, and the base
> system must expose a minimum of four programmable PMU counters to the
> operating system.
> 
> B_PE_21: The base system must expose a minimum of two programmable PMU
> counters to a hypervisor.
> 
> It is then repeated in SBSA (Server Base System Architecture)
> specification in level 3 requirements:
> 
> Each PE must implement a minimum of six programmable PMU counters.
> 
> So let make QEMU provide those 6 PMU counters.
> 
> SBSA-ACS says now:
> 
>   12 : Check number of PMU counters      : Result:  PASS
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Reviewed-by: Leif Lindholm <leif@nuviainc.com>

It would be good if we could get 6.0 closer to SBSA compliance.
Would it be worth the effort to make this controllable per cpu model?

/
    Leif

> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 0e1a3b9421..02e25b5c22 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -38,7 +38,7 @@
>  #endif
>  
>  #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
> -#define PMCR_NUM_COUNTERS 4 /* QEMU IMPDEF choice */
> +#define PMCR_NUM_COUNTERS 6 /* QEMU IMPDEF choice */
>  
>  #ifndef CONFIG_USER_ONLY
>  
> -- 
> 2.29.2
> 

