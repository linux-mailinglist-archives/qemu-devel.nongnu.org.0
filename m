Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D3018AE23
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Mar 2020 09:14:38 +0100 (CET)
Received: from localhost ([::1]:34662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEqK4-0000SR-Vu
	for lists+qemu-devel@lfdr.de; Thu, 19 Mar 2020 04:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dietmar@proxmox.com>) id 1jEqJM-0008P7-5e
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 04:13:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dietmar@proxmox.com>) id 1jEqJL-0000Q6-8x
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 04:13:52 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:59588)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dietmar@proxmox.com>) id 1jEqJL-0008OP-27
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 04:13:51 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 92FDB42101;
 Thu, 19 Mar 2020 09:13:39 +0100 (CET)
Date: Thu, 19 Mar 2020 09:13:38 +0100 (CET)
From: Dietmar Maurer <dietmar@proxmox.com>
To: "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Message-ID: <1577640273.5.1584605618249@webmail.proxmox.com>
Subject: aio-context question
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

I just saw commit 30dd65f307b647eef8156c4a33bd007823ef85cb, and noticed that 
a similar pattern in drive_backup_prepare() and blockdev_backup_prepare().

The calls to bdrv_try_set_aio_context() seems useless, because we already do
that later in backup_job_create/brdv_attach.

But I am not 100%& sure?


