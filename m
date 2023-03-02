Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB756A811C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:34:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhCf-0007FY-DA; Thu, 02 Mar 2023 06:34:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXhCd-0007FM-M6
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:34:27 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXhCc-0001Zs-3w
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:34:27 -0500
Received: by mail-pg1-x531.google.com with SMTP id q23so9580500pgt.7
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 03:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677756864;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=em4zClGTjsTlDf0Z5bh6zPlyaUXZ/u4APi2TXFt6uHc=;
 b=ZRHlHgEnOY0Cn9lKMAq4oYhh/ZQYV43Sbv7dTCjpXgZ+VZ373tQKcdMK3rp4iIvQuW
 z/hLUpbN/7XT85dGMavcbUttgasvvrdoJ8qIbBOuvv0nJbKNVc8OgrkotnDHt3LM49S0
 5ms6Lr/AB1gLUYZ7NOEE7UsOFS85nCgAlx5SOwSz48u8hhBHcfvkqu6Pa1i9XeAeLuwJ
 YkKBC00/VnlnVr9HDHXo+X1wLjKlsSJ3YuFjcUHXWmj378CUZR7AYKvVM22XEHe5XM28
 xJEJnOecbCT69MpZOHoSjvapYJAUooSZ+LDO3fRdqUK+nSm99L4AvOK6Vsit001eP1Hh
 2goQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677756864;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=em4zClGTjsTlDf0Z5bh6zPlyaUXZ/u4APi2TXFt6uHc=;
 b=BMMsU4tT6C9A3BNEnjW6PPWAaSoTmWjHCiWLsDnVRmxUEr1YEPDoVFS04/ddCSZdeX
 Epper4326EyBtUR/7zLIx4XvyTkkQ7JjzMdZ5xKKSJBifl/wIvwcqGwNSMIHI8QirPp6
 6nUFNygBTP3yRIv2st7szfTZ4U5fJANEEZ8a5+o/rPaSHuqgWdDlJvlMcwklKjBCz1pl
 mNdj2YkPpWXnMi9bGbXkuNbYcpZcC12zPQJifipck1OxvL3Nik4wqfJ1ql52hb8//aD0
 sN7Pl3R/2rJh9E0a/criZLDL4g3T6M2keJnjr7KqKM7TRInx2yKXB2DI+eoTr6xUJMsH
 fGwQ==
X-Gm-Message-State: AO0yUKV80YAqjURO3bG7dpOvuPj1B/+YUJtQcV5WCCeiEr8SMHaWdZHJ
 kbCPxIhMmBgeYdFpS6P0BOv9reaBiJywQm068O8jvQ==
X-Google-Smtp-Source: AK7set9W8fXMGf9/8GqOpnAeg1BM8+AoJIa/YSkGrfyhh18TkWq+Vyw0Z+51HTj1730sLQRAujxO5z7SEmWsM+djBvE=
X-Received: by 2002:a05:6a00:1624:b0:5a9:c22e:7764 with SMTP id
 e4-20020a056a00162400b005a9c22e7764mr3703808pfc.5.1677756864326; Thu, 02 Mar
 2023 03:34:24 -0800 (PST)
MIME-Version: 1.0
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
 <CAFEAcA_ok_VSAWk2uqhTs5sF2y3C_JmBNkb8HUGMX6ZX-xdVoA@mail.gmail.com>
 <87356ocp56.fsf@linaro.org>
 <CAFEAcA9X9nQ-6iYqGV9fWWmzDU_SE1ADed6xToOoDmMbvEBkuA@mail.gmail.com>
 <CAHDbmO19_HT7ZgtdvWfzp-BEn3uyhw7NKAW9f9adSHoaZ1mEug@mail.gmail.com>
 <CAFEAcA-Pve7oOuDmP=BDSt5Smdn8MUg2y47Y6PL3YMXwg=Q4Sw@mail.gmail.com>
 <87h6v3bdbb.fsf@linaro.org>
In-Reply-To: <87h6v3bdbb.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2023 11:34:13 +0000
Message-ID: <CAFEAcA9AWVJnNvxqyWPZuFzFQfSZYJ=tQdkgocT3fTMyhmxf4w@mail.gmail.com>
Subject: Re: [PULL v2 00/24] testing updates (gitlab, cirrus, docker, avocado,
 windows)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 2 Mar 2023 at 11:30, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Wed, 1 Mar 2023 at 19:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >>
> >> From the other thread:
> >>
> >> I think the underlying config needs updating:
> >>
> >>   .git/modules/tests/fp/berkeley-testfloat-3/config
> >>
> >> I'm surprised the git config for submodules doesn't carry the metadata=
.
> >
> > Yeah, in my local repo that I merge stuff with that file
> > does still have a github URL:
> > url =3D git://github.com/cota/berkeley-testfloat-3
> >
> > So I guess my questions are:
> >  (1) why hasn't this been a problem up til now ?
> >  (2) does this mean that if I merge this then everybody will
> >      need to manually go in and update this file somehow
> >      to be able to pull the updated qemu master ?
>
>   git submodule set-url tests/fp/berkeley-testfloat-3 https://gitlab.com/=
qemu-project/berkeley-testfloat-3.git
>
> seems to be the magic to reset origin without manually hacking things.

The documentation suggests
 'git submodule sync'
ought to work too ?

-- PMM

