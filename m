Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B78A62FA957
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 19:55:08 +0100 (CET)
Received: from localhost ([::1]:43980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ZgB-0000FM-Rc
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 13:55:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1l1Zev-0007mU-Ce
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 13:53:49 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:50283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1l1Zet-0006XM-FT
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 13:53:49 -0500
Received: by mail-pj1-x1032.google.com with SMTP id md11so10125411pjb.0
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 10:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t1zkc7rmsvwPqrVFutdI/DwvMfrlIuyvE4D07Z+63cc=;
 b=rGJeVuFFCmSgqCwlylTpLUtHJqDhiYAWKDsJQEDr9y/NAy1XYE+U6N3TdDHeeEcBAe
 3vgdameAlkxqMe/IPol/MT3cyP2IR7wdiIR9Yp+L7QYyzYTCpr2kguMjuhZQrr6jLupr
 PoMCHkQiRQsu+Fp62eSliuVCIqhW88dUv6M/6B4SoF5mUeQycvyEZIdFhiTa1QQUm3+R
 MZ7nsgmNWhEpNAS7oTPLREUw0heC53nxDBUDusQ+INOUrPQKPFVRnvLgQFCuC9smU0Oy
 0DNbEb/JWa2YS3hLXyZfsFjw24NoWw18lVvIzhKDlQec/TTbT6f9x165qSyqNMq+t4h3
 ZkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t1zkc7rmsvwPqrVFutdI/DwvMfrlIuyvE4D07Z+63cc=;
 b=cC63g80089GvlT2v0oDkTTn2qWqP1jHV+2KvulgnzBaJQeJIEmmV5+mmPsvyRdA+SQ
 E5qJoXYIh8blUXlmpRvaPYVKCJqdTIZqb2nWnHyPzezvkLoE3KXOChh1YEM6/aJV26ns
 0SQXabiqcD4GbaC5ZLEFrgbNZpioVBTWReeFju8bvWEtTTDDWH+heeuNU/7AByRrF9Hl
 sMf7H/ih3lVXfeM0dooRt2bkwGRvSgESULKdU+gk54DqGBYZP60twYPCUOhdivXzSvEh
 y/F7dxCYBqVn4haKsUiqjF2wx3giikra+4xCOW/SjcaVhYj3EbEAbMN4Mzqkzz4fSRj9
 MSLA==
X-Gm-Message-State: AOAM533tn2WR2d2Sb5hxSo1s44AztEDFYfsz/u6HvFY11IUytl5iWaa8
 C63N7Rd/bfUJty703Z8pccl2FcF6YgOGHGglqQA=
X-Google-Smtp-Source: ABdhPJzIYZCWCMHa6W6MKOHvUCLVA0XDo1cJuhQzHv1/plCnngZSNJiO4BAh6mXUmjxeUWk4I6HIZfmcTTHJNqzjNWg=
X-Received: by 2002:a17:90a:1082:: with SMTP id
 c2mr702407pja.183.1610996025589; 
 Mon, 18 Jan 2021 10:53:45 -0800 (PST)
MIME-Version: 1.0
References: <CAAQ-SiP8G28ade0jHbhTcv0jtGQb4OSgL5p3mAr0MU_FH8vZ3w@mail.gmail.com>
 <87a6tm2sxb.fsf@linaro.org>
 <CAAQ-SiOW8OnWEb0sHUEeS139-Tw0RO2YD1Tx-1s9iuy3ZVQFgw@mail.gmail.com>
 <878s941x85.fsf@linaro.org>
 <20210108083433.pfzhxrd4rezk6yxe@sirius.home.kraxel.org>
 <CAAQ-SiO4VvVTo77J2ga1FmUZ9yrwopeASweO6-AFaakrAUZ80w@mail.gmail.com>
 <CAAQ-SiPiq5NQN=2mvP3isZ9PtYO2Bu64kVEvE6T+3OJd5B-U5A@mail.gmail.com>
 <CAAQ-SiMkJGBnxWSnybJqMD0LSASMtvA_wbrPDQcg-S+Y1ddjJA@mail.gmail.com>
 <878s8zptrf.fsf@linaro.org>
 <CAAQ-SiNKXhJcT1XEodQT6kojqppq37Kg8F8igipQ-HVYOU0=zA@mail.gmail.com>
 <87ft33l8an.fsf@linaro.org>
 <CAAQ-SiMY8W9TS7eXgWuHY0m4yjaRbqqsZ+41Xyhxm+gW0sYakg@mail.gmail.com>
 <CAAQ-SiM8_XnW1Ar5xocR7pUG_WW4SrQSnaKhqr1rY62ti2pw7Q@mail.gmail.com>
In-Reply-To: <CAAQ-SiM8_XnW1Ar5xocR7pUG_WW4SrQSnaKhqr1rY62ti2pw7Q@mail.gmail.com>
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Tue, 19 Jan 2021 00:23:34 +0530
Message-ID: <CAAQ-SiPcBeGGgYcPHn7WSnz4jLAza+hE7tSMYSHJ-caC66D48A@mail.gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d700b805b9313d3e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d700b805b9313d3e
Content-Type: text/plain; charset="UTF-8"

I will make it an in-QEMU pci device. After it is done and the device is
working, I can
write a vhost-user daemon and move the device out of QEMU should it be
needed.
This way I'd already have the virtio-pci device tested out by the time I
get to the vhost-user
daemon. Also I'll be a lot more familiar to sound and virtio devices by
then hopefully. I hope
this is fine?

As for the implementation plan, I will start out by writing the structure
for the device, `VirtIOSnd`
or `VirtIOSound`. Since QEMU already has a base `VirtIODevice` with common
implementation
along with the `VirtQueue`s, this shouldn't be very difficult. Following
this I will start implementing
the methods mentioned in the `VirtIODeviceClass`. This would include
creating a separate
`virtio-sound-pci.c` file with the `realize`, `unrealize` and various init
functions.

After that, I will start writing the `get`, `set` and validate functions
mentioned in the `VirtioDeviceClass`.
QEMU already has an implementation for `start_ioeventfd` and
`stop_ioeventfd`.
This should get us done with the configuration plane. I am thinking of
writing
a few tests at this point. I will have to read about the qtest framework
first though.
This should take at most around a month. I am hoping to get it done earlier
than that
time (~3 weeks) if things go well. From this most of the time goes to
tests. I am taking
a bit of a margin to err on the side of caution.

This now brings us to the dataplane and processing of the data. I think
once the data plane
is successfully implemented, processing shouldn't take a lot of time. Once
the control
queue, event queue, tx queue and rx queues are implemented, I can start
implementing
the Jack and PCM control requests. I can write tests after completing each
of these
phases. As of right now, I am not awake enough to give
a clear plan on the data plane implementation. I will clear the plan out
tomorrow. The
dataplane along with the processing should at most take a little over a
month to implement I'd
guess.

I will make sure I write a follow up mail tomorrow with a clearer and
complete plan. Apologies for
any statements that weren't very clear or mistakes in the language that I
used.

- Shreyansh Chouhan

--000000000000d700b805b9313d3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I will make it an in-QEMU pci device. After it is don=
e and the device is working, I can<br></div><div>write a vhost-user daemon =
and move the device out of QEMU should it be needed.<br></div><div>This way=
 I&#39;d already have the virtio-pci device tested out by the time I get to=
 the vhost-user</div><div>daemon. Also I&#39;ll be a lot more familiar to s=
ound and virtio devices by then hopefully. I hope</div><div>this is fine?</=
div><div><br></div><div>As for the implementation plan, I will start out by=
 writing the structure for the device, `VirtIOSnd`</div><div>or `VirtIOSoun=
d`. Since QEMU already has a base `VirtIODevice` with common implementation=
</div><div>along with the `VirtQueue`s, this shouldn&#39;t be very difficul=
t. Following this I will start implementing</div><div>the methods mentioned=
 in the `VirtIODeviceClass`. This would include creating a separate</div><d=
iv>`virtio-sound-pci.c` file with the `realize`, `unrealize` and various in=
it functions. <br></div><div><br></div><div>After that, I will start writin=
g the `get`, `set` and validate functions mentioned in the `VirtioDeviceCla=
ss`.</div><div>QEMU already has an implementation for `start_ioeventfd` and=
 `stop_ioeventfd`. <br></div><div>This should get us done with the configur=
ation plane. I am thinking of writing</div><div>a few tests at this point. =
I will have to read about the qtest framework first though.</div><div>This =
should take at most around a month. I am hoping to get it done earlier than=
 that</div><div>time (~3 weeks) if things go well. From this most of the ti=
me goes to tests. I am taking</div><div>a bit of a margin to err on the sid=
e of caution.<br></div><div><br></div><div>This now brings us to the datapl=
ane and processing of the data. I think once the data plane</div><div>is su=
ccessfully implemented, processing shouldn&#39;t take a lot of time. Once t=
he control</div><div>queue, event queue, tx queue and rx queues are impleme=
nted, I can start implementing</div><div>the Jack and PCM control requests.=
 I can write tests after completing each of these</div><div>phases. As of r=
ight now, I am not awake enough to give</div><div>a clear plan on the data =
plane implementation. I will clear the plan out tomorrow. The <br></div><di=
v>dataplane along with the processing should at most take a little over a m=
onth to implement I&#39;d</div><div>guess. <br></div><div><br></div><div>I =
will make sure I write a follow up mail tomorrow with a clearer and complet=
e plan. Apologies for</div><div>any statements that weren&#39;t very clear =
or mistakes in the language that I used. <br></div><div><br></div><div>- Sh=
reyansh Chouhan<br></div></div>

--000000000000d700b805b9313d3e--

