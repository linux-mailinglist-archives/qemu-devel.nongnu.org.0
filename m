Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2664C277
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 22:38:36 +0200 (CEST)
Received: from localhost ([::1]:41864 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdhLn-0004ri-RY
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 16:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40971)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <afaerber@suse.de>) id 1hdhEv-0008Fr-6n
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 16:31:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <afaerber@suse.de>) id 1hdhEt-00088n-NG
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 16:31:28 -0400
Received: from mx2.suse.de ([195.135.220.15]:57790 helo=mx1.suse.de)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <afaerber@suse.de>) id 1hdhEt-00085e-FG
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 16:31:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 790E9ADD4;
 Wed, 19 Jun 2019 20:31:23 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20190619201050.19040-1-armbru@redhat.com>
 <20190619201050.19040-2-armbru@redhat.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Openpgp: preference=signencrypt
Organization: SUSE Linux GmbH
Message-ID: <e0595422-c115-ca7f-9e3c-cfb69602d5e2@suse.de>
Date: Wed, 19 Jun 2019 22:31:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190619201050.19040-2-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic]
X-Received-From: 195.135.220.15
Subject: Re: [Qemu-devel] [PATCH 01/17] MAINTAINERS: new maintainers for QOM
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
Cc: kwolf@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.06.19 um 22:10 schrieb Markus Armbruster:
> From: Paolo Bonzini <pbonzini@redhat.com>
>=20
> QOM is not a particularly active subsystem now: 51 commits in two years=
.
> But, we need active maintainers to review and merge patches, and Git
> shows the following top committers taking on QOM:
>=20
>     Markus Armbruster <armbru@redhat.com>
>     Eduardo Habkost <ehabkost@redhat.com>
>     Paolo Bonzini <pbonzini@redhat.com>
>     Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>     Eric Blake <eblake@redhat.com>
>=20
> I volunteer myself, and also volunteer Eduardo and Daniel as reviewers
> since they understand the code well.
>=20
> Cc: Andreas F=C3=A4rber <afaerber@suse.de>
> Cc: Daniel P. Berrange <berrange@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Message-Id: <20190607113737.13473-1-pbonzini@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

I'm pretty sure I gave an Acked-by that's missing above?

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)

