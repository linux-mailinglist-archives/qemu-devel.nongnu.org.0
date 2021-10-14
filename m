Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7ED42D942
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 14:26:28 +0200 (CEST)
Received: from localhost ([::1]:44314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mazoZ-0000uj-Bw
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 08:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1mazkp-0007Nb-Tz
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 08:22:38 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c]:36833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1mazko-0002cF-BU
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 08:22:35 -0400
Received: by mail-ua1-x92c.google.com with SMTP id e10so6213248uab.3
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 05:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4iM3alJOOVUJNl00AwwlaDqZ9P6Nojd00QLsVWB4UKY=;
 b=kpbylDY/Kw4bw+/eP9UazW1+IOjdcN2rrN8OjvnqxYfoYVSfLf21ywdeeE9QIWvRrm
 T+F7w/b5eDYOS1UQgLx2RQ+D5yluiXhvqLgtDk2zkLwDSgFxVk4yLBvKB09OUEeyAyKv
 djImY1KK/bX8eUUambQ6kA3kjWdoms7y+AM4YDir9/Z+8/TNhw6DL/eksDkQ4o9D2fRc
 TbkX68mEAkq9rXZuIj8Bi0YwFteDzZA8wSP8uKijHtqWBfKpnWOUS4ecws2nuBKv8g6Q
 Mn51cokGyHZEAqsFzDCy8ga1Zj3vl7M3yTcu5RfN8rYC/UYV2y8zwXY7dAGuRF4EzNOw
 yBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4iM3alJOOVUJNl00AwwlaDqZ9P6Nojd00QLsVWB4UKY=;
 b=Vy/lUlX8aP8e//pRN66UxRTtr+8bCx7q2B2PCEcgFAZgVvOBxbZOnyPWUoeumJg1qz
 Cq7719ugpfq9L27JtbV9YHmGyaIWSKBGsrXQ4fEdtunXQPPB8lQ0t4bJxQ+wXAnkrpNH
 I25CfV8WlwZ8QcjW5h7KQknfxAPhXxkYLlOnC/+wY3GnCUSNRiU0cPOeALdKncFSsSZz
 pU9LQkHn3hD4Ube5eyHPOQIcELIIVipV1pc9h6EpOGgTo/wNMhui0kI3qNutXhIJoPJN
 QhH2RxewaP3r6HGgNRJn4VLiBLYXcGqVEEir+iHpmHv8Iq+zjPXWisBejIytkEXUEVoj
 eS2A==
X-Gm-Message-State: AOAM533ccx6FwXhRzWJXHVlT7ng3NU4QanWSaRJWaeSfnCb9nGtOm+E2
 HISMsG33CUzCXH2VUhjhpkk0Z94XZCVh3HXx6VLHb9R6y9SzoQ==
X-Google-Smtp-Source: ABdhPJzhFFrgZ+hw8Kc4v5LKCpu0kKkArC3i0GiHGP27jjI2gF76LEOeJu1PIsihJm/LsAltTrp+YwqyfSuPlOSk0XA=
X-Received: by 2002:a67:ed87:: with SMTP id d7mr6471025vsp.30.1634214152261;
 Thu, 14 Oct 2021 05:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211013230405.32170-1-wwcohen@gmail.com>
 <20211014090359.0c0f7b4f@bahia.huguette>
 <CAB26zV1pHqEChqUd6UXMhGyhZbtHOo3DM=v_S0Vc3496xF4byg@mail.gmail.com>
 <7858538.Xg4lN0sot7@silver>
In-Reply-To: <7858538.Xg4lN0sot7@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Thu, 14 Oct 2021 08:22:19 -0400
Message-ID: <CAB26zV17E_b_-nnLBTeH2QxT=c7vy9zvPak+Tp4TkyECNGUS-Q@mail.gmail.com>
Subject: Re: [PATCH 00/11] 9p: Add support for Darwin
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="0000000000000852e305ce4f2284"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=wwcohen@gmail.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000852e305ce4f2284
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Correct. It's been tested and functions when applied to QEMU master, with
host running macOS Big Sur 11.6 (personal machine) using client 9p2000.L
(taking a cue from the guest mounting instructions on
https://wiki.qemu.org/Documentation/9psetup).

On Thu, Oct 14, 2021 at 7:57 AM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Donnerstag, 14. Oktober 2021 12:48:55 CEST Will Cohen wrote:
> > Many thanks for all the clarifications =E2=80=94 it=E2=80=99s my first =
time using
> > git-send-email and first time with mailing-list-based devel workflows.
> Will
> > adjust accordingly, work through gitlab, and eventually resend via
> > git-publish as v2.
>
> So the intended use case is macOS being host.
>
> Has this been tested, and if yes, using which 9p client and which macOS
> version?
>
> Best regards,
> Christian Schoenebeck
>
>
>

--0000000000000852e305ce4f2284
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Correct. It&#39;s been tested and functions when applied t=
o QEMU master, with host running macOS Big Sur 11.6 (personal machine) usin=
g client 9p2000.L (taking a cue from the guest mounting instructions on <a =
href=3D"https://wiki.qemu.org/Documentation/9psetup">https://wiki.qemu.org/=
Documentation/9psetup</a>). <br></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 7:57 AM Christian S=
choenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crudebyte=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Donnerstag, 14. Oktober 2021 12:48:55 CEST Will Cohen wrote:<br>
&gt; Many thanks for all the clarifications =E2=80=94 it=E2=80=99s my first=
 time using<br>
&gt; git-send-email and first time with mailing-list-based devel workflows.=
 Will<br>
&gt; adjust accordingly, work through gitlab, and eventually resend via<br>
&gt; git-publish as v2.<br>
<br>
So the intended use case is macOS being host.<br>
<br>
Has this been tested, and if yes, using which 9p client and which macOS <br=
>
version?<br>
<br>
Best regards,<br>
Christian Schoenebeck<br>
<br>
<br>
</blockquote></div>

--0000000000000852e305ce4f2284--

