Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD214DDBA0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 15:26:02 +0100 (CET)
Received: from localhost ([::1]:56764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVDYH-00086k-AQ
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 10:26:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVDCq-0002FW-Ka; Fri, 18 Mar 2022 10:03:52 -0400
Received: from [2607:f8b0:4864:20::436] (port=35359
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVDCo-0000e6-BK; Fri, 18 Mar 2022 10:03:52 -0400
Received: by mail-pf1-x436.google.com with SMTP id a5so9559966pfv.2;
 Fri, 18 Mar 2022 07:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=64qvE4ivymnbYLyGpAgwtJ4atgyNPhSPChxVQUV3e5Y=;
 b=Mv9DFxW6Y+Csq4sS1IcSUftq6JgPReWqXMik7bDA1V0gEd1RT+dOLTnL3thwSUeoQg
 DP3p6hd3irD5N2Pq5R3lK2uLJBch/odGMD4mtLdso3SWxrGkH/iN4+runom19vPekYtG
 sQoREez7v2OpM4nm7k8Yfu8MYEWgo6E1p65eZWiLrSpuU9XyPiQCBEaZtxUO81eozJwh
 DX/bPqNO7UBmV1bxFgTRLdKJnchZ3PXYQ1w5NKhMpj86Y1Kl0o9Ll5bEYouxmjsW2uhc
 mTOQIJy+zv4+LsF75bsRxAOcLDiboGpLP5OmI/iQ6Hcu+8s7WU6z2Hfv/F3oXuKI9Kr6
 qsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=64qvE4ivymnbYLyGpAgwtJ4atgyNPhSPChxVQUV3e5Y=;
 b=J3T+FdU+6/WdijTuynq7Ysr9NqUWqkfJRCaupYT6AEk1Io7n7QeFxx8O6pYpbPL0vd
 cdepDiKE8DSAE4nzayatn7+qu6yH1twmhDnbM0bf+8fc9puXMU6U1S1FGMskQnYIFxUV
 o4ze4J0tUghDXxlYGLnMVwiR56gDBYR1BIHRCFTl5Qx/WZCU3ldvme7Kpe1zOWTQOQG7
 hXPRqB1crcm8ozqwj3kucXxKuyBg2BmrxXub6cBamj+MwE6q4oy1/BqGPthtfL8FTyo8
 9SdPZOl3WgxNNBjGIvuN9FeG3sZiOFbjMDzhdL+91qU1vQ5IpJFi+yRkpWG8g19virla
 lYlA==
X-Gm-Message-State: AOAM533qeWL0tWIRwbABno9tZx++loNJgh4x3zeMlhdGufoAMB3VhscY
 e5FOV/ZE4Nw8uCzgXDxlQiyBuvVhUtU=
X-Google-Smtp-Source: ABdhPJxBteUdnSeSoFZHGFs4MBfszHDpMZfclqvsjF6+dEJTw0myxlqgbXckS3XDK/tI+i/LTMneZw==
X-Received: by 2002:a05:6a00:d91:b0:4f7:a462:7612 with SMTP id
 bf17-20020a056a000d9100b004f7a4627612mr9917966pfb.15.1647612228333; 
 Fri, 18 Mar 2022 07:03:48 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 pj13-20020a17090b4f4d00b001bf2ff56430sm12835246pjb.30.2022.03.18.07.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 07:03:48 -0700 (PDT)
Message-ID: <2a8a7a37-57c1-9f6d-3a2d-359b8060abfb@gmail.com>
Date: Fri, 18 Mar 2022 15:03:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [RFC PATCH-for-7.0] hw/i386/amd_iommu: Fix maybe-uninitialized
 error with GCC 12
Content-Language: en-US
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20220318004153.4510-1-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220318004153.4510-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+qemu-trivial@

On 18/3/22 01:41, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Initialize 'oldlevel' early to avoid on Debian/sid:
> 
>    FAILED: libqemu-x86_64-softmmu.fa.p/hw_i386_amd_iommu.c.o
>    In function 'pte_get_page_mask',
>        inlined from 'amdvi_page_walk' at hw/i386/amd_iommu.c:945:25,
>        inlined from 'amdvi_do_translate' at hw/i386/amd_iommu.c:989:5,
>        inlined from 'amdvi_translate' at hw/i386/amd_iommu.c:1038:5:
>    hw/i386/amd_iommu.c:877:38: error: 'oldlevel' may be used uninitialized [-Werror=maybe-uninitialized]
>      877 |     return ~((1UL << ((oldlevel * 9) + 3)) - 1);
>          |                      ~~~~~~~~~~~~~~~~^~~~
>    hw/i386/amd_iommu.c: In function 'amdvi_translate':
>    hw/i386/amd_iommu.c:906:41: note: 'oldlevel' was declared here
>      906 |     unsigned level, present, pte_perms, oldlevel;
>          |                                         ^~~~~~~~
>    cc1: all warnings being treated as errors
> 
> Having:
> 
>    $ gcc --version
>    gcc (Debian 12-20220313-1) 12.0.1 20220314 (experimental)
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/i386/amd_iommu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
> index 4d13d8e697..b6d299f964 100644
> --- a/hw/i386/amd_iommu.c
> +++ b/hw/i386/amd_iommu.c
> @@ -904,6 +904,7 @@ static void amdvi_page_walk(AMDVIAddressSpace *as, uint64_t *dte,
>       /* make sure the DTE has TV = 1 */
>       if (pte & AMDVI_DEV_TRANSLATION_VALID) {
>           level = get_pte_translation_mode(pte);
> +        oldlevel = level;
>           if (level >= 7) {
>               trace_amdvi_mode_invalid(level, addr);
>               return;


