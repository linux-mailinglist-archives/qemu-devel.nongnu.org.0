Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC2031F973
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 13:37:02 +0100 (CET)
Received: from localhost ([::1]:49372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD51p-0000EY-HN
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 07:37:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lD4ci-0006Se-CV
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:11:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lD4ce-0004aR-JI
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:11:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613736659;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=45Dm/mZfrJbWzizoN9wLVx4pShqBQ+9iMXBHgbG5TR0=;
 b=VIcFCYwwxZkaEh9FI7T3JH5HW0ogcVtMvS+Wvssi+66HaS5X2mizXEwZV/tQUMLi+YSNql
 fO24TCnW+MG1GPHHSW/G7cPjtW0awyoyfgsENRgbU08yQBXihWkUBOQp0Ck9kesZsXcUaI
 yNBJQ8Jb+oFqz3zQPWLTIfyBBafK4gI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-AFE5aQfpPteMhmzp8Pa9qA-1; Fri, 19 Feb 2021 07:10:43 -0500
X-MC-Unique: AFE5aQfpPteMhmzp8Pa9qA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDEB1100A8E9;
 Fri, 19 Feb 2021 12:10:40 +0000 (UTC)
Received: from redhat.com (ovpn-113-184.ams2.redhat.com [10.36.113.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 653155C1BB;
 Fri, 19 Feb 2021 12:10:30 +0000 (UTC)
Date: Fri, 19 Feb 2021 12:10:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/7] hw/boards: Introduce 'kvm_supported' field to
 MachineClass
Message-ID: <YC+qs7R140qAWnJY@redhat.com>
References: <20210219114428.1936109-1-philmd@redhat.com>
 <20210219114428.1936109-3-philmd@redhat.com>
 <YC+nxWnB+eaiq736@redhat.com>
 <CAFEAcA-A=TG43w2yNfrDwCgYYNZBEa25cM_yYgREfQyKa=PZEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-A=TG43w2yNfrDwCgYYNZBEa25cM_yYgREfQyKa=PZEQ@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Cornelia Huck <cohuck@redhat.com>, kvm-devel <kvm@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Leif Lindholm <leif@nuviainc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 19, 2021 at 12:08:05PM +0000, Peter Maydell wrote:
> On Fri, 19 Feb 2021 at 11:58, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > Is the behaviour reported really related to KVM specifically, as opposed
> > to all hardware based virt backends ?
> >
> > eg is it actually a case of some machine types being  "tcg_only" ?
> 
> Interesting question. At least for Arm the major items are:
>  * does the accelerator support emulation of EL3/TrustZone?
>    (KVM doesn't; this is the proximate cause of the assertion
>    failure if you try to enable KVM for the raspi boards.)
>  * does the board type require a particular CPU type which
>    KVM doesn't/can't support?
> Non-KVM accelerators could at least in theory have different answers
> to those questions, though in practice I think they do not.
> 
> I think my take is that we probably should mark the boards
> as 'tcg-only' vs 'not-tcg-only', because in practice that's
> the interesting distinction. Specifically, our security policy
> https://qemu.readthedocs.io/en/latest/system/security.html
> draws a boundary between "virtualization use case" and
> "emulated", so it's really helpful to be able to say clearly
> "this board model does not support virtualization, and therefore
> any bugs in it or its devices are simply outside the realm of
> being security issues" when doing analysis of the codebase or
> when writing or reviewing new code.

Oh, yes, that is useful to correlate with.

> If we ever have support for some new accelerator type where there's
> a board type distinction between KVM and that new accelerator and
> it makes sense to try to say "this board is supported by the new
> thing even though it won't work with KVM", the folks interested in
> adding that new accelerator will have the motivation to look
> into exactly which boards they want to enable support for and
> can add a funky_accelerator_supported flag or whatever at that time.
> 
> Summary: we should name this machine class field
> "virtualization_supported" and check it in all the virtualization
> accelerators (kvm, hvf, whpx, xen).

Agreed.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


