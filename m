Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D43481033
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 06:54:27 +0100 (CET)
Received: from localhost ([::1]:35488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2Rus-0006sS-3Z
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 00:54:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1n2RtW-0006CS-Pq
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 00:53:02 -0500
Received: from [2607:f8b0:4864:20::b36] (port=38727
 helo=mail-yb1-xb36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1n2RtV-0007qF-6c
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 00:53:02 -0500
Received: by mail-yb1-xb36.google.com with SMTP id w184so40249962ybg.5
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 21:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=qMCFjjOifKsdavZ/gFT4axLbS+KAk7xdnmzIPRN2SQU=;
 b=V9d0k0wllLx13IYuRqjXtSQCc80H07JVau2IRfOs5NP+rEwtNqFlEmwjUC03ihEGOc
 8XQk6o5JLLDIcjN1fvCt5VHPvEFB7fLBjRCm7aa0NCBtj8QeiCLlInsJGp7Tc1k2oKYq
 oF8df1OieJa+b50Xyio+M0sdT+btx0Gz/aRAyMYHCv3fK8t1mipxusGiVrMysLAzbUdD
 A0058J2igiDqVbg2uCs62zHdS1ww6oxwi/97MX5BMeRxxw7Ebfq1ki16Cg3K1z9ARATy
 ZlDnylflY3DZH7zoDp8HWxjlFlRmzFWheBdj8ewEP1xgt4PTsPR98Aml/HFQybulOPgs
 Kz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=qMCFjjOifKsdavZ/gFT4axLbS+KAk7xdnmzIPRN2SQU=;
 b=g8JE/jFWPGdQ4DB8eNbbWnfELGQz3G7Yw3jheNwRpDF/3tPvUryGnXaa3yqH3nu4gg
 lOY8tjqfrlgFOkgDdUGTMux5YNhb1N9v8cxm9vWNEmQ+LPwWTuJd2PO+A8ScQte+sibW
 E7Feto/4x8iV1zAKZHeo+WZ+pv9IJQR1vw5gVe6ZpFDy3ssYWF80w1PYdQFFCEBt8fby
 LD4iSvl+l+Utr4wHCkY1YHNOYqlvUY9VO+qNtEn1GKHqqYv1tcsP7C9xCuxo7TvkbU1b
 evonyihVTcpPk0qAl3rpP6nqmX6NBvXovP6AbYvTY9VzPiX8cTgiBN5kNgBeZLHwqgHO
 pEcA==
X-Gm-Message-State: AOAM532i17n6G6378n4lGyOlgHUFNFq8N6NhTmGa8jKCkJDV3dlWnNUS
 JGfel0CACpXmOHPVURqMv9ZDBDJ5+aOYZLHhM7UDAZaTUkE=
X-Google-Smtp-Source: ABdhPJzLi61a7JNBiFOoHDyg9R+OXE3Bknq2ulwQXKaQXEW0/GASnWvQcm4frcqgKd/aABJSmOh2PgSaXxrroRWo9dQ=
X-Received: by 2002:a25:d9d1:: with SMTP id
 q200mr21784026ybg.309.1640757179888; 
 Tue, 28 Dec 2021 21:52:59 -0800 (PST)
MIME-Version: 1.0
References: <CAAQ-SiOU5vkcVODOvBEf=PXzRDQbhzJC6ZU3wLpnRzhD58cuGg@mail.gmail.com>
 <CAAQ-SiMpZZ3yVCRjapCuResP38HFmtykFuLvpwH_23kEPg6v_w@mail.gmail.com>
 <20210215143934.sz6tdtoaaffkvla7@sirius.home.kraxel.org>
 <CAAQ-SiO_cTe3bQKDQ-tyeUU-DqTSf=1kRUcc+a=tktZb0ZhVog@mail.gmail.com>
 <20210416113252.km4w72vnruv6s2oi@sirius.home.kraxel.org>
 <CAAQ-SiOSw9u=yFrakjjjTvozpAW3nxhC+QeW7wswMSzSeZ_AVg@mail.gmail.com>
 <20210419131050.bltknubbkd4du6ti@sirius.home.kraxel.org>
 <CAAQ-SiMf=BV-HUudRayZkRPJjmkYWuiBuKqYHHLzYjcFnPOgLQ@mail.gmail.com>
 <20210419135627.dlerwnswhfxt6ciz@sirius.home.kraxel.org>
 <CAAQ-SiM6uWUgHTS5PQ-hSkuXNOoKC7fw6Y1ZHhJ0MCUE3oaBqg@mail.gmail.com>
 <20210420071304.gmndase3r6mwp5yt@sirius.home.kraxel.org>
 <CAAQ-SiPPNK0xqnPPSjNZgwQCs+Vj0_A5koq5xK8HzhZKDgqVJw@mail.gmail.com>
In-Reply-To: <CAAQ-SiPPNK0xqnPPSjNZgwQCs+Vj0_A5koq5xK8HzhZKDgqVJw@mail.gmail.com>
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Wed, 29 Dec 2021 11:22:48 +0530
Message-ID: <CAAQ-SiO6-Ay9415XsLe2Xd-KXog7i2Xvh0kX0h1uBgtj-L+=Ag@mail.gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000deb70405d4428c37"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000deb70405d4428c37
Content-Type: text/plain; charset="UTF-8"

Hi,

I am sorry for the absence of activity on this. A couple of people very
close to me died, and I also got busy
with the linux kernel mentorship program for a while. It was a weird year.
But I am back on this now.

I have the basic functionality of the sound card working. I tested it on an
ubuntu vm and it plays audio just fine. I'd like to test
other things like changing stream parameters and channel maps. Also the
VIRTIO_SND_PCM_F_MSG_POLLING,
VIRTIO_SND_PCM_F_EVT_SHMEM_PERIODS, VIRTIO_SND_PCM_F_EVT_XRUNS features
aren't implemented yet.
Implementing VIRTIO_SND_PCM_F_EVT_SHMEM_PERIODS hopefully shouldn't be much
of a challenge. We can send a notification
when we have processed period bytes (if I correctly understand this).

I will send another rfc patch series once I have channel maps and jacks
ready. And one more when I have these PCM features
ready.

--000000000000deb70405d4428c37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I am sorry for the absen=
ce of activity on this. A couple of people very close to me died, and I als=
o got busy</div><div>with the linux kernel mentorship program for a while. =
It was a weird year. But I am back on this now.<br></div><div><br></div><di=
v>I have the basic functionality of the sound card working. I tested it on =
an ubuntu vm and it plays audio just fine. I&#39;d like to test</div><div>o=
ther things like changing stream parameters and channel maps. Also the VIRT=
IO_SND_PCM_F_MSG_POLLING,<br>VIRTIO_SND_PCM_F_EVT_SHMEM_PERIODS, VIRTIO_SND=
_PCM_F_EVT_XRUNS features aren&#39;t implemented yet.</div><div>Implementin=
g VIRTIO_SND_PCM_F_EVT_SHMEM_PERIODS hopefully shouldn&#39;t be much of a c=
hallenge. We can send a notification</div><div>when we have processed perio=
d bytes (if I correctly understand this).</div><div><br></div><div>I will s=
end another rfc patch series once I have channel maps and jacks ready. And =
one more when I have these PCM features</div><div>ready.<br></div></div>

--000000000000deb70405d4428c37--

