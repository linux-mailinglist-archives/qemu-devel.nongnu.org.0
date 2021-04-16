Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B4A362331
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 16:58:05 +0200 (CEST)
Received: from localhost ([::1]:52100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXPv2-0007wV-4J
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 10:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXPtL-0007I4-86
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 10:56:19 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXPtE-00081d-W5
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 10:56:15 -0400
Received: by mail-wr1-x432.google.com with SMTP id x7so26958365wrw.10
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 07:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aO05T/irpzubNF1vjr4wITeSHnOls63tUeATE0icNl8=;
 b=EPIDeFHFQe4L+lOB4DXTj3aeTqNFIHuXWKm23z+Bapp6u1FN4yS2Vqzg/B6ZDdNMMJ
 Uvt3B0HUNqG+by9v4NitEfx15yfScwo3CBUS5U7aK4+5oxzMSIZN1uEfu/IqbeVAd79k
 /x9H6NHx4t2tSJvx6n80vqWig6h3RxF7YFOoJFHIofTyN7I1AsPwkDes3EIdo8PqnEYf
 LV6XFbflq88xIHxYxf/HmOJW1ic3A+jjyV021RjBU3LqKADbDxokeVWTA2j1u4NkTReE
 X/CU5vdHqbVpvoMevLbIdf6e/3Jv+0UAM+AFVRWm4AaEDbnwU8UlI+0k0gdRmc8oyNnh
 RKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aO05T/irpzubNF1vjr4wITeSHnOls63tUeATE0icNl8=;
 b=NhNZrdZQh8ZwAsuBWBvnyK6k8k1GRjh9oqdVHTs9dKEM7g12LhKyubNLi22zHrMTd5
 Q6naWS17XUZkhcd5WInD6Vg6l8qEbgLUPEz84flA8L9bBfPEEDYGWjuMIY6ehADLmvaq
 vcnpznC40AALs1XhyQWiGNO9O/GYPxaKnyWJg4rzr1/HUTEsJFE7DPVz2UcRVE4ArBww
 KZpuA6DBXuBhqV/K6fM/zQjZbmAchtnusSKkzwJcw0RKC1n5V9fg1lfhzs3/v2ZLZgkq
 rzOELdXbRjYrLeCeYHB0t+fqG/rMizngLEHN1DYtqyRAHMqvuq03JOQwVqIKpk4dF6zR
 yMog==
X-Gm-Message-State: AOAM5333V+0bz14CikHoN6zOu8eIDm4EFMHVuFj9MLxFDeK0Lbly0tmk
 Pt2qT0av68KqGofRgqFpyLU=
X-Google-Smtp-Source: ABdhPJz19klqcOAVCbZ4Oal2QW3getKELPsrFUpXtjUZ39BFNwRAzbH17kFkbVRJrQ46WeMe0ufnZQ==
X-Received: by 2002:adf:9148:: with SMTP id j66mr9682262wrj.124.1618584970354; 
 Fri, 16 Apr 2021 07:56:10 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id i12sm9742937wrm.77.2021.04.16.07.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 07:56:09 -0700 (PDT)
Subject: Re: [PATCH for-6.0? 0/6] extern "C" overhaul for C++ files
To: qemu-devel@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>, Vince.DelVecchio@mediatek.com,
 Filip Vidojevic <Filip.Vidojevic@Syrmia.com>
References: <20210416135543.20382-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <aaf058e8-ba51-b408-d82d-acf08d20a8b7@amsat.org>
Date: Fri, 16 Apr 2021 16:56:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416135543.20382-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing MediaTek future contributors who expressed interest
in reviewing this.

On 4/16/21 3:55 PM, Peter Maydell wrote:
> Hi; this patchseries is:
>  (1) a respin of Paolo's patches, with the review issue Dan
>      noticed fixed (ie handle arm-a64.cc too)
>  (2) a copy of my "osdep.h: Move system includes to top" patch
>  (3) some new patches which try to more comprehensively address
>      the extern "C" issue
> 
> I've marked this "for-6.0?", but more specifically:
>  * I think patches 1 and 2 should go in if we do an rc4
>    (and maybe we should do an rc4 given various things that
>    have appeared that aren't individually rc4-worthy)
>  * patches 3-6 are definitely 6.1 material
> 
> We have 2 C++ files in the tree which need to include QEMU
> headers: disas/arm-a64.cc and disas/nanomips.cpp. These
> include only osdep.h and dis-asm.h, so it is sufficient to
> extern-C-ify those two files only.
> 
> I'm not wildly enthusiastic about this because it's pretty
> invasive (and needs extending if we ever find we need to
> include further headers from C++), but it seems to be what
> C++ forces upon us...
> 
> Patches 1, 2 and 3 have been reviewed (I kept Dan's r-by on
> patch 1 since the change to it is just fixing the thing he
> noticed). Further review, and opinions on the 6.0-ness, whether
> we should do an rc4, etc, appreciated.
> 
> thanks
> -- PMM
> 
> Paolo Bonzini (2):
>   osdep: include glib-compat.h before other QEMU headers
>   osdep: protect qemu/osdep.h with extern "C"
> 
> Peter Maydell (4):
>   include/qemu/osdep.h: Move system includes to top
>   osdep: Make os-win32.h and os-posix.h handle 'extern "C"' themselves
>   include/qemu/bswap.h: Handle being included outside extern "C" block
>   include/disas/dis-asm.h: Handle being included outside 'extern "C"'
> 
>  include/disas/dis-asm.h   | 12 ++++++++++--
>  include/qemu/bswap.h      | 26 ++++++++++++++++++++++----
>  include/qemu/compiler.h   |  6 ++++++
>  include/qemu/osdep.h      | 34 +++++++++++++++++++++++++++-------
>  include/sysemu/os-posix.h |  8 ++++++++
>  include/sysemu/os-win32.h |  8 ++++++++
>  disas/arm-a64.cc          |  2 --
>  disas/nanomips.cpp        |  2 --
>  8 files changed, 81 insertions(+), 17 deletions(-)
> 


