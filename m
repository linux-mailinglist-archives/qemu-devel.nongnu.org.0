Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396953BAC77
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 11:28:26 +0200 (CEST)
Received: from localhost ([::1]:54146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzyQK-0005VT-Qy
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 05:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzyPa-0004qy-Rt
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 05:27:38 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzyPZ-00063T-DA
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 05:27:38 -0400
Received: by mail-wr1-x42c.google.com with SMTP id n9so906357wrs.13
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 02:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LWX6L0443Kwo93nEMEIV35h7Z6b/Ri4SP6u5dTu4U2w=;
 b=N2xuaSZKK39wFzdbPB7ebTA3RuRtSvDCh15ewwNDGrULOIm3NzMc5jTFYYrB8ZsFI6
 pIWybFcNo2o09vuWY9vxoRR283g5HSQtLX8V15mKYjOwmKQW0HsJI37jTVk3aVGqujix
 xH3peqxv6I1Z3YGsdlX0SNxwH1HS1tJkFQVL1O3jPLyl0XeAmZPTyvmB4Z4FycMPi6qp
 CjK3ZaYX3ZtoJmNkVBWp3P7//sn5PA9U5xC0/wTEuXyXqlLa2garDCd/3820HLKMJx6Y
 N7/jJbNC3drZCa5uNE+gbomgpVFPApjlAEdiID6TfUNVGH/xfp02oLKBphNdJbz5vlmz
 /GyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LWX6L0443Kwo93nEMEIV35h7Z6b/Ri4SP6u5dTu4U2w=;
 b=t8FzsBoK3O1Y8wpldaFkLs9EmslOg7iR2Fc7RAcxT8/XdTNpvvS2TnMFV5AbGK363U
 4wxb7cUdgsoTH8YEDgxqD3U7KXqN7iwt8Knf379JDopZiWdS1laS2H5Hhef2Pb98k4pX
 WcFTov9rGy2rTHM+GbAKyHxr0Cf46UG7QyNRx5A8w/Z7WwL4FXT8ato2AkB5LF5tzIN/
 7Exg1/+bUC28Rf55T4YQYUaiKAteIWqZUzXpZLUVIfC/lxd0Iopl+t0gt5JCMsuVymlJ
 LTtcGaaTqKWMRiyiBqk93YnvXPEJQDZzDZstZJSKoXrR5+ul2W3rDwOiGCod2i5cEOTi
 yIQQ==
X-Gm-Message-State: AOAM531/eC9MgbBM4Z8pg71IJjNztr0AGY3dI1UHjgK0m3lRE9dPamxw
 rKnw1rcsskkga4tJm8q6sMu9GJO7jPs=
X-Google-Smtp-Source: ABdhPJzCm9z5jx/RaX1mUC1fUsXLmijjLX8wayxNX8A+XpnxeQqCdiqGUB1sKAfH/S3w7Jj0p0BSQQ==
X-Received: by 2002:a5d:498d:: with SMTP id r13mr9177677wrq.379.1625390855579; 
 Sun, 04 Jul 2021 02:27:35 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z4sm8413914wmf.9.2021.07.04.02.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jul 2021 02:27:35 -0700 (PDT)
Subject: Re: [PATCH 1/2] Fix for Haiku
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Richard Zak <richard.j.zak@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <CAOakUfOhn43BUUGoJPahxmxxTk8vcPeyrgsX0GDmzt46ZriNeA@mail.gmail.com>
 <CAFEAcA-rhL_BEJMi7a2tCoVE61OV2o5QeDdDfz1JXL9fLvM_cQ@mail.gmail.com>
 <CAOakUfNpv_7TE+86R0+Ng=10mXtx2=pyZUZG8jPDgOdLbqrqKQ@mail.gmail.com>
 <5c47cf07-f02e-f7d8-2725-5ae0a240e37b@amsat.org>
Message-ID: <975f0d41-be4e-7e8c-2fc6-64eafc7c11a8@amsat.org>
Date: Sun, 4 Jul 2021 11:27:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5c47cf07-f02e-f7d8-2725-5ae0a240e37b@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/4/21 11:03 AM, Philippe Mathieu-Daudé wrote:
> On 7/4/21 12:06 AM, Richard Zak wrote:
>> For MIPS (all sub-targets, 64-bit and EL) & xtensa(eb), the compiler
>> complains about running out of memory. Best I can see, that's not what
>> actually happens, but that's the error message. I was going to
>> investigate this later, but this was the error which was causing the
>> test with the Haiku VM with that corresponding make target. My desktop &
>> laptop have 64 GB, and I'm pretty sure it didn't get to that point.
>>
>>
/boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../../../../x86_64-unknown-haiku/bin/ld:
>> final link failed: memory exhausted

> See how Haiku handles POSIX errno:
> 
> https://github.com/haiku/haiku/blob/master/headers/os/support/Errors.h
> 
> #define B_GENERAL_ERROR_BASE   INT_MIN
> 
> #define B_POSIX_ERROR_BASE     (B_GENERAL_ERROR_BASE + 0x7000)
> 
> #define B_POSIX_ENOMEM  B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 0)
> #define E2BIG           B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 1)
> #define ECHILD          B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 2)
> ...
> 

Same problem with Xtensa:

static uint32_t errno_h2g(int host_errno)
{
    static const uint32_t guest_errno[] = {
        [EPERM]         = TARGET_EPERM,
        [ENOENT]        = TARGET_ENOENT,
        [ESRCH]         = TARGET_ESRCH,
        [EINTR]         = TARGET_EINTR,
        [EIO]           = TARGET_EIO,
        [ENXIO]         = TARGET_ENXIO,
        [E2BIG]         = TARGET_E2BIG,
        [ENOEXEC]       = TARGET_ENOEXEC,
...

