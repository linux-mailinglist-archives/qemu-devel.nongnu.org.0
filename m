Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9C92D7307
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 10:48:29 +0100 (CET)
Received: from localhost ([::1]:57610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knf2K-0008Cb-Ny
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 04:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1knf0o-0007m9-VI
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 04:46:55 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1knf0m-0003xM-3o
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 04:46:54 -0500
Received: by mail-wm1-x343.google.com with SMTP id v14so6997686wml.1
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 01:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=IvSTK3jPh8dX77bdvTlELOrL/VTypnA6Ggj1OSGhi3M=;
 b=bopoGUzBb6ApPCaDwQvf4pnT6Bf1de73ZTlTHDTXBuLo3aIpqS6Y3K+SsDGpyFqS/K
 S5hF21hVeSGBgpgH3dm2qGNVEfPiSnbE9Y2CvJdKTjnoNx59cQFPRdlymox3SC79O7tS
 0jn554osWwkNbZb47iX76BK6CQDT1/Kt8O52cIu5PqIcG80SCD7b4a//U0aWAZmEnc5/
 lGzVrit/67mIhzXmhNXqoOEqwV6Ir5rJCi6SGZIod/npAYV44WR+S2ClHnUOM/Hzeh0a
 /T/dNWWbGNr/RX8jveLLZG4V8DATLYMC/pLklp+MOSD34K1APLAt1W09WVsB4oJXNCRC
 mXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=IvSTK3jPh8dX77bdvTlELOrL/VTypnA6Ggj1OSGhi3M=;
 b=h+1zPC7Ao2Kb6WDkzyHp3prMGVc/bBTvfWT+MiDo6a4EKBph5l9o6hwPL6GZGB5cAY
 ZnWYdtoSHbkYQubxjgd59JrcMswtUxUdYTu+rHXbo1bHufzL9txQT78QdwXr0XbVyL3K
 5Vn19Mz+s0V+k8hL10sLpf85a5Hx6uEZb+IVIWqrwaxQPwLdNN+CYtBspBI7SwzYWRST
 nP1XUPireUTS4OM9mBUmg5xgd0a5l+cF0bPk4ianFrcjB5kY5945aF7voVSyEOruEdYu
 pe3j68F0Uaf9Mfhq8SDvTiXLuhdLrjuNFZUUeCu8Bcflu2YIBBqzvxHQls0uW2fq4rqN
 o4jA==
X-Gm-Message-State: AOAM531Hqdx1HJ8/SIiF5jP7J8Bzq7Z7gilGz7vD1fhp70BkVoOVcy/k
 Vu/W8m/4hdgqzoIuNoHh3/pR+w==
X-Google-Smtp-Source: ABdhPJxDgz+R6l6FdXZgI8I/usP44WmntqV7/k9ySa19zYF5aRdTdXfGXkNl6N9DREFYdbuuo0aCnw==
X-Received: by 2002:a1c:7f90:: with SMTP id a138mr12858702wmd.61.1607680010203; 
 Fri, 11 Dec 2020 01:46:50 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a13sm14256251wrt.96.2020.12.11.01.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 01:46:49 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 362A51FF7E;
 Fri, 11 Dec 2020 09:46:48 +0000 (GMT)
References: <20201210190417.31673-1-alex.bennee@linaro.org>
 <20201210190417.31673-5-alex.bennee@linaro.org>
 <dad53fb4-8aa4-441b-1daa-01b635396ad4@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 4/8] configure: add --without-default-features
Date: Fri, 11 Dec 2020 09:44:11 +0000
In-reply-to: <dad53fb4-8aa4-441b-1daa-01b635396ad4@redhat.com>
Message-ID: <87360cd69j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 richard.henderson@linaro.org, f4bug@amsat.org, qemu-devel@nongnu.org,
 cota@braap.org, stefanha@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> On 10/12/2020 20.04, Alex Benn=C3=A9e wrote:
>> By default QEMU enables a lot of features if it can probe and find the
>> support libraries. It also enables a bunch of features by default.
>> This patch adds the ability to build --without-default-features which
>> can be paired with a --without-default-devices for a barely functional
>> build.
>>=20
<snip>
>> -# is impossible without a --enable-foo that exits if a feature is not f=
ound.
>> +# is impossible without a --enable-foo that exits if a feature is not
>> +# found.
>
> Why did you wrap the second long line, but not the first one?

Hmm I probably just hit return on that line and my editor wrapped it.
Revert or reflow?

>
>> -brlapi=3D""
>> -curl=3D""
>> +default_feature=3D""
>> +# parse CC options second
>> +for opt do
>> +  optarg=3D$(expr "x$opt" : 'x[^=3D]*=3D\(.*\)')
>> +  case "$opt" in
>> +      --without-default-features)
>> +          default_feature=3D"no"
>> +  ;;
>> +  esac
>> +done
>> +
>> +brlapi=3D"$default_feature"
>> +curl=3D"$default_feature"
>>  iconv=3D"auto"
>>  curses=3D"auto"
>>  docs=3D"auto"
>> @@ -303,52 +315,52 @@ netmap=3D"no"
>>  sdl=3D"auto"
>>  sdl_image=3D"auto"
>>  virtiofsd=3D"auto"
>> -virtfs=3D""
>> +virtfs=3D"$default_feature"
>
> So this currently only deals with the variables that are pre-initialized =
to
> "" ... but what about those that are initialized to "auto" ? I think they
> should be handled, too? Well, it can still be done in a later patch, I
> guess.

Most of the auto flags go through to meson which can then squash them
with the -Dauto_features=3Ddisabled, but I can fixup the auto's left in
configure with additional patches.

>
> Acked-by: Thomas Huth <thuth@redhat.com>


--=20
Alex Benn=C3=A9e

