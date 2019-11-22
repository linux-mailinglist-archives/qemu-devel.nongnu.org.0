Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2694F1079F5
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Nov 2019 22:27:31 +0100 (CET)
Received: from localhost ([::1]:55024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iYGSf-0004t7-Os
	for lists+qemu-devel@lfdr.de; Fri, 22 Nov 2019 16:27:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34010)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ariadne@dereferenced.org>) id 1iYGRb-0004QP-DP
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 16:26:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ariadne@dereferenced.org>) id 1iYGRa-0005rd-Dc
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 16:26:23 -0500
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:38104)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <ariadne@dereferenced.org>)
 id 1iYGRZ-0005pb-UN
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 16:26:22 -0500
Received: by mail-io1-xd42.google.com with SMTP id u24so7992314iob.5
 for <qemu-devel@nongnu.org>; Fri, 22 Nov 2019 13:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dereferenced-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cq6i6D48Z555hRuuHcRPVMJMC6xmzKMM97e6BbkOyYk=;
 b=ZHMLNawGBWarZRIyLV2Kn+P2Kynj+ePWxVoCOWxU+YyTJ1M6+TQYXsQBTwSA/p5njz
 LfZN24H4IMWHmmrFzLDC81moxiTSZGhBVJMC+lgdnVgnt0XIkMzEdxP64/dHAOjGGe+t
 faHM9fiBc3iaFEDmuNwh1MBFnGpUIuiZcqN9HVIFMZP/P8VppwMJBphY3InO2ewSZCzU
 QK2ZjIok+8pOWfVn1KiLnp/r8bska2P5Ag6rMqIKDv9sIPo+CJU8Vlf3UrQ3tx19cBmk
 vWhntY68+SFj0uSOlxTCf1YQ17OPDqCdU+cbv1aTI5aMYvGxj3r1Mvkcke5FOq8tTMxK
 nfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cq6i6D48Z555hRuuHcRPVMJMC6xmzKMM97e6BbkOyYk=;
 b=s+B3XA3ApsJxLeL+PfyV2K7eiEdPeQH1QCwVNaxDuS/uVPYM/myuG0WZROpMhKTcs7
 itkr3UHWJqYqxc6vWXCDZVJpY3N3L1aAyTACemK/B/UCAxHhkiHNQf4falqTgLyFZf5S
 EKTjt5+kSb+brLpf+yeLjgDi5kXTA44cMkbaWlHfwsuYW9q8K68UHqTAXdd4AW/Hxmxt
 H7l6zxFJvX16CDoOPOGBSfxjNxLsduIwyT3ODwUmOhh4KD44lgrAVql55ht2MDDm5ABX
 I1qOM1oJpdoCUs4cP/EqIQbiWpYS0ijaBU3k0jsGnQS/TiJYqz+NzV1rop7iynBovso+
 +RfQ==
X-Gm-Message-State: APjAAAU9Lm2n+oXBDxdfjGx+YvJsk/sQmgBDSfZ+IMe52WVIxLqGcBc4
 90SYiUDi4/rP1REofmWlmkuiIIyaYnzz51Frgh0Xjw==
X-Google-Smtp-Source: APXvYqwZ4kZ9BYqYAUj+69avOrpSvXS4DX5h3peM2wisootqCNZxnfH0irvBCovO0Qxcuj0cQMV6z9Avfrd6qyDsOEc=
X-Received: by 2002:a6b:6e03:: with SMTP id d3mr14868287ioh.110.1574457980732; 
 Fri, 22 Nov 2019 13:26:20 -0800 (PST)
MIME-Version: 1.0
References: <20191122174040.569252-1-ariadne@dereferenced.org>
 <CAL1e-=jBhF476ZErrbZ_ANBnrKhNNgYtntGDB-5BDMXdT9J0aQ@mail.gmail.com>
In-Reply-To: <CAL1e-=jBhF476ZErrbZ_ANBnrKhNNgYtntGDB-5BDMXdT9J0aQ@mail.gmail.com>
From: Ariadne Conill <ariadne@dereferenced.org>
Date: Fri, 22 Nov 2019 15:26:08 -0600
Message-ID: <CAAOiGNxTTf6OEbc4trBCyt+uuu08dVxtwsk4mk-o=+64Sh4Byg@mail.gmail.com>
Subject: Re: [PATCH] linux-user: fix translation of statx structures
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d42
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On Fri, Nov 22, 2019 at 12:27 PM Aleksandar Markovic
<aleksandar.m.mail@gmail.com> wrote:
>
> On Fri, Nov 22, 2019 at 7:22 PM Ariadne Conill <ariadne@dereferenced.org> wrote:
> >
> > All timestamps were copied to atime instead of to their respective
> > fields.
> >
> > Signed-off-by: Ariadne Conill <ariadne@dereferenced.org>
> > ---
>
> What a bug.

Yes, in Alpine qemu+binfmt_misc+chroot environment, this bug caused
all files to have an observed mtime set to the UNIX epoch, which
caused problems with building Autoconf-based applications.  This
really irked me so I took the time to dig into it.

>
> Laurent, perhaps a good candidate for 4.2?
>
> Thanks for submitting this, Ariadne Conill!

Not a problem.

Ariadne

