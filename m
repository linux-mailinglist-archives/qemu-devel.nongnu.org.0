Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A522F14DE
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Nov 2019 12:19:52 +0100 (CET)
Received: from localhost ([::1]:56082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSJLr-0003HG-CR
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 06:19:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33248)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dietmar@proxmox.com>) id 1iSJKI-0001xp-9b
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 06:18:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dietmar@proxmox.com>) id 1iSJKG-0001Bo-9j
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 06:18:14 -0500
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:48851)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dietmar@proxmox.com>)
 id 1iSJK7-0000cv-DT; Wed, 06 Nov 2019 06:18:03 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 24825464D5;
 Wed,  6 Nov 2019 12:18:01 +0100 (CET)
Date: Wed, 6 Nov 2019 12:18:00 +0100 (CET)
From: Dietmar Maurer <dietmar@proxmox.com>
To: Max Reitz <mreitz@redhat.com>, Wolfgang Bumiller <w.bumiller@proxmox.com>
Message-ID: <1868807950.27.1573039080274@webmail.proxmox.com>
In-Reply-To: <37f72cb7-7085-3c40-7728-e41d59137b3b@redhat.com>
References: <1767781109.66.1572948164492@webmail.proxmox.com>
 <20191106083222.GA189998@stefanha-x1.localdomain>
 <ac30110f-6abe-a144-2aa5-b1cc140d7e8c@redhat.com>
 <20191106103450.cafwk7m5xd5eulxo@olga.proxmox.com>
 <37f72cb7-7085-3c40-7728-e41d59137b3b@redhat.com>
Subject: Re: backup_calculate_cluster_size does not consider source
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.2-Rev15
X-Originating-Client: open-xchange-appsuite
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.186.127.180
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
Reply-To: Dietmar Maurer <dietmar@proxmox.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> And if it issues a smaller request, there is no way for a guest device
> to tell it =E2=80=9COK, here=E2=80=99s your data, but note we have a whol=
e 4 MB chunk
> around it, maybe you=E2=80=99d like to take that as well...?=E2=80=9D
>=20
> I understand wanting to increase the backup buffer size, but I don=E2=80=
=99t
> quite understand why we=E2=80=99d want it to increase to the source clust=
er size
> when the guest also has no idea what the source cluster size is.

Because it is more efficent.


