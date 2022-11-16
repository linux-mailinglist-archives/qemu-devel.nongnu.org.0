Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FDB62C8D4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 20:17:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovNsz-0000hh-NY; Wed, 16 Nov 2022 14:15:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1ovNsr-0000fu-Mr
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 14:15:43 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1ovNsm-0006a9-QF
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 14:15:41 -0500
Received: by mail-ed1-x535.google.com with SMTP id u24so28010824edd.13
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 11:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L9qI+icUfecGM5aEXi1wLqFbcmy/8kfIaJ2CdGEr+qY=;
 b=pp08S/M4nd8Tjj7HnvOL2k/2yxOseTicNANPQqj1LsB2RCtM7K68HZcK4ruJ7zBLaa
 2V4rHUU4qtKg76l7LaozxgXlyZHzu5LCIMvzEFQIYf4u/nT7v+GKTYjATzrAf/mgV21B
 p6ySG1lTvBwzIx/vFU+FuKpYKSK6R+zqW77J227TMq0Jj8sLb/2+zoh29YhE+NExG2NN
 BUJR3I5ZaYWEOGdh6j8tpUMUx/iVagV9hcdqJZYvCqRculJiFlagl1vU8pF4dSFfeLnX
 tNvlVGOt1oMuWbe0kqQmgJupRO3VNz8UTg79zAVm9nwTn2JxykxnRCeYxWWQSAhvex57
 K61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L9qI+icUfecGM5aEXi1wLqFbcmy/8kfIaJ2CdGEr+qY=;
 b=ZveO5JphyPG8M5fz/TeJdk8ZiDUSc7oEQrSYUyYQSeXcnKYutzaawcgukD0DWb6dwx
 jGmuC8SBV3Tq+vYcBavUZkwcAIK8l4ERgcRWvlan/lYbx48p7fiLhD53tovddosrxj/1
 H+HtQKOIk7cr9ybIjogvKJrFts8pF8Gfj1UPpjgQmLkMWUIeG0F62/HZAIPdcsiCgk3A
 7tXyGvpm6V9OPGA4QvYn4lzrmJrwfZmuaQrHwkUGIZUJx65g0FX8ka2D/N72irkHkBSR
 XGw5ydY/WSMNhb3H9Lcd0HdThozgBcehCVwU8k/MykN5qjAf4MiNBLKXCOVTgS6S9/eW
 eVxg==
X-Gm-Message-State: ANoB5pmrdyrEmSLZFtReFxM5M1Su0d9XVnmJhlhcGeBiQic2Yfw92e7+
 gxwosM4rvbqhUYfE2uZzRPGDW/ALMsUvg1VsaXc=
X-Google-Smtp-Source: AA0mqf460KZmOzPdB65VsL8WstVQNNL/kkGB4YpwZ1HtXGdIP15UNObEbaawGu1MRfPB5+lI836EXhqkCxAOgiIZPO8=
X-Received: by 2002:a05:6402:229b:b0:457:d794:f5ee with SMTP id
 cw27-20020a056402229b00b00457d794f5eemr20852477edb.227.1668626134584; Wed, 16
 Nov 2022 11:15:34 -0800 (PST)
MIME-Version: 1.0
References: <20221114192011.1539233-1-marmarek@invisiblethingslab.com>
 <20221114192011.1539233-2-marmarek@invisiblethingslab.com>
In-Reply-To: <20221114192011.1539233-2-marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 16 Nov 2022 14:15:22 -0500
Message-ID: <CAKf6xpvpsJuMZx98vLJ7CAmUWG-vW91Am0L8817eD8nmAN4NUw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Do not access /dev/mem in MSI-X PCI passthrough on Xen
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=jandryuk@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, Nov 14, 2022 at 2:21 PM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> The /dev/mem is used for two purposes:
>  - reading PCI_MSIX_ENTRY_CTRL_MASKBIT
>  - reading Pending Bit Array (PBA)
>
> The first one was originally done because when Xen did not send all
> vector ctrl writes to the device model, so QEMU might have outdated old
> register value. This has been changed in Xen, so QEMU can now use its
> cached value of the register instead.
>
> The Pending Bit Array (PBA) handling is for the case where it lives on
> the same page as the MSI-X table itself. Xen has been extended to handle
> this case too (as well as other registers that may live on those pages),
> so QEMU handling is not necessary anymore.
>
> Removing /dev/mem access is useful to work within stubdomain, and
> necessary when dom0 kernel runs in lockdown mode.
>
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

I put the Xen, QEMU, and xen-pciback patches into OpenXT and gave a
little test.  When pci_permissive=3D0, iwlwifi fails to load its
firmware.  With pci_permissive=3D1, it looks like MSI-X is enabled. (I
previously included your libxl allow_interrupt_control patch - that
seemed to get regular MSIs working prior to the MSI-X patches.)  I
also removed the OpenXT equivalent of 0005-Disable-MSI-X-caps.patch.
I am testing with Linux 5.4.y, so that could be another factor.

One strange thing is the lspci output.  Dom0 shows MSI-X enabled.
Meanwhile NDVM (sys-net) does not show the MSI-X capability.  If you
`hexdump -C /sys/bus/pci/devices/$dev/config` you can see MSI-X
enabled, but you also see that the MSI capability has 00 as the next
pointer, so lspci stops parsing.

MSI cap stubdom:
00000040  10 00 92 00 c0 0e 00 00  10 0c 10 00 00 00 00 00  |..............=
..|
0x41 -> next 0x00
MSI cap dom0:
00000040  10 80 92 00 c0 0e 00 10  10 0c 10 00 00 00 00 00  |..............=
..|
0x41 -> next 0x80

MSI-X:
00000080  11 00 0f 80 00 20 00 00  00 30 00 00 00 00 00 00

AFAIU, the value 0x80 at offset 0x83 is MSI-X Enabled.

I had a boot where assignment failed with the hypervisor printing:
d12: assign (0000:00:14.3) failed (-16)
Rebooting the laptop seemed to clear that.

Regards,
Jason

