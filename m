Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B33FC311F8B
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 20:10:25 +0100 (CET)
Received: from localhost ([::1]:48130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8SyO-0001aZ-92
	for lists+qemu-devel@lfdr.de; Sat, 06 Feb 2021 14:10:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8Sx2-00018J-Fw
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 14:09:00 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:34319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8Sx0-0002zj-V5
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 14:09:00 -0500
Received: by mail-wm1-x331.google.com with SMTP id o10so9782412wmc.1
 for <qemu-devel@nongnu.org>; Sat, 06 Feb 2021 11:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JzvfSuwd9woqTwO82A/7o+pN0zzPLtEubOPYdzuy8fA=;
 b=jMYEZFu9fwiwyKlpWquY4XrZvaDXYN4K6euyyYVYF1SXDW16kz0D1CMh/JxE68XXtk
 GFy7UEgMOPhMJWk7vQUTUQOznz1bmaGiTj++Gq0/JvO+Y01J7n/XRJc5bqyWyxCUkkI0
 W+YxmsKO6I0C3ogNpQ8OEBV/CU1HVWPt7oxuJYMCVUwMJ/oILyCnmkCbkgaHfNLZewU3
 NmAkH8Ov8Tefhr6vI+M7lWcxhYDYTsw/bqu4pAEjgZHEnOO5megp65SuGjc0M4Irmyi/
 h8eE/sCQMA29Gj/YLfhbz5BFd1sWu5cDP/TOpUL5qfLUpg0kGHMdpupS/sVkCGI/9uNm
 JORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JzvfSuwd9woqTwO82A/7o+pN0zzPLtEubOPYdzuy8fA=;
 b=Ek/QA/l/mSklGuqmxE3htZMI4ThtQUh9j22dPAkQMgVX5R2dwaCx/GMfyh4+8Uuwgx
 wYx8q6v/otRrMRGwmAlD6/U20IoHvWpXgPp2sm+CpL8t6JvikbaLgllKY1KTbxSxO//V
 KG71szeXvWkYBIcC2gCiVW1keSzrPDq1oATvnn7lqOsyh8SjtY8EOQg/uhTIBmeUCNZe
 kq1lRqA8lIBd9Vo6M+UJ1DJ8wLJmI7an/9ra+ve58aCweeqNvDl1e+agJOIizoF+nEDH
 Zwbqtnrr+zae+mRvvDJrqLCbuQnxz1Po9XEvcR2xrx6Yv4/hk40wTLNdBGjWEK0pKhh5
 yfww==
X-Gm-Message-State: AOAM531iwl75zZWv5ErfaNLHdU7oCArK8sfzboZbKSi/pFGzxLqMd8Nv
 oCeIEtBjHn1Fvb0ZxzlIeEqvDjVufss=
X-Google-Smtp-Source: ABdhPJwTgEzQdOd7djfZzqmfMC7Elr6T9to//9j95Dphlx8z4dnspviDxZ4VOhI/Tqle1fEFScLqpg==
X-Received: by 2002:a1c:7905:: with SMTP id l5mr5937698wme.171.1612638536734; 
 Sat, 06 Feb 2021 11:08:56 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a17sm18110322wrx.63.2021.02.06.11.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Feb 2021 11:08:55 -0800 (PST)
Subject: Re: [PULL 04/31] build-system: clean up TCG/TCI configury
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Helge Deller <deller@gmx.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
 <20210123143128.1167797-5-pbonzini@redhat.com>
 <90002196-f2db-4ee8-a788-dca667bc63ef@amsat.org>
Message-ID: <d7d20ecf-2485-e907-11b8-a27076e72342@amsat.org>
Date: Sat, 6 Feb 2021 20:08:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <90002196-f2db-4ee8-a788-dca667bc63ef@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.105,
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
Cc: Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/6/21 7:01 PM, Philippe Mathieu-Daudé wrote:
> On 1/23/21 3:31 PM, Paolo Bonzini wrote:
>> Make CONFIG_TCG_INTERPRETER a Meson option, and enable TCI (though with
>> a warning) if the host CPU is unsupported, making it more similar to
>> other --enable-* options.
>>
>> Remove TCG-specific include paths from !CONFIG_TCG builds.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  configure         | 11 +++--------
>>  disas/meson.build |  2 --
>>  meson.build       | 46 +++++++++++++++++++++++++---------------------
>>  meson_options.txt |  2 ++
>>  4 files changed, 30 insertions(+), 31 deletions(-)
> 
> I spent 2h bisecting until:
> 
> 23a77b2d18b84e410478e88f11c54911f7a649fc is the first bad commit
> commit 23a77b2d18b84e410478e88f11c54911f7a649fc
> Author: Paolo Bonzini <pbonzini@redhat.com>
> Date:   Mon Dec 14 12:01:45 2020 +0100
> 
>     build-system: clean up TCG/TCI configury
> 
>     Make CONFIG_TCG_INTERPRETER a Meson option, and enable TCI (though with
>     a warning) if the host CPU is unsupported, making it more similar to
>     other --enable-* options.
> 
>     Remove TCG-specific include paths from !CONFIG_TCG builds.
> 
>     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> to realize I need to re-bisect from here now including:
> 
> commit c6fbea47664466e526e40300568324ef77e5f2cc
> Author: Richard Henderson <richard.henderson@linaro.org>
> Date:   Sun Jan 24 11:10:55 2021 -1000
> 
>     configure: Fix --enable-tcg-interpreter
> 
>     The configure option was backward, and we failed to
>     pass the value on to meson.
> 
>     Fixes: 23a77b2d18b ("build-system: clean up TCG/TCI configury")
>     Tested-by: Stefan Weil <sw@weilnetz.de>
>     Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>     Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>     Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>     Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>     Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

From a buildir configured *before* 23a77b2d18b84, checking out
*after* c6fbea476644 (5b19cb63d9d actually, pull-tcg-20210205
merged today) I get:

[352/396] Compiling C object
libqemu-hppa-linux-user.fa.p/target_hppa_translate.c.o
In file included from /home/philmd/qemu/include/tcg/tcg-op.h:28,
                 from ../target/hppa/translate.c:25:
/home/philmd/qemu/include/tcg/tcg.h:35:10: fatal error: tcg-target.h: No
such file or directory
   35 | #include "tcg-target.h"
      |          ^~~~~~~~~~~~~~
compilation terminated.

When starting in a new empty directory, it works. I don't understand
because there are no generated files involved (similarly to commit
0572d6cd29d).

Note for later: Better merge buildsys fixes sooner rather than later,
as it ease bisections.

