Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D1B6FC303
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:43:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJri-0001OB-18; Tue, 09 May 2023 05:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1pwJrb-0001NU-7C
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:42:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1pwJrZ-0003xa-Dc
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:42:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683625348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/kkFsoVk90suBF732mvT2fQ4LKdCXBmXhmOjzJEvsFQ=;
 b=X6yOpArn+mdEYAqL0v2rL4nlBvBnMl+mWuGEAp22opeJwVW7p+Ls9OoY5XeEQKB4YDE3bz
 n5OFpUiaMTcXsQ7kwUQZwTPrmIUyWpgX3Wf23KXvBpQYbfvErXuqn9mNgV3F4zHF447xku
 /muSJQ+2opqp7+/tQeyAS3r1aR2r7sc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-GZKFmiF_OOWH5w8dApELMA-1; Tue, 09 May 2023 05:42:26 -0400
X-MC-Unique: GZKFmiF_OOWH5w8dApELMA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 319471C08795;
 Tue,  9 May 2023 09:42:26 +0000 (UTC)
Received: from localhost (unknown [10.42.28.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA22E1121314;
 Tue,  9 May 2023 09:42:25 +0000 (UTC)
Date: Tue, 9 May 2023 11:43:45 +0200
From: Sergio Lopez <slp@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 2/6] ui: add the infrastructure to support MT events
Message-ID: <rjkw62vfvujpsgmtjak7sqccewmnpc4q2oizfmqlpliyuhjgrj@rku5pxt33ihn>
References: <20230413152120.53967-1-slp@redhat.com>
 <20230413152120.53967-3-slp@redhat.com>
 <87sfcybwu3.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7ue7uy2rywjancj2"
Content-Disposition: inline
In-Reply-To: <87sfcybwu3.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--7ue7uy2rywjancj2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2023 at 12:57:08PM +0200, Markus Armbruster wrote:
> Sergio Lopez <slp@redhat.com> writes:
>=20
> > Add the required infrastructure to support generating multitouch events.
> >
> > Signed-off-by: Sergio Lopez <slp@redhat.com>
> > Reviewed-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/ui/input.h    |  3 +++
> >  qapi/ui.json          | 46 ++++++++++++++++++++++++++++++++++++++++---
> >  replay/replay-input.c | 18 +++++++++++++++++
> >  ui/input.c            |  6 ++++++
> >  ui/trace-events       |  1 +
> >  5 files changed, 71 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/ui/input.h b/include/ui/input.h
> > index c86219a1c1..2a3dffd417 100644
> > --- a/include/ui/input.h
> > +++ b/include/ui/input.h
> > @@ -8,9 +8,12 @@
> >  #define INPUT_EVENT_MASK_BTN   (1<<INPUT_EVENT_KIND_BTN)
> >  #define INPUT_EVENT_MASK_REL   (1<<INPUT_EVENT_KIND_REL)
> >  #define INPUT_EVENT_MASK_ABS   (1<<INPUT_EVENT_KIND_ABS)
> > +#define INPUT_EVENT_MASK_MTT   (1<<INPUT_EVENT_KIND_MTT)
> > =20
> >  #define INPUT_EVENT_ABS_MIN    0x0000
> >  #define INPUT_EVENT_ABS_MAX    0x7FFF
> > +#define INPUT_EVENT_SLOTS_MIN  0x0
> > +#define INPUT_EVENT_SLOTS_MAX  0xa
> > =20
> >  typedef struct QemuInputHandler QemuInputHandler;
> >  typedef struct QemuInputHandlerState QemuInputHandlerState;
> > diff --git a/qapi/ui.json b/qapi/ui.json
> > index 98322342f7..83369bdae8 100644
> > --- a/qapi/ui.json
> > +++ b/qapi/ui.json
> > @@ -1014,7 +1014,7 @@
> >  ##
> >  { 'enum'  : 'InputButton',
> >    'data'  : [ 'left', 'middle', 'right', 'wheel-up', 'wheel-down', 'si=
de',
> > -  'extra', 'wheel-left', 'wheel-right' ] }
> > +  'extra', 'wheel-left', 'wheel-right', 'touch' ] }
> > =20
> >  ##
> >  # @InputAxis:
> > @@ -1026,6 +1026,17 @@
> >  { 'enum'  : 'InputAxis',
> >    'data'  : [ 'x', 'y' ] }
> > =20
> > +##
> > +# @InputMultitouchType:
>=20
> Suggest InputMultiTouchType, because...
>=20
> > +#
> > +# Type of a multitouch event.
>=20
> ... the common spelling is multi-touch.
>=20
> More of the same below.

Ack, let's use this in v4.

> > +#
> > +# Since: 8.1
> > +##
> > +{ 'enum'  : 'InputMultitouchType',
> > +  'data'  : [ 'begin', 'update', 'end', 'cancel', 'data' ] }
> > +
> > +
> >  ##
> >  # @InputKeyEvent:
> >  #
> > @@ -1069,13 +1080,32 @@
> >    'data'  : { 'axis'    : 'InputAxis',
> >                'value'   : 'int' } }
> > =20
> > +##
> > +# @InputMultitouchEvent:
> > +#
> > +# Multitouch input event.
> > +#
> > +# @slot: Which slot has generated the event.
>=20
> Ignorant question: what's a "slot"?

The Multi-touch protocol [1] talks about them without describing them in mu=
ch
detail. In my understanding, the HW has as many slots as simultaneous conta=
ct
points is able to track. When a new contact is detected is assigned a
particular slot, and keeps using that one until the contact is released.

> > +# @tracking-id: ID to correlate this event with previously generated e=
vents.
> > +# @axis: Which axis is referenced by @value.
> > +# @value: Contact position.
> > +#
> > +# Since: 8.1
> > +##
> > +{ 'struct'  : 'InputMultitouchEvent',
> > +  'data'  : { 'type'       : 'InputMultitouchType',
> > +              'slot'       : 'int',
> > +              'tracking-id': 'int',
> > +              'axis'       : 'InputAxis',
> > +              'value'      : 'int' } }
> > +
> >  ##
> >  # @InputEventKind:
> >  #
> >  # Since: 2.0
> >  ##
> >  { 'enum': 'InputEventKind',
> > -  'data': [ 'key', 'btn', 'rel', 'abs' ] }
> > +  'data': [ 'key', 'btn', 'rel', 'abs', 'mtt' ] }
>=20
> While we generally avoid abbreviations in QAPI, local consistency is a
> strong argument for this one.  Okay.
>=20
> > =20
> >  ##
> >  # @InputKeyEventWrapper:
> > @@ -1101,6 +1131,14 @@
> >  { 'struct': 'InputMoveEventWrapper',
> >    'data': { 'data': 'InputMoveEvent' } }
> > =20
> > +##
> > +# @InputMultitouchEventWrapper:
> > +#
> > +# Since: 8.1
> > +##
> > +{ 'struct': 'InputMultitouchEventWrapper',
> > +  'data': { 'data': 'InputMultitouchEvent' } }
>=20
> The only reason for wrapping is consistency with the other branches.
> Okay.
>=20
> > +
> >  ##
> >  # @InputEvent:
> >  #
> > @@ -1112,6 +1150,7 @@
>    # @type: the input type, one of:
>    #
>    #        - 'key': Input event of Keyboard
> >  #        - 'btn': Input event of pointer buttons
> >  #        - 'rel': Input event of relative pointer motion
> >  #        - 'abs': Input event of absolute pointer motion
> > +#        - 'mtt': Input event of Multitouch
>=20
> You're imitating the existing "Input event of" pattern, which is fair.
> But the pattern is bad.  The phrasing awkward, and so is the place.  By
> documenting the values of InputEventKind only here, and not in
> InputEventKind's doc comment, the generated documentation for
> InputEventKind looks like this:
>=20
>     "InputEventKind" (Enum)
>     -----------------------
>=20
>     Values
>     ~~~~~~
>=20
>     "key"
>        Not documented
>=20
>     "btn"
>        Not documented
>=20
>     "rel"
>        Not documented
>=20
>     "abs"
>        Not documented
>=20
>     "mtt"
>        Not documented
>=20
>=20
>     Since
>     ~~~~~
>=20
>     2.0
>=20
> We should document them right in InputEventKind's doc comment, roughly
> like this:
>=20
>    ##
>    # @InputEventKind:
>    #
>    # @key: a keyboard input event
>    # @btn: a pointer button input event
>    # @rel: a relative pointer motion input event
>    # @abs: an absolute pointer motion input event
>    # @mtt: a multi-touch input event
>    #
>    # Since: 2.0
>    ##
>=20
> We can then dumb down the documentation of InputEvent member @type to
> just
>=20
>    # @type: the type of input event
>=20
> What do you think?

Yeah, this definitely looks better. Fixed in v4.

Thanks,
Sergio.

> Many more doc comments neglect to document members in this file, and in
> others.  I'm not asking you to fix them all.
>=20
> >  #
> >  # Since: 2.0
> >  ##
> > @@ -1121,7 +1160,8 @@
> >    'data'  : { 'key'     : 'InputKeyEventWrapper',
> >                'btn'     : 'InputBtnEventWrapper',
> >                'rel'     : 'InputMoveEventWrapper',
> > -              'abs'     : 'InputMoveEventWrapper' } }
> > +              'abs'     : 'InputMoveEventWrapper',
> > +              'mtt'     : 'InputMultitouchEventWrapper' } }
> > =20
> >  ##
> >  # @input-send-event:
>=20
> [...]
>=20

--7ue7uy2rywjancj2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmRaFdAACgkQ9GknjS8M
AjXNtg//RuM+HwLCCdCy8+Fg1bhHpuflJmNvkoTVL1Mj4/5zMx4D/TZzQQAj0fmN
WJfapgahilzEhf67mbjpumPE/bbsGxHrJBT28U5FIkM+8lXf48msFsGYp3bh6qro
jE/xCkWf7+G+B/F/sbAFOJ3ZI9Ze8TKsLgAInHn72A0Mm6a5WVWX4fIyiC8SUco+
+wXaioYh6no2Fn7l2/DsxIVeyw1wYtND4I2xfAf8NuMyIO7YSzLGq0+WWC8EeR7m
Rvle+78aMCxbrg4Z/8wfb/uiTyQRJuCmyb5W/Q3VkFmG1COwXfLF/ItM/NfmSjGc
piR18R2GBWkkQr1j9Io2kV3u/lqFqVMCoIwTNis2liZehNT+y+4q0a/hPwcTJ154
oci8UrYTr+wgwLNZOwjPHXXiO0GRjzivjxd52XPpJhuvhAtiE5soljZz3yCXTiOl
AyLnAn1mqNjgKxdWKJJf8dVKS3nC4oaj7EZS2OlEcsZIkUk2bT243m6iSGnBfoxy
HizjECOm3xSQ5yOkQ+GKbtJiKdNdk6grbpnhEMmRg9J5zvwdRx0qGygyYSEz+Jc0
ky7E0GxpB1sJ5krtAUi29nb7/qobh4DPF1Nro9noeZW8M9EFt9/lIduxtXtkushZ
Q8Eg6ZEb/Xf4fJsQ53IQXet7RMcGI7sr6RZDovarkproU5udgfg=
=Lrs6
-----END PGP SIGNATURE-----

--7ue7uy2rywjancj2--


