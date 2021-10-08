Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAB0426BB6
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 15:32:18 +0200 (CEST)
Received: from localhost ([::1]:37710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYpyz-0006lc-81
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 09:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYpwe-00060r-Mu
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 09:29:52 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYpwd-0003HG-1Z
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 09:29:52 -0400
Received: by mail-pf1-x431.google.com with SMTP id i65so5307676pfe.12
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 06:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=gPmQcCutNEbekUj8xgwpW2Iy93S37lvlxWsAb9J08WA=;
 b=JZ66t6CAbO62DugBHd+PbpzOkQ1iOjxZIZmOxxP70Rn6fqSXFQIwdhAHSAToaEHpgN
 +9CEGui5AXuj5lL8nYXFpEDtMiqAHKxtxc09u8Zzv2xMTT2cSplhbtRtaa4z4Rzkh084
 9MhCckOfskxazs4BA45TqK3OmSRlHXGaJiTq9zwZdozv4br/3UNMlJ1enDJ8bfZRaN9R
 RCg2DUCWNgGjK7857qRGvUxxwmnS0++z0NEWYeI9g3hPCMIwNLlAJdKYhU92crh033bM
 /j9oBGCaWhqHravaJh3ZU2grtUgW+utezdKvkMdWHqOcSr6KJTWDq7EF5YuWU6osw9uR
 Xnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gPmQcCutNEbekUj8xgwpW2Iy93S37lvlxWsAb9J08WA=;
 b=BsGLfSG/QIv5mlqrPKJe8YoGPPdY3Vja2b67mNFs2xeTL5UXSgMwGpaM/hV5t1kQqH
 gm4I889AnNWjZ74LXVK4xMiGBwEZL3U4wptnjJ6oyh7AgSz4KbKGi8eg4XY802uff8wQ
 92RV/q04EMrxOcHfLmrWtHrXclgdf4quPR1QEaTIct7DaAW2DFyvVfW+Cq3sOoN2nnpE
 90B1ZLeKNVl7BIuipNzwvOP4jlcco9fKa5DXCaLcP/+e6Ec/jM7fuia9cdlng/JztySb
 VKuIWMS7Y7U3yZBgiWZqmw68ju3uv+I4gsHtjQO6bWrKjSQfmHH85BpNkYoh/uOhOIRM
 voiQ==
X-Gm-Message-State: AOAM532pUDVa6gTqkUjuHzXWHyBwqYDPtlsnLn/c/14qwVlwaA0wH9Tu
 QzBtKROcWAWtBVZ3Isk8y/50qFxwDjOy+g==
X-Google-Smtp-Source: ABdhPJwY3G4PN51oY+esdWl36ZIY0SnQSa/8TXfb664U/MNw97yzT5YpMFM08ymdvPhnI0V5y6aZKQ==
X-Received: by 2002:a05:6a00:140c:b0:447:96be:2ade with SMTP id
 l12-20020a056a00140c00b0044796be2ademr10088291pfu.26.1633699789265; 
 Fri, 08 Oct 2021 06:29:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id s7sm2797906pgc.60.2021.10.08.06.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 06:29:48 -0700 (PDT)
Subject: Re: [PULL 00/13] M68k next patches
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211008114518.757615-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <78410b27-b7d3-3978-7eac-f13a1bafe16e@linaro.org>
Date: Fri, 8 Oct 2021 06:29:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211008114518.757615-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/8/21 4:45 AM, Laurent Vivier wrote:
> The following changes since commit 14f12119aa675e9e28207a48b0728a2daa5b88d6:
> 
>    Merge remote-tracking branch 'remotes/vsementsov/tags/pull-jobs-2021-10-07-v2' into staging (2021-10-07 10:26:35 -0700)
> 
> are available in the Git repository at:
> 
>    git://github.com/vivier/qemu-m68k.git tags/m68k-next-pull-request
> 
> for you to fetch changes up to efd0c37edc8efe7dccc2356f4a07f33581bc9e67:
> 
>    q800: wire macfb IRQ to separate video interrupt on VIA2 (2021-10-08 13:31:03 +0200)
> 
> ----------------------------------------------------------------
> Pull request q800 20211008
> 
> macfb: fixes for booting MacOS
> 
> ----------------------------------------------------------------
> 
> Mark Cave-Ayland (13):
>    macfb: handle errors that occur during realize
>    macfb: update macfb.c to use the Error API best practices
>    macfb: fix invalid object reference in macfb_common_realize()
>    macfb: fix overflow of color_palette array
>    macfb: use memory_region_init_ram() in macfb_common_realize() for the
>      framebuffer
>    macfb: add trace events for reading and writing the control registers
>    macfb: implement mode sense to allow display type to be detected
>    macfb: add qdev property to specify display type
>    macfb: add common monitor modes supported by the MacOS toolbox ROM
>    macfb: fix up 1-bit pixel encoding
>    macfb: fix 24-bit RGB pixel encoding
>    macfb: add vertical blank interrupt
>    q800: wire macfb IRQ to separate video interrupt on VIA2
> 
>   include/hw/display/macfb.h |  43 +++++
>   hw/display/macfb.c         | 386 ++++++++++++++++++++++++++++++++++---
>   hw/m68k/q800.c             |  23 ++-
>   hw/display/trace-events    |   7 +
>   4 files changed, 429 insertions(+), 30 deletions(-)

Applied, thanks.  Please update the wiki for the changelog.

r~


