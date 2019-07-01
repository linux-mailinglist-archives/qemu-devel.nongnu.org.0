Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F136F5B888
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 12:01:08 +0200 (CEST)
Received: from localhost ([::1]:56648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hht7U-0006Ft-5X
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 06:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55203)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ppandit@redhat.com>) id 1hht3z-0004F4-8e
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 05:57:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ppandit@redhat.com>) id 1hht3x-0006iF-9d
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 05:57:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42328)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ppandit@redhat.com>) id 1hht3r-0006cw-Kx
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 05:57:26 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B426FC04BD4A;
 Mon,  1 Jul 2019 09:57:22 +0000 (UTC)
Received: from kaapi (unknown [10.33.36.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C47C17D32;
 Mon,  1 Jul 2019 09:57:19 +0000 (UTC)
Date: Mon, 1 Jul 2019 15:27:15 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
In-Reply-To: <20190701093749.GE3573@redhat.com>
Message-ID: <nycvar.YSQ.7.76.1907011526090.31268@xnncv>
References: <20190701090904.31312-1-ppandit@redhat.com>
 <20190701090904.31312-4-ppandit@redhat.com>
 <20190701093749.GE3573@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Mon, 01 Jul 2019 09:57:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH v2 3/3] net: tap: restrict bridge name to
 IFNAMSIZ
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
Cc: Riccardo Schirone <rschiron@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+-- On Mon, 1 Jul 2019, Daniel P. Berrang=C3=A9 wrote --+
| Playing games with multiple "perfectly" sized static buffers & snprintf=
 is=20
| madness. How about re-writing this method so that it just uses=20
| g_strdup_printf() to dynamically format the helper_cmd string.
|=20
| Alternatively we could get rid of the use of shell and directly exec th=
e=20
| helper program. This would let us just pass argv[] and avoid the printf=
'ing=20
| entirely.

Okay, makes sense; I'll prepare patch v3.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
