Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526985286C1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 16:17:13 +0200 (CEST)
Received: from localhost ([::1]:35546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqbX6-0004OP-EW
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 10:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nqbUz-0002rR-Qi; Mon, 16 May 2022 10:15:01 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:42254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nqbUv-0002X7-R4; Mon, 16 May 2022 10:14:59 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-edf3b6b0f2so20183388fac.9; 
 Mon, 16 May 2022 07:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/5cDBAo02l5w47Xi6o83JaM+FqB8Nf/5pmG19NlIm04=;
 b=d/tACDyOK1VZRmgKOoWJsZKztJtMOtyd2yNLhz44NSRIbYJ3eYc2AYrozRmcqJqfDP
 4MpPm+0mSNqhCDSFks3dh2TF2X5cL+A1BaF5TGTQWTlqavwSrjBDNbY8UTleBO7e9OZS
 DZDRQ1x6T58mg7JK+DNJLBZNSEMeTgMUOl0aAxsHABl05Dxs9OsuIoGP1VWc4qQljCJm
 oNQerX+1KE3ihbC+BCscIzlMI6Zv0DeovvWJhjVVUJfjzbHnioA9luMz5ymj/FEvEP9O
 DElgr+xJPNTMHCBT80X9Vo7AMbDnNAhcep23Y7R2atHdfUBeMokdwmSbRTEhoe+prrgl
 aLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/5cDBAo02l5w47Xi6o83JaM+FqB8Nf/5pmG19NlIm04=;
 b=kU4yOcIPKdQivjXYTuO/heN2hHhJ/xaM1py+oXR9XTwdly0oWVCOOVcVMrk/OE5ITb
 bsD6MbLvEvcHrngD+GWtv4h7DfH8RATmtOiN1Ol4v6JVGoj3mz90EotWF638pf2Zb5YN
 36+vQLqCTuglPQ3StmjoIZCZ7mtDMInNKSwcMNw/KhcqyJg/x9GKzqNV34ayZny+5l4T
 izMkaoqtD7Rv/YWGsNt9N4pO6gG3F1RAbzEpgAJUSh/G9HgqQhIBAJAWkjq/T1W4oBgg
 JvZKoUNvoglY6HVGT4YLSw81wtBfgGnkYFeVkAeZdDYG6GYyvyPmzl9VjiIgWhWm5Tw1
 TAUA==
X-Gm-Message-State: AOAM531aiN+MwxV2mk2wwwW2ptsRxcX/CrwVdP4e9/DOfSRvzyBt7cll
 bO75O96gFgwTxDMT1o/AcMw=
X-Google-Smtp-Source: ABdhPJysG7Biz0BC011+8jDFPaCHhDTM6rcMbtOuQjYv9d+G6kc+R/EiBVept+WWIS0eSZi9XZxtOQ==
X-Received: by 2002:a05:6870:630d:b0:e2:6498:6734 with SMTP id
 s13-20020a056870630d00b000e264986734mr9350418oao.3.1652710487600; 
 Mon, 16 May 2022 07:14:47 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.151.26])
 by smtp.gmail.com with ESMTPSA id
 ds6-20020a0568705b0600b000e686d1388dsm5321432oab.39.2022.05.16.07.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 07:14:47 -0700 (PDT)
Message-ID: <aca5b885-daea-bb59-e79e-3317e3854cf3@gmail.com>
Date: Mon, 16 May 2022 11:14:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] mos6522: fix linking error when CONFIG_MOS6522 is not
 set
Content-Language: en-US
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, mopsfelder@gmail.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>, Thomas Huth <thuth@redhat.com>
References: <20220510235439.54775-1-muriloo@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220510235439.54775-1-muriloo@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 5/10/22 20:54, Murilo Opsfelder Araujo wrote:
> When CONFIG_MOS6522 is not set, building ppc64-softmmu target fails:
> 
>      /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/monitor_misc.c.o:(.data+0x1158): undefined reference to `hmp_info_via'
> 
> Make devices configuration available in hmp-commands*.hx and check for
> CONFIG_MOS6522.
> 
> Fixes: 409e9f7131e5 (mos6522: add "info via" HMP command for debugging)
> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Fabiano Rosas <farosas@linux.ibm.com>
> Cc: Thomas Huth <thuth@redhat.com>
> ---

Thomas,


Are you going to pick this up via your misc patches tree? If not I can take it
via ppc64.



Thanks,


Daniel




> v3:
> - Removed TARGET_M68K and TARGET_PPC checks, as per Thomas Huth suggestion.
> 
> v2:
> - https://lore.kernel.org/qemu-devel/20220506011632.183257-1-muriloo@linux.ibm.com/
> - Included devices configuration in monitor/misc.c
> 
> v1:
> - https://lore.kernel.org/qemu-devel/20220429233146.29662-1-muriloo@linux.ibm.com/
> 
>   hmp-commands-info.hx | 2 +-
>   monitor/misc.c       | 3 +++
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index adfa085a9b..834bed089e 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -880,7 +880,7 @@ SRST
>       Show intel SGX information.
>   ERST
>   
> -#if defined(TARGET_M68K) || defined(TARGET_PPC)
> +#if defined(CONFIG_MOS6522)
>       {
>           .name         = "via",
>           .args_type    = "",
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 6c5bb82d3b..3d2312ba8d 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -84,6 +84,9 @@
>   #include "hw/s390x/storage-attributes.h"
>   #endif
>   
> +/* Make devices configuration available for use in hmp-commands*.hx templates */
> +#include CONFIG_DEVICES
> +
>   /* file descriptors passed via SCM_RIGHTS */
>   typedef struct mon_fd_t mon_fd_t;
>   struct mon_fd_t {

