Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8852D9D7D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 18:22:15 +0100 (CET)
Received: from localhost ([::1]:39498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1korY5-0002aG-Rq
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 12:22:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1korRE-0004oY-MD
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:15:08 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:39218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1korR8-0006uq-EB
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:15:07 -0500
Received: by mail-ed1-x542.google.com with SMTP id c7so17941843edv.6
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 09:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kHK+8JW3o/66OeJGgGkKLUVvpyGprz6TQSevzUa59LI=;
 b=uKRRfl80/3FDMoezWOp/Xy+zEcU2ZhlRZtpZrf9gNMsta2WZxJl0MlfiPz5enMK0/1
 eZkQE+bcP+rmCamH7DIF5n0HpPWZ10dHdPOqb3zVqapGuU19biBa3YkLi3aoYnq00W+P
 i2DPuKX58mZOzJKMdYX9srDIheiUdFrBYM1sXcVaQdJE/F2tDCylvGxcdrST0gXP26sE
 sIUiICkg/QGFf/Pg163aG0pxkrIxxYaWsLixvKI9jiogwHz4RF8hhxHV8CsWI2kqmc2U
 fMKDAiK5noZaGsvTYtIC6ms0jGW5NzwrqHkn59sVeEugSRZbBd0rKEpdezWtF98getNn
 zJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kHK+8JW3o/66OeJGgGkKLUVvpyGprz6TQSevzUa59LI=;
 b=oTNt8oCxcUjq5F2jUZ0FJrOB2sxdEXp4QoHBnulnFELvql/l9DyBXtPCmbQQvWtLWI
 3kugxr+JDljy3Mbr8cSFyIhrFpq0VeoWum96x/2lmWnsnN9IsoC2Cvb4LTamPFqzQLo/
 rHNyn9c7WZuMeh5D0sG81/s953/ZbcCbnGDue9pi8IOzvwzWXyi7lDQaI8RkTGjJPPnc
 PlRVZpktBSxB2IBxUCTHDypc51oMPlJ+4vVtJjo4g2CMEnOhHRUTeXGEhpVQ8G7PsOhi
 RWXqRSWpWtLgAW9d/sAToiUIcmR+IiNVSnrVhcCkjYdtM6ijYlu5Ue3SLTzSBEeiWz45
 NfSQ==
X-Gm-Message-State: AOAM533OJ6kmazK7+UfXHk5jRQZHIE9ogOO2euyEF6ved5zEMzLsASO1
 8A0qZ/Ax+899FYyxpbYCZ2uPXkMWxEBA6k0t+jYKeA==
X-Google-Smtp-Source: ABdhPJwA+iAf0CU0l3y/eRzIwYnReOwQKV5xtinLPPSnr0QAnfhxLfd956fm/ANDfg1OA0aTTPwZDHSn2uJU9YywNNM=
X-Received: by 2002:a50:fd18:: with SMTP id i24mr26093522eds.146.1607966099384; 
 Mon, 14 Dec 2020 09:14:59 -0800 (PST)
MIME-Version: 1.0
References: <20201214153012.12723-1-alex.bennee@linaro.org>
 <20201214153012.12723-3-alex.bennee@linaro.org>
 <CAFEAcA_2N=bMikxfHQWoX=rOOockSAAjpbBf8upm=w-LWp4KqQ@mail.gmail.com>
 <87r1nstiwj.fsf@linaro.org>
In-Reply-To: <87r1nstiwj.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Dec 2020 17:14:48 +0000
Message-ID: <CAFEAcA9iTxBuUbi1fD=icgLLAY8m2Zsa54JBDDvGxk=-0iPWqA@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] configure: gate our use of GDB to 8.3.1 or above
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
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

On Mon, 14 Dec 2020 at 17:08, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Mon, 14 Dec 2020 at 15:36, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >> Certain earlier versions of GDB have (possibly distro) derived issues
> >> when running against multiarch guests. Also given the problem of
> >> clashing ports it is preferable to use socket comms rather than TCP
> >> ports for testing.
> >
> > What's a "multiarch guest" ?
>
> I guess non-native guest would be another way of saying it. There is
> some hoop jumping to deal with the fact that some arches package up a
> fully featured multiarch aware gdb and some package up the multiarch one
> as a separate gdb-multiarch package.
>
> > Incidentally I think the problem I have been running into
> > with the Ubuntu gdb 8.1 is that it doesn't support registers
> > larger than 64 bytes, and if AArch64 QEMU is emulating SVE
> > then it tries to expose registers bigger than that to the
> > gdbstub.
>
> So this is a missing patch from Ubuntu's gdb?

No, upstream 8.1 doesn't handle this either and crashes too.
I'm a bit surprised we haven't had user complaints, since
gdb+QEMU would have previously worked and then started to
crash gdb when we put in the SVE registers.

> We could just peg the sha1 test to cortex-a57 - your are likely not
> getting the SVE tests running unless you have the compilers to build
> them (or using docker).

Yeah, forcing a non-SVE CPU should allow the test to work with this gdb.

thanks
-- PMM

