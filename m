Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6EB178B3A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Mar 2020 08:23:10 +0100 (CET)
Received: from localhost ([::1]:58254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9ON2-0003Cb-Kf
	for lists+qemu-devel@lfdr.de; Wed, 04 Mar 2020 02:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35718)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j9OM6-0002gP-RO
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 02:22:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j9OM5-0005cH-1m
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 02:22:10 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:39456
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j9OM4-0005Vl-UA
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 02:22:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583306528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KZGee8f2URBuPqBUUcS4r80iAAWy1YmjVI/Ofuemx0w=;
 b=BrtXdfLAMq7O7Yh1SG5ilUsvuZJDVK3t0j3vU4VhQr/AkedLgrCJ8upaAT6qY7rOsEm+y2
 gjm6YVKysTYkM516Yp4fODARDZk01mxwpQdKbUBCSsVzrrgJ6PLQdlBa4BYrqyl+21ug8r
 EYsrcVFCPKIqqBYBuS9pi518iXBE0Gc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-Yic6ICbGMzmNwZSEpwF6ZQ-1; Wed, 04 Mar 2020 02:22:05 -0500
X-MC-Unique: Yic6ICbGMzmNwZSEpwF6ZQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4D8B800D4E;
 Wed,  4 Mar 2020 07:22:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A083D5D9C9;
 Wed,  4 Mar 2020 07:22:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1550811386A6; Wed,  4 Mar 2020 08:22:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 9/9] iotests: add pylintrc file
References: <20200227000639.9644-1-jsnow@redhat.com>
 <20200227000639.9644-10-jsnow@redhat.com>
Date: Wed, 04 Mar 2020 08:22:02 +0100
In-Reply-To: <20200227000639.9644-10-jsnow@redhat.com> (John Snow's message of
 "Wed, 26 Feb 2020 19:06:39 -0500")
Message-ID: <87h7z4r3dx.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Repeatable results. run `pylint iotests.py` and you should get a pass.

Start your sentences with a capital letter, please.

>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/pylintrc | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 tests/qemu-iotests/pylintrc
>
> diff --git a/tests/qemu-iotests/pylintrc b/tests/qemu-iotests/pylintrc
> new file mode 100644
> index 0000000000..feed506f75
> --- /dev/null
> +++ b/tests/qemu-iotests/pylintrc
> @@ -0,0 +1,20 @@
> +[MESSAGES CONTROL]
> +
> +# Disable the message, report, category or checker with the given id(s).=
 You
> +# can either give multiple identifiers separated by comma (,) or put thi=
s
> +# option multiple times (only on the command line, not in the configurat=
ion
> +# file where it should appear only once). You can also use "--disable=3D=
all" to
> +# disable everything first and then reenable specific checks. For exampl=
e, if
> +# you want to run only the similarities checker, you can use "--disable=
=3Dall
> +# --enable=3Dsimilarities". If you want to run only the classes checker,=
 but have
> +# no Warning level messages displayed, use "--disable=3Dall --enable=3Dc=
lasses
> +# --disable=3DW".
> +disable=3Dinvalid-name,
> +        missing-docstring,
> +        line-too-long,
> +        too-many-lines,
> +        too-few-public-methods,
> +        too-many-arguments,
> +        too-many-locals,
> +        too-many-branches,
> +        too-many-public-methods,
> \ No newline at end of file

Add the newline, please.

German pejorative for the too-many- and too-few- warnings: "M=C3=BCsli".
Implies it's for muesli-knitters / granola-crunchers indulging their
orthorexia.

missing-docstring is not advisable for libraries.  Feels okay here.

line-too-long might be worth cleaning up.  How many of them do we have
now?


