Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFD338EDEB
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 17:43:09 +0200 (CEST)
Received: from localhost ([::1]:43884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llCjU-0002fZ-11
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 11:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1llCi4-0001fs-NO; Mon, 24 May 2021 11:41:40 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:36423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1llCi3-0007OI-9N; Mon, 24 May 2021 11:41:40 -0400
Received: by mail-qk1-x732.google.com with SMTP id c20so27427930qkm.3;
 Mon, 24 May 2021 08:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=pyD0wc4ZRS1Ap5n3qFeAKV5tYx7cZnQDI5laor3ASVw=;
 b=C5OT+tTuHtRErS3lpi0mx0dpaf2Fd43LB8adEngd3e7rszk7NX2UuCi9APlkOe+TXe
 CooOzho7k1fjRzjnwRwE3t/p8jxmMh95JcGLKtXr9eW7HSdGev/Br5o/22erCiQrQx9T
 dsxZwchSHfowPgcS1ZZsxvNkhyuMrsI3Bxdo6sw0IvGWq3yHcODj8zQ0jHlxSexwEMiy
 TCDqoUlX5k6z+J2FLqd/uCOMpcYt7EVPvuEeqFSDmQNJ81LCpThBWvg9KV/KYywDknUb
 xdBh+fBopihQ34KUJva5bcJxKd06NkhQnrzIAQdg7JagSPbzL2TNw6PzbQMWKrdep3BV
 PN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=pyD0wc4ZRS1Ap5n3qFeAKV5tYx7cZnQDI5laor3ASVw=;
 b=HBLkVG0jy9FLot2zCzQoB37oUa7GLamVuV8i/hul0BMTysvj4GudT7IpEkEPm46z/+
 mWlpk2y2BvrlIYSn4Id/1Zu26ifPSrameKD8jwg7t8BrKh6wWWkD1dcK8H3w1dhwJISh
 ZoUw/Ypl4v96o+KjRo6WDusywWXHwz+lwZpF0OFuNb1Uh8wfwPawUBSLNOh1V9YegQep
 +tvms02y7S2Us4vBdPM/sO8Yl+KJCX3kTS55KhTQxQMWmlvr/oEnAMbpEVlpCoGhr3KY
 c2sagBsqaLESZg/rXul80aFj4RK9l+VyVYuRU2MpS7PZsOjA8xgCAYq9DmKB0HNlcb+y
 tbXQ==
X-Gm-Message-State: AOAM5328RbilUkzSq0rJ3YtW/Nar+Fxr8/FJp+jKTEyVwDMWcWO0P2dU
 9RvM79ZmCAKBXYedM6KFOo4=
X-Google-Smtp-Source: ABdhPJzZoPKQc5GXaVTNB1kUKsfGfCFi3LGvYJ6CVf+F1mnVpTWTWudYUfxNUxqAa36qyojKRfeBng==
X-Received: by 2002:a37:6183:: with SMTP id v125mr27928720qkb.49.1621870897991; 
 Mon, 24 May 2021 08:41:37 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id 25sm10546499qtd.51.2021.05.24.08.41.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 May 2021 08:41:37 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH 0/2] vvfat: fix two crashes.
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <20210524101257.119377-1-vsementsov@virtuozzo.com>
Date: Mon, 24 May 2021 11:41:36 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <E8FEBD24-139F-4918-92D9-5183EECCA8FB@gmail.com>
References: <20210524101257.119377-1-vsementsov@virtuozzo.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x732.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, berto@igalia.com,
 QEMU devel list <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On May 24, 2021, at 6:12 AM, Vladimir Sementsov-Ogievskiy =
<vsementsov@virtuozzo.com> wrote:
>=20
> Hi!
>=20
> As reported by Programmingkid, command=20
>=20
> qemu-system-ppc -usb -device usb-storage,drive=3Dfat16 -drive =
file=3Dfat:rw:fat-type=3D16:"<path of a host =
folder>",id=3Dfat16,format=3Draw,if=3Dnone
>=20
> crashes.
>=20
> I tested it with qemu-system-x86_64 and it reproduces for me. I even
> kept "<path of a host folder>" as is :).
>=20
> So, here are two fixes.
>=20
> Vladimir Sementsov-Ogievskiy (2):
>  block/vvfat: child_vvfat_qcow: add .get_parent_aio_context, fix crash
>  block/vvfat: fix vvfat_child_perm crash
>=20
> include/block/block.h | 1 +
> block.c               | 4 ++--
> block/vvfat.c         | 8 +++-----
> 3 files changed, 6 insertions(+), 7 deletions(-)
>=20
> --=20
> 2.29.2

I applied both of your patches to the most recent git commit today and =
they worked. I was able to share files from the host on the guest.

Thank you.

Reviewed-by: John Arbuckle <programmingkidx@gmail.com>=

