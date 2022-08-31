Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1B85A7E2F
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 15:01:52 +0200 (CEST)
Received: from localhost ([::1]:58016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTNLr-0007mU-BC
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 09:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTNFQ-0008Cd-Qq
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 08:55:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTNFO-0001X0-0Y
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 08:55:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661950508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l+Wi8MFIKiSgFZ88HL6nSZ9hxi9MpQujPjvAffmbgTE=;
 b=Cdb196kgPE7fbaqtOMXM/J1cXXvvV+hdot0fva6yGszNYIRQTgF9mg6oL34Ia6SFxDEJ+E
 dxMsiFMltbbF/CUr3nwOXArDKFUVfPjZBzcYWue6EMFcTEmLkf7MnYz81qeY/N0VVJr6bq
 +N1c/nu575SnzKnO7xyB/3Z2QiqGQbI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-24wkEIw5MwO_dcI1jLt-Og-1; Wed, 31 Aug 2022 08:55:06 -0400
X-MC-Unique: 24wkEIw5MwO_dcI1jLt-Og-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 863F5101A54E;
 Wed, 31 Aug 2022 12:55:06 +0000 (UTC)
Received: from localhost (unknown [10.40.195.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BCB9909FF;
 Wed, 31 Aug 2022 12:55:06 +0000 (UTC)
Date: Wed, 31 Aug 2022 14:55:05 +0200
From: Victor Toso <victortoso@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v1 03/16] qapi: fix example of query-spice command
Message-ID: <20220831125505.ezjevpomvsns7db7@tapioca>
References: <20220830161545.84198-1-victortoso@redhat.com>
 <20220830161545.84198-4-victortoso@redhat.com>
 <87sflcaayg.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a3yc56idd2awvrha"
Content-Disposition: inline
In-Reply-To: <87sflcaayg.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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


--a3yc56idd2awvrha
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Aug 31, 2022 at 01:50:31PM +0200, Markus Armbruster wrote:
> Victor Toso <victortoso@redhat.com> writes:
>
> > Example output has an extra ',' delimiter and a foreign comment
> > format. Fix it.
> >
> > Problem was noticed when trying to load the example into python's json
> > library.
> >
> > Signed-off-by: Victor Toso <victortoso@redhat.com>
> > ---
> >  qapi/ui.json | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/qapi/ui.json b/qapi/ui.json
> > index 286c5731d1..901b84da8a 100644
> > --- a/qapi/ui.json
> > +++ b/qapi/ui.json
> > @@ -356,8 +356,7 @@
> >  #                "host": "127.0.0.1",
> >  #                "channel-id": 0,
> >  #                "tls": false
> > -#             },
> > -#             [ ... more channels follow ... ]
> > +#             }
> >  #          ]
> >  #       }
> >  #    }
>
> Hmm.  You're removing an ellipsis Gerd put there for a reason,
> I presume (commit cb42a870c3 "spice: add qmp 'query-spice' and
> hmp 'info spice' commands.")

I guess the reason is just that we get a too big array of
SpiceChannels so the example output would be big but not
interesting.

> Even if we can do without it here, We may still want a way to
> abridge examples.  Thoughts?

I just want something that can be a valid QMP message so we can
transform JSON to a specific language type and then back to QMP
message and compare that both matches.

I don't think that, for the purpose of query-spice documentation
it is worth to have a very similar but with 10 or more entries of
array of channels. So, I'd say it is fine to simply cut it here.
If we have a reason to put it out a 100% valid message, well, we
would have that reason to back it up... but I don't have one.

Cheers,
Victor

--a3yc56idd2awvrha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmMPWikACgkQl9kSPeN6
SE/SZg/6A/iy+Eao7VP0Ny+FXkupHVMF4xSe6tREYM1MGconisFYpzal78aBGMSf
b7j1Z6RJvIrqgjjNb9kg7M0IbvNz55jt9btTZIlY51I8w2QAn8NeXDmRWYo+tNge
3AcQrWIBG3extr00/ss8hHwFckhIIZiSoMY6K8WzBQEEUPh6EDfELc+UqpGeiRR1
QHmSGMM+FRkDrEs/tXiexljRynKloPqWdcj2kImnqbYi090GPsM2Blej5Lhv7F5d
5wKW6LnEmDwma3dI48m4jCns9ln0su7oN1DEAIzC5GLaw6Kx+IJ1Rj0/JSBU8JNc
h9GMbVWmzMP0xkDstqEBd6WM1r2Sxzf0xto6IYsJGHtR2ewTYGPQLjZqEdWW+OjQ
rZQzSMGWRH77gImwOscrh0pX+J2n+OsbK0fYr/KU0m3AtSkdcMDsU2uGspETrOkv
EgyY/q6yFGqO2qV/D/4HnA42OLygDp10o46+YJB4IdE7jATtmNqtlGujH/etgCpD
G3rpQS9owRGfLjNgEZG9bBGt+q6Nowc5NMi017aLJOV3v5w1WXJLGSmCcFpf3Yf9
VSjhU/tHySMT792eHXLEr8qUKn/DIfG+ACgYBpvlBy1EkYENI6T8ta/P4hTo6Oho
XuPXdxxaRc+69AiLA0serJt9FfruZVNDYR+dlrqxLanNPUwb3Hk=
=q+E+
-----END PGP SIGNATURE-----

--a3yc56idd2awvrha--


