Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA143337D4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 09:51:30 +0100 (CET)
Received: from localhost ([::1]:53878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJuYz-0002bm-UZ
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 03:51:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJuWO-00086Q-5F; Wed, 10 Mar 2021 03:48:52 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:35834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJuWL-0007uh-I6; Wed, 10 Mar 2021 03:48:47 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id p186so17056036ybg.2;
 Wed, 10 Mar 2021 00:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=72l9CliPYnYznlFEcqth+eaGJqyTX8oYfvLaXJ+NqKc=;
 b=VxlQd5KJW/H4aO8Eb0rkUsy2oivLnQJK6XeRo9mUfgMNS08+Ufx2x3pGu+nj4I8nOV
 c5K5mW38+3WQR3/ZoTR4/9MfgmzWGpexofvU+3qMvIabgcZOfPc1UuYDMNiNkw1fxhbR
 CJAwx1BiMzqgl9L5SXokB3qXAeGN9VCaXU9vq+FwzO/9GlM3We1FMBch/qEZ5OqVXxHm
 ae/ayS2DLnnFg8Uj7q0/ycoxhzXP7CMxzDoAWu6CMMPAXhKgaDVswdwq5OxbAFBnniXn
 Qboux3QEuAld+DNiLHbVrX3XexDrKdiQ3d/Rk8c7sYk2X5rdu/UahB4v5YLbKg4/1z0i
 D4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=72l9CliPYnYznlFEcqth+eaGJqyTX8oYfvLaXJ+NqKc=;
 b=EwNHNzl6jS4Pso6sPpK2z5QylPk3b4S2kxbocdO8ZivmAknXFdj/jcStXcL2ra8P4p
 SHXzpECt1WT7XCXBevwOJDU4mN2qW4RY3bpaoYutqZrsRfu9l2BxZGMaljoy6SQDxjP8
 0Ug0w6kNM2HQ7F+6jdVf+A3zBYXbJlC5gMuZ7BpkPz5nMrYFv5Zc9HYnXPaHg2fjfwWE
 kl4eJwgES0MbuIC9s7e+ZR7rtMtnbcIaSg0W3lotEB4tP/PcGuder1TapJdzLdZHmC8W
 eIaFsv5ks5CarmAF/N4WtVkBYybieQh3iz2kgwLNVQ6tZb9ow9d9YYwi81O7wd4F+tS6
 ROmQ==
X-Gm-Message-State: AOAM532sRzu9DJAxXBLACgj9GPFKm4mp+9/yi7teK9xBZBq5WNMorotS
 fw3vMGDgzDhD1TLnpSYcN0q+aH7VMmJbXqHiQbk=
X-Google-Smtp-Source: ABdhPJxDWEDQLpiPmUr3f8vWz7DA0hgYdAxWY+vbKTJHSBGpG0lacjKDhe0IYSnBLDWAjV29fiw+gtXNmyPAYimVC90=
X-Received: by 2002:a25:abce:: with SMTP id v72mr2914735ybi.152.1615366120519; 
 Wed, 10 Mar 2021 00:48:40 -0800 (PST)
MIME-Version: 1.0
References: <20210309235028.912078-1-philmd@redhat.com>
 <20210309235028.912078-2-philmd@redhat.com>
In-Reply-To: <20210309235028.912078-2-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Mar 2021 16:48:28 +0800
Message-ID: <CAEUhbmVcvNN1QTWi3dKmn1RRd5Tu55beueScNHBt1EJZJ-RbCA@mail.gmail.com>
Subject: Re: [PATCH 1/9] hw/block/pflash_cfi: Fix code style for checkpatch.pl
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 7:50 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> We are going to move this code, fix its style first.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/block/pflash_cfi01.c | 36 ++++++++++++++++++++++++------------
>  hw/block/pflash_cfi02.c |  9 ++++++---
>  2 files changed, 30 insertions(+), 15 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

