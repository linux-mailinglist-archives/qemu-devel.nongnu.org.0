Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01620520827
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 01:09:44 +0200 (CEST)
Received: from localhost ([::1]:59266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noCVb-00051B-5M
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 19:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noCUl-0004LW-RS
 for qemu-devel@nongnu.org; Mon, 09 May 2022 19:08:51 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:42968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noCUj-0005dz-Un
 for qemu-devel@nongnu.org; Mon, 09 May 2022 19:08:51 -0400
Received: by mail-pl1-x631.google.com with SMTP id d22so15213985plr.9
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 16:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=77WG7uSvf6DNnmm23dIVbWmWTmQY4hPF2jPSCptKSHw=;
 b=Z8K+EZPVSU0zx83nAy4/g5K0mZok4nCa9QcRMD5gzmYcz7btICCHWW8kKsEMB5FgAo
 +rRQHEWa3xPV5PjBmsw3kHFK7/j7gEwmZAaoIs6Sv92CaII2CIsAKAsNZ0nCGxi9kjSY
 YDTiIJpytbAZ+zWhHzfdV4CDwtyn9Vc2Zz7VbqNlq5NHnaUHCbwGGYUkBz+Bds1IPFgp
 /yrY3weY+pN13yi/HCiJnsntpHTUkS09KWLOKCMyAyb5kn0Xfw/UHkokXr5kUG95V0fY
 WGCuYll6lYsr2W/2rzEziiU5hGjgMPkccJ40RvWmHM1xaMHryCiTBgkY/lfRCcNMmdZl
 2R2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=77WG7uSvf6DNnmm23dIVbWmWTmQY4hPF2jPSCptKSHw=;
 b=sjGEP1UTY2/QN1NOk0rO3CuuTtUtSwKZvGOkWOlaBfn7pNSHIX6F+xDbuTQxG9rN6f
 K1Jxlneffu7YAU9xF1n2AetAED9pGozUHDB6vjDPKWgaT1D2TTBeKc36vkHVynh8NAoA
 wUnwmjP+nsP5/w2GiZrHjvB/xBh4ZEXSAW677hPIJLyoPkvNkPiK0NDXYHDEwshzRrk6
 wYFzW65RaE7QXDHjWi/mhiKBkLTyjra8uXChFzXXhYyfqawBCPDdWVZqqwrD4HLvAQYV
 H2qs7C0JZzDCZFHauAE2GwddUyuYNhlKlqxzavV2HmaI8npZ6iVcUcWrHAJGyFw926pH
 8SkQ==
X-Gm-Message-State: AOAM531vp+//MLTL7gbyXGfPGkmCWePcna0rHakNdibmeEiydt3kOLmf
 +1k0o529KB33AtHM+2e+G0TX+Q==
X-Google-Smtp-Source: ABdhPJzFSgkb8V4wfHnKUEDPB7JkfFv1Jqx6mynGr8sJvoLmnSTlfSF9BhIV+8o+TDNfQfdPz0duag==
X-Received: by 2002:a17:90b:4c10:b0:1dc:8289:7266 with SMTP id
 na16-20020a17090b4c1000b001dc82897266mr28563998pjb.190.1652137728263; 
 Mon, 09 May 2022 16:08:48 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 e18-20020aa798d2000000b0050dc762816csm9179718pfm.70.2022.05.09.16.08.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 16:08:47 -0700 (PDT)
Message-ID: <646537b2-26c9-c32b-d142-e47362c8cc94@linaro.org>
Date: Mon, 9 May 2022 16:08:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 3/3] linux-user: Remove pointless CPU{ARCH}State casts
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220509205728.51912-1-philippe.mathieu.daude@gmail.com>
 <20220509205728.51912-4-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220509205728.51912-4-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 5/9/22 15:57, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé<f4bug@amsat.org>
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/syscall.c        | 49 +++++++++++++++++--------------------
>   linux-user/uname.c          |  2 +-
>   linux-user/user-internals.h |  2 +-
>   3 files changed, 25 insertions(+), 28 deletions(-)

This is the real win.  Thanks,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

