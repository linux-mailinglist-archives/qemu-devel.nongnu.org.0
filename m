Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5253D6A56EB
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 11:40:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWxP7-0008Fd-Um; Tue, 28 Feb 2023 05:40:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pWxOg-0008AH-I8
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:39:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pWxOc-0001jW-Fl
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677580785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NJr1v+Fg3X7rjMTnlf2Bt1V+Ic/mzwck/Xt/BL3vIn0=;
 b=cijT/e+3xZ3lTiNxfmvQZjdIC/q7uuhlMhJZ7clSjoMRUaItlVTUXbkwfHp/N9Cu3PfTNW
 PkKIfaARYi2eeUrIydFuZOzWb5edBAXAAkbeNzELnrvsd+OAyjmMZnWCq/dQLrhuWqEqU2
 12fjMmuZ8uDfD6+ZdezVPSQo2//Gq84=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-lf9JwHrrNxiA7gTzVlLOEg-1; Tue, 28 Feb 2023 05:39:42 -0500
X-MC-Unique: lf9JwHrrNxiA7gTzVlLOEg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D422A293248C;
 Tue, 28 Feb 2023 10:39:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91E7E2026D68;
 Tue, 28 Feb 2023 10:39:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7BCBB21E6A1F; Tue, 28 Feb 2023 11:39:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,
 libvir-list@redhat.com,  Richard Henderson
 <richard.henderson@linaro.org>,  qemu-devel@nongnu.org,
 qemu-arm@nongnu.org,  Reinoud Zandijk <reinoud@netbsd.org>,  Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,  xen-devel@lists.xenproject.org,
 Paolo Bonzini <pbonzini@redhat.com>,  Maxim Levitsky
 <mlevitsk@redhat.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
 <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org>
 <Y/3CiEKKoG06t9rr@redhat.com>
 <20230228040115-mutt-send-email-mst@kernel.org>
 <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
 <Y/3MIUDRBUSNg6C5@redhat.com>
 <20230228050908-mutt-send-email-mst@kernel.org>
Date: Tue, 28 Feb 2023 11:39:39 +0100
In-Reply-To: <20230228050908-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Tue, 28 Feb 2023 05:11:20 -0500")
Message-ID: <87cz5uhy50.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Tue, Feb 28, 2023 at 09:40:49AM +0000, Daniel P. Berrang=C3=A9 wrote:
>> On Tue, Feb 28, 2023 at 10:14:52AM +0100, Thomas Huth wrote:
>> > On 28/02/2023 10.03, Michael S. Tsirkin wrote:
>> > > On Tue, Feb 28, 2023 at 08:59:52AM +0000, Daniel P. Berrang=C3=A9 wr=
ote:
>> > > > On Tue, Feb 28, 2023 at 03:19:20AM -0500, Michael S. Tsirkin wrote:
>> > > > > On Tue, Feb 28, 2023 at 08:49:09AM +0100, Thomas Huth wrote:
>> > > > > > On 27/02/2023 21.12, Michael S. Tsirkin wrote:
>> > > > > > > On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrang=
=C3=A9 wrote:
>> > > > > > > > I feel like we should have separate deprecation entries fo=
r the
>> > > > > > > > i686 host support, and for qemu-system-i386 emulator binar=
y, as
>> > > > > > > > although they're related they are independant features with
>> > > > > > > > differing impact. eg removing qemu-system-i386 affects all
>> > > > > > > > host architectures, not merely 32-bit x86 host, so I think=
 we
>> > > > > > > > can explain the impact more clearly if we separate them.
>> > > > > > >=20
>> > > > > > > Removing qemu-system-i386 seems ok to me - I think qemu-syst=
em-x86_64 is
>> > > > > > > a superset.
>> > > > > > >=20
>> > > > > > > Removing support for building on 32 bit systems seems like a=
 pity - it's
>> > > > > > > one of a small number of ways to run 64 bit binaries on 32 b=
it systems,
>> > > > > > > and the maintainance overhead is quite small.
>> > > > > >=20
>> > > > > > Note: We're talking about 32-bit *x86* hosts here. Do you real=
ly think that
>> > > > > > someone is still using QEMU usermode emulation
>> > > > > > to run 64-bit binaries on a 32-bit x86 host?? ... If so, I'd b=
e very surprised!
>> > > > >=20
>> > > > > I don't know - why x86 specifically? One can build a 32 bit bina=
ry on any host.
>> > > > > I think 32 bit x86 environments are just more common in the clou=
d.
>> > > >=20
>> > > > Can you point to anything that backs up that assertion. Clouds I've
>> > > > seen always give you a 64-bit environment, and many OS no longer
>> > > > even ship 32-bit installable media.
>> > >=20
>> > > Sorry about being unclear. I meant that it seems easier to run CI in=
 the
>> > > cloud in a 32 bit x64 environment than get a 32 bit ARM environment.
>> >=20
>> > It's still doable ... but for how much longer? We're currently dependi=
ng on
>> > Fedora, but they also slowly drop more and more support for this
>> > environment, see e.g.:
>>=20
>> FWIW, we should cull our fedora-i386-cross.docker dockerfile and
>> replace it with a debian i686 dockerfile generated by lcitool.
>> There's no compelling reason why i686 should be different from
>> all our other cross builds which are based on Debian. The Debian
>> lcitool generated container would have access to a wider range
>> of deps than our hand written Fedora one.
>>=20
>> >  https://www.theregister.com/2022/03/10/fedora_inches_closer_to_droppi=
ng/
>>=20
>> With regards,
>> Daniel
>
> ... and is closer to where 32 bit is likely to be deployed which is
> systems like e.g. raspberry pi os which until recently was only
> 32 bit.

32 bit ARM.  How is that an argument for continued maintenance of 32 bit
x86?

If the argument goes like "32 bit x86 is easier to test in CI", then I
don't buy it.  Testing 64 bit ARM + 32 bit x86 does not magically
replace testing 32 bit ARM.

The question to answer: Is 32 bit x86 worth its upkeep?  Two
sub-questions: 1. Is it worth the human attention?  2. Is it worth
(scarce!) CI minutes?

I want to see an argument for benefits justifying the costs.

A benefit like "somebody out there might still want to use it" I'd value
at zero.


