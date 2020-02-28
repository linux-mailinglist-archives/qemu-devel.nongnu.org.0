Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B477173646
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 12:42:11 +0100 (CET)
Received: from localhost ([::1]:45658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7e1y-0006Qx-Lx
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 06:42:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40376)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanrin@gmail.com>) id 1j7e1D-0005f8-A0
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 06:41:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanrin@gmail.com>) id 1j7e1C-0006Ud-Eu
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 06:41:23 -0500
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:42546)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanrin@gmail.com>)
 id 1j7e1A-0006U0-F6; Fri, 28 Feb 2020 06:41:20 -0500
Received: by mail-io1-xd41.google.com with SMTP id z1so3047891iom.9;
 Fri, 28 Feb 2020 03:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Gr5LmJZlxHOHuQ6gyEfwrE1cHMWKEe9J8ZRtrjl8sqg=;
 b=rGfK5llNKQhbjZLGP+PLv7LMWU5pPXfxELhkoX/fmwV1lt36AJpJtDy/HRkUxR3PIZ
 jd1biIbMcp4L3zgGFWw1wbr0iimv9FAJnzNmCGPwz9YaK2+iI4TS1BQ7EMSR4X/DlWoa
 d5OWr2UnXxZymD2cWAKd/KjXw54j1mnWowLglr5oFfdbVghlt5J1G7gIrqDO/NIDXePQ
 3n5rkQcl9NoWx/gNY5KA1JsTiBAZsu1imqdLIMKVuKl2NulWTQdqB/IxwlzB2iuf2gZg
 mjdOzN4QJh+KnWnLVeWfuE/qxvbRHRzgUp344X4BC1V5Ce+M3w2Y3vV5+c2GiA+vVjcD
 dZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Gr5LmJZlxHOHuQ6gyEfwrE1cHMWKEe9J8ZRtrjl8sqg=;
 b=O9afKIE1FeNIBg7z3ZVXaa7PNUnAhkD5kPZzSCJAuq3wAr2fLv61+1os0aIcg/MhI8
 RSUCOsHEaITSkKG1DheYtC+dLnSG3Gd4/I4Ngp9mW/KB6R3BsMcNlDpDsFRRzWXeE/Bn
 MiKlx6gf4AD1inFRJvcHqLDcyHU90hYJXFLJKe+ShA2dJ8UrrWr3KYQslWnRYLPDEpKJ
 fnzlvH4nt3NjEyKx7Y012M2gtbXdQ9aHLB8J5AR9wMvLgWo4p4KX/ot+CSI+MvyNzsKB
 umx7RIcpX1cllFn187VxSjZ8w3esWN1jlIfanDsjDp6/y+KcXeIA00pU+oCYSBY9ldbk
 Q87w==
X-Gm-Message-State: APjAAAXc326sKKP3kJ3/secdKViG+PWhz1XGGjs3e3rpUP8tuQLr6qWM
 77/fFfrfGxcO9NWznZSmGlKx4LA9VlWO97rKBjrgNA==
X-Google-Smtp-Source: APXvYqwvmgt/bw+pHWWXou5tyccFRyXunW6p7SQR2RZbuTc8/lWcYhqTEzF+kVUypx9r00/QHnthFI29Omdf0qdOEa4=
X-Received: by 2002:a5d:8d90:: with SMTP id b16mr3294983ioj.262.1582890079434; 
 Fri, 28 Feb 2020 03:41:19 -0800 (PST)
MIME-Version: 1.0
References: <CAAxjCEzHQz4cG_8m7S6=CwCBoN5daQs+KVyuU5GL5Tq3Bky1NA@mail.gmail.com>
 <CAAxjCEx79Fkjw9tFbSMo+b1LGv2LNivLRXf1GS9JsYnXrNVVkQ@mail.gmail.com>
 <CAAxjCEwv61e87ZUz-jueL9AkzaNbY3pRoFmf2dah-p9W8nosWA@mail.gmail.com>
 <CAAxjCEx__TsY75b0iecG1a_wUO2MF2UMVP50nFHQi2Ouyu0znw@mail.gmail.com>
 <CAAxjCExb8GKP0Y8hwEbv=DETfu1dG3++umYV0n8vX6kxuJW3pQ@mail.gmail.com>
 <20200228111046.GC5274@linux.fritz.box>
In-Reply-To: <20200228111046.GC5274@linux.fritz.box>
From: Stefan Ring <stefanrin@gmail.com>
Date: Fri, 28 Feb 2020 12:41:08 +0100
Message-ID: <CAAxjCEx8EVyEs9akLV+WNghxE9A-ej5_u5o3f+=zrL7VNjXa2g@mail.gmail.com>
Subject: Re: Strange data corruption issue with gluster (libgfapi) and ZFS
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d41
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
Cc: integration@gluster.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 28, 2020 at 12:10 PM Kevin Wolf <kwolf@redhat.com> wrote:
>
> This sounds almost like two other bugs we got fixed recently (in the
> QEMU file-posix driver and in the XFS kernel driver) where two write
> extending the file size were in flight in parallel, but if the shorter
> one completed last, instead extending the file, it would end up
> truncating it.

Hmm, XFS is used on the gluster server, with a CentOS 7 kernel. I can
switch to ext4 and check if it changes anything.

At this point I actually wanted to take this investigation away from
qemu, because it=E2=80=99s not involved anymore in my reproducer.

