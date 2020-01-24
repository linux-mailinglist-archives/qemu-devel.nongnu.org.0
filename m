Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637A5148C89
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 17:52:52 +0100 (CET)
Received: from localhost ([::1]:44834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iv2CR-0001r1-Ei
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 11:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44583)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iv2BY-0001Cs-88
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 11:51:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iv2BV-0008U2-MO
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 11:51:54 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31976
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iv2BV-0008Sr-Bj
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 11:51:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579884712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:openpgp:openpgp;
 bh=x9FsuIAfGUDXqzlYBq2H3+I7Vtpi2lBfDhxCiluRJFo=;
 b=L2ByoyQi9wrjnJ8iDHbDQBifahcllAKViBb8seJSbwizOngZn0d6Vfp4tyyxu6CsDs1KrE
 lGWL11hpU0NFM2PIp008AihHMX2wAq5fnsQO8ZJiyuVzkjzh/iAlxrBN9ajOMsacFc0wIO
 DMKMnq/meuGfSwLsN5XAxCVkZn1ahD8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-bQDtHHHuP8S_obt5wp3QRA-1; Fri, 24 Jan 2020 11:51:44 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F36C8005A2;
 Fri, 24 Jan 2020 16:51:43 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-156.ams2.redhat.com [10.36.116.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B42BC857BB;
 Fri, 24 Jan 2020 16:51:42 +0000 (UTC)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
From: Thomas Huth <thuth@redhat.com>
Subject: OpenBIOS update broke Linux boot on qemu-system-sparc64
Openpgp: preference=signencrypt
Message-ID: <82c4a7e1-aafc-70e5-b00a-bd56c9cd1b61@redhat.com>
Date: Fri, 24 Jan 2020 17:51:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: bQDtHHHuP8S_obt5wp3QRA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


 Hi Mark,

today, I noticed that the Sparc64 image from the QEMU advent calendar
2018 does not work anymore with the recent QEMU:

 https://www.qemu-advent-calendar.org/2018/download/day23.tar.xz

The Linux kernel now crashes during the boot process.

Bisecting the issues pointed to:

 commit e9deadb1c10351213845428de7591931f790f111
 Update OpenBIOS images to 3464681b built from submodule.

Do you maybe have an idea what might be going wrong here?

 Thomas


