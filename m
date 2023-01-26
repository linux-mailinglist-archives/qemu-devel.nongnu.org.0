Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2293567CE15
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 15:28:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL3E4-00038b-Vt; Thu, 26 Jan 2023 09:27:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pL3Dv-00038A-5v
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:27:34 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pL3Dt-0002PM-Ls
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:27:30 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 h5-20020a17090a9c0500b0022bb85eb35dso1839324pjp.3
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 06:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pvlc48kG0Ul/yGEzTltdtLaj37EFER+POyGpdvLmJVU=;
 b=TuBFJ+BAf/oX7pzkDEGoZR7+GraGcji6XS5VtCvSHmr2oIuFyf+iEKkL+6siSHe5Cc
 cM3/7sbLFHC+lAoVr+Ej3jpeTMTUH8EAiAjLOnAdcgY+WQfa1SmgOjzuag8tecbBrMRt
 FpoZI9o48x9IMeLdgLTpA1fnccpAbLXy6LmFpUI1QDu+AldmxPVW4+h5/Sc6OZdlxsSL
 ZYcMQLFLWtF93z3iCQWP/4Z2q1w8/Eoj4ryxDIHj6swrdjg/tOpU1G2PjLfWX48Oh/pd
 MTXXZO/c6ukro+ex+djtoRg5lFP18XBsGaQ7eUC5No+Oriortxnay7rfUrnsU6wQR10l
 HzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pvlc48kG0Ul/yGEzTltdtLaj37EFER+POyGpdvLmJVU=;
 b=mZs5oGQ0qYYz7r2aWZtHKm2r6s8L+3+wS6+27Lwh9Rry1WbjaOpCFCfcGvS6F+FeMA
 wM1NxnGmU0620BlE3sPYOX40yWrZzC9mdCYdcHpiEds/dqFJ4P+B+3dDnl5l3s3UXEHa
 EQEwVrqiMwrh3lQrtUpcbQv8UPVorC5q4qfHRz5szr/bWp+H7uJgy8Ry5EOTB3xtQ2O+
 Z01UeOok/oPmhjdy7iZrhinsZw8dhqtIbGnQEBAPHbCZ1Jb/iHRQbB9Cvn0jrAxZBgbe
 mGBMchi/138qf+xWUe0yBgW0pFdAdoQjiC1n5NWvPpj9aTXCja0x303M4PNXmzACOmKR
 /F8A==
X-Gm-Message-State: AO0yUKUOUgY7SURFyg52epYOzinZ9uFmxX31VcC+zmITYdM9NpPlrAru
 2g7rBX8KxR1V71ZnflI1XLwwSgqsxMqAhOg5aKnNOw==
X-Google-Smtp-Source: AK7set/tpOIGYBg47AtWouBE65ThWpias4BC00WUD6n5gz3WEpSd3sk2d4AKgmFtcsmF5/F4D1caVaLUZIHZk5uDyIE=
X-Received: by 2002:a17:90b:312:b0:22c:37a4:6ae3 with SMTP id
 ay18-20020a17090b031200b0022c37a46ae3mr91931pjb.97.1674743248066; Thu, 26 Jan
 2023 06:27:28 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
 <Y9KFp06pp/qohgV1@invalid> <87h6wdpeig.fsf@linaro.org>
In-Reply-To: <87h6wdpeig.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Jan 2023 14:27:16 +0000
Message-ID: <CAFEAcA_6J7M8OMjB=NQAwJqcGd96c1Q=3dQwX7HDLiAorY809g@mail.gmail.com>
Subject: Re: no more pullreq processing til February
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Eldon Stegall <eldon-qemu@eldondev.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
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

On Thu, 26 Jan 2023 at 14:16, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Eldon Stegall <eldon-qemu@eldondev.com> writes:
> > I have several baremetal machines colocated that I could dedicate to
> > execute these runs, dual processor xeons with a couple hundred gigs of
> > RAM. I would need approx 48 hours notice to initially provision the
> > machines. I would be happy to provide root credentials and work out IPM=
I
> > access if that becomes necessary.
>
> I think we would need:
>
>   - provisioning scripts in scripts/ci/setup (if existing not already
>     good enough)
>   - tweak to handle multiple runner instances (or more -j on the build)
>   - changes to .gitlab-ci.d/ so we can use those machines while keeping
>     ability to run on shared runners for those outside the project

Also
  - the provider of the private runner agrees that they're doing
    the system administration for it (i.e. keeping the OS distro
    on it up to date, installing security fixes, etc)

(We've historically had a severe lack of people with the time
and expertise to do sysadmin work, which is part of why we
moved towards doing CI on gitlab in the first place).

thanks
-- PMM

