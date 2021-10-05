Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24F0422160
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 10:58:03 +0200 (CEST)
Received: from localhost ([::1]:44796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXgGw-0004tp-PB
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 04:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mXg8Y-0003ng-UL
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:49:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mXg8W-0003SV-0E
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:49:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633423758;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qo3yrDkYWvWUkY6aQ18Y3cfoUxcGsVAVCVZ7hJbvMQ8=;
 b=OCKGeg/EZWiebiG9Zp8GvMT+zd+t7azrmB3a/KXGLImBsmlqafvNmLu9J6NNREcRIL7dpo
 sPHC6to+QN0UhgRCH6x6FN4cG5pBtsELF8w9u/dAc1lJ4tlH7nSgUFvSQhYMEK3JL93NDQ
 5tcaEzWYB+oadm9IgFxQ4AAiGh0ZHko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-zYhsPyR6M5CQghsra9lo7g-1; Tue, 05 Oct 2021 04:49:17 -0400
X-MC-Unique: zYhsPyR6M5CQghsra9lo7g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7410E19057A1;
 Tue,  5 Oct 2021 08:49:14 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47FE160C05;
 Tue,  5 Oct 2021 08:49:03 +0000 (UTC)
Date: Tue, 5 Oct 2021 09:49:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
Message-ID: <YVwRfETMFxFKuXO1@redhat.com>
References: <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com>
 <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 dbarboza@redhat.com, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 06:44:23AM +0200, Christophe Leroy wrote:
> 
> 
> Le 05/10/2021 à 02:48, David Gibson a écrit :
> > On Fri, Oct 01, 2021 at 04:18:49PM +0200, Thomas Huth wrote:
> > > On 01/10/2021 15.04, Christophe Leroy wrote:
> > > > 
> > > > 
> > > > Le 01/10/2021 à 14:04, Thomas Huth a écrit :
> > > > > On 01/10/2021 13.12, Peter Maydell wrote:
> > > > > > On Fri, 1 Oct 2021 at 10:43, Thomas Huth <thuth@redhat.com> wrote:
> > > > > > > Nevertheless, as long as nobody has a hint where to find that
> > > > > > > ppc405_rom.bin, I think both boards are pretty useless in QEMU (as far as I
> > > > > > > can see, they do not work without the bios at all, so it's
> > > > > > > also not possible
> > > > > > > to use a Linux image with the "-kernel" CLI option directly).
> > > > > > 
> > > > > > It is at least in theory possible to run bare-metal code on
> > > > > > either board, by passing either a pflash or a bios argument.
> > > > > 
> > > > > True. I did some more research, and seems like there was once
> > > > > support for those boards in u-boot, but it got removed there a
> > > > > couple of years ago already:
> > > > > 
> > > > > https://gitlab.com/qemu-project/u-boot/-/commit/98f705c9cefdf
> > > > > 
> > > > > https://gitlab.com/qemu-project/u-boot/-/commit/b147ff2f37d5b
> > > > > 
> > > > > https://gitlab.com/qemu-project/u-boot/-/commit/7514037bcdc37
> > > > > 
> > > > > > But I agree that there seem to be no signs of anybody actually
> > > > > > successfully using these boards for anything, so we should
> > > > > > deprecate-and-delete them.
> > > > > 
> > > > > Yes, let's mark them as deprecated now ... if someone still uses
> > > > > them and speaks up, we can still revert the deprecation again.
> > > > 
> > > > I really would like to be able to use them to validate Linux Kernel
> > > > changes, hence looking for that missing BIOS.
> > > > 
> > > > If we remove ppc405 from QEMU, we won't be able to do any regression
> > > > tests of Linux Kernel on those processors.
> > > 
> > > If you/someone managed to compile an old version of u-boot for one of these
> > > two boards, so that we would finally have something for regression testing,
> > > we can of course also keep the boards in QEMU...
> > 
> > I can see that it would be usefor for some cases, but unless someone
> > volunteers to track down the necessary firmware and look after it, I
> > think we do need to deprecate it - I certainly don't have the capacity
> > to look into this.
> > 
> 
> I will look at it, please allow me a few weeks though.

Once something is deprecated, it remains in QEMU for a minimum of two
release cycles, before being deleted. At any time in that deprecation
period it can be returned to supported status, if someone provides a
good enough justification to keep it.

IOW, we can deprecate this now, and you still have plenty of time to
investigate more.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


