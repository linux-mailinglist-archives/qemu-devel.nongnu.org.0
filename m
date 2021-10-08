Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23CE4268A4
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 13:22:43 +0200 (CEST)
Received: from localhost ([::1]:59172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYnxY-0002YG-K4
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 07:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>)
 id 1mYnvY-0001bY-TN; Fri, 08 Oct 2021 07:20:42 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:37511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>)
 id 1mYnvW-0006GC-4b; Fri, 08 Oct 2021 07:20:36 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MwQGj-1mrzIo3Vgr-00sPbX; Fri, 08 Oct 2021 13:20:31 +0200
Received: by mail-wr1-f50.google.com with SMTP id v17so28696055wrv.9;
 Fri, 08 Oct 2021 04:20:31 -0700 (PDT)
X-Gm-Message-State: AOAM533RAYjIz1E+nzcp0HVDKEp1dUdTFsSykCQHHe72p4vIklfYNw55
 4qqelZEU/8OMwuTOyR4rmzRLEGAhaa/SRefNkOI=
X-Google-Smtp-Source: ABdhPJwmdLyhaewmRJRXqXMUIM7GqtXtVhwp6VBUaGEhSjspLIvHp3zzP2LHfsGoG7F9fLbQBLgADMdhGKa4rLdNfPI=
X-Received: by 2002:adf:f481:: with SMTP id l1mr3209844wro.411.1633692031269; 
 Fri, 08 Oct 2021 04:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <877deoevj8.fsf@linaro.org>
In-Reply-To: <877deoevj8.fsf@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 8 Oct 2021 13:20:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a09c2wFUMargRkonYQA6mUMnGK-+Lmrt4rDGEog5M3+6w@mail.gmail.com>
Message-ID: <CAK8P3a09c2wFUMargRkonYQA6mUMnGK-+Lmrt4rDGEog5M3+6w@mail.gmail.com>
Subject: Re: Approaches for same-on-same linux-user execve?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:q15D2Vjmh/CH0eYAv1jvWhChEjQwrAx7kt6Fme3Qeeh0fCtazl9
 zHVw1jgb/B6nMDcdyycYVR44BNA+ARJb00QqOx6bdKWUYl7tHvKgDh0yFheNW9WoJFREgs3
 zl7/W6o9mDQu3EvrWSLxwVXXBTkKYYi+GUUO9AswIBxwFVaYYatrf77NJqEe7QKQ1x37t4B
 ykHkY7R/jF7lZzfX5cn5A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZOMb5n9af58=:4Eu2yy2rK5oHvRjtecfrXr
 +NIstRjKREODQ6DA0LzBXSWs2ynu9T4VocE3O4PXPRh5lMtFLInBrHYO8IwqWGBL0vo15m67J
 fbpYphM/v1hHEogNgpqf0OdVEdWrSCvZ1DcGMYACCs7M6P9EnJpjLQvnEoZGletoAv5YgBZgB
 wbABYRt6VLn+5iCt6IUG9Qb87U0iyY3j74CY0xINs0LJDWgjw8qNm5VuQK8im40vFIxakSGne
 cFmwHvKWLahMPCNLfe8FmCd/bs4oez8xymCRWoatpwJJ47mZ40E7eQ5/z48O6iZ9ENghUkYaO
 BUjO/GjbcPdRF6pbJ/WIUo7WdX72sjDc1PorMePgyKzarAFNIUJRwh3wcitx8yOCwxIjbVNWA
 v/xUFye5V1Z/BaDdR4coBwx7quZ83kXuZdcm35JxPWa2jMqSlMUTDzVmSUbulzEwHXtltkQsz
 r92pb2nBrWEW4hsiBhCHId2XpZ0jZ7EARTfZUKYNUs4bXkfRX52NW87UB6WCvWAsZY69VHofM
 Qi4mszGNO13Us6nMtccP2wfMmaiaBwDii7yZjFQ35uEqIR3H8yYnvsTTm2n2vh+vmrw9ElbMu
 tSvaVtwtpN8ob8bi56RKT03Vu6ajU8uxbHhw0AvUs1mEVuitu7VjQJr7YbSNJuQGPloG/L2Gl
 eMuOq86Qa6xpdQVrIbQCKEClGR8JzBZDqtv3qs/lt7n6STnR75H/Y/v8SIOtPlYe6Ke5UKWHM
 UD3AV/l3SpA684+y2MWmmGtT5spOD4n+BeckdA==
Received-SPF: none client-ip=212.227.126.135; envelope-from=arnd@arndb.de;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: assad.hashmi@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 qemu-arm <qemu-arm@nongnu.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Arnd Bergmann <arnd.bergmann@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 7, 2021 at 4:32 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> Are there any other approaches you could take? Which do you think has
> the most merit?

Reading through the ELF loader code in the kernel, I had another idea:
If qemu-user could be turned into a replacement for /lilb/ld.so and act
as an ELF interpreter rather than a binfmt-misc helper, this might address
a lot of the issues automatically.

It would need to be a statically linked binary so it doesn't itself require
an interpreter. It would have to do the job of ld.so in addition to
the emulation, but it could do that by finding the real ld.so somewhere
else and running that in emulation mode. It would also not work at
all for statically linked executables.

Not sure if that makes the tradeoffs better than your other suggestions,
but it seemed worth bringing up.

       Arnd

