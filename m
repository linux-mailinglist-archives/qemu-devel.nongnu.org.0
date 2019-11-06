Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CD2F13C1
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Nov 2019 11:20:31 +0100 (CET)
Received: from localhost ([::1]:54942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSIQQ-0002bi-MC
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 05:20:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41562)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dietmar@proxmox.com>) id 1iSIOj-00016N-VQ
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 05:18:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dietmar@proxmox.com>) id 1iSIOj-0004Ut-3K
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 05:18:45 -0500
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:37154)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dietmar@proxmox.com>)
 id 1iSIOb-0004QK-7o; Wed, 06 Nov 2019 05:18:37 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 204B7457FF;
 Wed,  6 Nov 2019 11:18:28 +0100 (CET)
Date: Wed, 6 Nov 2019 11:18:27 +0100 (CET)
From: Dietmar Maurer <dietmar@proxmox.com>
To: Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <1775789152.22.1573035507302@webmail.proxmox.com>
In-Reply-To: <ac30110f-6abe-a144-2aa5-b1cc140d7e8c@redhat.com>
References: <1767781109.66.1572948164492@webmail.proxmox.com>
 <20191106083222.GA189998@stefanha-x1.localdomain>
 <ac30110f-6abe-a144-2aa5-b1cc140d7e8c@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> The thing is, it just seems unnecessary to me to take the source cluster
> size into account in general.  It seems weird that a medium only allows
> 4 MB reads, because, well, guests aren=E2=80=99t going to take that into =
account.

Maybe it is strange, but it is quite obvious that there is an optimal clust=
er
size for each storage type (4M in case of ceph)...


