Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CE227172
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 23:13:49 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51542 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTYYW-0001Yo-NZ
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 17:13:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hTYXS-0001C9-O1
	for qemu-devel@nongnu.org; Wed, 22 May 2019 17:12:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hTYXO-00078H-1k
	for qemu-devel@nongnu.org; Wed, 22 May 2019 17:12:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54754)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hTYXN-00077W-OO
	for qemu-devel@nongnu.org; Wed, 22 May 2019 17:12:37 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DCEAFC0A4F4C;
	Wed, 22 May 2019 21:12:35 +0000 (UTC)
Received: from localhost (ovpn-116-14.gru2.redhat.com [10.97.116.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0E13760240;
	Wed, 22 May 2019 21:12:32 +0000 (UTC)
Date: Wed, 22 May 2019 18:12:30 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20190522211230.GA10764@habkost.net>
References: <20190520231910.12184-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190520231910.12184-1-f4bug@amsat.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 22 May 2019 21:12:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/4] mips: Add more Avocado tests
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
Cc: Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-devel@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 21, 2019 at 01:19:06AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Hi,
>=20
> It was a rainy week-end here, so I invested it to automatize some
> of my MIPS tests.
>=20
> The BootLinuxSshTest is not Global warming friendly, it is not
> meant to run on a CI system but rather on a workstation previous
> to post a pull request.
> It can surely be improved, but it is a good starting point.

Until we actually have a mechanism to exclude the test case on
travis-ci, I will remove patch 4/4 from the queue.  Aleksandar,
please don't merge patch 4/4 yet or it will break travis-ci.

Cleber, Wainer, is it already possible to make "avocado run" skip
tests tagged with "slow"?

--=20
Eduardo

