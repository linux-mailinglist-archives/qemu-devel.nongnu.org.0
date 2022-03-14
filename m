Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA84B4D862E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:44:31 +0100 (CET)
Received: from localhost ([::1]:48946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTkzu-0006WK-PI
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:44:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nTkp1-0000Pr-7B
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:33:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nTkox-0000pT-Gn
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:33:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647264789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dwX4YuIkE+1lTOTsnpt2OvYEOu91usTxRwDIIKA69GM=;
 b=CDsPBnjJj8wB+jmBVnTtLzxJ+vmGBp6R7zMLG3wRm3Yt6DtFRhUIKZSjwd63hLw1HCfmze
 tBYlNZGp6HLTPnSUD1JN34prDM8UjNnIcxsSnciVfudCvm5I/yfsE8T5WyBpTOehx2F/u4
 lDApYqcX/iWSyZsvha8Mc6s5rfsbQZk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-mFPhYTIYPsaUvS6FE_-daw-1; Mon, 14 Mar 2022 09:33:05 -0400
X-MC-Unique: mFPhYTIYPsaUvS6FE_-daw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D61D51C01508;
 Mon, 14 Mar 2022 13:33:04 +0000 (UTC)
Received: from localhost (unknown [10.39.195.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DECA403144;
 Mon, 14 Mar 2022 13:33:04 +0000 (UTC)
Date: Mon, 14 Mar 2022 13:33:03 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: [PATCH v2 2/4] Introduce event-loop-base abstract class
Message-ID: <Yi9EDyZpOa4+6MG4@stefanha-x1.localdomain>
References: <20220303145822.518887-1-nsaenzju@redhat.com>
 <20220303145822.518887-3-nsaenzju@redhat.com>
 <YinSD8xxujd5lOSy@stefanha-x1.localdomain>
 <50ce51c3a8f84d53b64fba396b19e5a1d11b1e19.camel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hA7jK3PlKkyc5bMp"
Content-Disposition: inline
In-Reply-To: <50ce51c3a8f84d53b64fba396b19e5a1d11b1e19.camel@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, eduardo@habkost.net,
 hreitz@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--hA7jK3PlKkyc5bMp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 11, 2022 at 11:17:22AM +0100, Nicolas Saenz Julienne wrote:
> On Thu, 2022-03-10 at 10:25 +0000, Stefan Hajnoczi wrote:
> > On Thu, Mar 03, 2022 at 03:58:20PM +0100, Nicolas Saenz Julienne wrote:
> > > @@ -2935,13 +2947,6 @@ qemu_syms =3D custom_target('qemu.syms', outpu=
t: 'qemu.syms',
> > >                               capture: true,
> > >                               command: [undefsym, nm, '@INPUT@'])
> > > =20
> > > -qom_ss =3D qom_ss.apply(config_host, strict: false)
> > > -libqom =3D static_library('qom', qom_ss.sources() + genh,
> > > -                        dependencies: [qom_ss.dependencies()],
> > > -                        name_suffix: 'fa')
> > > -
> > > -qom =3D declare_dependency(link_whole: libqom)
> > > -
> >=20
> > Why was it necessary to move qom_ss and subdir('hw') up? Can
> > event_loop_base be defined down here instead?
>=20
> The way I setup it up, qemuutil now depdens on event_loop_base which in t=
urn
> depends on qom. IIUC I can't declare dependencies without declaring first=
 the
> libraries and source sets. All has to happen sequencially. With this in m=
ind,
> almost all libraries depend on libqemuutil so moving it down isn't possib=
le.

I see now. The qemuutil dependency on event_loop_base is introduced in
the next patch so the reason wasn't clear at this point in the patch
series.

Stefan

--hA7jK3PlKkyc5bMp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIvRA8ACgkQnKSrs4Gr
c8iGhQf/YtrIlnXwrNFXBp05OSg4nS6d0tIkS7dqmm38efQ0dFtpwQ+XWA9FiB+x
q7QSW5frXK6GTt1TrNE7pQ+Gxt06121f0ECPlnd8EiiCthy5SHPisqc8kiKcpHJ9
mbpn4ULE5ybD8Fp3pbqSECXE9+HhB11THo1XxskurxGfxDtleFsFYXmYPKza60Qa
sHEQwDHMjA7Xe68yQ/INdpGKjUgaEfiNTuzJOKWWkEk3YdV1C9c18z5GD1rRHXjM
ML9VroE/Nz8KsHU3niwJBhDyyoaDdCOoYfvX1++ompnvGK3D27NEZm6wxCqWPoGP
5mfe2vEnUNIKs7MZvFmxPdEFidHYSQ==
=Df8y
-----END PGP SIGNATURE-----

--hA7jK3PlKkyc5bMp--


