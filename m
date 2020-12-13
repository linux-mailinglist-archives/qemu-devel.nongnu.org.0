Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C952D8F45
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 19:36:42 +0100 (CET)
Received: from localhost ([::1]:46336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koWEb-0005rT-Gx
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 13:36:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koWDY-0005Kb-Td
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 13:35:36 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koWDX-0003Vg-Bp
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 13:35:36 -0500
Received: by mail-ot1-f66.google.com with SMTP id 11so13561002oty.9
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 10:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nGXqa5k7nlSlX4i4eZ0KZ0jmLLpFgPyseVRWgnM5sXI=;
 b=BIikV78JajrHCHzGooRgDMPgJMyp2uP6ZzErah2zseev3RwOqOfM2AzzXZBmMOLf+P
 CSm5OETn/9gwz/6rrMwb57epKpAYP3riGv+TNCIgPSr8jaGk3q0nNJ44jd/tTGrfpwyt
 vjpT2ieP+DHc7QxX540JEbdTJvB90NN/fSjJtZTmqEQA9zEekSnPDOsEPgvp5/b44JN1
 q9X2fE+wy7rXFVNKJHpHwKlc3q/ZkpkmkfYeE+aTG2PUvqpLDLL99sQnwXCQt9hZzxxS
 rsODZLyEie9BbdQKaIXlsVw7DJ/cBbreZguUn++dgGiRzPh+T95p9JYSDiYMxsc65r2F
 a2fg==
X-Gm-Message-State: AOAM531of2mtf2uedowpcV2J8UMK/j5rmEVWJTbzmdy+sDh3Xj8Z4b4r
 1LLZdL7NJVrw0g0TkaD2/u9PVf3r7XJkP1jwVFk=
X-Google-Smtp-Source: ABdhPJyH4ZiEKL4Ugdm07UnjkzGpU3Um0RHJ7mhhOXs43FzHdHrB9ojeYQzzMotcdMlxKsbOC4bNwxEXCeizPB+lE+A=
X-Received: by 2002:a9d:4b81:: with SMTP id k1mr17236524otf.371.1607884533435; 
 Sun, 13 Dec 2020 10:35:33 -0800 (PST)
MIME-Version: 1.0
References: <20201118140739.18377-1-alex.bennee@linaro.org>
 <44c6c5c4-2152-b31f-9610-1a8e7f72037e@redhat.com>
In-Reply-To: <44c6c5c4-2152-b31f-9610-1a8e7f72037e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sun, 13 Dec 2020 19:35:22 +0100
Message-ID: <CAAdtpL6E1wbT_qrzARjR8M2b1s=jpVuT0y5iTA5wxh+559DQQA@mail.gmail.com>
Subject: Re: [RFC PATCH] .cirrus.yml: bump timeout period for MacOS builds
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.66;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f66.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ed Maste <emaste@freebsd.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 4:11 PM Thomas Huth <thuth@redhat.com> wrote:
> On 18/11/2020 15.07, Alex Benn=C3=A9e wrote:
> > These seem to trigger timeouts with some regularity.
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > ---
> >  .cirrus.yml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/.cirrus.yml b/.cirrus.yml
> > index f0209b7a3e..08db7c419f 100644
> > --- a/.cirrus.yml
> > +++ b/.cirrus.yml
> > @@ -18,6 +18,7 @@ freebsd_12_task:
> >      - gmake -j$(sysctl -n hw.ncpu) check V=3D1
> >
> >  macos_task:
> > +  timeout_in: 90m
> >    osx_instance:
> >      image: catalina-base
> >    install_script:
> > @@ -32,6 +33,7 @@ macos_task:
> >      - gmake check V=3D1
> >
> >  macos_xcode_task:
> > +  timeout_in: 90m
> >    osx_instance:
> >      # this is an alias for the latest Xcode
> >      image: catalina-xcode
> >
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
>
> ... we could maybe also split the --target-list between the two jobs if t=
hey
> take too long...

Maybe it's time, 90min reached:
https://cirrus-ci.com/task/5774549872541696

