Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0791129D0
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 12:03:31 +0100 (CET)
Received: from localhost ([::1]:36756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icSRM-0008Mh-JM
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 06:03:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57423)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1icREL-0002W7-A0
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:45:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1icREB-0003MU-UZ
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:45:53 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40737
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1icREB-00037U-Aw
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575452743;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z6NK+TzWGdR+0z0PjiusZJGK79qnvznigg62JRM7/DI=;
 b=P1ONSjKx/QeXrJ9IzvZoX8EpoNSS9OrhbjP0lUJS/IEA3e/YZbGA0xrMnWsFTvC9+EHgDA
 u0gh1tg/CW1ZzX9jZPK4NClqJHXkppgzhqNP2RGFEy+fOnsVgbLMzXTfR9Iax9pQD5tbJj
 UB5Y21olrn7ZXNLOxroqncEb9mBrTlY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-1rHVEPwePzG4W_AGP13LwA-1; Wed, 04 Dec 2019 04:45:42 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48F19107ACCC
 for <qemu-devel@nongnu.org>; Wed,  4 Dec 2019 09:45:41 +0000 (UTC)
Received: from redhat.com (ovpn-112-55.ams2.redhat.com [10.36.112.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D1BC5DA76;
 Wed,  4 Dec 2019 09:45:40 +0000 (UTC)
Date: Wed, 4 Dec 2019 09:45:37 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 03/18] io: Fix Error usage in a comment <example>
Message-ID: <20191204094537.GC785462@redhat.com>
References: <20191204093625.14836-1-armbru@redhat.com>
 <20191204093625.14836-4-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191204093625.14836-4-armbru@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 1rHVEPwePzG4W_AGP13LwA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 04, 2019 at 10:36:10AM +0100, Markus Armbruster wrote:
> Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/io/task.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


