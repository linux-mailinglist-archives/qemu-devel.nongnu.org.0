Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7917766C31B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 16:00:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHQyM-0008Ks-L1; Mon, 16 Jan 2023 10:00:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHQyB-0008HH-W2
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 10:00:25 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHQyA-0003Q1-7c
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 10:00:19 -0500
Received: by mail-pg1-x531.google.com with SMTP id 36so19817236pgp.10
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 07:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hRRcqk61d6KFVspK53ajSQf+t9MomagpjhOabMgzA9U=;
 b=GOGOShrXi5Jb48eKEj9oTZt4dh2D/i4quGL8g+otJgUqZWc/1B01sJGSyhWR3zyUoE
 iYxV3nyHisTTNo7LPoP2ExPYQX9qywl+OH9QYe9VcRTRrfpou6AelUlweFN2/zVL5eUC
 j9boibHiYZjjYv1fh8JgP83uIPs0opPuPhX7KhfU7GFVP+YH+ob/P3eoRo6vFU5NKjGn
 JtZNYkspnoOyPZN5J3Q7RW+QxVKSbfECDvsV77X1jsrLhVaoWcPVGrD49Ugf4AxOkPMv
 jmsObBmrpNaSFmh+8YXkL0cvHWcuehjcy4bG2ZWUaqv2zxzaqbO0Y9iN0uBLDY22NpUF
 aYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hRRcqk61d6KFVspK53ajSQf+t9MomagpjhOabMgzA9U=;
 b=WsY77yctAfGWeByvTGAJeLnPo3QzansbX3tBVMhXCE9KWmisvnjHkrZjW6GU+EitGn
 hEjHhnckhhyuf96x/HTC1WJcI0vUIX4hboNPK0IndMmomKBq3UkEvkCCYiWoHMcLYjJb
 ACtS8MpVvJnvn/ME9G1WbviJROtmPIS0WLQFcMldyqNQ01PD9E+ePpIGWc7XeVrcqhlw
 lXXxKDLKhGT5ync1diTjVaoLwUXq5u4eUdTtl2PUP1Os5osN3gPFobFUYpDQ08773nB7
 Qlc+iDIaVLbZmwLEsOvhLUOy4X7ANB+YV7Kn4eWYPkpXxkqiWOFaAp7CoQG9Uj9uhZ6e
 WY2w==
X-Gm-Message-State: AFqh2kplYrueOvRYlTruyPr/CUGnZJJmgM6LOOiuEzapBdUORXLIGXaD
 NJvdc2j2p95SEM3rDyQHpQgjXWbaC1mHiAQcJhPSvg==
X-Google-Smtp-Source: AMrXdXt9/RkYJL5lBa4I07YYHV/SHeT9/pLDIX4KqxeIGmATlRSDyYmKn20h1Bb/WYvcBFz1Y7eEeyNEOF5BNz2AVhI=
X-Received: by 2002:aa7:93c6:0:b0:58b:c7ef:25ca with SMTP id
 y6-20020aa793c6000000b0058bc7ef25camr587641pff.51.1673881216657; Mon, 16 Jan
 2023 07:00:16 -0800 (PST)
MIME-Version: 1.0
References: <20230113154532.49979-1-philmd@linaro.org>
 <CAFEAcA9mKmOahpvVQUUwyxcbJE2aNeB+Y_a1brgnq1kPNtv_nQ@mail.gmail.com>
 <553a8707-417d-b692-1176-f2fbdd146961@linaro.org>
In-Reply-To: <553a8707-417d-b692-1176-f2fbdd146961@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jan 2023 15:00:05 +0000
Message-ID: <CAFEAcA-+Kr1qyWxLBZdevgPPP2y+za6Rsm-W92=3NkVV+47sYQ@mail.gmail.com>
Subject: Re: [PULL 00/46] MIPS patches for 2023-01-13
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
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

On Fri, 13 Jan 2023 at 20:32, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 13/1/23 18:57, Peter Maydell wrote:
> > On Fri, 13 Jan 2023 at 16:05, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> >>
> >> The following changes since commit 3db29dcac23da85486704ef9e7a8e7217f7=
829cd:
> >>
> >>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into st=
aging (2023-01-12 13:51:36 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>    https://github.com/philmd/qemu.git tags/mips-20230113
> >>
> >> for you to fetch changes up to 4828656f65324249273ad2f2db80844ba90eeb9=
b:
> >>
> >>    scripts/git.orderfile: Display MAINTAINERS changes first (2023-01-1=
3 16:22:57 +0100)
> >>
> >> ----------------------------------------------------------------
> >> MIPS patches queue
> >>
> >> Confronting my triskaidekaphobia, here goes
> >> a bunch of cleanups from various people:
> >>
> >> - Improved GT64120 on big-endian hosts
> >> - GT64120 north bridge and MC146818 RTC devices are now target indepen=
dent
> >> - Bonito64 north bridge converted to 3-phase reset API
> >> - PCI refactors around PIIX devices
> >> - Support for nanoMIPS in bootloader generator API
> >> - New YAMON Malta Avocado test
> >> - Removal of 'trap and emulate' KVM support
> >> - System-specific QMP commands restricted to system emulation
> >
> > Hi; gpg says your key has expired -- which keyserver can
> > I get an updated version from?
>
> "the usuals"? :)
>
> This time I set up an alarm to upload a renewed one before the
> expiration date, and submitted it to pgp.mit.edu and keys.openpgp.org.

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

