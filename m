Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA858B557
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 12:22:51 +0200 (CEST)
Received: from localhost ([::1]:50876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxTx4-000090-G5
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 06:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33420)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hxTvX-0006pP-2f
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 06:21:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hxTvW-0002yU-9E
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 06:21:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37882)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hxTvW-0002y9-49
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 06:21:14 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 75118693C8;
 Tue, 13 Aug 2019 10:21:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30F7B10016E8;
 Tue, 13 Aug 2019 10:21:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 73B4016E08; Tue, 13 Aug 2019 12:21:12 +0200 (CEST)
Date: Tue, 13 Aug 2019 12:21:12 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>
Message-ID: <20190813102112.4bt5l5uschq6y65c@sirius.home.kraxel.org>
References: <cover.1564925486.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1564925486.git.DirtY.iCE.hu@gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 13 Aug 2019 10:21:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 00/14] Multiple simultaneous audio
 backends
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

On Sun, Aug 04, 2019 at 07:04:12PM +0200, K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1=
n wrote:
> Hello,
>=20
> This is the v3 of my audio patches.  audiodev argument of wavcapture hm=
p
> is now mandatory.

Looks good, survived basic testing, queuing up for 4.2

thanks,
  Gerd


