Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E95113F4E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 11:23:27 +0100 (CET)
Received: from localhost ([::1]:52618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icoI9-0003JJ-Iz
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 05:23:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47051)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1icoGu-0002jw-1O
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 05:22:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1icoGr-0007Sa-D9
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 05:22:07 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59116
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1icoGr-0007Mr-3j
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 05:22:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575541323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MVg8tTPmIRSU+yVAO5p+EuU9NukICxQMvEzmz9savAQ=;
 b=fLY/vKPsZaTuqzkcKsFtPxNVOxzeNBANtmF11TpWKcv4G9npwcaO6UGDHPWzaORVcpE6wS
 B4EUGcqIOB0QWPSlBe5+edEisfAnkDoccFA7RWi0nQHePPgbPSnJQqq1DyYTwo+bPgXSJN
 Am9T3PNFD0blo7XWdhBru3N1SdrXQ6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-4qFRWYmUPuqycGei6rpleg-1; Thu, 05 Dec 2019 05:22:02 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12A37183B700;
 Thu,  5 Dec 2019 10:22:01 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 137405D6A5;
 Thu,  5 Dec 2019 10:21:53 +0000 (UTC)
Date: Thu, 5 Dec 2019 10:21:51 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v6 0/9] Clock framework API
Message-ID: <20191205102151.GB2824@work-vm>
References: <20190904125531.27545-1-damien.hedde@greensocs.com>
 <CAFEAcA98rt6nRDSrwk8XRbaBT67LZXvF=XEV13dtJBp4fPUscw@mail.gmail.com>
 <be199ad6-1b79-f77d-afad-faeb042151ed@greensocs.com>
 <febdb64d-9d02-66ad-84d2-dc795879e48b@redhat.com>
 <a0cea550-d6c7-0193-b4e6-24ed879be61d@greensocs.com>
 <279a0fd5-1ea5-b3c7-27bb-b1d22db5e359@redhat.com>
MIME-Version: 1.0
In-Reply-To: <279a0fd5-1ea5-b3c7-27bb-b1d22db5e359@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 4qFRWYmUPuqycGei6rpleg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
 Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daud=E9 (philmd@redhat.com) wrote:
> On 12/5/19 10:36 AM, Damien Hedde wrote:
> > On 12/4/19 9:34 PM, Philippe Mathieu-Daud=E9 wrote:
> > > On 12/4/19 5:40 PM, Damien Hedde wrote:
> > > > On 12/2/19 5:15 PM, Peter Maydell wrote:
> > > > >=20
> > > > > The one topic I think we could do with discussing is whether
> > > > > a simple uint64_t giving the frequency of the clock in Hz is
> > > > > the right representation. In particular in your patch 9 the
> > > > > board has a clock frequency that's not a nice integer number
> > > > > of Hz. I think Philippe also mentioned on irc some board where
> > > > > the UART clock ends up at a weird frequency. Since the
> > > > > representation of the frequency is baked into the migration
> > > > > format it's going to be easier to get it right first rather
> > > > > than trying to change it later.
> > >=20
> > > Important precision for Damien, IIUC we can not migrate float/double =
types.
> > >=20
> > > > > So what should the representation be? Some random thoughts:
> > > > >=20
> > > > > 1) ptimer internally uses a 'period plus fraction' representation=
:
> > > > >  =A0 int64_t period is the integer part of the period in nanoseco=
nds,
> > > > >  =A0 uint32_t period_frac is the fractional part of the period
> > > > > (if you like you can think of this as "96-bit integer
> > > > > period measured in units of one-2^32nd of a nanosecond").
> > > > > However its only public interfaces for setting the frequency
> > > > > are (a) set the frequency in Hz (uint32_t) or (b) set
> > > > > the period in nanoseconds (int64_t); the period_frac part
> > > > > is used to handle frequencies which don't work out to
> > > > > a nice whole number of nanoseconds per cycle.
> > >=20
> > > This is very clear, thanks Peter!
> > >=20
> > > The period+period_frac split allow us to migrate the 96 bits:
> > >=20
> > >  =A0=A0=A0=A0=A0=A0=A0 VMSTATE_UINT32(period_frac, ptimer_state),
> > >  =A0=A0=A0=A0=A0=A0=A0 VMSTATE_INT64(period, ptimer_state),
> > >=20
> > > > > 2) I hear that SystemC uses "value plus a time unit", with
> > > > > the smallest unit being a picosecond. (I think SystemC
> > > > > also lets you specify the duty cycle, but we definitely
> > > > > don't want to get into that!)
> > > >=20
> > > > The "value" is internally stored in a 64bits unsigned integer.
> > > >=20
> > > > >=20
> > > > > 3) QEMUTimers are basically just nanosecond timers
> > >=20
> > > Similarly to SystemC, the QEMUTimers macro use a 'scale' unit, of:
> > >=20
> > > #define SCALE_MS 1000000
> > > #define SCALE_US 1000
> > > #define SCALE_NS 1
> > >=20
> > > > >=20
> > > > > 4) The MAME emulator seems to work with periods of
> > > > > 96-bit attoseconds (represented internally by a
> > > > > 32-bit count of seconds plus a 64-bit count of
> > > > > attoseconds). One attosecond is 1e-18 seconds.
> > > > >=20
> > > > > Does anybody else have experience with other modelling
> > > > > or emulator technology and how it represents clocks ?
> > > >=20
> > > > 5) In linux, a clock rate is an "unsigned long" representing Hz.
> > > >=20
> > > > >=20
> > > > > I feel we should at least be able to represent clocks
> > > > > with the same accuracy that ptimer has.
> > > >=20
> > > > Then is a maybe a good idea to store the period and not the frequen=
cy in
> > > > clocks so that we don't loose anything when we switch from a clock =
to a
> > > > ptimer ?
> > >=20
> > > I think storing the period as an integer type is a good idea.
> > >=20
> > > However if we store the period in nanoseconds, we get at most 1GHz
> > > frequency.
> > >=20
> > > The attosecond granularity feels overkill.
> > >=20
> > > If we use a 96-bit integer to store picoseconds and use similar SCALE
> > > macros we get to 1THz.
> > >=20
> > > Regardless the unit chosen, as long it is integer, we can migrate it.
> > > If can migrate the period, we don't need to migrate the frequency.
> > > We can then use the float type in with the timer API to pass frequenc=
ies
> > > (which in the modeled hardware are ratios, likely not integers).
> > >=20
> > > So we could use set_freq(100e6 / 3), set_freq(40e6 / 5.5) directly.
> > >=20
> > > > Regarding the clock, I don't see any strong obstacle to switch
> > > > internally to a period based value.
> > > > The only things we have to choose is how to represent a disabled cl=
ock.
> > > > Since putting a "0" period to a ptimer will disable the timer in
> > > > ptimer_reload(). We can choose that (and it's a good value because =
we
> > > > can multiply or divide it, it stays the same).
> > > >=20
> > > > We could use the same representation as a ptimer. But if we don't k=
eep a
> > > > C number representation, then computation of frequencies/periods wi=
ll be
> > > > complicated at best and error prone.
> > > >=20
> > > >  =A0From that point of view, if we could stick to a 64bits integer =
(or
> > > > floating point number) it would be great. Can we use a sub nanoseco=
nd
> > > > unit that fit our needs ?
> > > >=20
> > > > I did some test with a unit of 2^-32 of nanoseconds on 64bits (is t=
hat
> > > > the unit of the ptimer fractional part ?) and if I'm not mistaken
> > > > + we have a frequency range from ~0.2Hz up to 10^18Hz
> > > > + the resolution is decreasing with the frequency (but at 100Mhz we=
 have
> > > > a ~2.3mHz resolution, at 1GHz it's ~0.23Hz and at 10GHz ~23Hz
> > > > resolution). We hit 1Hz resolution around 2GHz.
> > > >=20
> > > > So it sounds to me we have largely enough resolution to model clock=
s in
> > > > the range of frequencies we will have to handle. What do you think =
?
> > >=20
> > > Back to your series, I wonder why you want to store the frequency in
> > > ClockIn. ClockIn shouldn't be aware at what frequency it is clocked.
> > > What matters is ClockOut, and each device exposing ClockOuts has a
> > > (migrated) state of the output frequencies (rather in fields, or enco=
ded
> > > in registers). Once migrated, after the state is loaded back into the
> > > device, we call post_load(). Isn't it a good place to call
> > > clock_set_frequency(ClockOut[]) which will correctly set each ClockIn
> > > frequency.
> > >=20
> > > IOW I don't think ClockIn/ClockOut require to migrate a frequency fie=
ld.
> > >=20
> >=20
> > I agree it is more logical to store the frequency in clock out. But,
> > regarding migration constraints, we have no choice I think because a
> > device cannot rely on values that are migrated by another device for
> > restoring its state. (when I checked, I add the impression that
> > post_load()s are called on a per device migration basis not all at the
> > end of migration).
>=20
> Cc'ing David to clear that out.


That's pretty much right; the 'post_load' is called on a structure at the e=
nd
of loading the data for that structure.

You can do things at the end of migration; one way is to register a
vm change state handler (search for qemu_add_vm_change_state_handler)
and that means you get a kick when the VM starts running or a timer set
in virtual time (not wall clock time because that becomes sensitive
to the speed of the host).

Somewhere ^^^ it says we can't migrate fp values; I'm not sure that's
true; we've got a VMSTATE_FLOAT64 macro but I don't see it's used
anywhere.

Dave

> > So we could store the frequency in clock out and migrate things there.
> > But since we have no way to ensure all clock out states are migrated
> > before some device fetch a ClockIn: we'll have to say "don't fetch one
> > of your ClockIn frequency during migration and migrate the value
> > yourself if you need it", pretty much like gpios.
> >=20
> > So we will probably migrate all ClockOut and almost all ClockIn.
> >=20
> > It would nice if we had a way to ensure clocks are migrated before
> > devices try to use them. But I don't think this is possible.
> >=20
> > --
> > Damien
> >=20
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


