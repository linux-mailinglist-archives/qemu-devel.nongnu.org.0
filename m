Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD00A210421
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 08:45:57 +0200 (CEST)
Received: from localhost ([::1]:48636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqWVI-0001dU-Mq
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 02:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jqWUX-0001CQ-R1
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 02:45:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25185
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jqWUV-0004Kw-Do
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 02:45:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593585906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UwEwF8FOhDSYnx4tI16qzKRrR8llFoAvfFCTo2+Vgs0=;
 b=DC+jo7C7wun+RNbTTjpsAIfRMfXbb8Fet6EA4IEUKxe5ZE7vVDC4gT7D+d9WYBKSIzpRaE
 ktWK7IV/ZbGX4GVos9ss+LlmfuRbK/trxs7dihpz0eZ0RsfSlbZ/hrDpnIPzALVNvC9Mzf
 DQrpfg9laDRstZENgOLnWUj27ls++LA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484--ETGEKRpNt6rZqzogRGeIA-1; Wed, 01 Jul 2020 02:45:02 -0400
X-MC-Unique: -ETGEKRpNt6rZqzogRGeIA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EA8D80183C;
 Wed,  1 Jul 2020 06:45:00 +0000 (UTC)
Received: from localhost (ovpn-113-121.ams2.redhat.com [10.36.113.121])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29516100164D;
 Wed,  1 Jul 2020 06:44:53 +0000 (UTC)
Date: Wed, 1 Jul 2020 07:44:52 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: elena.ufimtseva@oracle.com
Subject: Re: [PATCH v7 08/21] multi-process: Initialize communication channel
 at the remote end
Message-ID: <20200701064452.GA126613@stefanha-x1.localdomain>
References: <cover.1593273671.git.elena.ufimtseva@oracle.com>
 <f908ad44bec708a20f9367e2f79f529f3a672f0f.1593273671.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <f908ad44bec708a20f9367e2f79f529f3a672f0f.1593273671.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 22:25:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: fam@euphon.net, john.g.johnson@oracle.com, swapnil.ingle@nutanix.com,
 mst@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, armbru@redhat.com, kanth.ghatraju@oracle.com,
 felipe@nutanix.com, thuth@redhat.com, ehabkost@redhat.com,
 konrad.wilk@oracle.com, dgilbert@redhat.com, liran.alon@oracle.com,
 thanos.makatos@nutanix.com, rth@twiddle.net, kwolf@redhat.com,
 berrange@redhat.com, mreitz@redhat.com, ross.lagerwall@citrix.com,
 marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 27, 2020 at 10:09:30AM -0700, elena.ufimtseva@oracle.com wrote:
> @@ -42,6 +43,20 @@ static void remote_machine_init(MachineState *machine)
>      qdev_realize(DEVICE(rem_host), sysbus_get_default(), &error_fatal);
>  }
> =20
> +static void remote_set_socket(Object *obj, const char *str, Error **errp=
)
> +{
> +    RemMachineState *s =3D REMOTE_MACHINE(obj);
> +    Error *local_err =3D NULL;
> +    int fd =3D atoi(str);
> +
> +    s->ioc =3D qio_channel_new_fd(fd, &local_err);

Missing error handling and local_err is leaked. errp should be set.

> +}
> +
> +static void remote_instance_init(Object *obj)
> +{
> +    object_property_add_str(obj, "socket", NULL, remote_set_socket);
> +}

The name "socket" does not communicate the structure of the value. Is it
a <host>:<port> pair, a UNIX domain socket path, a file descriptor, etc?
It's common to name file descriptor arguments with an "fd" suffix (e.g.
vhostfd) and that would work here too.

Please also include a help string with

  object_property_set_description(obj, property_name, help_text);

The help string when QEMU is invoked like this:

  $ qemu-system-x86_64 -M remote,\?

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl78MOQACgkQnKSrs4Gr
c8jfIAf6A844b35Yde+R/FpM3kTRoySt5+rcF+2nYuEcUvaFSCPVRyXMlGu772D7
CvLuMbkKMKJ9MxZTo1KiQwdrIowsL2j/LBEppNfz2iUEo9ayVZpSq7AgJMJbqo6L
6FOJqMGMupm9jQq+R706IMhNxEtJ+HHylxaxIoZThcTlIv6qseDHQ0yUl7KE4cw2
m8G2w7MM0YB7jXaDt+0gEWXIQ9dweC/G3KkrTkHO7XHv3fgoeQI/CuaQ8Msi9qHS
0qFgwMYBVfeViVCBxkoM/GA3kQ5muG0Ad7P4CbiZ6FDoU4q7wOqFxIuZrFs98Ull
BtsxrJg0BBIqgP3Wdx+2fHdS5GpzKA==
=ZSmb
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--


