Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA15E4D0E94
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 05:20:28 +0100 (CET)
Received: from localhost ([::1]:34212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRRKl-0001dv-H8
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 23:20:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nRRIz-0000y0-Gb
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 23:18:37 -0500
Received: from [2607:f8b0:4864:20::a2d] (port=37641
 helo=mail-vk1-xa2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nRRIx-0004JB-M4
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 23:18:37 -0500
Received: by mail-vk1-xa2d.google.com with SMTP id h10so3128899vkn.4
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 20:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=7d0AVRGilC4TxJ40u4Wf5onEB09tCCNGsBAeTMgsssU=;
 b=xL9EFlSAN7FVfOTaeDJasfgx5cEwybLzyA/GKdAEV/roxRf4vN/YgjmxgXkqMwUZg+
 Kg1FvANF7UA6hn+9bogKGXy58aFx60tiy0iZYp1GxmYF5J/Yr3vKPaXjnopuV4JpN4u8
 X/qaE2ZoI6M2nnA2ie7qa8NFoQwTrxhy6OQ8ze02eJO9K1I+RwCWR4Ftu0BRCUgIcv70
 627pnRHFBguG/oOd++R7tFTYcWhfTKLCEl6o0LsbpjcTodM3AT9YKIuV9X7mf+1cu0k7
 a6UQB1Bi1BeH/rmaufQ01SMgjfvCTYgjnliuoDCe7P0GlQBBTD0JI12enFSfXDmYz+wb
 i3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7d0AVRGilC4TxJ40u4Wf5onEB09tCCNGsBAeTMgsssU=;
 b=sfYieInu5dly9pJMn+IMp+RbY84VS5GWYeW0gTgvemBIkwcAL+5KNk8PswF6LiWDPi
 QEbLqGpQkTzSiFsqOVXQYwq0kGT+2wxgAvkJ3StGhEj1mjNduhJGwrv/pKWtz11aoehi
 yu8VeH2mia04DukI912w/Bx0apPHwauf7ebKuOdTV//xkdAx1d8PYMY7jAQm0C7WEbL3
 CEBqzEfaIpMForqtL30R7Lhm+5HGMj9RFqClXc5H/D+mGAcvTIzVElrHo6ghDblHX6w7
 pCTLHCa3UnSCwtT7gj9PAr7OYHO/gms/tLEVb97MQ/+ETudbQQXfi7XgTghbLNoHw2dJ
 ElNw==
X-Gm-Message-State: AOAM5317I5pLv0MR7NuFBenTkP94j8V9WzcARhlVfYe4SJyYjoUMXsXD
 HEuE8yf0h14XRu9SVF9fN5Y4ffmeMF9fpw6BoZvShhV96clM+Q==
X-Google-Smtp-Source: ABdhPJxfU1/XEAxxzQlapJCOtgsNdZ4M61PmCsiPHDOR12ijT7IRn7lZlJvVl+HkPK0KkkvphPHgQ/NkOaBRjq4iqaM=
X-Received: by 2002:ac5:c193:0:b0:336:e9e3:f571 with SMTP id
 z19-20020ac5c193000000b00336e9e3f571mr5571924vkb.26.1646713113749; Mon, 07
 Mar 2022 20:18:33 -0800 (PST)
MIME-Version: 1.0
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 7 Mar 2022 21:18:29 -0700
Message-ID: <CANCZdfpJVWFjrQDiYJy8xiw-THF8_3GNcu=0Pmbvp_6zAJbfHA@mail.gmail.com>
Subject: Question about atomics
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000313c4405d9ad460d"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

--000000000000313c4405d9ad460d
Content-Type: text/plain; charset="UTF-8"

I have a question related to the user-mode emulation and atomics. I asked
on IRC, but thinking about it, I think it may be too complex to discuss in
that medium...

In FreeBSD we have a system call that uses host atomic operations to
interact memory that userland also interacts with using atomic operations.

In bsd-user we call the kernel with a special flag for dealing with 32-bit
processes running on a 64-bit kernel. In this case, we use 32-bit-sized
atomics to set variables in the address space of the bsd-user guest. This
is used when running armv7 binaries on amd64 hosts.

First question: Is this expected to work? I know I'm a bit vague, so as a
followup question: If there's restrictions on this, what might they be? Do
some classes of atomic operations work, while others may fail or need
additional cooperation? Are there any conformance tests I could compile for
FreeBSD/armv7 to test the hypothesis that atomic operations are misbehaving?

I'm asking because I'm seeing a rare, but not rare enough, race that's
corrupting state in ways that only appear to be possible when pthread
mutexes aren't working (which only break when atomic operations are
broken). So far my efforts to narrow this down has been unsuccessful and
I'm looking to both understand qemu/tcm better as well as to reduce the
problem space to search...

Thanks for any help you might be able to give.

Warner

--000000000000313c4405d9ad460d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have a question related to the user-mode emulation =
and atomics. I asked on IRC, but thinking about it, I think it may be too c=
omplex to discuss in that medium...<br></div><div><br></div><div>In FreeBSD=
 we have a system call that uses host atomic operations to interact memory =
that userland also interacts with using atomic operations.</div><div><br></=
div><div>In bsd-user we call the kernel with a special flag for dealing wit=
h 32-bit processes running on a 64-bit kernel. In this case, we use 32-bit-=
sized atomics to set variables in the address space of the bsd-user guest. =
This is used when running armv7 binaries on amd64 hosts.<br></div><div><br>=
</div><div>First question: Is this expected to work? I know I&#39;m a bit v=
ague, so as a followup question: If there&#39;s restrictions on this, what =
might they be? Do some classes of atomic operations work, while others may =
fail or need additional cooperation? Are there any conformance tests I coul=
d compile for FreeBSD/armv7 to test the hypothesis that atomic operations a=
re misbehaving?<br></div><div><br></div><div>I&#39;m asking because I&#39;m=
 seeing a rare, but not rare enough, race that&#39;s corrupting state in wa=
ys that only appear to be possible when pthread mutexes aren&#39;t working =
(which only break when atomic operations are broken). So far my efforts to =
narrow this down has been unsuccessful and I&#39;m looking to both understa=
nd qemu/tcm better as well as to reduce the problem space to search...</div=
><div><br></div><div>Thanks for any help you might be able to give.<br></di=
v><div><br></div><div>Warner</div><div><br></div></div>

--000000000000313c4405d9ad460d--

