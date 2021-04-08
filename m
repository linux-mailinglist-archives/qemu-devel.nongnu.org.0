Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A440A358078
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 12:21:52 +0200 (CEST)
Received: from localhost ([::1]:59140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lURnL-0001jc-Na
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 06:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lURkK-0000Tf-6u
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:18:44 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:54219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lURkG-0002w7-TK
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:18:43 -0400
Received: by mail-wm1-x335.google.com with SMTP id p22so919869wmc.3
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=43wrP4+h1EJTdD6HNApR30qrDokqb8gGQpSbF/V27Tk=;
 b=oT+otYgjEAYgEI+gBbat6Fo2Q4E3OAETP6i7/qQQwMXJ5jdhRA9LTQ3RmHKq2AP2Ij
 J9XnKLvTwRY9jQtH4xpaYjzoO7Ur/6fkWBe4+vHWjHchdxiE6UIC381FLAuS+4evPRe4
 iJ2nbAtv9KMOgKXj47CJW6EQOc5FcO2JFDj/WCvLwXmkVVpjZXHV7O49FKcmm7PEz79C
 v5jI5yqTO3gAPzo+9pbQYfFVmrhsKFksuyWIG2Ut5WiykU4ryd1iG1d0IHDEPvpc9ZAN
 LTMvHmEDwD2dmlxNewkWFTxD4HYiWibXfVJlz/AEp8aRNHZLUzNDaM8jqkDy9K2DTUNn
 hezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=43wrP4+h1EJTdD6HNApR30qrDokqb8gGQpSbF/V27Tk=;
 b=AWYdaJ2+2zP5bJ0kOuIirZMzabNtWrZiTEp8mn2GvMrSiw3KXpHa3tVllSEnF6mpjx
 ROjM/OsDuD6f0ee0ziAM7xun6MZrxMCifonsCR85Q6xdmnw5EGTeVFcy/1KKAuUHnDSp
 dByWIOnqpji0eW93uwkiCpUNtymyc55yk3ix65039TrPXSU3BZmMqazd4jy9ANwSh2vo
 /uWFAruISCAdn21n6INBtyJYFj59GhOlC+FurFd99GccgCDWs91PZPk5qhgb8TK+NAPH
 hCFXguisTCAbGwmQZEnOLSanj8Jm6m+E4STKgEEhS3Z3oqMdH8WjpW8dvNVfpLppWba8
 SMFA==
X-Gm-Message-State: AOAM5320eWl0MH0RU4khfVSJK0eehQkvDrSp77n11KyuuOLtFt/vK6Vu
 kR94cdAEe4B7yyICF/Yw+5D1GQ==
X-Google-Smtp-Source: ABdhPJyd1v4o9GZGQgoiFgMnLTAoO26QvtQY1g8UpEvDGpxgSnIT/goj1qQ75MICBEOp9XNbafMJLg==
X-Received: by 2002:a05:600c:154a:: with SMTP id
 f10mr7397793wmg.20.1617877118996; 
 Thu, 08 Apr 2021 03:18:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z15sm15222725wrw.38.2021.04.08.03.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 03:18:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 748681FF7E;
 Thu,  8 Apr 2021 11:18:37 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-4-richard.henderson@linaro.org>
 <877dleuds3.fsf@linaro.org>
 <CAFEAcA9Vc=w9d-3DkwuyY8Vzrj4d=f2zHn4OXauQRc-Vr=oQzQ@mail.gmail.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 03/12] target/arm: Fix mte_checkN
Date: Thu, 08 Apr 2021 11:02:57 +0100
In-reply-to: <CAFEAcA9Vc=w9d-3DkwuyY8Vzrj4d=f2zHn4OXauQRc-Vr=oQzQ@mail.gmail.com>
Message-ID: <87k0pdt6yq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: 1921948@bugs.launchpad.net, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 7 Apr 2021 at 19:54, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>>
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>
>> > We were incorrectly assuming that only the first byte of an MTE access
>> > is checked against the tags.  But per the ARM, unaligned accesses are
>> > pre-decomposed into single-byte accesses.  So by the time we reach the
>> > actual MTE check in the ARM pseudocode, all accesses are aligned.
>> >
>> > Therefore, the first failure is always either the first byte of the
>> > access, or the first byte of the granule.
>> >
>> > In addition, some of the arithmetic is off for last-first -> count.
>> > This does not become directly visible until a later patch that passes
>> > single bytes into this function, so ptr =3D=3D ptr_last.
>> >
>> > Buglink: https://bugs.launchpad.net/bugs/1921948
>>
>> Minor note: you can Cc: Bug 1921948 <1921948@bugs.launchpad.net> to
>> automatically copy patches to the appropriate bugs which is useful if
>> you don't have the Cc for the reporter.
>
> I'm not sure cc'ing bugs on patches is very useful, though (and especially
> not for big series). I usually prefer to just add a note to the bug with
> the URL of the series in patchew afterwards.

Ideally the tooling would pick up bug links in Patchew and automatically
update the relevant bugs when new series are posted. I only mentioned it
because the original bug reporters weren't Cc'ed on the patches and lo
now they know about the iteration they have tested it ;-)

--=20
Alex Benn=C3=A9e

