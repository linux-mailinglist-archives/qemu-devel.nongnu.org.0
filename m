Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5967014D7E3
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 09:43:08 +0100 (CET)
Received: from localhost ([::1]:57292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ix5Pn-0007b8-Ex
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 03:43:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34418)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ix5Ol-0006lh-O0
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 03:42:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ix5Oj-0007ve-Px
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 03:42:02 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:37481
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ix5Oj-0007tu-FR
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 03:42:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580373720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=KSvVNt5BaR9o7hhJ9QtzBrN36fVpgqwFRFl2ocUGJos=;
 b=UjELnJlI0EtmCajFRZPn8L7MqyR2zG/xh8ZnwUAauUQOiuaA3bZghhvNaDIywLyDUJUpRx
 yymt0fw/zHrh1TUR0M9EM2PkmoFKYO8kZF8P+wb5D/kwTfj6S5U2HP/rY3b0/hc2NDfVzF
 O7Y9iVdKl9Y2TJZtz8yPN52ZbL4/CAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-PkuTxoHsM6-qf3vP4R0v8A-1; Thu, 30 Jan 2020 03:41:59 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D42710052E8;
 Thu, 30 Jan 2020 08:41:58 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-117-117.ams2.redhat.com [10.36.117.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 502A71036B22;
 Thu, 30 Jan 2020 08:41:51 +0000 (UTC)
Subject: Re: [PATCH v2 29/29] MAINTAINERS: Add Acceptance tests reviewers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Denis Plotnikov <dplotnikov@virtuozzo.com>, qemu-devel@nongnu.org
References: <20200129212345.20547-1-philmd@redhat.com>
 <20200129212345.20547-30-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <0eda4471-7daa-c578-dbac-54817d1f40b1@redhat.com>
Date: Thu, 30 Jan 2020 09:41:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200129212345.20547-30-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: PkuTxoHsM6-qf3vP4R0v8A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/01/2020 22.23, Philippe Mathieu-Daud=C3=A9 wrote:
> Acceptance tests can test any piece of the QEMU codebase.
> As such, the directory holding them does not belong to a specific
> subsystem with designated maintainers.
>=20
> Each subsystem covered by a test is welcomed to add the test path
> to its section.
> See for example commits 71b290e70, b11785ca2 or 5d480ddde.
>=20
> Since Eduardo, Cleber and Philippe have been reviewing the patches
> on the list, add them as reviewers.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Wainer do you want to be listed?
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index efd3f3875f..4a3cc3f137 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2733,6 +2733,12 @@ S: Maintained
>  F: tests/tcg/Makefile
>  F: tests/tcg/Makefile.include
> =20
> +Acceptance Tests
> +R: Eduardo Habkost <ehabkost@redhat.com>
> +R: Cleber Rosa <crosa@redhat.com>
> +R: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> +F: tests/acceptance/

Many files under tests/acceptance/ are not covered by a maintainer at
all, e.g.:

 $ scripts/get_maintainer.pl -f tests/acceptance/boot_linux_console.py
 get_maintainer.pl: No maintainers found, printing recent contributors.

... so I think it would be good to have someone who feels at least a
little bit responsible to do the maintainers work here and picks up
patches to put them into a pull request. Any volunteers?

 Thomas


