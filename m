Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C962344B2C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:25:38 +0100 (CET)
Received: from localhost ([::1]:45638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONN3-0005Nr-2i
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:25:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lONM2-0004n8-BN
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:24:34 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lONM0-00046S-4H
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:24:33 -0400
Received: by mail-ed1-x52f.google.com with SMTP id bf3so20111394edb.6
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 09:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=u0iVDaA+S69KQJO5fAOQSPiRKRNoOAE++J9qElb9g0U=;
 b=WIIzXD/BuCOUHnzLuJNzMIkPJbHc7YrXpNFkCSjz1HIYsi5fosFBgDKsAYUmnVt2oY
 ACaAtVD/IdD+S3VnI9vdev/eph9AOfUVT7fvDru/kOLRSK0tmtNL4Rl06PTSYXgaP3o7
 fNHUhOZPpoEj2MzTcE06jvQQVXKnOSkGEVxMLL4i8VrMAWLd7Vj/3wO/gIawE6P3YAAJ
 cv8RnglaVOMIKq2PWhI6Qgc1kAKoxH1MmMxWuqFl7LdiDky78EgAcjJ0jO0Hj74GV3/N
 xIvsvVyllHAty7fjlZTrYumS5LBiDwMwyHl6UiOeBG9DJveKkrMA88vsvFOBPHy2gDPp
 c1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=u0iVDaA+S69KQJO5fAOQSPiRKRNoOAE++J9qElb9g0U=;
 b=pAPtomisJjahvNXBMSZvsGUNRDhL+kYKfaHGCND5AWpa1ZziVyrBec5P9gg9E0/z/A
 f1nqU1WXJdbY/cEXnumYMWC4cvqtOIwZDYAJBGbXG2qL1B7/JJb1k89/LunfPl2IaD51
 QOkeDU/kKYQqdS9W3d+EO1gm7CZsQxd/K0JYHT0VMIAGr9z9aagwqi3fW5a9dfwSHnMJ
 J8IrDlA41HTVcX/trBRk9XPX9402whBq83Bu4CmK50oFM6PBkXP+LsVKEZZRGJsYPu+7
 hc+7KyDba+2CadMq7Cx11GbuUbjn1BCdMDJbd/tZu2ZXcRocoESvlJ0OxGZXnf3Fqeol
 XVtw==
X-Gm-Message-State: AOAM533MkGxhDaOwT90JuaAHEZfm/Unzgyyn/1FQJktw4SqjKWUqm/qG
 SwEp5I6y71tlci6uj3Mi0VKsEA==
X-Google-Smtp-Source: ABdhPJzp8Bxag1CP5Czmvbs1BLADECn4Twi2Ivpn+9K/m7mXFSuvpo7CuSGWjGaMmX1llHbBW+Wy7g==
X-Received: by 2002:a05:6402:13ca:: with SMTP id
 a10mr388226edx.320.1616430270257; 
 Mon, 22 Mar 2021 09:24:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a9sm11947795edt.82.2021.03.22.09.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 09:24:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A3C9E1FF7E;
 Mon, 22 Mar 2021 16:24:28 +0000 (GMT)
References: <20210322144140.13505-1-alex.bennee@linaro.org>
 <e4946ac6-8580-c8fc-ae1b-f1907f00bdce@redhat.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] gitlab: default to not building the documentation
Date: Mon, 22 Mar 2021 16:24:04 +0000
In-reply-to: <e4946ac6-8580-c8fc-ae1b-f1907f00bdce@redhat.com>
Message-ID: <87r1k7jgw3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> On 22/03/2021 15.41, Alex Benn=C3=A9e wrote:
>> In d0f26e68a0 ("gitlab: force enable docs build in Fedora, Ubuntu,
>> Debian") we made sure we can build the documents on more than one
>> system. However we don't want to build documents all the time as it's
>> a waste of cycles (and energy). So lets reduce the total amount of
>> documentation we build while still keeping some coverage.
>> Fixes: a8a3abe0b3 ("gitlab: move docs and tools build across from
>> Travis")
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   .gitlab-ci.yml | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index 9ffbaa7ffb..7714c7cac8 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -23,9 +23,9 @@ include:
>>       - cd build
>>       - if test -n "$TARGETS";
>>         then
>> -        ../configure --enable-werror $CONFIGURE_ARGS --target-list=3D"$=
TARGETS" ;
>> +        ../configure --enable-werror --disable-docs $CONFIGURE_ARGS --t=
arget-list=3D"$TARGETS" ;
>>         else
>> -        ../configure --enable-werror $CONFIGURE_ARGS ;
>> +        ../configure --enable-werror --disable-docs $CONFIGURE_ARGS ;
>>         fi || { cat config.log meson-logs/meson-log.txt && exit 1; }
>>       - if test -n "$LD_JOBS";
>>         then
>> @@ -119,7 +119,7 @@ build-system-ubuntu:
>>       job: amd64-ubuntu2004-container
>>     variables:
>>       IMAGE: ubuntu2004
>> -    CONFIGURE_ARGS: --enable-fdt=3Dsystem --enable-slirp=3Dsystem
>> +    CONFIGURE_ARGS: --enable-docs --enable-fdt=3Dsystem --enable-slirp=
=3Dsystem
>
> I think it might be better to add it to the Fedora job - it will
> likely have a newer version of Sphinx and gets updated more often.

It's already in build-system-fedora, just the ubuntu one was squashed
when I moved tools and docs across.


>
>  Thomas


--=20
Alex Benn=C3=A9e

