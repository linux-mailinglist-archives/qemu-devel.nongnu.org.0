Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 9197138A68
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 14:33:57 +0200 (CEST)
Received: from localhost ([::1]:50044 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZE4C-0004Ea-KG
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 08:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47659)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <afaerber@suse.de>) id 1hZE0E-0002zD-GQ
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 08:29:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <afaerber@suse.de>) id 1hZE0D-0006FH-C7
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 08:29:50 -0400
Received: from mx2.suse.de ([195.135.220.15]:57272 helo=mx1.suse.de)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <afaerber@suse.de>) id 1hZE0D-0006AS-63
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 08:29:49 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 92025AC8D;
 Fri,  7 Jun 2019 12:29:46 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20190607113737.13473-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Openpgp: preference=signencrypt
Organization: SUSE Linux GmbH
Message-ID: <f18cb164-d742-04c3-37b6-ba10f72bcd0c@suse.de>
Date: Fri, 7 Jun 2019 14:29:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190607113737.13473-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic]
X-Received-From: 195.135.220.15
Subject: Re: [Qemu-devel] [PATCH] MAINTAINERS: new maintainers for QOM
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.06.19 um 13:37 schrieb Paolo Bonzini:
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
> ---
>  MAINTAINERS | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a96829ea83..c5862db154 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2031,9 +2031,10 @@ F: docs/interop/qemu-ga-ref.texi
>  T: git https://github.com/mdroth/qemu.git qga
> =20
>  QOM
> -M: Andreas F=C3=A4rber <afaerber@suse.de>
> +M: Paolo Bonzini <pbonzini@redhat.com>
> +R: Daniel P. Berrange <berrange@redhat.com>
> +R: Eduardo Habkost <ehabkost@redhat.com>

Thanks for volunteering,

Acked-by: Andreas F=C3=A4rber <afaerber@suse.de>

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)

