Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C1D2E519
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 21:11:18 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hW3ym-0006M1-U5
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 15:11:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hW3x1-0005h3-5E
	for qemu-devel@nongnu.org; Wed, 29 May 2019 15:09:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hW3x0-0003id-9e
	for qemu-devel@nongnu.org; Wed, 29 May 2019 15:09:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60752)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hW3x0-0003iD-4T
	for qemu-devel@nongnu.org; Wed, 29 May 2019 15:09:26 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 66B1D2E95B1
	for <qemu-devel@nongnu.org>; Wed, 29 May 2019 19:09:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-250.ams2.redhat.com
	[10.36.117.250])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76C4613425;
	Wed, 29 May 2019 19:09:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 0906B1138648; Wed, 29 May 2019 21:09:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
References: <20190529150853.9772-1-armbru@redhat.com>
	<20190529150853.9772-2-armbru@redhat.com>
	<fe9bdf35-70bf-0adc-b096-21a891dfdbd4@redhat.com>
Date: Wed, 29 May 2019 21:09:17 +0200
In-Reply-To: <fe9bdf35-70bf-0adc-b096-21a891dfdbd4@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed,
	29 May 2019 17:52:54 +0200")
Message-ID: <87h89dm61u.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 29 May 2019 19:09:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/3] MAINTAINERS: Drop redundant L:
 qemu-devel@nongnu.org
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 5/29/19 5:08 PM, Markus Armbruster wrote:
>> Redundant since commit c9a19d5b95 "MAINTAINERS: add all-match entry
>> for qemu-devel@".
>
> https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg05019.html
>
> :(

Oh.

I'm happy to take your patch if it applies without too much trouble.

Did more of that series get stuck?

>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thanks!

