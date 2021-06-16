Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22F23A980B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 12:47:14 +0200 (CEST)
Received: from localhost ([::1]:46788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltT4i-0002sN-UE
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 06:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltT3j-0001LS-Ls
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 06:46:11 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:45759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltT3g-00037Z-FS
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 06:46:11 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 c18-20020a05600c0ad2b02901cee262e45fso1417054wmr.4
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 03:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UrgS/7XRbWCASapl7Etq61NSDBB3VibTEv7/VPg2rsE=;
 b=ZFQR7VzWveb+nLVdmcvE9eHb/DgvhNrnWbzzNH9+p10SyYoLy4/+akBGtawPCWi2IB
 bdUHjcCB1dAtVqU3wzKseHxg5hwMA7l35j9XZJqLi/FxCkBB0vs1MihxSjUF3oJzWYPK
 wbJcLdmUwwdTvfXLThj9mJyb+WgTHy1huIk+IIkdp7UltzKBFDcLkgBdaG+TnIwqgYFJ
 amFB138EpKedg7RRQA2irzuOSDohzzaWLrN84bgCBt8yPWYE5nYReemFd6UClo53zBJh
 1OdfL7GyNzvQ62sossIwFdbRSRVLZplUcP8aJz3Ra63fuLKSvprUEwzVmJAe7/eSV6K4
 DE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UrgS/7XRbWCASapl7Etq61NSDBB3VibTEv7/VPg2rsE=;
 b=Xva655VnG4kyZYJX5hryVXfVyR+Oce6fo/lQhP1ulbfk6Za4UNpGOCsuJ+nsIFjLuW
 fH80io9uTilqCZPy8YF0obVZdG8asXfYmxXU6yM0rdO0fSifUje1pFkZKmHkr197Jg8S
 3zfPZTjCJuNf2rR8rHSV2IBr7um1TgE/gUN6EMOM0OKKV/Esx3ZIebNyT3fuWqRRCXdd
 ZBkt07OgM6RMMCM8ZGJ2aKba6shOIlz49GoyaAWf1z1Gk14A5n2UOPYKnQ+5D5k146q+
 lOi5jmGQyDHmw/rXnyQeG9cey3N7okIe2M35RHCjJcXX/dVs7RsDTGPDfR7sV9aXNRPN
 qZew==
X-Gm-Message-State: AOAM530Co2Ouh9a90VWSXWK45tLpDoJTi0utM9q0/ypGMtB6kQqF8WhR
 YkKutT00CgAlkGeLYby11rI=
X-Google-Smtp-Source: ABdhPJyIWTZ7hH49is3yhXeSkYqYM3Il5vlgKknHTafhaabdamgB87qw2Txx0w4RC61MSnWi7qaa+g==
X-Received: by 2002:a7b:c446:: with SMTP id l6mr4621463wmi.64.1623840366790;
 Wed, 16 Jun 2021 03:46:06 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r6sm1679105wrz.91.2021.06.16.03.46.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 03:46:06 -0700 (PDT)
Subject: Re: [PATCH 08/21] linux-user/hppa: Document non-use of setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3d14a44c-69ef-4970-e375-f8aa97891f8e@amsat.org>
Date: Wed, 16 Jun 2021 12:46:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210616011209.1446045-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Helge Deller <deller@gmx.de>, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Helge

On 6/16/21 3:11 AM, Richard Henderson wrote:
> We cannot use a raw sigtramp page for hppa,
> but must wait for full vdso support.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/hppa/target_signal.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/linux-user/hppa/target_signal.h b/linux-user/hppa/target_signal.h
> index 7f525362e9..d558119ee7 100644
> --- a/linux-user/hppa/target_signal.h
> +++ b/linux-user/hppa/target_signal.h
> @@ -71,4 +71,18 @@ typedef struct target_sigaltstack {
>  /* mask for all SS_xxx flags */
>  #define TARGET_SS_FLAG_BITS  TARGET_SS_AUTODISARM
>  
> +/*
> + * We cannot use a bare sigtramp page for hppa-linux.
> + *
> + * Unlike other guests where we use the instructions at PC to validate
> + * an offset from SP, the hppa libgcc signal frame fallback unwinding uses
> + * the PC address itself to find the frame.  This is due to the fact that
> + * the hppa grows the stack upward, and the frame is of unknown size.
> + *
> + * TODO: We should be able to use a VDSO to address this, by providing
> + * proper unwind info for the sigtramp code, at which point the fallback
> + * unwinder will not be used.
> + */
> +#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
> +
>  #endif /* HPPA_TARGET_SIGNAL_H */
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

