Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 590C73A55ED
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 03:10:41 +0200 (CEST)
Received: from localhost ([::1]:52028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsEe7-0000nv-Tb
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 21:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pauldzim@gmail.com>)
 id 1lsEdD-00006W-7p
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 21:09:43 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:37702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pauldzim@gmail.com>)
 id 1lsEdB-0006SG-Hu
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 21:09:43 -0400
Received: by mail-io1-xd2e.google.com with SMTP id q7so35790172iob.4
 for <qemu-devel@nongnu.org>; Sat, 12 Jun 2021 18:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PgfHjqxuG4y/oGLkTSgIPYAG+bCRUaha+6F/lRpNRPA=;
 b=PzWrG8QvVZItYiH5CLFBQHh32857myPiSwLaWEI4iufk13y+sVIAtzpnN0Nav4RppW
 EQWyt32io+7rh/HTvrGRQcDF7FBqZXTcbaFtCNVhgmdC9tR0JqRSJ39TuzB9vRwEIxa0
 Cj3p7120lB2pTEGEgdpZ/0uO/csLnZp+AqmIAMgG+jEEFzyTvCREUxP8LWRKqfl6GlbW
 10tKZUVzC7GBoQVnEafHxAnR1ehqQUC1QdqKmTcEi5zqRDFgmpYsu5NfbGjBJqE8F5P2
 MO1i/Nm1ulAkjKwxqMIcBJWu5BFB0mcDHfBO7wG0zDZAARZbKWBDkildr1P+uh1DmckE
 PFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PgfHjqxuG4y/oGLkTSgIPYAG+bCRUaha+6F/lRpNRPA=;
 b=sQNq8gU3Ura0gtbA3sVaXbd2G1fdVr4+yPfY5fkasS6ThmjfveEMzf7DnDnqXcgOaE
 OCmnyR2YjM3e/OAvu891QFK5Ol82HV0pu/vp1WPVp0HYOaWZn/Mj3ZU4NSzk3k/eNoFg
 2co2fa1Gx2O70EuTxWXu05YOCKqVX9JIP48C9O18ALGW8m5oKyZj3GICbiOxx9lbTI3z
 00Ukrd+MJrEC2vsmDbE62CUfvtjp76YsEd7zWH6UUGJPPWXTo6Ty177XzaIHCmGzF3QH
 XhLI++8T7LOf8j7S0egCGduMjC8ic9zhdds7gmBpjxTgKip8k6gmccSoqsY4dOm2OB8x
 kdSA==
X-Gm-Message-State: AOAM5323hMqzDWJaXzYDud0AhbklQq0I6k5rsCVZq4lNk4qeYkpawxXz
 Ya4xi0mCJiJ3JviTHkgCJZuFZnyHMd9OW8feEeE=
X-Google-Smtp-Source: ABdhPJzYMHB+bkGfOOt7SCBexdCKpCVzBubFizddOvZqJ9ZWKjRRpCrNVX9Nm8hbwLyJxi2Ay6f0k6S58vuSCpP86B0=
X-Received: by 2002:a5d:88c4:: with SMTP id i4mr9149884iol.210.1623546579644; 
 Sat, 12 Jun 2021 18:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <reply-a8857b5ced579c7499da46ef969a0b87@gitlab.com>
 <issue_86599308@gitlab.com> <note_597531265@gitlab.com>
 <note_598004557@gitlab.com>
 <CAAdtpL4utd6p3_Rg+h3rFt=V2sKv288G11dNqjDU21YitC2q-A@mail.gmail.com>
 <CADBGO7-KMxXA4sXGdztNfoK2h6Jim6Kyi=yuLLC083jAv_sppw@mail.gmail.com>
 <44d114c5-a43d-815e-a3e5-b551654e9960@amsat.org>
 <CADBGO78QHUFUKd+2JNY2wdWf4egaY4v+qv6tEc4zj26mHPEcZg@mail.gmail.com>
In-Reply-To: <CADBGO78QHUFUKd+2JNY2wdWf4egaY4v+qv6tEc4zj26mHPEcZg@mail.gmail.com>
From: Paul Zimmerman <pauldzim@gmail.com>
Date: Sat, 12 Jun 2021 18:09:13 -0700
Message-ID: <CADBGO7_A5insgdpVr+EqcPc4YfYCq26at2zNjwpeWBuXTeOmXw@mail.gmail.com>
Subject: Re: QEMU | USB Ethernet device (RNDIS) does not work on several
 tested operating systems (#198)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=pauldzim@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: John Snow <jsnow@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 QEMU / QEMU <incoming+a8857b5ced579c7499da46ef969a0b87@incoming.gitlab.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jun 12, 2021 at 12:10 PM Paul Zimmerman <pauldzim@gmail.com> wrote:
>
> On Sat, Jun 12, 2021 at 12:40 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org> wrote:
> >
> > On 6/11/21 9:48 PM, Paul Zimmerman wrote:
> > > I will take a look. Might take me a couple of days to get to it thoug=
h.
> >
> > Thanks!
> >
> > Odd, your comment appears as posted by myself on GitLab:
> > https://gitlab.com/qemu-project/qemu/-/issues/198#note_599551747
> >
> > BTW Paul, could you join QEMU GitLab project to help us with this issue=
?
> > https://gitlab.com/qemu-project/qemu/-/project_members/request_access
>
> OK, I put in a request to join the project.
>
> - Paul

This is Paul again.

I looked at the issue from =E8=99=8E=E6=B8=B8 @hu60.cn about the dwc2 probl=
em, and it looks
like the issue there is that he/she is using a modular kernel, but the root
disk image does not contain any modules for that kernel. It looks like at l=
east
cdc_ether.ko and cdc_subset.ko are needed for the ethernet to work. I
checked that by using the 2020-08-20-raspios-buster image that is
referenced on the page where they downloaded that kernel, and with
that the network comes up.

- Paul

