Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B979D133E87
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 10:48:50 +0100 (CET)
Received: from localhost ([::1]:41180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ip7xJ-00045P-Hc
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 04:48:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49564)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1ip7wH-0003ZE-PW
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 04:47:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1ip7wF-0007C9-QH
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 04:47:44 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54070
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1ip7wD-0007Av-Vp
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 04:47:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578476860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mx4ZvzSk+Nefx14K2LQ13Rj1gZT1s/euld6djsG8w+w=;
 b=CnazWr57A/PGZa+W9CwWOeg+5PuQsJk/uknLtEeHHbntR7E4HOMn2qpXwwl9VyS3rIEPaN
 blAduZ+fGPLT0aZovL+4JiTSppFckN78ELBp0/Q7NMuWlrgtvURsI2D1M+Z4wl3qT3BDYo
 UPhFCehkNjO+Rwfd8wNlGf05+BatcJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-HbH4RQCmPZmWRXxW8r4_cQ-1; Wed, 08 Jan 2020 04:47:38 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CA43800D50;
 Wed,  8 Jan 2020 09:47:37 +0000 (UTC)
Received: from dhcp-200-226.str.redhat.com (dhcp-200-226.str.redhat.com
 [10.33.200.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D26EF100164D;
 Wed,  8 Jan 2020 09:47:25 +0000 (UTC)
Date: Wed, 8 Jan 2020 10:47:24 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Christophe de Dinechin <dinechin@redhat.com>
Subject: Re: Priority of -accel (was: [PATCH] tests/qemu-iotests: Update
 tests to recent desugarized -accel option)
Message-ID: <20200108094724.GB5057@dhcp-200-226.str.redhat.com>
References: <20200106130951.29873-1-philmd@redhat.com>
 <c493e693-13a7-7dc4-eb2d-5dbc7b3053f1@redhat.com>
 <12334054-4ae7-e580-9727-2d322bfa2bda@redhat.com>
 <1A5859EA-4403-4921-B527-DFD07C59C702@redhat.com>
 <360fa010-ba80-b02b-3a35-19c2b48a462d@redhat.com>
 <5FB9F11E-77DC-4FD6-B780-AB508DD42B42@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5FB9F11E-77DC-4FD6-B780-AB508DD42B42@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: HbH4RQCmPZmWRXxW8r4_cQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.01.2020 um 18:43 hat Christophe de Dinechin geschrieben:
> > It would break backwards compatibility for "-machine accel=3Dtcg:kvm",
> > which so far meant "use TCG if compiled in, otherwise use KVM".  This i=
s
> > not something I would have a problem with... except that "tcg:kvm" is
> > the default if no -accel option is provided!
>=20
> What is the rationale for picking tcg over kvm?
>=20
> My guess is that when this was selected, KVM was the new fancy unstable
> thing and this was deemed the safe choice. My other guess is that this wa=
s
> around 1907 or so :-) My third guess is that you will probably provide me
> with a much better rationale ;-)

I know I intentionally disabled KVM in the past for debugging guests
because TCG allowed a few more things there (most of -d doesn't do
anything with KVM, and I think the gdb stub also had some restrictions).

Requiring an explicit '-accel tcg' for such cases might be reasonable
enough, though.

(And if we make this change and therefore break with the habit that
Peter mentioned - leaving defaults unchanged - could we make more
changes that better reflect a typical use case today? For example, I
doubt most people can do with only 128 MB of RAM in the guest.)

Kevin


