Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED073894A0
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 19:26:46 +0200 (CEST)
Received: from localhost ([::1]:48452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPy1-00041Z-LR
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 13:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljPry-0004ad-W2
 for qemu-devel@nongnu.org; Wed, 19 May 2021 13:20:31 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljPrw-0008Gh-S6
 for qemu-devel@nongnu.org; Wed, 19 May 2021 13:20:30 -0400
Received: by mail-wr1-x42d.google.com with SMTP id p7so11098039wru.10
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 10:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=hlfxI4GdyglrHlVe9pq+6l7D8aq8IBBy7pRMJBzAHdI=;
 b=g7It9T/htDmkdj1hFIsQdwKAugTDL/YOnU9jdVK2BMp5bJCCiPH3FUF3staoZWySK0
 uqLs8ec1dQjursLIkvkS0SR/Swm7t6U2N4+Y1UvLSuvq5ZB3eof/iJBI+5mznqQfBjpW
 KB27tSfhpOnW/ESKMHMoJEePLwSS4Wj06gWVskURCAUcykZDGOpM2KLRfwsMY2yWp4ej
 yLABn/oYqN2rdh09nza+ml+CNMqyA04c71M4hgPia5+rr1zAnAYoDQEfutk0rbEHRw2C
 Sc/DgwP5/RF70L3x2MrV+hgMBAdB727JPy7YiNxuA9IZQ+xNhMI1uVTrWV293DVbISy0
 TEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=hlfxI4GdyglrHlVe9pq+6l7D8aq8IBBy7pRMJBzAHdI=;
 b=eIK/cXa5rvuqCPcqgYJ0XkB0HOMD8HMfK0Xb+c02GcE+6cA7AtrD/Xhai2zBTy7v9j
 CfC+0MSVx9sgAujIis7gkJ32S/N0A7Eu1u4ykJYpk65I6fhk2E/WmNHhrgOauZ3A8a6U
 BtJiYz0++HW+twRLqVW6zDKUuAPr7KKRnsZOTZb6dKWjiLEBpnws67fmRiKzM/ZDJ1KA
 QMhrSjObV67RJxSGRvHVBoYBKplgE1VrV+uYPvCvrLG7WTYBOx2173KWPyKf+1g0lU44
 kU4t49hr3d1ds85Qr9Yjw992vYfQ1k6tn9wP5wpxeGCAkr+/4NHRYOORNS+mme2eKLqD
 aoSQ==
X-Gm-Message-State: AOAM532il3OjGxnk5rjY01S6yhyuumULtpYUiCTXnMWS6YFlPlocYXHV
 xtgkvB4axgqHwc7f/uYWQVqCJQ==
X-Google-Smtp-Source: ABdhPJz7r2bVWjRKOSacz/AmGAG8a0g3jF9D0KOAacS0Tqt96nX66SmHcHxBUPurwkyCF84rfwBa7w==
X-Received: by 2002:a05:6000:1544:: with SMTP id 4mr17994wry.370.1621444827087; 
 Wed, 19 May 2021 10:20:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n7sm1357wri.14.2021.05.19.10.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 10:20:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C0B551FF7E;
 Wed, 19 May 2021 18:20:25 +0100 (BST)
References: <20210518090720.21915-1-alex.bennee@linaro.org>
 <CAFEAcA_biNmALCd9hkCiRXWOiiKv9hPhHFH9=Yt1PMVCTF+kNg@mail.gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 00/29] testing and plugin updates
Date: Wed, 19 May 2021 18:19:34 +0100
In-reply-to: <CAFEAcA_biNmALCd9hkCiRXWOiiKv9hPhHFH9=Yt1PMVCTF+kNg@mail.gmail.com>
Message-ID: <87im3ed4iu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 18 May 2021 at 10:07, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> The following changes since commit 367196caa07ac31443bc360145cc10fbef4fd=
f92:
>>
>>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-=
6.1-pull-request' into staging (2021-05-17 16:44:47 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/stsquad/qemu.git tags/pull-testing-and-plugin-updat=
es-180521-2
>>
>> for you to fetch changes up to b1aa4de12e846e0ad18969ee823c19b66d8d4d8f:
>>
>>   configure: use cc, not host_cc to set cross_cc for build arch (2021-05=
-18 09:36:21 +0100)
>>
>> ----------------------------------------------------------------
>> testing and plugin updates:
>>
>>   - various fixes for binfmt_misc docker images
>>   - add hexagon check-tcg support docker image
>>   - add tricore check-tcg support
>>   - refactor ppc docker images
>>   - add missing ppc64le tests
>>   - don't use host_cc for test fallback
>>   - check-tcg configure.sh tweaks for cross compile/clang
>>   - fix some memory leaks in plugins
>>
>> ----------------------------------------------------------------
>
> This fails the 'build-user-hexagon' job in gitlab:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/1276171518
>
> "ERROR: Cannot find Ninja" seems likely to be the main issue...

OK the proper image is now pushed to the qemu-project registry (my tests
used my personal registry as a preference):

  17:16:11 [alex.bennee@hackbox2:~/l/q/b/all] testing/next=E2=86=91244|=E2=
=9C=94 + docker push registry.gitlab.com/qemu-project/qemu/qemu/debian-hexa=
gon-cross
  Using default tag: latest
  The push refers to repository [registry.gitlab.com/qemu-project/qemu/qemu=
/debian-hexagon-cross]
  512e7ffed4ce: Mounted from stsquad/qemu/qemu/debian-hexagon-cross
  d608c89fd339: Mounted from stsquad/qemu/qemu/debian-hexagon-cross
  07cc4994a1db: Mounted from stsquad/qemu/qemu/debian-hexagon-cross
  14a1ca976738: Layer already exists
  latest: digest: sha256:44fbef81dc947e643d6d15ee89ac609a28109fdaced61cbf1a=
9c5292f2e23076 size: 1162

And now that failing test passes:

  https://gitlab.com/qemu-project/qemu/-/jobs/1277078226

>
>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

