Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9E716ADF9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 18:46:40 +0100 (CET)
Received: from localhost ([::1]:40288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6HoV-0003wQ-Nb
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 12:46:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52703)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1j6HnH-00034U-HM
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 12:45:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1j6HnF-0003Xi-5s
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 12:45:22 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45004
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1j6HnF-0003X7-17
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 12:45:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582566320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WlPPsno0+P5tgPCYJttfZKtXjvBJ1U2H9vuTIDWQGvs=;
 b=F+WCV8QmiFMdY9FOaF0GbUBU5o51eG8xVpPgNg5afCcgS4TDUUaSdiCtroBX3yaJovVC4g
 oTEAdPrcQ+Oc/H9F9/uvVRs+S+iUa+qL8khMn5vXGIWFJQK3d/cn0uqsU94Lt+YLYgrxwL
 zx+hNzJowQGvDmkmnbYTHRzhyD56RgI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-XaisS1rrMxmhWeN8YHjb_w-1; Mon, 24 Feb 2020 12:45:18 -0500
X-MC-Unique: XaisS1rrMxmhWeN8YHjb_w-1
Received: by mail-qv1-f71.google.com with SMTP id dc2so9683728qvb.7
 for <qemu-devel@nongnu.org>; Mon, 24 Feb 2020 09:45:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y5L6KGN8szEsuiDDKAFgF9m+VDMviEhY+SfsdRxH4ds=;
 b=IIQOo3sylA+PicIqIS06T4SP3XlqQtzUe0v72H7oBaXMCmBAsFWXlRW8uT2I6DihQa
 iEmLOUCHrrxANnhF5zhmqkf5TG1meleKMq533+KXr8Kd+a/4i3hIGT321zVHombBtsAQ
 mAPrYjlr/uSfcyPowOk20edqLlMXCAZyEzRPwFMFF5ykH9RIE0426CrI1PDMFVvNL3+G
 FDwsKOarC6WpAEokS/yQsSj/h+VU60mK1tzjW5zMCYRTBOM7sOLvU57ygWTzhYjrxn8h
 SH/+k0YGthTtp0e7hUwicDPgDJZY08uxcvGCobFFQhnX0LL74KAecmgrNNj0KerFbeSV
 xmDA==
X-Gm-Message-State: APjAAAUlVUps0iuTz35lF4zcqplg7HNMvjaVVM/l738gGG/+Y1uchYTQ
 sC52Wh69bDBse1BpNOxihW/su56iZTV/2rKOsYKPZ4dpBs68xoMaFTeh7LUCysuJ1jrF97HjsNa
 ksHNwBZYjKdnsylQ=
X-Received: by 2002:a0c:eacb:: with SMTP id y11mr46483644qvp.68.1582566317785; 
 Mon, 24 Feb 2020 09:45:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqzD+DPB/jeC9XHICOHJzVv5cGIrHrS7nePasyupoiU2BDNG222h8lCZwJNAXt4g88b/yNJ7SA==
X-Received: by 2002:a0c:eacb:: with SMTP id y11mr46483609qvp.68.1582566317515; 
 Mon, 24 Feb 2020 09:45:17 -0800 (PST)
Received: from xz-x1 ([104.156.64.75])
 by smtp.gmail.com with ESMTPSA id g53sm6347474qtk.76.2020.02.24.09.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 09:45:16 -0800 (PST)
Date: Mon, 24 Feb 2020 12:45:15 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 00/13] migrate/ram: Fix resizing RAM blocks while
 migrating
Message-ID: <20200224174515.GJ37727@xz-x1>
References: <20200221164204.105570-1-david@redhat.com>
 <20200221180440.GE37727@xz-x1>
 <d10b53cc-89f3-042b-9889-d16ea7572f42@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d10b53cc-89f3-042b-9889-d16ea7572f42@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Shannon Zhao <shannon.zhao@linaro.org>, Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 24, 2020 at 10:09:19AM +0100, David Hildenbrand wrote:
> On 21.02.20 19:04, Peter Xu wrote:
> > On Fri, Feb 21, 2020 at 05:41:51PM +0100, David Hildenbrand wrote:
> >> I was now able to actually test resizing while migrating. I am using t=
he
> >> prototype of virtio-mem to test (which also makes use of resizable
> >> allocations). Things I was able to reproduce:
> >=20
> > The test cases cover quite a lot.  Thanks for doing that.
> >=20
> >> - Resize while still running on the migration source. Migration is can=
celed
> >> -- Test case for "migraton/ram: Handle RAM block resizes during precop=
y"
> >=20
> >> - Resize (grow+shrink) on the migration target during postcopy migrati=
on
> >>   (when syncing RAM blocks), while not yet running on the target
> >> -- Test case for "migration/ram: Discard new RAM when growing RAM bloc=
ks
> >>    and the VM is stopped", and overall RAM size synchronization. Seems=
 to
> >>    work just fine.
> >=20
> > This won't be able to trigger without virtio-mem, right?
>=20
> AFAIK all cases can also be triggered without virtio-mem (not just that
> easily :) ). This case would be "RAM block is bigger on source than on
> destination.".
>=20
> >=20
> > And I'm also curious on how to test this even with virtio-mem.  Is
> > that a QMP command to extend/shrink virtio-mem?
>=20
> Currently, there is a single qom property that can be modifed via
> QMP/HMP - "requested-size". With resizable resizable memory backends,
> increasing the requested size will also implicitly grow the RAM block.
> Shrinking the requested size will currently result in shrinking the RAM
> block on the next reboot.
>=20
> So, to trigger growing of a RAM block (assuming requested-size was
> smaller before, e.g., 1000M)
>=20
> echo "qom-set vm1 requested-size 6000M" | sudo nc -U $MON
>=20
> To trigger shrinking (assuming requested-size was bigger before)
>=20
> echo "qom-set vm1 requested-size 100M" | sudo nc -U $MON
> echo 'system_reset' | sudo nc -U $MON
>=20
>=20
> Placing these at the right spots during a migration allows to test this
> very reliably.

I see, thanks for the context.  The question was majorly about when
you say "during postcopy migration (when syncing RAM blocks), while
not yet running on the target" - it's not easy to do so imho, because:

  - it's a very short transition period between precopy and postcopy,
    so I was curious about how you made sure that the grow/shrink
    happened exactly during that period

  - during the period, IIUC it was still in the main thread, which
    means logically QEMU should not be able to respond to any QMP/HMP
    command at all...  So even if you send a command, I think it'll
    only be executed later after the transition completes

  - this I'm not sure, but ... even for virtio-mem, the resizing can
    only happen after guest ack it, right?  During the precopy to
    postcopy transition period, the VM is stopped, AFAICT, so
    logically we can't trigger resizing during the transition

So it's really a question/matter of whether we still even need to
consider that transition period for resizing event for postcopy.
Maybe we don't even need to.

Thanks,

--=20
Peter Xu


