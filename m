Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 184A35213C6
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 13:31:10 +0200 (CEST)
Received: from localhost ([::1]:44018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noO56-00036c-T8
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 07:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1noO2o-0000wb-ES
 for qemu-devel@nongnu.org; Tue, 10 May 2022 07:28:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1noO2m-0005Sv-7g
 for qemu-devel@nongnu.org; Tue, 10 May 2022 07:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652182123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x3zARQ6NDd2VXsl+j5VfUErRgvZ1hvU8OPH9ukCmRrc=;
 b=XK+s8hnK5PYzgLW3s0ljAMzCy6WdRVxXW/CZxWpwpTid20wQMpmOWW83BUBjAZgxtrGqX5
 nV2A3cFcTsZW8SwULdx3oruNoywEAn/hOGKvg33LehSLQRKG06cCa5MaUada18QZqQVPaj
 7IogYxRu4gLYrrcnAFc89VbIq75Hcxs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-dS_opjFePUKOnLbiEwolmg-1; Tue, 10 May 2022 07:28:41 -0400
X-MC-Unique: dS_opjFePUKOnLbiEwolmg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D5F6802803
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 11:28:41 +0000 (UTC)
Received: from localhost (unknown [10.40.193.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04B02432105;
 Tue, 10 May 2022 11:28:40 +0000 (UTC)
Date: Tue, 10 May 2022 13:28:39 +0200
From: Victor Toso <victortoso@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH v1 1/8] qapi: golang: Generate qapi's enum types in Go
Message-ID: <20220510112839.6cixyqovp2dciypv@tapioca>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <20220401224104.145961-2-victortoso@redhat.com>
 <Yno5GC8Fs3ypv7MQ@redhat.com>
 <20220510111532.tm5cyljsxxnvk7l2@tapioca>
 <YnpKXf4fynWupiVC@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ynbbz3eginm7bewu"
Content-Disposition: inline
In-Reply-To: <YnpKXf4fynWupiVC@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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


--ynbbz3eginm7bewu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 10, 2022 at 12:19:57PM +0100, Daniel P. Berrang=E9 wrote:
> > Marshalling does error if you try to convert an int that is not
> > in the range of the enum type.
> >=20
> > Unmarshalling should not error in this case, but the field ends
> > up not being set which defaults to 0 (in this case,
> > ShutdownCauseNone). That could mislead the *actual* reason but
> > not without a warning which is expected in this case, imho.
> >=20
> > (I know is not an actual warning, just a Println, but it'll be
> > fixed in the next iteration)
>=20
> I don't thinnk we should be emitting warnings/printlns at all
> in this case though. The app should be able to consume the enum
> without needing a warning.  If the app wants to validate
> against a specific set of constants, it can decide to emit a
> warning if there was a case it can't handle. We shouldn't emit
> warnings/errors in the unmarshalling step though,as it isn't
> the right place to decide on such policy.

I think it is useful to know that, a binary compiled to qapi-go
7.0 but running with qemu 7.1 would have some mismatches. It
could help detect issues (e.g: Why my program doesn't know/show
the reason for shutdown?).

So, some sort of --verbose option for this level should exist.

> >   | func (s *ShutdownCause) UnmarshalJSON(data []byte) error {
> >   |     var name string
> >   |
> >   |     if err :=3D json.Unmarshal(data, &name); err !=3D nil {
> >   |         return err
> >   |     }
> >   |
> >   |     switch name {
> >   |     case "none":
> >   |         (*s) =3D ShutdownCauseNone
> >   |     case "host-error":
> >   |         (*s) =3D ShutdownCauseHostError
> >   |     case "host-qmp-quit":
> >   |         (*s) =3D ShutdownCauseHostQmpQuit
> >   |     case "host-qmp-system-reset":
> >   |         (*s) =3D ShutdownCauseHostQmpSystemReset
> >   |     case "host-signal":
> >   |         (*s) =3D ShutdownCauseHostSignal
> >   |     case "host-ui":
> >   |         (*s) =3D ShutdownCauseHostUi
> >   |     case "guest-shutdown":
> >   |         (*s) =3D ShutdownCauseGuestShutdown
> >   |     case "guest-reset":
> >   |         (*s) =3D ShutdownCauseGuestReset
> >   |     case "guest-panic":
> >   |         (*s) =3D ShutdownCauseGuestPanic
> >   |     case "subsystem-reset":
> >   |         (*s) =3D ShutdownCauseSubsystemReset
> >   |     default:
> >   |         fmt.Println("Failed to decode ShutdownCause", *s)
> >   |     }
> >   |     return nil
> >   | }
> >=20
> > > If the enums were just represented as strings, then we can
> > > gracefully accept any new enum value that arrives in future.
> > > The application can thus also still log the shutdown reason
> > > string, even though it was not a value explicitly known to the
> > > generated API.
> >=20
> > As a string, the warning should still exist and default value of
> > "" or nil for ptr would apply. IMHO, between string + warning and
> > int + warning, I'd still go with int here.
> >=20
> > That's a design decision to be made. All in all, I don't know
> > much about the changes in QEMU/QAPI per version to take this
> > decision, so I'll rely on you and the list for this, not just for
> > enums but for the other types too.
>=20
> Essentially every release of QEMU will have QAPI changes. Most of
> the time these are append-only changes. ie a new struct, new command,
> new field, new enum value.  Sometimes there will be removals due
> to deprecation, though note my other reply saying that we really
> ought to stop doing removals from the schema, and instead just
> annotate when a field stops being used.

Ok, thanks.

Cheers,
Victor

--ynbbz3eginm7bewu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmJ6TGcACgkQl9kSPeN6
SE8X4g//c+zztu62agDkFDVnl7UeiAHmteqBvEZWcjkiR8ZheFip1rrKWBVveM13
AF3aFuh3YA+4N4mhW4sWbOs/Ob5v0thKoG+Q5X9tr4WQu+myCaOt3cBIwAZ7waoU
k/M6QqpIfpdPrxYFZTxCKN4GpnzntCsd4P6Cq5TmzvNT9buarSalYxZyO/1ba6//
Y+vozNorLd3gk2IuEKKleG/29vHuAY0SbefYs1h+3Lmc2NWxq7maz9Xj1EuqEv65
iCugFb1TyJoDlCsEVg6we5d7lcBpsUrKnvlAgAIUHeEIYxXLq9KgMfkAK0IdCb09
MXAb4hQpIN6MjwfR3egMcC1CUCOzS0BMr7sj7zpQgICpTRU/KOfOb1q6+uB3t2Tc
TM6dlrkKpVLxceI1InPaGkiM6kXmSg23vWaEbZqjeSEUIq8fspuRgT1Qg7jpl4uj
JHiML5mmz7GHnu4wsyN+VzunLpbtmMO18uSFkNjuAgsf5VXzNwtI8B7WfOTq8wNq
WFkdUxRbXJJzNsZnjusxeN3j/nXz6UoVC1J1WaUck4LRwqsgGAXjtT+GUwMN5LR2
eNg4XmVI2ekHlSi8w71/W0CgIJxkV5OLc7OdjUGJZQDmPzeoyIaQGwZ3aQpmEj8Y
c3sMi7OQKK6iokjNrBmvadYtDTq6zeJyc9IPMJLMF2+T8JxP1ng=
=3cLb
-----END PGP SIGNATURE-----

--ynbbz3eginm7bewu--


