Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC4DE29C6
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 07:08:46 +0200 (CEST)
Received: from localhost ([::1]:60302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNVMb-0004mu-Kv
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 01:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32898)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dietmar@proxmox.com>) id 1iNVLS-0003Et-KC
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 01:07:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dietmar@proxmox.com>) id 1iNVLR-0002Bx-Lj
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 01:07:34 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:6859)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dietmar@proxmox.com>) id 1iNVLR-0002Ap-Er
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 01:07:33 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id AA4FD46576;
 Thu, 24 Oct 2019 06:58:26 +0200 (CEST)
Date: Thu, 24 Oct 2019 06:58:25 +0200 (CEST)
From: Dietmar Maurer <dietmar@proxmox.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <1219145809.2.1571893105014@webmail.proxmox.com>
In-Reply-To: <20191023142258.GE9574@stefanha-x1.localdomain>
References: <20191021085055.30852-1-dietmar@proxmox.com>
 <20191023142258.GE9574@stefanha-x1.localdomain>
Subject: Re: [PATCH v3] yield_until_fd_readable: make it work with any
 AioContect
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.2-Rev14
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > +    aio_set_fd_handler(ctx, fd, false, (IOHandler *)qemu_coroutine_enter,
> > +                       NULL, NULL, qemu_coroutine_self());
> 
> This cast is unsafe.  If qemu_coroutine_enter()'s prototype is changed
> there will be no compiler warning that the prototypes are now
> incompatible.
> 
> Please keep fd_coroutine_enter() so the code is type-safe.

OK. Sent v4 with suggested changes.


