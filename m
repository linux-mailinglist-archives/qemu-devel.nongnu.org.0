Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C820191261
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 15:05:07 +0100 (CET)
Received: from localhost ([::1]:49382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGkB0-0004NT-78
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 10:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54104)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dietmar@proxmox.com>) id 1jGk88-0008SQ-Gk
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 10:02:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dietmar@proxmox.com>) id 1jGk87-00050j-82
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 10:02:08 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:34568)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dietmar@proxmox.com>) id 1jGk87-0004xZ-11
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 10:02:07 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 3DF9540D02;
 Tue, 24 Mar 2020 15:02:05 +0100 (CET)
Date: Tue, 24 Mar 2020 15:02:03 +0100 (CET)
From: Dietmar Maurer <dietmar@proxmox.com>
To: Max Reitz <mreitz@redhat.com>, "jsnow@redhat.com" <jsnow@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <1839684450.63.1585058523789@webmail.proxmox.com>
In-Reply-To: <32c10c76-1c9f-3a6a-4410-09eebad0f6f3@redhat.com>
References: <2007060575.48.1585048408879@webmail.proxmox.com>
 <1512602350.59.1585056617632@webmail.proxmox.com>
 <1806708761.60.1585056799652@webmail.proxmox.com>
 <32c10c76-1c9f-3a6a-4410-09eebad0f6f3@redhat.com>
Subject: Re: backup transaction with io-thread core dumps
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.2-Rev22
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> I assume this is with master and has popped up only recently?

sure
=20
> Maybe it has something to do with the recent mutex patches by Stefan, so
> I=E2=80=99m Cc-ing him.

Thanks.


