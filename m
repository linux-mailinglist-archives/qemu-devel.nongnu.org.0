Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BC533E64
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 07:31:02 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45966 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hY22G-0000zg-6T
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 01:31:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hY20Z-0000Lx-2A
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 01:29:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hY1y9-0004o2-4V
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 01:26:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:13335)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hY1y8-0004mj-To
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 01:26:45 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E452019CF7A;
	Tue,  4 Jun 2019 05:26:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-131.ams2.redhat.com
	[10.36.117.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 313AA10013D9;
	Tue,  4 Jun 2019 05:26:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 6925817523; Tue,  4 Jun 2019 07:26:32 +0200 (CEST)
Date: Tue, 4 Jun 2019 07:26:32 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: John Snow <jsnow@redhat.com>
Message-ID: <20190604052632.2rb24ohovz45yq3s@sirius.home.kraxel.org>
References: <20190531192429.GH22103@habkost.net>
	<93e5101f-67f1-a416-5e80-f16371a35e6a@redhat.com>
	<871s0asvli.fsf@dusky.pond.sub.org>
	<236db86d-52df-5537-4f33-f3c09bbb6289@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <236db86d-52df-5537-4f33-f3c09bbb6289@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 04 Jun 2019 05:26:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] Deprecation policy and build dependencies
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> >> Normally I'd say it's only nice to also follow the depreciation policy
> >> for tooling as well to give people a chance to switch away, but with
> >> regards to Python2, I feel like we're in the clear to drop it for the
> >> first release that will happen after the Python2 doomsday clock.
> >>
> >> (So, probably 4.2.)

Makes sense to me.

> > RHEL-7 has Python 3 only in EPEL.

That'll change with 7.7 btw.  Beside that I'd say EPEL is good enough.

> What's the benefit of making sure that stable platforms can continue to
> run the *newest* QEMU?

Well, my development workstation runs RHEL-7 ...

cheers,
  Gerd


