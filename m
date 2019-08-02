Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B279F7FC3F
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 16:29:54 +0200 (CEST)
Received: from localhost ([::1]:35306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htYZ7-0003NG-Gn
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 10:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37687)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1htYYL-0002mx-Pg
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 10:29:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1htYYK-0002jo-Mj
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 10:29:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60575)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1htYYK-0002jP-H3
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 10:29:04 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9BF298830C;
 Fri,  2 Aug 2019 14:29:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
 [10.36.116.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2A145D704;
 Fri,  2 Aug 2019 14:28:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0C39417472; Fri,  2 Aug 2019 16:28:59 +0200 (CEST)
Date: Fri, 2 Aug 2019 16:28:59 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20190802142859.26wikc3yuyjvxscb@sirius.home.kraxel.org>
References: <20190717134335.15351-1-alex.bennee@linaro.org>
 <20190717134335.15351-23-alex.bennee@linaro.org>
 <1e1ae24a-bed3-2acc-7727-16cfb7d877bc@redhat.com>
 <adc633ad-9c58-78ef-c5b0-7044f5053573@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <adc633ad-9c58-78ef-c5b0-7044f5053573@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 02 Aug 2019 14:29:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] make vm-build-openbsd (was: Re: [PATCH v2 22/23]
 tests: Run the iotests during "make check" again)
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 23, 2019 at 09:20:43AM +0200, Thomas Huth wrote:
> On 22/07/2019 21.53, Philippe Mathieu-Daud=E9 wrote:
> [...]
> > Since Gerd updated the OpenBSD image, do you know if we can run vm-te=
st
> > again?
>=20
> I just tried it, but the OpenBSD build seems to be completely broken ri=
ght now:
>=20
> $ nice make vm-build-openbsd=20

Works fine here.
Can you try again with "V=3D1" ?

thanks,
  Gerd


