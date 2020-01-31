Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2055C14E6CE
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 02:11:28 +0100 (CET)
Received: from localhost ([::1]:42544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixKqF-0000Qt-60
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 20:11:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58411)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ixKov-0007vP-78
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 20:10:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ixKos-000770-2G
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 20:10:05 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23311
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ixKor-00071p-MC
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 20:10:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580432994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sgzjFCGiqyESzKZe6K3egxpB6SWKcjX7gcf4EqU9NQw=;
 b=Hrzw2vy0Q7YefUJQ5RTWtMi2kFcbEYb/WpojQau1XCsb1zw5RhZ6qfAoRN8dxp4BMtXnqr
 Z/iWJz169JY7TBpwMDDtpqcqsclMDRH7w09hvHvyna+aW+j8xgBzf5hfBwWqrDzDxEf1jh
 d+Z2dmf9G9CMITwbQmwNsWZWq3Qt8zA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-rS4_abqsOg-qtrz9kJGk8Q-1; Thu, 30 Jan 2020 20:09:51 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A8E5182B8E7;
 Fri, 31 Jan 2020 01:09:49 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-34.brq.redhat.com [10.40.204.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EB675DA75;
 Fri, 31 Jan 2020 01:09:43 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] !fixup target/avr merger-rc4
Date: Fri, 31 Jan 2020 02:09:39 +0100
Message-Id: <20200131010941.10636-1-philmd@redhat.com>
In-Reply-To: <1580428993-4767-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1580428993-4767-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: rS4_abqsOg-qtrz9kJGk8Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Aleksandar, I addressed Alex Benn=C3=A9e comment as fixup, so you
can squash directly. See:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg673846.html

- convert DB_PRINT() to trace-events
- fix style/indentation

Based-on: <1580428993-4767-1-git-send-email-aleksandar.markovic@rt-rk.com>

Philippe Mathieu-Daud=C3=A9 (2):
  !fixup "hw/misc: Add limited support for AVR power device"
  !fixup "hw/timer: Add limited support for AVR 16-bit timer peripheral"

 hw/misc/avr_power.c    | 17 +++++++++--------
 hw/timer/avr_timer16.c | 25 +++++++++++++++----------
 hw/misc/trace-events   |  4 ++++
 hw/timer/trace-events  | 12 ++++++++++++
 4 files changed, 40 insertions(+), 18 deletions(-)

--=20
2.21.1


