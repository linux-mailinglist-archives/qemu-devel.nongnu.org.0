Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5131A4688
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Apr 2020 14:55:11 +0200 (CEST)
Received: from localhost ([::1]:33974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMtBe-0007P9-Rq
	for lists+qemu-devel@lfdr.de; Fri, 10 Apr 2020 08:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39971)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1jMtAr-0006z1-NO
 for qemu-devel@nongnu.org; Fri, 10 Apr 2020 08:54:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1jMtAp-0005wN-RU
 for qemu-devel@nongnu.org; Fri, 10 Apr 2020 08:54:20 -0400
Received: from [192.146.155.5] (port=21134 helo=mcp02.nutanix.com)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1jMtAp-0005tm-LH
 for qemu-devel@nongnu.org; Fri, 10 Apr 2020 08:54:19 -0400
Received: from localhost.localdomain (unknown [10.22.39.231])
 by mcp02.nutanix.com (Postfix) with ESMTP id 4E50E10061FA;
 Fri, 10 Apr 2020 12:54:18 +0000 (UTC)
Date: Thu, 9 Apr 2020 20:41:15 -0400
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: mst@redhat.com
Subject: Feature and message numbers missing in vhost-user.c
Message-ID: <20200410004115.GA7738@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 192.146.155.5
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi MST,

I see that a new feature, VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS
(https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Ddocs/interop/vhost-user.=
rst;h=3D3b1b6602c77932101e1e3b098e35c2497f5b0260;hb=3DHEAD#l817),
and corresponding VHOST_USER_VRING_KICK
(https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Ddocs/interop/vhost-user.=
rst;h=3D3b1b6602c77932101e1e3b098e35c2497f5b0260;hb=3DHEAD#l1252)
message has been added to the documentation for the vhost-user protocol
and seem to be added in libvhost-user. However I don=E2=80=99t see the fe=
ature
or message number reserved in the core vhost-user code
(https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dhw/virtio/vhost-user.c;h=
=3D08e7e63790e5bcfae6cd31bf9ccd32c3a7347f4e;hb=3DHEAD#l47)

I understand these features are mostly for simulation, but surely
the numbers for these features should at least be reserved as more
features and messages are frequently being added.

Is this an oversight? With the aim of preventing future confusion should
I send a patch to add them in /hw/virtio/vhost-user.c?

Thanks,
Raphael

