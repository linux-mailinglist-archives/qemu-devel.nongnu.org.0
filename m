Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A77C17347E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 10:48:12 +0100 (CET)
Received: from localhost ([::1]:44426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7cFf-0001gC-Fd
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 04:48:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53340)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1j7cEh-00018c-Ll
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 04:47:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1j7cEg-00089p-HE
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 04:47:11 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:43450
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1j7cEg-00089Y-Di
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 04:47:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582883230;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9zcHGnT+0ej7x7ymTp0/o65Dkz8UctCjtp7boL5bY7k=;
 b=Yuna1X4h7mMG32zzON59YSHBLx1OnOuCaykgTgKe50yRFLJLEnvUlb7W46s5lsGxZCfiJj
 C7XYRdc8YaOiux7zeYo2XArdgn9O7uu/8Hjqv6Mr1ektyqUwPJL3mN1lheWqX6LufJFc+P
 aOKxRpFWQQbZ9bhugGOtgAlZPTYYL4Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-OU2dA_BfNHqnSc5oqScfFQ-1; Fri, 28 Feb 2020 04:47:01 -0500
X-MC-Unique: OU2dA_BfNHqnSc5oqScfFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAB38DB61;
 Fri, 28 Feb 2020 09:46:59 +0000 (UTC)
Received: from redhat.com (unknown [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3070C6E3EE;
 Fri, 28 Feb 2020 09:46:54 +0000 (UTC)
Date: Fri, 28 Feb 2020 09:46:52 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] qom/object: Comment to use g_slist_free on
 object_class_get_list result
Message-ID: <20200228094652.GB1657361@redhat.com>
References: <20200227190942.8834-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200227190942.8834-1-philmd@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 Pan Nengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 27, 2020 at 08:09:42PM +0100, Philippe Mathieu-Daud=C3=A9 wrote=
:
> Document the list returned by object_class_get_list() must be
> released with g_slist_free() to avoid memory leaks.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/qom/object.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/include/qom/object.h b/include/qom/object.h
> index 29546496c1..5517b56508 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -984,6 +984,9 @@ void object_class_foreach(void (*fn)(ObjectClass *kla=
ss, void *opaque),
>   * @include_abstract: Whether to include abstract classes.
>   *
>   * Returns: A singly-linked list of the classes in reverse hashtable ord=
er.
> + *
> + * The returned list must be released with g_slist_free()
> + * when no longer required.

I'd suggest

  "The returned list, but not its elements, must be released with
   g_slist_free() or g_autoptr when no longer required"

>   */
>  GSList *object_class_get_list(const char *implements_type,
>                                bool include_abstract);
> @@ -995,6 +998,9 @@ GSList *object_class_get_list(const char *implements_=
type,
>   *
>   * Returns: A singly-linked list of the classes in alphabetical
>   * case-insensitive order.
> + *
> + * The returned list must be released with g_slist_free()
> + * when no longer required.
>   */
>  GSList *object_class_get_list_sorted(const char *implements_type,
>                                bool include_abstract);
> --=20
> 2.21.1
>=20
>=20

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


