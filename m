Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C05A01422E4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 06:47:21 +0100 (CET)
Received: from localhost ([::1]:58742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itPuC-0003b8-Pz
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 00:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34339)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1itPtF-00039i-7R
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 00:46:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1itPtD-0003Uv-23
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 00:46:20 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:42460
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1itPtA-0003T0-3Q
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 00:46:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579499174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=RUeMIhdi4Q2p+JSHkh+1wcF33hrEna5jg2cQUOW1m9E=;
 b=Zdkr5pMoF5tmusM52QaM3UzA5rwxLitpsuNe0+duoEwGmFbBIgFM+zaFHcoIRr5RCIicx4
 nJZw90ShP4Wbu5p//ad7rkoSxtThFldKhzC6LLygXKiLxbCc7lAm1HBTIfjHA5mVNu8gQ6
 UR/gggtakmAD7S6ROMK5xcyzfbVqzHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-Eje9onARP3e4TyzWckXJ5Q-1; Mon, 20 Jan 2020 00:46:12 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE7C5108442C;
 Mon, 20 Jan 2020 05:46:11 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-99.ams2.redhat.com [10.36.116.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 275C184790;
 Mon, 20 Jan 2020 05:46:01 +0000 (UTC)
Subject: [Qemu-devel] Xenial in Travis (was: qapi: Fix code generation with
 Python 3.5)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200116202558.31473-1-armbru@redhat.com>
 <3fb3e411-c5de-fbc1-684b-c7fb1ce2ea7d@redhat.com>
 <875zhapnlt.fsf@dusky.pond.sub.org>
 <a6ea59a5-0877-fdeb-5b37-9ec3f31074a4@redhat.com>
 <dc9826a5-63a8-9529-838b-aec2fbb66ea6@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <ccbe1f43-f3ba-167e-1f42-bb79ecdcacbb@redhat.com>
Date: Mon, 20 Jan 2020 06:46:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <dc9826a5-63a8-9529-838b-aec2fbb66ea6@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: Eje9onARP3e4TyzWckXJ5Q-1
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
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 mdroth@linux.vnet.ibm.com, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <cleber@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/01/2020 09.29, Philippe Mathieu-Daud=C3=A9 wrote:
[...]
> This broke 29 of the 32 Travis jobs we have:
>=20
> https://travis-ci.org/qemu/qemu/builds/637999366
>=20
> Since we started to use Travis CI, it catched quite some bugs...
>=20
> I think it is important to add in the equation we also depend of our CIs.

Thinking about the state of our Travis CI ... The Travis CI jobs that
broke are still running Ubuntu Xenial (v16.04). According to our support
policy, we will stop supporting Xenial two years after v18.04 LTS has
been released, i.e. in April this year. So we have to update our Travis
CI jobs to a newer version with a newer Python very soon anyway - the
question is here only whether we update to v18.04 (with the broken
libssh version that we don't support in QEMU), or rather directly to
v20.04 (which might take a while 'till it shows up as an option in
Travis)...

 Thomas


