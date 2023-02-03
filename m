Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F072689E81
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 16:48:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNyI9-0002cS-4L; Fri, 03 Feb 2023 10:47:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNyI1-0002Ta-0I
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:47:54 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNyHw-0003k5-KN
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:47:46 -0500
Received: by mail-pg1-x52a.google.com with SMTP id 7so3912481pga.1
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 07:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XU1lsO1l+T2lVdWzPmKWL9Gkg/aMQhYeB6UGMIMVJYM=;
 b=qE8HLCb0+p7iHAnl0S6SrWrV2EYq9d+9pAXQedgNt+tEgnkA6FJ8kf3hSc2AN44z99
 2oO2fDz9ZP7lgRolDs4j5xltb8Zj8VuVlu4rS3MFWhvmDiCr3LMNn1LolCGNl5VoAzkO
 vMO3ZWIVHy0C0pj4p1fiRxByt1287+ZZxHIlXhNsJLEVlH2t3GXzwJTny6g8tYupjTJe
 JrxNdgLnFu2J+Ero2iTHz+AVcyLqF2sCCC0ha4NzR+aRh0F4S2HOYt8WqlsQu1E/1QTD
 LwhcCW0+ULgJ0lMi2eaBFXWuhYdYrx84NznDWzEc3sVX+fw4kruXYugvzUdg+KlwJ+sn
 /Lug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XU1lsO1l+T2lVdWzPmKWL9Gkg/aMQhYeB6UGMIMVJYM=;
 b=LvA6W0GSyZOUwi1NBi6UBG1xP4PAZ943huDG35iIF8yD7sl8f8yXhpCTFivxeHVNPu
 g1+uPPZaEs066ZcXwi9NM0993czfLauEJe685pM9RoMd8FFcAisbUQCwd9dF+5QciM3t
 mnK8sLSsx4F+ovZglX48WL8Qe5R4bE61dOgG94PbMwCHxOKb7Sx3PuZE3LQltMcMgCr/
 0u/jZlu2N2L4RFmiV0gEokqk19qOD7++LdXCoR2vZflO4wnCyAbZVVM5lLMoCbXGqaKU
 +iJpKOkLzkwYH74iVCeWX2iu0FL3Bx6U1XIIUCYXKw2f43FSWKrRFtTTUShGLpkAwxsu
 KPrw==
X-Gm-Message-State: AO0yUKWZeiINy9ewgJk09tbZhGUZ2cAncc5VsmW7zDA6dazU2iIlHxwh
 3Ssx/h1MZsUR7jsKFy9gXaMPyTJ0vQZhixwjjeK4iw==
X-Google-Smtp-Source: AK7set8IvJ4scC1SdlGnLKawNUF5P3kmbQTWfou4Gv7y2gBeIlBIiTlKl9v+rQdeHo+PtUM5m+W7sF6HCfP2taDMhaM=
X-Received: by 2002:a63:1a51:0:b0:4da:e1c7:99be with SMTP id
 a17-20020a631a51000000b004dae1c799bemr1730237pgm.37.1675439262948; Fri, 03
 Feb 2023 07:47:42 -0800 (PST)
MIME-Version: 1.0
References: <20230130104446.1286773-1-thuth@redhat.com>
 <20230130104446.1286773-7-thuth@redhat.com>
 <Y9eizgN9UYo5kbgx@redhat.com>
 <fc5dba59-4993-ee66-a94b-a550bdced396@redhat.com>
 <Y9z5TohXERGuQ6TS@redhat.com>
 <2caefefa-8757-af55-ccf3-fcc641db0784@redhat.com>
In-Reply-To: <2caefefa-8757-af55-ccf3-fcc641db0784@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2023 15:47:31 +0000
Message-ID: <CAFEAcA972rKvQqJh2-FghQcJ1hswVWkhtzb3-KW4CgsypnQgYA@mail.gmail.com>
Subject: Re: [PATCH 6/6] gitlab-ci.d/buildtest: Disintegrate the
 build-coroutine-sigaltstack job
To: Thomas Huth <thuth@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>, qemu-devel@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, hreitz@redhat.com, 
 dgilbert@redhat.com, quintela@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
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

On Fri, 3 Feb 2023 at 15:44, Thomas Huth <thuth@redhat.com> wrote:
>
> On 03/02/2023 13.08, Kevin Wolf wrote:
> > Am 03.02.2023 um 12:23 hat Thomas Huth geschrieben:
> >> On 30/01/2023 11.58, Daniel P. Berrang=C3=A9 wrote:
> >>> On Mon, Jan 30, 2023 at 11:44:46AM +0100, Thomas Huth wrote:
> >>>> We can get rid of the build-coroutine-sigaltstack job by moving
> >>>> the configure flags that should be tested here to other jobs:
> >>>> Move --with-coroutine=3Dsigaltstack to the build-without-defaults jo=
b
> >>>> and --enable-trace-backends=3Dftrace to the cross-s390x-kvm-only job=
.
> >>>
> >>> The biggest user of coroutines is the block layer. So we probably
> >>> ought to have coroutines aligned with a job that triggers the
> >>> 'make check-block' for iotests.  IIUC,  the without-defaults
> >>> job won't do that. How about, arbitrarily, using either the
> >>> 'check-system-debian' or 'check-system-ubuntu' job. Those distros
> >>> are closely related, so getting sigaltstack vs ucontext coverage
> >>> between them is a good win, and they both trigger the block jobs
> >>> IIUC.
> >>
> >> I gave it a try with the ubuntu job, but this apparently trips up the =
iotests:
> >>
> >>   https://gitlab.com/thuth/qemu/-/jobs/3705965062#L212
> >>
> >> Does anybody have a clue what could be going wrong here?
> >
> > I'm not sure how changing the coroutine backend could cause it, but
> > primarily this looks like an assertion failure in migration code.
> >
> > Dave, Juan, any ideas what this assertion checks and why it could be
> > failing?
>
> Ah, I think it's the bug that will be fixed by:
>
>   https://lore.kernel.org/qemu-devel/20230202160640.2300-2-quintela@redha=
t.com/
>
> The fix hasn't hit the master branch yet (I think), and I had another pat=
ch
> in my CI that disables the aarch64 binary in that runner, so the iotests
> suddenly have been executed with the alpha binary there --> migration fai=
ls.
>
> So never mind, it will be fixed as soon as Juan's pull request gets inclu=
ded.

The migration tests have been flaky for a while now,
including setups where host and guest page sizes are the same.
(For instance, my x86 macos box pretty reliably sees failures
when the machine is under load.)

-- PMM

