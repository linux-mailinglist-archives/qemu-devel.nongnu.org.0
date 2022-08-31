Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C31B5A7DCD
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 14:47:18 +0200 (CEST)
Received: from localhost ([::1]:48554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTN7l-0001tO-8x
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 08:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTN5w-0000Vb-Ds
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 08:45:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTN5s-00089Y-Qt
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 08:45:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661949918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SUUcIbOUAoVMyiF6zUC03ZbBwkmgUPL2hvb0IxSxGcE=;
 b=KBu7P7OrS/R9eb5UjkIhFsMmCXpWxRd09x4RGekQC9wW1kLU17TkxTuVWs+kjf06Y/zPoT
 oK0u23UKTPbcOHggvDKhSHZdOkrYhRmuA0bXesFfWJfHHAke3xgRo5pMHITsEcgVCRmW9P
 MuJZZAqOMb+k1mTTOTji1HD0SDRct9I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-bB29gTk2MkiIfbd_EV0eWQ-1; Wed, 31 Aug 2022 08:45:14 -0400
X-MC-Unique: bB29gTk2MkiIfbd_EV0eWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B59A296A60D;
 Wed, 31 Aug 2022 12:45:14 +0000 (UTC)
Received: from localhost (unknown [10.40.195.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 131C92026D4C;
 Wed, 31 Aug 2022 12:45:13 +0000 (UTC)
Date: Wed, 31 Aug 2022 14:45:12 +0200
From: Victor Toso <victortoso@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v1 12/16] qapi: fix example of blockdev-add command
Message-ID: <20220831124512.ngotphuwnsx6pyqn@tapioca>
References: <20220830161545.84198-1-victortoso@redhat.com>
 <20220830161545.84198-13-victortoso@redhat.com>
 <87zgfkabel.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jbiz4tjwp4zacjub"
Content-Disposition: inline
In-Reply-To: <87zgfkabel.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jbiz4tjwp4zacjub
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 31, 2022 at 01:40:50PM +0200, Markus Armbruster wrote:
> Victor Toso <victortoso@redhat.com> writes:
>
> > The example output is setting optional member "backing" with null.
> > This has no runtime impact. Remove it.
> >
> > Problem was noticed when using the example as a test case for Go
> > bindings.
>
> "Fix example" and "problem" implies there's something wrong.
> "No runtime impact" sounds like it's redundant, but not wrong.
> Wrong or not wrong?

I take your comment is more about the wording which is confusing.

Would it be better if I change to:
'''
   The example output is setting optional member "backing" with
   null. While this has no runtime impact, setting optional
   members with empty value should not be encouraged. Remove it.
'''

While I think the above is true, my main reason for proposing
this change is to re-use the example as a test case, but I'm not
sure if adding anything related to it would make it better (only
more confusing!).

Cheers,
Victor

> > Signed-off-by: Victor Toso <victortoso@redhat.com>
> > ---
> >  qapi/block-core.json | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/qapi/block-core.json b/qapi/block-core.json
> > index dcc6d41494..302164d575 100644
> > --- a/qapi/block-core.json
> > +++ b/qapi/block-core.json
> > @@ -1542,9 +1542,7 @@
> >  #      "arguments": { "driver": "qcow2",
> >  #                     "node-name": "node1534",
> >  #                     "data-file": { "driver": "file",
> > -#                                    "filename": "hd1.qcow2" },
> > -#                     "backing": null } }
> > -#
> > +#                                    "filename": "hd1.qcow2" } } }
> >  # <- { "return": {} }
> >  #
> >  # -> { "execute": "blockdev-snapshot",
>=20

--jbiz4tjwp4zacjub
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmMPV9gACgkQl9kSPeN6
SE9VBw/+PdoVzRS7NPL0SSgBLpwLA6fvZNEXTJf9hVNwlJzd1l7lV6ksI6cx9BZF
W440MCtVB/Z0BtYfq3sQDABMMwvM/TfyX+KntsubbHk9+XvUxPODDZyINHNtbfqR
uglQ7KBnfBQNy/ZYYdfW7IYOtxTdtQJp1QXfEM+ig5Vqe1tlHBFSIVQA2P8X8DLU
BCt1Nehhu6TdC4JxU8m7/3UGsM11tltWgEFyV0PXp/X/p7mKWf+NOQBrjmP3gge7
dq7/FcpKGI4mLqdIsNcDtfE+O+FxNO3dj+OhEGV1q7zzG7hIADrjP3YiVLlHbH1Z
rfrT+27xBIW8+l67f6HINy3ihnCfhlNegRcEtzyz0lXGopKp00Mf5A3uw5XhKDL5
Y1/nJ0bcJm1nAFwgaDXETXQc60aHkYSI/eCa8u5dpADqYIsAOQUC9PIMcPYW3lQ3
QrMpO8B/fJS8mIMRtRVEFHeifayVVCqbR1wT7I1UKz1dlEUtWml3Iq+3YmlhfySr
wTnvvZeI6NT+m8iKQyiiyOemy5qVEf/r2tQdAn4N/taqIQALaGwyRpb4rdwchO15
m+jL/n4J/ihdlWBEzdQhSpcbAtySwOdXc8+x8jHfwhEjfmuJQKQtO1bqAS30XEby
ENxyek4vgXCBd1N6Pr0MNn9tGClM5UrzB0DFRHPnFODjWC9rGs4=
=6NEl
-----END PGP SIGNATURE-----

--jbiz4tjwp4zacjub--


