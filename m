Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89804E7AC1
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 22:05:43 +0100 (CET)
Received: from localhost ([::1]:45346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXr7v-00030M-0V
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 17:05:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXr6H-0001ef-E7
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 17:04:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXr6G-0001pf-21
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 17:04:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648242239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a1nEg2s1JpMZgRybj+vP7KCMQeiDH7G/04xxOTLI0zk=;
 b=JG9gN/IlQH1CGoR9sZdj/dBxEw1FlDdlTlEuAPOHmZfRhDz3JhjLkq6mkIobkv6UeglKKc
 ONYKK7i+QoM7tClz3/7bnrQYJL9rXDVxUvMihJohDrNHXWcEOCXEvHmVqX1++HEfOyRVwh
 LU7BeG/F5oIbI4Ww7h6xNuvW6VBrzXc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-hQrG-IXSOtW8Nkoy9us-VA-1; Fri, 25 Mar 2022 17:03:57 -0400
X-MC-Unique: hQrG-IXSOtW8Nkoy9us-VA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCB613800A13
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 21:03:56 +0000 (UTC)
Received: from localhost (unknown [10.40.192.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 733BA40149AC;
 Fri, 25 Mar 2022 21:03:56 +0000 (UTC)
Date: Fri, 25 Mar 2022 22:03:55 +0100
From: Victor Toso <victortoso@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 06/14] qapi: fix example of MEMORY_DEVICE_SIZE_CHANGE event
Message-ID: <20220325210355.52bycw4vl2nvc5km@tapioca>
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-7-victortoso@redhat.com>
 <CAFn=p-Y3Jywf45CyaxwQ+SP6+_ToFJoZ1Lr=8tNQdNLQQaESCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bapmepwd74wy6oun"
Content-Disposition: inline
In-Reply-To: <CAFn=p-Y3Jywf45CyaxwQ+SP6+_ToFJoZ1Lr=8tNQdNLQQaESCg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--bapmepwd74wy6oun
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 24, 2022 at 04:57:00PM -0400, John Snow wrote:
> On Thu, Mar 24, 2022 at 1:50 PM Victor Toso <victortoso@redhat.com> wrote:
> >
> > * qom-path is not optional
> >
> > Signed-off-by: Victor Toso <victortoso@redhat.com>
> > ---
> >  qapi/machine.json | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/qapi/machine.json b/qapi/machine.json
> > index 42fc68403d..9c460ec450 100644
> > --- a/qapi/machine.json
> > +++ b/qapi/machine.json
> > @@ -1356,7 +1356,8 @@
> >  # Example:
> >  #
> >  # <- { "event": "MEMORY_DEVICE_SIZE_CHANGE",
> > -#      "data": { "id": "vm0", "size": 1073741824},
> > +#      "data": { "id": "vm0", "size": 1073741824,
> > +#                "qom-path": "/machine/unattached/device[2]" },
> >  #      "timestamp": { "seconds": 1588168529, "microseconds": 201316 } }
> >  #
> >  ##
> > --
> > 2.35.1
> >
>=20
> I'll just assume this is a realistic qom-path and not actually try to che=
ck =F0=9F=98=85

Copied from another example, so blame that one if it doesn't!

> Reviewed-by: John Snow <jsnow@redhat.com>

Cheers,

--bapmepwd74wy6oun
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmI+LjsACgkQl9kSPeN6
SE/ONxAAnXQWHso2rTY9Hv7nRjzLyO2AfboFZxpYf8a2UDlOwnJJZRBElkvocfV7
z2yz7WqXGaCZsCRfXBvnz9QzCplofZrTwGJf9Enuia6QgzQER0CuQLy2zJV6n19q
GdGAWnPYtAjxR9tnT0+6DxkFq+pkB8xZSDnM3oSnivGymNYCapunODC2/SBaGB3K
f1VPLx4ZInjya3MOFrEHLrKWfA7dhdJP7dg08zaWQMAismQ4KAN4gYkgOZrYOqV6
Yoy8gEA17tUIOm2ooNDHvYBYNEzXdPeNkTHRSmz15r1DoK7E/Jrs469/oX3yS4Ng
u8sGg+wiuqvMbt5KkQAjAzgAEJrUWisNxBrLEwFmjcIBtqTJ7cbiUxGNv2RIlwP1
OyBHYEURlAXE9NsZQKqAONy5K6TWt4+6wKAvf1ij4QkxpAtW8cYflQVzJlYQTZ8U
5M4GAd3sYo+xMSA1T2kx6D8hd4wKCtm+2GiZJjvjS3T+QtyrgECM7O14iytBGkKP
466RbR8HMOsd4ZUdSL5z2W0g9wn1MhAisHS4AFdEN7XMLq5s6B00mfL7TlW2J/mv
NjBSJ1ELE5HdsltQOqoDxANk5En2w9b+JwfNe8xiBc/wUUqBOmLZ8B+hLS6LsNN5
1kHqv81qcL0Z+O5pJAb8HnTceaBR3ovH5QZKwUBU/fVq14gxYWU=
=MjXA
-----END PGP SIGNATURE-----

--bapmepwd74wy6oun--


