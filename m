Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE443EA44A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 14:09:55 +0200 (CEST)
Received: from localhost ([::1]:59500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE9Wz-0000wZ-VF
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 08:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mE9Vl-0007wM-0I; Thu, 12 Aug 2021 08:08:37 -0400
Received: from redisdead.crans.org ([2a0c:700:2::ff:fe01:2402]:48400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mE9Vh-0004w2-2m; Thu, 12 Aug 2021 08:08:36 -0400
Received: from [IPv6:2a0c:700:3012:13:7783:661a:ffa4:4d1f] (unknown
 [IPv6:2a0c:700:3012:13:7783:661a:ffa4:4d1f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id D2F9821A;
 Thu, 12 Aug 2021 14:08:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1628770108; bh=DrVA4wn8+P9VwSUDkfbihALWWys76RZc0xcXJ/vhNQ0=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=aOlSQ6hDZjrdtZTvE5mJ6vIYV/NKhTD3Z8SDcwqkFcnt8AERUnJaL8CuvYj8gnkAk
 E1vNze20t1HVvYTm0vQLhVJRaudOAujOaBCKxFmkPIIfN3MiQte9C7qkOyxWDFhaQk
 RlpToYakIkthvPA44oyZIjsrGkyS9XwwsQB1HSi5q9RosxHCPABOzebsocOthQ0Ni1
 rCfz6PVVQ7e9/lGUtb4qOhSCbDRnwRzk/3HBOQvtMI4c4FG2KoMEbQXXVxpRl9Vacj
 gTPgLIcRNhOB1pSfAKkuHA2EPeYhtijwJYZJifJhEA71Kh/sYecvy1VY3ZjMzLeu7K
 CmKzs0HvlQgSdJHV0XBg/bae6m+/Tlly5E6tB1gAQLfZwSL2vifX3/m7a5QCPMBED9
 t2dfCpIK2WD9ekZZWiizFRZXDGk7+EiNlYpA9dFKhK6cmEiE8kW+ZGScnBiryFCNKm
 P7RsSQMlqcd4ZZMjF698X0rKeXUaCOaUDNjaZ1m5dZ7S89E0DyQzPhbyBj8bQzYUrt
 GsIbXmFeo5S7mvh5/3SApsLV4RXujBCYxcKc4ukd2u2sMJq0snIv2+x00+qJETo8bD
 0oOaWR5GSABe8dOLmNG8DcVjoQK8xfuXL7aRZNUentVIIrknwBjOGr2vGtbT4go98j
 p5cKbyYDLWdzy0D/QAzSYFFU=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-10-peter.maydell@linaro.org>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Subject: Re: [PATCH for-6.2 09/25] clock: Provide builtin multiplier/divider
Message-ID: <6a0f3bcc-cb85-2f02-32f3-3ea85b0b9c43@crans.org>
Date: Thu, 12 Aug 2021 14:08:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812093356.1946-10-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FxX4ynRr6SksxxRKOuMXZr0QTVrtkyIXh"
Received-SPF: pass client-ip=2a0c:700:2::ff:fe01:2402;
 envelope-from=erdnaxe@crans.org; helo=redisdead.crans.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <alistair@alistair23.me>, Luc Michel <luc@lmichel.fr>,
 Joel Stanley <joel@jms.id.au>, Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FxX4ynRr6SksxxRKOuMXZr0QTVrtkyIXh
Content-Type: multipart/mixed; boundary="5WMYnmrsvoDUvzGgX2hZ36lDb5JZqoZhG";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Luc Michel <luc@lmichel.fr>, Damien Hedde <damien.hedde@greensocs.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>
Message-ID: <6a0f3bcc-cb85-2f02-32f3-3ea85b0b9c43@crans.org>
Subject: Re: [PATCH for-6.2 09/25] clock: Provide builtin multiplier/divider
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-10-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-10-peter.maydell@linaro.org>

--5WMYnmrsvoDUvzGgX2hZ36lDb5JZqoZhG
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 8/12/21 11:33 AM, Peter Maydell wrote:
> It is quite common for a clock tree to involve possibly programmable
> clock multipliers or dividers, where the frequency of a clock is for
> instance divided by 8 to produce a slower clock to feed to a
> particular device.
>=20
> Currently we provide no convenient mechanism for modelling this.  You
> can implement it by having an input Clock and an output Clock, and
> manually setting the period of the output clock in the period-changed
> callback of the input clock, but that's quite clunky.
>=20
> This patch adds support in the Clock objects themselves for setting a
> multiplier or divider.  The effect of setting this on a clock is that
> when the clock's period is changed, all the children of the clock are
> set to period * multiplier / divider, rather than being set to the
> same period as the parent clock.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/devel/clocks.rst   | 23 +++++++++++++++++++++++
>   include/hw/clock.h      | 29 +++++++++++++++++++++++++++++
>   hw/core/clock-vmstate.c | 24 +++++++++++++++++++++++-
>   hw/core/clock.c         | 29 +++++++++++++++++++++++++----
>   4 files changed, 100 insertions(+), 5 deletions(-)
>=20
> diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
> index 956bd147ea0..430fbd842e5 100644
> --- a/docs/devel/clocks.rst
> +++ b/docs/devel/clocks.rst
> @@ -260,6 +260,29 @@ clocks get the new clock period value: *Clock 2*, =
*Clock 3* and *Clock 4*.
>   It is not possible to disconnect a clock or to change the clock conne=
ction
>   after it is connected.
>  =20
> +Clock multiplier and divider settings
> +-------------------------------------
> +
> +By default, when clocks are connected together, the child
> +clocks run with the same period as their source (parent) clock.
> +The Clock API supports a built-in period multiplier/divider
> +mechanism so you can configure a clock to make its children
> +run at a different period from its own. If you call the
> +``clock_set_mul_div()`` function you can specify the clock's
> +multiplier and divider values. The children of that clock
> +will all run with a period of ``parent_period * multiplier / divider``=
=2E
> +For instance, if the clock has a frequency of 8MHz and you set its
> +multiplier to 2 and its divider to 3, the child clocks will run
> +at 12MHz.
> +
> +You can change the multiplier and divider of a clock at runtime,
> +so you can use this to model clock controller devices which
> +have guest-programmable frequency multipliers or dividers.

This looks nice!
Does this imply that if I am going to implement the STM32 RCC (Reset and =

Clock Controller) device, then I should use this new feature?

> +
> +Note that ``clock_set_mul_div()`` does not automatically call
> +``clock_propagate()``. If you make a runtime change to the
> +multiplier or divider you must call clock_propagate() yourself.a
> +
>   Unconnected input clocks
>   ------------------------
>  =20
> diff --git a/include/hw/clock.h b/include/hw/clock.h
> index a7187eab95e..11f67fb9701 100644
> --- a/include/hw/clock.h
> +++ b/include/hw/clock.h
> @@ -81,6 +81,10 @@ struct Clock {
>       void *callback_opaque;
>       unsigned int callback_events;
>  =20
> +    /* Ratio of the parent clock to run the child clocks at */
> +    uint32_t multiplier;
> +    uint32_t divider;
> +
>       /* Clocks are organized in a clock tree */
>       Clock *source;
>       QLIST_HEAD(, Clock) children;
> @@ -350,4 +354,29 @@ static inline bool clock_is_enabled(const Clock *c=
lk)
>    */
>   char *clock_display_freq(Clock *clk);
>  =20
> +/**
> + * clock_set_mul_div: set multiplier/divider for child clocks
> + * @clk: clock
> + * @multiplier: multiplier value
> + * @divider: divider value
> + *
> + * By default, a Clock's children will all run with the same period
> + * as their parent. This function allows you to adjust the multiplier
> + * and divider used to derive the child clock frequency.
> + * For example, setting a multiplier of 2 and a divider of 3
> + * will run child clocks with a period 2/3 of the parent clock,
> + * so if the parent clock is an 8MHz clock the children will
> + * be 12MHz.
> + *
> + * Setting the multiplier to 0 will stop the child clocks.
> + * Setting the divider to 0 is a programming error (diagnosed with
> + * an assertion failure).
> + * Setting a multiplier value that results in the child period
> + * overflowing is not diagnosed.
> + *
> + * Note that this function does not call clock_propagate(); the
> + * caller should do that if necessary.
> + */
> +void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divid=
er);
> +
>   #endif /* QEMU_HW_CLOCK_H */
> diff --git a/hw/core/clock-vmstate.c b/hw/core/clock-vmstate.c
> index 260b13fc2c8..07bb45d7ed4 100644
> --- a/hw/core/clock-vmstate.c
> +++ b/hw/core/clock-vmstate.c
> @@ -14,6 +14,24 @@
>   #include "migration/vmstate.h"
>   #include "hw/clock.h"
>  =20
> +static bool muldiv_needed(void *opaque)
> +{
> +    Clock *clk =3D opaque;
> +
> +    return clk->multiplier !=3D 1 || clk->divider !=3D 1;
> +}
> +
> +const VMStateDescription vmstate_muldiv =3D {
> +    .name =3D "clock/muldiv",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .needed =3D muldiv_needed,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT32(multiplier, Clock),
> +        VMSTATE_UINT32(divider, Clock),
> +    },
> +};
> +
>   const VMStateDescription vmstate_clock =3D {
>       .name =3D "clock",
>       .version_id =3D 0,
> @@ -21,5 +39,9 @@ const VMStateDescription vmstate_clock =3D {
>       .fields =3D (VMStateField[]) {
>           VMSTATE_UINT64(period, Clock),
>           VMSTATE_END_OF_LIST()
> -    }
> +    },
> +    .subsections =3D (const VMStateDescription*[]) {
> +        &vmstate_muldiv,
> +        NULL
> +    },
>   };
> diff --git a/hw/core/clock.c b/hw/core/clock.c
> index fc5a99683f8..c371b9e977a 100644
> --- a/hw/core/clock.c
> +++ b/hw/core/clock.c
> @@ -64,6 +64,15 @@ bool clock_set(Clock *clk, uint64_t period)
>       return true;
>   }
>  =20
> +static uint64_t clock_get_child_period(Clock *clk)
> +{
> +    /*
> +     * Return the period to be used for child clocks, which is the par=
ent
> +     * clock period adjusted for for multiplier and divider effects.
> +     */
> +    return muldiv64(clk->period, clk->multiplier, clk->divider);
> +}
> +
>   static void clock_call_callback(Clock *clk, ClockEvent event)
>   {
>       /*
> @@ -78,15 +87,16 @@ static void clock_call_callback(Clock *clk, ClockEv=
ent event)
>   static void clock_propagate_period(Clock *clk, bool call_callbacks)
>   {
>       Clock *child;
> +    uint64_t child_period =3D clock_get_child_period(clk);
>  =20
>       QLIST_FOREACH(child, &clk->children, sibling) {
> -        if (child->period !=3D clk->period) {
> +        if (child->period !=3D child_period) {
>               if (call_callbacks) {
>                   clock_call_callback(child, ClockPreUpdate);
>               }
> -            child->period =3D clk->period;
> +            child->period =3D child_period;
>               trace_clock_update(CLOCK_PATH(child), CLOCK_PATH(clk),
> -                               CLOCK_PERIOD_TO_HZ(clk->period),
> +                               CLOCK_PERIOD_TO_HZ(child->period),
>                                  call_callbacks);
>               if (call_callbacks) {
>                   clock_call_callback(child, ClockUpdate);
> @@ -110,7 +120,7 @@ void clock_set_source(Clock *clk, Clock *src)
>  =20
>       trace_clock_set_source(CLOCK_PATH(clk), CLOCK_PATH(src));
>  =20
> -    clk->period =3D src->period;
> +    clk->period =3D clock_get_child_period(src);
>       QLIST_INSERT_HEAD(&src->children, clk, sibling);
>       clk->source =3D src;
>       clock_propagate_period(clk, false);
> @@ -133,10 +143,21 @@ char *clock_display_freq(Clock *clk)
>       return freq_to_str(clock_get_hz(clk));
>   }
>  =20
> +void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divid=
er)
> +{
> +    assert(divider !=3D 0);
> +
> +    clk->multiplier =3D multiplier;
> +    clk->divider =3D divider;
> +}
> +
>   static void clock_initfn(Object *obj)
>   {
>       Clock *clk =3D CLOCK(obj);
>  =20
> +    clk->multiplier =3D 1;
> +    clk->divider =3D 1;
> +
>       QLIST_INIT(&clk->children);
>   }
>  =20
>=20

Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>

Thanks,
-- Alexandre


--5WMYnmrsvoDUvzGgX2hZ36lDb5JZqoZhG--

--FxX4ynRr6SksxxRKOuMXZr0QTVrtkyIXh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmEVDzsFAwAAAAAACgkQbHknjz/NzAJB
Eg//QeZkBI4tU5wUgu8JIeAyokk44ECG0gwVFM39dkMPx9JnwRRBBJ3sANvrIL65h2UZ5SPhW3VU
1AOyX3Nx3cM/FQcCnXi1lFjyDfrS1NkXblxJeGmqvi3Z0XYgJkKFR8mvYENiUoh7KkwwD3MkVy4T
PfrKNzSCDfzWMQZvS5iaQQSKUs8A/0iZcw1QPErVExEOXIs2TQvyHM4GzlGfaSxb5XdqmyszJ0sf
CPhLdT1EwQXef4wIQqLyPeC6pawt9YLqO7uOPGdLzy2CZLr3UNJ7xc8tpqjyFiaHXprTpk3+n44Q
SdfUxBvJvhLzFOM+2m/Wh6eMI9SqIgj6zOER8BJs9yQMFOC3MuoemeQZ88HV3YvEFH2EUq3CQ4hm
EFsHCp58O9bxj7bh9S2HTrstl55SEsDRV1/8cjEGZ4PLZnJfrIAHPMhuj5O/Tbb4YiSY6ldhyuvv
agRm62uaR4bvBlGFar3MiOJ0YL49WJxOBSQ3D4mrb8EUYVhaFX7K3hNZnlD8VRjCwDoAUqEIRbSQ
oknjrtSsPHmlWMkxNxfG4lSeNmRddlMXXOzgcc6vuRXHrJUiC6NMgY0lwd1+r/8DjZUba5hn1AGn
NDizU7iFWHdY6rcI3xZ3HoT1vodtQXwEeRsRpHkv6sVPXyn+JLANaQ852fGrMby9ENzFql8OcG7L
4uM=
=d2Cl
-----END PGP SIGNATURE-----

--FxX4ynRr6SksxxRKOuMXZr0QTVrtkyIXh--

