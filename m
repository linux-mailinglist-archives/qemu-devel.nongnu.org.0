Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE04162F2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 13:38:10 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44975 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNyQC-00033o-ME
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 07:38:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hNyP8-0002lC-P4
	for qemu-devel@nongnu.org; Tue, 07 May 2019 07:37:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hNyP8-0007Sa-1C
	for qemu-devel@nongnu.org; Tue, 07 May 2019 07:37:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46084)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1hNyP7-0007SE-SW
	for qemu-devel@nongnu.org; Tue, 07 May 2019 07:37:01 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A972C307CDD5;
	Tue,  7 May 2019 11:37:00 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-186.ams2.redhat.com
	[10.36.116.186])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34DC61001DFE;
	Tue,  7 May 2019 11:36:49 +0000 (UTC)
Date: Tue, 7 May 2019 13:36:48 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190507113648.GG5808@localhost.localdomain>
References: <20190505224737.1028-1-philmd@redhat.com>
	<20190505224737.1028-2-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190505224737.1028-2-philmd@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 07 May 2019 11:37:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/1] MAINTAINERS: Add an entry for the
 Parallel NOR Flash devices
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Stephen Checkoway <stephen.checkoway@oberlin.edu>,
	Paul Burton <paul.burton@imgtec.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jordan Justen <jordan.l.justen@intel.com>, qemu-devel@nongnu.org,
	Laszlo Ersek <lersek@redhat.com>, Roy Franz <roy.franz@linaro.org>,
	Michael Walle <michael@walle.cc>, Paolo Bonzini <pbonzini@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Jean-Christophe PLAGNIOL-VILLARD <plagnoij@jcrosoft.com>,
	David Engraf <david.engraf@sysgo.com>,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 06.05.2019 um 00:47 hat Philippe Mathieu-Daud=E9 geschrieben:
> Step in to maintain it, since I have some familiarity with
> the technology.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Thanks, applied to the block branch.

Kevin

