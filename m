Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A8D1129A6
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 11:56:51 +0100 (CET)
Received: from localhost ([::1]:36738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icSKs-0006MT-QD
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 05:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56766)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1icRG7-0002Mz-65
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:47:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1icRDw-0002ex-9m
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:45:35 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48462
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1icRDv-0002Uv-VK
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:45:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575452725;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1k47op3h9nADE9XzmjPwkej6OOpZrwHzR2XkAqlvbww=;
 b=J+S6sTOZE6q09pxNraL+IPZTT0gEevDULT01KVW62OBqtxWpaPc0CZ2A+/wxtqVwlIgAej
 jcKFCUhAgbwxGT5P4pL7Hib5biweXyLQQAoY39AUTS7/3QEYuq9XctwRu5s5cVUYwWOFQW
 oYAJj5LJwdfWpu/Xf8zkFJ1m6Gizp+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-7HjpTIQeO_2XljaSjoV8hQ-1; Wed, 04 Dec 2019 04:45:24 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E6968C80F3
 for <qemu-devel@nongnu.org>; Wed,  4 Dec 2019 09:45:23 +0000 (UTC)
Received: from redhat.com (ovpn-112-55.ams2.redhat.com [10.36.112.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F1A610246E3;
 Wed,  4 Dec 2019 09:45:22 +0000 (UTC)
Date: Wed, 4 Dec 2019 09:45:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 02/18] crypto: Fix typo in QCryptoTLSSession's
 <example> comment
Message-ID: <20191204094519.GB785462@redhat.com>
References: <20191204093625.14836-1-armbru@redhat.com>
 <20191204093625.14836-3-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191204093625.14836-3-armbru@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 7HjpTIQeO_2XljaSjoV8hQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 04, 2019 at 10:36:09AM +0100, Markus Armbruster wrote:
> Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/crypto/tlssession.h | 2 +-
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


