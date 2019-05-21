Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 677CE2592C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 22:44:02 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59212 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTBc9-00024Z-4B
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 16:44:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hTBZn-0000pa-78
	for qemu-devel@nongnu.org; Tue, 21 May 2019 16:41:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hTBVw-0003vq-UM
	for qemu-devel@nongnu.org; Tue, 21 May 2019 16:37:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38070)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hTBVu-0003q6-9J
	for qemu-devel@nongnu.org; Tue, 21 May 2019 16:37:34 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ABB11C04B2F6;
	Tue, 21 May 2019 20:37:20 +0000 (UTC)
Received: from localhost (ovpn-116-14.gru2.redhat.com [10.97.116.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 224436012E;
	Tue, 21 May 2019 20:37:14 +0000 (UTC)
Date: Tue, 21 May 2019 17:37:12 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: John Snow <jsnow@redhat.com>
Message-ID: <20190521203712.GO10764@habkost.net>
References: <20190520184108.GA10764@habkost.net>
	<20190521085350.GF25835@redhat.com>
	<e2395213-efaf-6d6c-6cfd-d949d071b4f6@redhat.com>
	<87pnobrg37.fsf@dusky.pond.sub.org>
	<CAFEAcA8db=UsyU_kRBoatFT2ULQBqL318xRhg+CV4D_7hV76Og@mail.gmail.com>
	<7e468375-ca5f-0048-789e-c41d09065eeb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e468375-ca5f-0048-789e-c41d09065eeb@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 21 May 2019 20:37:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] Introducing GSoC project: API Documentation
 Generation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Gabriel Barreto <sbarreto.gabriel@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, "Emilio G. Cota" <cota@braap.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 21, 2019 at 04:32:35PM -0400, John Snow wrote:
> 
> 
> On 5/21/19 11:27 AM, Peter Maydell wrote:
> > On Tue, 21 May 2019 at 16:18, Markus Armbruster <armbru@redhat.com> wrote:
> >> Anyway.  What's so special about QEMU that justifies coming up with our
> >> own doc syntax?  Other than "we made a hash of it, and cleaning it up
> >> would be work".
> > 
> > The major problem as far as kernel-doc is concerned is that
> > it somewhat bakes in the kernel's style choice that the
> > 'struct' keyword is not hidden behind typedefs, and so it
> > gets a bit confused by QEMU's "use typedefs for struct types"
> > style. The rest, as you say, is just a matter of fixing up
> > our syntax errors.
> > 
> > thanks
> > -- PMM
> > 
> 
> But this is the one we're going with? Do we have a plan for teaching it
> not to panic for our use of named custom types?

If I understood correctly, the patch from Paolo that I have
forwarded to this thread is all we need.  Are there other issues
with kernel-doc we would still need to address?

-- 
Eduardo

