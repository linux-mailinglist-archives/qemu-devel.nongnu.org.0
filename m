Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0B3138DEA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 10:36:42 +0100 (CET)
Received: from localhost ([::1]:47840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iqw9J-0007SN-VU
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 04:36:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34074)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dovgaluk@ispras.ru>) id 1iqw8L-00070f-Px
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 04:35:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1iqw8K-0001cK-FF
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 04:35:41 -0500
Received: from mail.ispras.ru ([83.149.199.45]:41140)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1iqw8K-0001Y3-7m
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 04:35:40 -0500
Received: from PASHAISP (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 2C300725C0;
 Mon, 13 Jan 2020 12:35:35 +0300 (MSK)
From: "Pavel Dovgalyuk" <dovgaluk@ispras.ru>
To: "'Markus Armbruster'" <armbru@redhat.com>
References: <157709434917.12933.4351155074716553976.stgit@pasha-Precision-3630-Tower>	<003a01d5c6b3$df62afd0$9e280f70$@ru>	<20200109120038.GD9504@linux.fritz.box>
 <87k15v1z71.fsf@dusky.pond.sub.org>
In-Reply-To: <87k15v1z71.fsf@dusky.pond.sub.org>
Subject: RE: [for-5.0 PATCH 00/11] Support for reverse debugging with GDB
Date: Mon, 13 Jan 2020 12:35:36 +0300
Message-ID: <000f01d5c9f4$cfbc1230$6f343690$@ru>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 12.0
Content-Language: ru
Thread-Index: AdXJ9BBNsfAeGaZ6QBWsRLZVhcZvNwAAFBMg
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 83.149.199.45
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
Cc: 'Kevin Wolf' <kwolf@redhat.com>, peter.maydell@linaro.org,
 boost.lists@gmail.com, artem.k.pisarenko@gmail.com,
 crosthwaite.peter@gmail.com, ciro.santilli@gmail.com, jasowang@redhat.com,
 quintela@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 'Pavel Dovgalyuk' <pavel.dovgaluk@gmail.com>, maria.klimushenkova@ispras.ru,
 mst@redhat.com, kraxel@redhat.com, pavel.dovgaluk@ispras.ru,
 thomas.dullien@googlemail.com, pbonzini@redhat.com, alex.bennee@linaro.org,
 dgilbert@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Markus Armbruster [mailto:armbru@redhat.com]
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Am 09.01.2020 um 07:13 hat Pavel Dovgalyuk geschrieben:
> >> Ping.
> >
> > I think you have my Acked-by for the block-related patches in this
> > series now. If I missed something, please let me know.
> 
> Pavel, whom are you nudging to do what?

I'm not sure.
My prior patches for record/replay were pulled by Paolo.
But reverse debugging is more like a modification of things,
and not a completely new subsystem. 
Everything but gdbstub was already acked by the maintainers.

Pavel Dovgalyuk


