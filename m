Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E56AA0119
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 13:55:38 +0200 (CEST)
Received: from localhost ([::1]:35052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2wY4-0004ZJ-9g
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 07:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43902)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1i2wW3-0003Qt-9o
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 07:53:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1i2wW1-0005uq-5i
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 07:53:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44888)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1i2wW1-0005uJ-0Y
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 07:53:29 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 91F3618C4262;
 Wed, 28 Aug 2019 11:53:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
 [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFB01600D1;
 Wed, 28 Aug 2019 11:53:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0A97B31E7F; Wed, 28 Aug 2019 13:53:24 +0200 (CEST)
Date: Wed, 28 Aug 2019 13:53:24 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>
Message-ID: <20190828115323.lssnoykjmmv6buus@sirius.home.kraxel.org>
References: <cover.1566847960.git.DirtY.iCE.hu@gmail.com>
 <02d4328c33455742d01e0b62395013e95293c3ba.1566847960.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <02d4328c33455742d01e0b62395013e95293c3ba.1566847960.git.DirtY.iCE.hu@gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Wed, 28 Aug 2019 11:53:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 2/4] audio: omitting audiodev= parameter
 is only deprecated
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
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 26, 2019 at 09:59:02PM +0200, K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1=
n wrote:
> Unfortunately, changes introduced in af2041ed2d "audio: audiodev=3D
> parameters no longer optional when -audiodev present" breaks backward
> compatibility.  This patch changes the error into a deprecation warning=
.

Prepared a pull request for 1+2 to get them merged quickly while the pa
naming discussion is ongoing still.

cheers,
  Gerd


