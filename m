Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32DD587F0F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 17:39:19 +0200 (CEST)
Received: from localhost ([::1]:56738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oItzK-0007n1-L8
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 11:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oItua-0002Lq-3H
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 11:34:24 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:36651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oItuY-0003jp-9A
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 11:34:23 -0400
Received: by mail-pl1-x634.google.com with SMTP id x10so13086982plb.3
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 08:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5s97GOOs9GUCeUmaVZkJ3GnYyexDFHEDNSGI89u7uHo=;
 b=RbNzyOS62jHpc4t9pI4+aNsn6Q73IdmBUQXMXlLzbvuM213mI/44JgYWR+TPdQfg0Q
 9roKmcG7QOZ2Zp+jTX1h58NppN24gD/rwFJM2dotCDxJWTAzqsD5XWjnizPRwDuDsv11
 lbk7E0ESITVwuwYp/r2V0qFRnGqJpIFh8NKGwFQkjXmZJo8Nwkb9Or+/3kcQxzWzaBLL
 gm7k96eeOWJiSx9svqnmPQTtvIi2+SkVYxmYSxVRL7ROH7BIpEXoD6rKXq9Oge8tsWN4
 TwXBATtpD1Cb9WY9JM1MR9MZ6QkpdY8qHpKBAcfLLPHGaXRbvFtruQQX/svVlZU9xEYX
 2HSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5s97GOOs9GUCeUmaVZkJ3GnYyexDFHEDNSGI89u7uHo=;
 b=jOstVX2LYriLI06h4EHT6nbqQJLN/o5iUpxj1jQMW5mlgGlvxQDfhOKVmddC38XATT
 XjRHbhYedZ9ozAoK2n3xxgNj6UKVECKs9vwDpXSSwJ1E1SHaLD7ibyo5X7hr0ePey9Mk
 3iWvot55opEzpinjXDnX+IsWs3RjAo4GIy2EPVfcb3U494v/qV6HTUkBllMvgV3WHJUH
 tAdfc+mSvbxxApYKLoOdzlfVNhlbjLlrfG+uGIQq3JWiyp8NmZ7t0ltvMuCUUrVApDGX
 WYV6Assos/Djo68/2+TlIr+v3sEaWP7AfU/gGcYZ+2lZDJstzSefuRjQVF0JXgL9Ytn1
 pE1w==
X-Gm-Message-State: ACgBeo3ZQEXHlCT1CpW1MMtu+L3AEkjhy7Y63STNo8ifkPV1GN5jO+4y
 Dee0WJBNhsLyYzWddr/x7TY30w==
X-Google-Smtp-Source: AA6agR6iv7MJNkkTLjAab9VuEIcmHo1+1bDPBP6wmCRkR3eH2p8C5loy9R1cEGyLLjyunQtxQJPpVA==
X-Received: by 2002:a17:902:a502:b0:16b:fbd9:7fc5 with SMTP id
 s2-20020a170902a50200b0016bfbd97fc5mr22482388plq.112.1659454460729; 
 Tue, 02 Aug 2022 08:34:20 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:9b48:8d61:390d:9808?
 ([2602:ae:1549:801:9b48:8d61:390d:9808])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a170902710f00b0016d2540c098sm11863469pll.231.2022.08.02.08.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 08:34:19 -0700 (PDT)
Message-ID: <16cd72ea-06cb-b30b-e308-f399edb4b061@linaro.org>
Date: Tue, 2 Aug 2022 08:34:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/7] Block layer patches
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20220802133757.138016-1-kwolf@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220802133757.138016-1-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

On 8/2/22 06:37, Kevin Wolf wrote:
> The following changes since commit 60205b71421cbc529ca60b12c79e0eeace007319:
> 
>    Merge tag 'pull-aspeed-20220801' of https://github.com/legoater/qemu into staging (2022-08-01 13:55:11 -0700)
> 
> are available in the Git repository at:
> 
>    git://repo.or.cz/qemu/kevin.git tags/for-upstream
> 
> for you to fetch changes up to 21b1d974595b3986c68fe80a1f7e9b87886d4bae:
> 
>    main loop: add missing documentation links to GS/IO macros (2022-08-02 12:02:17 +0200)
> 
> ----------------------------------------------------------------
> Block layer patches
> 
> - libvduse: Coverity fixes
> - hd-geometry: Fix ignored bios-chs-trans setting
> - io_uring: Fix compiler warning (missing #include)
> - main loop: add missing documentation links to GS/IO macros
> - qemu-iotests: Discard stderr when probing devices

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Cole Robinson (1):
>        qemu-iotests: Discard stderr when probing devices
> 
> Emanuele Giuseppe Esposito (1):
>        main loop: add missing documentation links to GS/IO macros
> 
> Jinhao Fan (1):
>        block/io_uring: add missing include file
> 
> Lev Kujawski (1):
>        hw/block/hd-geometry: Do not override specified bios-chs-trans
> 
> Xie Yongji (3):
>        libvduse: Fix the incorrect function name
>        libvduse: Replace strcpy() with strncpy()
>        libvduse: Pass positive value to strerror()
> 
>   include/qemu/main-loop.h        | 18 +++++++++++++++---
>   block/io_uring.c                |  1 +
>   hw/block/hd-geometry.c          |  7 ++++++-
>   subprojects/libvduse/libvduse.c | 13 +++++++------
>   tests/qemu-iotests/common.rc    |  4 ++--
>   5 files changed, 31 insertions(+), 12 deletions(-)
> 
> 


