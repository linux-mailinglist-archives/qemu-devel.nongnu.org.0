Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDF021F2FC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 15:50:20 +0200 (CEST)
Received: from localhost ([::1]:53516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvLK7-00043P-S8
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 09:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jvLJ9-00030c-Ca
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 09:49:19 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60178
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jvLJ7-0002Jy-1G
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 09:49:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594734554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N1wHCF3Kvfbi4dK5MMfOi8XeK63D0zyFjPfS/rtqJXE=;
 b=fuqNw3N9FOnS8KNQEwwy3p51Cyj8fPqbEqCkcvNfADVuloWPD2hqY8PIU/av9gpy9bUwam
 S28zhS1qiAkYt72aYOMi6RSoHqfwAhJy1v+gh1M5DEx4T8VMXT/dlX8nwoCkTPO6Mkghd9
 rZ9ogKiZDMi6YznV9lIAj98KXj0ZDKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-0YRptK_hPIW3Tg3UBWaNhw-1; Tue, 14 Jul 2020 09:49:13 -0400
X-MC-Unique: 0YRptK_hPIW3Tg3UBWaNhw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDE731940939;
 Tue, 14 Jul 2020 13:49:00 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-8.ams2.redhat.com [10.36.114.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7326B100238D;
 Tue, 14 Jul 2020 13:48:58 +0000 (UTC)
Date: Tue, 14 Jul 2020 15:48:56 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: introduce cve or security quotient field
Message-ID: <20200714134856.GC5120@linux.fritz.box>
References: <20200714083631.888605-1-ppandit@redhat.com>
 <20200714083631.888605-2-ppandit@redhat.com>
 <CAFEAcA9QWLmi1fGuPW93GXFKV2KCwNs6Xp3U9MU2r4wtendzhg@mail.gmail.com>
 <20200714095233.GC25187@redhat.com>
 <20200714060916-mutt-send-email-mst@kernel.org>
 <CAFEAcA_ca4JN655GW=eGyjrjDmiv0EktaZZ7RMghO5rBwm9tGQ@mail.gmail.com>
 <20200714064921-mutt-send-email-mst@kernel.org>
 <20200714133021.GF25187@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200714133021.GF25187@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/14 03:57:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Prasad J Pandit <pjp@fedoraproject.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, P J P <ppandit@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.07.2020 um 15:30 hat Daniel P. Berrangé geschrieben:
> On Tue, Jul 14, 2020 at 07:02:59AM -0400, Michael S. Tsirkin wrote:
> > On Tue, Jul 14, 2020 at 11:22:28AM +0100, Peter Maydell wrote:
> > > On Tue, 14 Jul 2020 at 11:12, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > And for people who want to build QEMU with lots of functionality (like
> > > > Fedora does), I think a -security flag would be a useful addition.
> > > > We can then tell security researchers "only a high security issue
> > > > if it reproduces with -security=high, only a security issue
> > > > if it reproduces with -security=low".
> > > 
> > > I think a -security option would also be useful to users -- it
> > > makes it easier for them to check "is this configuration using
> > > something that I didn't realize was not intended to be secure".
> > > For me, something useful for our users is much more compelling
> > > than "this might make security researchers' lives a bit easier".
> > > 
> > > thanks
> > > -- PMM
> > 
> > True. And I guess downstreams can also force the option to high or set the
> > default to high rather easily if they want to.
> > 
> > So the option would be:
> > 
> > -security level
> > 	Set minimal required security level of QEMU.
> > 
> > 	high: block use of QEMU functionality which is intended to be secure against
> > 		malicious guests.
> > 	low: allow use of all QEMU functionality, best effort security
> > 		against malicious guests.
> > 
> > Default would be -security low.
> > 
> > Does this look reasonable?
> 
> The challenge I see is that wiring up a runtime flag into every relevant
> part of the QEMU codebase is an pretty large amount of work. Every device,
> every machine type, every backend type, every generic subsystem will all
> need checks for this flag. It is possible, but it isn't going to be quick
> or easy, especially with poor error reporting support in many areas.

Would it make more sense as a configure flag that decides whether or not
to compile in potentially problematic devices/backends?

Kevin


