Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D68521393
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 13:21:02 +0200 (CEST)
Received: from localhost ([::1]:58770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noNvJ-0001an-75
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 07:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1noNq8-0000cq-Rd
 for qemu-devel@nongnu.org; Tue, 10 May 2022 07:15:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1noNq5-0003Te-Md
 for qemu-devel@nongnu.org; Tue, 10 May 2022 07:15:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652181335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ExjekixSaSYqWbx7YDGIbcunj8iYrUc4U2I5n470o2A=;
 b=HHDu0m03EiPebrOe/i1d2v3VXWAa/m+NKja+eiRAjT6i2Yx1MRc2PUqrXwjUjaf0NaNgc1
 TnxBKrAy4gdqSgkAKrBUsX8y1DGA73Kd98M9oYd4l2ojK2UdQ9Yqhy/27oIlTMh8WVgqsM
 Rt+FtfS9DouRjv1vnm0LjLBSbDZRZpM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-trt-d_mpPluM0PcOl4ns4g-1; Tue, 10 May 2022 07:15:34 -0400
X-MC-Unique: trt-d_mpPluM0PcOl4ns4g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F02403C92FC3
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 11:15:33 +0000 (UTC)
Received: from localhost (unknown [10.40.193.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C838463E0A;
 Tue, 10 May 2022 11:15:33 +0000 (UTC)
Date: Tue, 10 May 2022 13:15:32 +0200
From: Victor Toso <victortoso@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH v1 1/8] qapi: golang: Generate qapi's enum types in Go
Message-ID: <20220510111532.tm5cyljsxxnvk7l2@tapioca>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <20220401224104.145961-2-victortoso@redhat.com>
 <Yno5GC8Fs3ypv7MQ@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w57sxfp5342dkhcy"
Content-Disposition: inline
In-Reply-To: <Yno5GC8Fs3ypv7MQ@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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


--w57sxfp5342dkhcy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 10, 2022 at 11:06:16AM +0100, Daniel P. Berrang=E9 wrote:
> On Sat, Apr 02, 2022 at 12:40:57AM +0200, Victor Toso wrote:
> > This patch handles QAPI enum types and generates its equivalent in Go.
> >=20
> > The highlights of this implementation are:
> >=20
> > 1. For each QAPI enum, we will define an int32 type in Go to be the
> >    assigned type of this specific enum
>=20
> I think there's a potential case to be made for considering
> representation of enums as strings in Golang, as it more
> gracefully degrades.
>=20
> Consider the 'SHUTDOWN' event in QEMU, which has a 'reason' field.
>=20
> This implementation has
>=20
> type ShutdownCause int32
>=20
> const (
>         ShutdownCauseNone               ShutdownCause =3D iota
>         ShutdownCauseHostError                        // An error prevent=
s further use of guest
>         ShutdownCauseHostQmpQuit                      // Reaction to the =
QMP command 'quit'
>         ShutdownCauseHostQmpSystemReset               // Reaction to the =
QMP command 'system_reset'
>         ShutdownCauseHostSignal                       // Reaction to a si=
gnal, such as SIGINT
>         ShutdownCauseHostUi                           // Reaction to a UI=
 event, like window close
>         ShutdownCauseGuestShutdown                    // Guest shutdown/s=
uspend request, via ACPI or other hardware-specific means
>         ShutdownCauseGuestReset                       // Guest reset requ=
est, and command line turns that into a shutdown
>         ShutdownCauseGuestPanic                       // Guest panicked, =
and command line turns that into a shutdown
>         ShutdownCauseSubsystemReset                   // Partial guest re=
set that does not trigger QMP events and ignores --no-reboot. This is usefu=
l for sanitizing hypercalls on s390 that are used during kexec/kdump/boot
> )
>=20
> and
>=20
> type ShutdownEvent struct {
>         Guest  bool          `json:"guest"`  // If true, the shutdown was=
 triggered by a guest request (such as a guest-initiated ACPI shutdown requ=
est or other hardware-specific action) rather than a host request (such as =
sending qemu a SIGINT). (since 2.10)
>         Reason ShutdownCause `json:"reason"` // The @ShutdownCause which =
resulted in the SHUTDOWN. (since 4.0)
> }
>=20
> Consider that the application is compiled against the QAPI
> generated API from QEMU 7.0. The application is believed to run
> happily against 7.1, because app doesn't need any of the
> functionality added in 7.1 QAPI.  But consider that QEMU 7.1
> had introduced a new shutdown reason value.
>=20
> The application may want to know that the guest has shutdown,
> but does NOT care about the reason for the shutdown.
>=20
> Since the ShutdownReason is implemented as an int though, the
> unmarshalling for the reason field is going to fail.

Marshalling does error if you try to convert an int that is not
in the range of the enum type.

Unmarshalling should not error in this case, but the field ends
up not being set which defaults to 0 (in this case,
ShutdownCauseNone). That could mislead the *actual* reason but
not without a warning which is expected in this case, imho.

(I know is not an actual warning, just a Println, but it'll be
fixed in the next iteration)

  | func (s *ShutdownCause) UnmarshalJSON(data []byte) error {
  |     var name string
  |
  |     if err :=3D json.Unmarshal(data, &name); err !=3D nil {
  |         return err
  |     }
  |
  |     switch name {
  |     case "none":
  |         (*s) =3D ShutdownCauseNone
  |     case "host-error":
  |         (*s) =3D ShutdownCauseHostError
  |     case "host-qmp-quit":
  |         (*s) =3D ShutdownCauseHostQmpQuit
  |     case "host-qmp-system-reset":
  |         (*s) =3D ShutdownCauseHostQmpSystemReset
  |     case "host-signal":
  |         (*s) =3D ShutdownCauseHostSignal
  |     case "host-ui":
  |         (*s) =3D ShutdownCauseHostUi
  |     case "guest-shutdown":
  |         (*s) =3D ShutdownCauseGuestShutdown
  |     case "guest-reset":
  |         (*s) =3D ShutdownCauseGuestReset
  |     case "guest-panic":
  |         (*s) =3D ShutdownCauseGuestPanic
  |     case "subsystem-reset":
  |         (*s) =3D ShutdownCauseSubsystemReset
  |     default:
  |         fmt.Println("Failed to decode ShutdownCause", *s)
  |     }
  |     return nil
  | }

> If the enums were just represented as strings, then we can
> gracefully accept any new enum value that arrives in future.
> The application can thus also still log the shutdown reason
> string, even though it was not a value explicitly known to the
> generated API.

As a string, the warning should still exist and default value of
"" or nil for ptr would apply. IMHO, between string + warning and
int + warning, I'd still go with int here.

That's a design decision to be made. All in all, I don't know
much about the changes in QEMU/QAPI per version to take this
decision, so I'll rely on you and the list for this, not just for
enums but for the other types too.

> > 2. While in the Go codebase we can use the generated enum values, the
> >    specification requires that, on the wire, the enumeration type's
> >    value to be represented by its string name.
> >=20
> >    For this reason, each Go type that represent's a QAPI enum will be
> >    implementing the Marshaler[0] and Unmarshaler[1] interfaces to
> >    seamless handle QMP's string to Go int32 value and vice-versa.
> >=20
> > 3. Naming: CamelCase will be used in any identifier that we want to
> >    export [2], which is everything in this patch.

Cheers,
Victor

--w57sxfp5342dkhcy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmJ6SVQACgkQl9kSPeN6
SE8riw//TY3qq4szVoe7qHFFrenFQdB2kMfmRLqEq3PRw6AxC7ZKcZWyAq/Q5MKk
5rpEKOWRE/wnYimLn956+dQevWslp+gsmuSHE/IlUXJMfbfCwH5z4uZZNIX/z9cz
FLsEXhFojEs9XpOCjAkc3smSXMMkSZAR1/DchGSvv6oH98AtBNsn48dLd2jXYkvp
7WLLVIbwvehwh7plAhciqd5wk3vsx0qCunmVJ04WtaroU6ABHoIaM4OTTaHZZd9R
cdlJySHPN1XV3Qs685fslCT+WfDrHPO4crYx8Hxl6U7gdY8oQt/abDh5mKlscAUx
NrChXUFThKt25y4Wt3Wqo8fKgpKP27k/CL5C0USIHEyr32n7Gu6LrxPE2m/3doQW
SFvrAuJQDAkUAXIWP/0qB3LWfc1B8TW6dfWXjZognPIbLcADLjhfwwIp9GaeLFBw
xzHc+bJ3/Z55soc8gEiak0RVqLjs4QPmzUJNWkCnBMwcgRubgwG/t3F3EWUb5SgQ
51yFze813f/aR8yO/X1eeiaQVS1fgDWefbIBxkoXcD1xIjHEKCakWdta63qsf82S
ECBZ7YzpzqslWUm1yPAybjmDvGK2kGxY0s7JTSUBCMm52aPkUX+cMxexzMF3uTaO
jwYJ84HyAwOz3MwdeJlo9wUeDgJjFRpGSYrNB1uvmTtK4XPwrz4=
=dp4h
-----END PGP SIGNATURE-----

--w57sxfp5342dkhcy--


