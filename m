Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F1E1328E0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 15:28:13 +0100 (CET)
Received: from localhost ([::1]:49776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iopq8-0006u7-PN
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 09:28:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37531)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iopoU-0005Jd-DQ
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 09:26:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iopoS-0004j8-Fl
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 09:26:29 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:44549
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iopoP-0004g5-Td
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 09:26:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578407183;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VVV/ibB7PnpiklHu6m3mhkl7dn6XgtXp6kCDjzOkSiE=;
 b=JMKi012SPPQdtFGwzElHsljCpU+HDQW347wfS9FCRhITMk2lJfI8xhUgp5dBhLwfXs2qTN
 EqPAub3umisJGlq41qxMCSVvknaGfAfQWaFpsSr4WQ3hhn11sgQHgdifqRBXkJHK6HlcBw
 adrmV+68IgIXnj2rCGAiU4PEvc5K0JA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-LOMhTOSbNUuUZPd2NV86hQ-1; Tue, 07 Jan 2020 09:26:22 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CAA6800D53;
 Tue,  7 Jan 2020 14:26:21 +0000 (UTC)
Received: from redhat.com (ovpn-112-61.ams2.redhat.com [10.36.112.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98EE17BFFA;
 Tue,  7 Jan 2020 14:26:12 +0000 (UTC)
Date: Tue, 7 Jan 2020 14:26:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: Priority of -accel (was: [PATCH] tests/qemu-iotests: Update
 tests to recent desugarized -accel option)
Message-ID: <20200107142609.GB3368802@redhat.com>
References: <20200106130951.29873-1-philmd@redhat.com>
 <c493e693-13a7-7dc4-eb2d-5dbc7b3053f1@redhat.com>
 <12334054-4ae7-e580-9727-2d322bfa2bda@redhat.com>
 <58eb34db-7d32-8b0e-d9ef-98648209486b@redhat.com>
 <656169fc-1abe-b521-20a3-e7041739b914@redhat.com>
 <20200107125451.GL3368802@redhat.com>
 <3241dff4-6223-404f-55d4-846991763046@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3241dff4-6223-404f-55d4-846991763046@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: LOMhTOSbNUuUZPd2NV86hQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 07, 2020 at 03:14:52PM +0100, Thomas Huth wrote:
> On 07/01/2020 13.54, Daniel P. Berrang=C3=A9 wrote:
> > On Tue, Jan 07, 2020 at 01:23:18PM +0100, Paolo Bonzini wrote:
> >> On 07/01/20 13:18, Thomas Huth wrote:
> >>> I don't think we need a separate priority parameter here. But IMHO it=
's
> >>>  really rather common practice to prioritize the last option. So whil=
e
> >>> it might be more "self-explanatory" to a CLI newbie if the first
> >>> occurrence got the highest priority, it might be rather confusing
> >>> instead for a CLI veteran...?
> >>
> >> Prioritising the last certainly makes sense for a choose-one-only
> >> option, but I'm not sure it's the same for a choose-best option.  Afte=
r
> >> all it was -machine accel=3Dkvm:tcg, not -machine accel=3Dtcg:kvm...
> >=20
> > IIUC, the main use case for specifying multiple accelerators is
> > so that lazy invokations can ask for a hardware virt, but then get
> > fallback to TCG if not available. For things that should be platform
> > portabile, there's more than just kvm to consider though, as we have
> > many accelerators.  Listing all possible accelerators is kind of
> > crazy though no matter what the syntax is.
> >=20
> > How about taking a completely different approach, inspired by the
> > -cpu arg and implement:
> >=20
> >     -machine accel=3Dbest
>=20
> Something like that sounds like the best solution to me, but I'd maybe
> rather not call it "best", since the definition of "best" might depend
> on your use-case (e.g. do you want to use a CPU close to the host or
> something different which might be better emulated by TCG?).
>
> What about "-accel any" or "-accel fastest" or something similar?

If there are many HW virt accelerators on a host, "fastest" might
not be what we optimize for - we might prefer the more feature
complete one even if theoeretically slower.

I suggested "best" as it intentionally somewhat vague about what
particular criteria it optimizes for. I would document it as

   "best: attempt to use a hardware virt accelerator for this
          platform. Falls back to emulation if none is available
          for use."

Utimately though this is just bikeshedding & I don't care much
about the specific name choice, just the general concept.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


