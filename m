Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601C7454AE4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:23:56 +0100 (CET)
Received: from localhost ([::1]:33634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNiy-0003ql-UP
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:23:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnNfX-0006mz-NT
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:20:19 -0500
Received: from [2a00:1450:4864:20::432] (port=37591
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnNfV-0005me-Ve
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:20:19 -0500
Received: by mail-wr1-x432.google.com with SMTP id b12so5760063wrh.4
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H09du6N0rlWN6vSXz5iX/MHWyDat8eUapM3QF+lpbAA=;
 b=AA4BLhiUm8cB36rrVvUTztj+KOpjciuBt6sXYfTYkY6QbUnR3eFaH2Q8mDLKoTheSB
 XflcYo5Gq8ttf+GpQyvx/sf45e6KVZyvhK7XFqcHO9XPJHIkoi+y6KuTcLCFTNDq1pNb
 rgP6SZp837aHapT57hnSHp1M2QoCrnVhZ+KmYMmUu8iuLGiXxaU4sz2DMkyeCOm7nAiM
 WYDBicA5PiHXRzTEmPRgrLXBi6X/Xd7RRmr1w4p075yolKZwykcceMcTbTQQ90Zowe6N
 fwjRa8MmNyde5H8bROJINDBiwsRwmYAFpJRk44dlkQdU7gf9p2ZMrCwlMaHqxNrHXAZO
 DLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H09du6N0rlWN6vSXz5iX/MHWyDat8eUapM3QF+lpbAA=;
 b=GpS4BA2muopgm+fPNS+iQ8jZTr363zvuB1774TgTBVthOmeP47ytqYff2vqDR5tknr
 Dr+TQbJecADinH1SqMyY5xAQwOzambXEg8x500lsdFYs3UfPiQ8cQW2f5mwj1i2NhsUc
 +yoCL0kpZkBX1Q9DEgzuBRD9bbPr/YicbenF+ANwsUilvbIoVHjS5ATmIIGKVT6sCvic
 zqrYOSY1W6ebTHZF8VTS98eZ7anoaoV4Yk8KxMW3UOEGXC+RB4gGovCgFP9B6tQX6iOd
 kp8fJMfWoLQVbd813nILRhGgturwZwzBbEHSD6mEGOq14RqeFoe5oPqVtfmFm8YjXW/p
 MuEw==
X-Gm-Message-State: AOAM533dkF5AeyTSsaDpHzODpDZczrKcKpQzYoW5vxwbd5DmAay7s+IW
 EQn15E1nViIXPqn9LrSPnus=
X-Google-Smtp-Source: ABdhPJzYdWpSm6wdqNo7FHTAQx87hRw6iT7pLNB/uF0p+/HXrTvNliRAP9axMeiRHZRMjPKQlECBaQ==
X-Received: by 2002:a5d:6488:: with SMTP id o8mr20792688wri.348.1637166015456; 
 Wed, 17 Nov 2021 08:20:15 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l15sm126025wme.47.2021.11.17.08.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 08:20:15 -0800 (PST)
Message-ID: <987e99d2-9e3a-73f0-967d-3b53c2d3524e@amsat.org>
Date: Wed, 17 Nov 2021 17:20:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 3/9] linux-user/safe-syscall.inc.S: Move to common-user
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
References: <20211116110256.365484-1-richard.henderson@linaro.org>
 <20211116110256.365484-4-richard.henderson@linaro.org>
 <CANCZdfoaw3X=ArOz2+tdZJ+gLRS7Wizzyc7MFHXrJyGH0nPVww@mail.gmail.com>
 <13e5e214-ff3d-3f17-27c7-c4dac8f8dc91@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <13e5e214-ff3d-3f17-27c7-c4dac8f8dc91@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.009,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 13:49, Richard Henderson wrote:
> On 11/16/21 10:03 PM, Warner Losh wrote:
>> I had to add this:
>>
>> diff --git a/meson.build b/meson.build
>> index 0a88bff8d2..349e7a988f 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -2880,6 +2880,8 @@ foreach target : target_dirs
>>       endif
>>       if 'CONFIG_BSD_USER' in config_target
>>         base_dir = 'bsd-user'
>> +      target_inc += include_directories('bsd-user/host/' /
>> config_host['ARCH'])
>> +      target_inc += include_directories('common-user/host/' /
>> config_host['ARCH'])
> 
> I get an error for adding bsd-user/host/ at this point, because
> bsd-user/host/arch does not yet exist.  But I can certainly add
> common-user/host/ now.

Does commit 46369b50ee3 help?
("Introduce meson_user_arch source set for arch-specific user-mode")



