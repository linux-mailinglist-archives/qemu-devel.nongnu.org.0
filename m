Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239ED3A5047
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 21:12:01 +0200 (CEST)
Received: from localhost ([::1]:54690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ls92z-0002v2-HH
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 15:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pauldzim@gmail.com>)
 id 1ls91j-0001gK-Rj
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 15:10:39 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:40686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pauldzim@gmail.com>)
 id 1ls91h-0001Bd-To
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 15:10:39 -0400
Received: by mail-io1-xd36.google.com with SMTP id l64so13573098ioa.7
 for <qemu-devel@nongnu.org>; Sat, 12 Jun 2021 12:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XUAU5eeywZpwgB1FDAy06in1pta5XtebeUl1s+hZlDg=;
 b=ekZmDfzDREAQJIlwQvapMmde+p2SbAAqb+zPA5TAxUdO3C1zxhouK3V78m+1izq+8o
 BuuWV6AJ8Z6Dny8Zr0PYGWc9pL00mhpKwszNqqH4PdXdqKgLqom/wi5yL9w8HJecIdqN
 MgmUnVdHGoA+Omc90D+qaWqggz/TR8qqzxnMhf3cGmq+wGOp++6R6cezqSmDU6y0Du33
 yYqoNYU76288GhgPxo6cu0nsV8ZhDrM0qPzkhud51/sOysKYAcQ+fTmXbaYd0LgsiHAw
 lTVBD5a6kQiU5mhTAc3G1XG5o9wQpj9//UKMuJF/ZMo9C37hoczXq6e+8NNOzOarp1ji
 iKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XUAU5eeywZpwgB1FDAy06in1pta5XtebeUl1s+hZlDg=;
 b=YD19S55g8ueig7Sy3VyCMnRjWCu2NQZPtHiBbFUJB40Z5K1wGN4BCWPZZBUtdc8mLI
 4ABbHyJvGjyHYelG65UDIoj4XpErBBhHwSN9Rr/5erzmHQxcLMDx21/Ag+9J3e4OaTxc
 gRnjtPKJSUdV2cnPL0gky1VrMp1lxgPmpteMdT16T0UEYA+uDa3GVyRzY1ZOrC1xQiN9
 td+oENfLFFiAt8myTqanp9DN7IUztttYB2+AjoRKRWUs7FNTxg63KdZdU+pf7qXaFwpR
 AxHgcTW6Yaz00KV5KXHnhpfDp0XXbkLN5ZR08xLpy5QMe94YD63wBJaloXBRqLVeHGGi
 Q/IQ==
X-Gm-Message-State: AOAM5324HQ/0pRXEOmQVfNNZW+aRBWfwkZTFxPkZEFSVXg02vAhrEUBu
 pIsE07/sPsK2m5AbtLXQpokWG4smQphB3dQg4Fs=
X-Google-Smtp-Source: ABdhPJyGMUC6H+bArvKmGrRiSAle6xCF/bqMVarVWODuZu75Pajvo+zOZgjMGMP2a6SJmur424yuo4hPApTAr+9CIJ4=
X-Received: by 2002:a02:820f:: with SMTP id o15mr6289650jag.139.1623525036144; 
 Sat, 12 Jun 2021 12:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <reply-a8857b5ced579c7499da46ef969a0b87@gitlab.com>
 <issue_86599308@gitlab.com> <note_597531265@gitlab.com>
 <note_598004557@gitlab.com>
 <CAAdtpL4utd6p3_Rg+h3rFt=V2sKv288G11dNqjDU21YitC2q-A@mail.gmail.com>
 <CADBGO7-KMxXA4sXGdztNfoK2h6Jim6Kyi=yuLLC083jAv_sppw@mail.gmail.com>
 <44d114c5-a43d-815e-a3e5-b551654e9960@amsat.org>
In-Reply-To: <44d114c5-a43d-815e-a3e5-b551654e9960@amsat.org>
From: Paul Zimmerman <pauldzim@gmail.com>
Date: Sat, 12 Jun 2021 12:10:10 -0700
Message-ID: <CADBGO78QHUFUKd+2JNY2wdWf4egaY4v+qv6tEc4zj26mHPEcZg@mail.gmail.com>
Subject: Re: QEMU | USB Ethernet device (RNDIS) does not work on several
 tested operating systems (#198)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=pauldzim@gmail.com; helo=mail-io1-xd36.google.com
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

On Sat, Jun 12, 2021 at 12:40 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> On 6/11/21 9:48 PM, Paul Zimmerman wrote:
> > I will take a look. Might take me a couple of days to get to it though.
>
> Thanks!
>
> Odd, your comment appears as posted by myself on GitLab:
> https://gitlab.com/qemu-project/qemu/-/issues/198#note_599551747
>
> BTW Paul, could you join QEMU GitLab project to help us with this issue?
> https://gitlab.com/qemu-project/qemu/-/project_members/request_access

OK, I put in a request to join the project.

- Paul

