Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3CE1E0E2C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 May 2020 14:14:27 +0200 (CEST)
Received: from localhost ([::1]:56654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdBzu-00076S-Ik
	for lists+qemu-devel@lfdr.de; Mon, 25 May 2020 08:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jdBxe-0005Ap-Uy
 for qemu-devel@nongnu.org; Mon, 25 May 2020 08:12:06 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:59796
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jdBxd-00011W-9y
 for qemu-devel@nongnu.org; Mon, 25 May 2020 08:12:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590408723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nherA5lmGQV50MTBRf8qD+cw5liSvRa19a1ifbrdpwI=;
 b=C6GG0773LSgK8FPPMtGXDTpsnk60g6FMrOwJMSWPF+99uejXNMSXJ9rfdmz1Ki2fBe+DFE
 AofUe6utoVCkuA5hB60OfaSW6F0AMVI2ODck9FNxzcgR9S62WENrRA3UAJ2dzwcAFmSLlT
 jcGZPOSEzyaV6yCnyeANpcYRyxkD33o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-xhpsipWeOuuZmfJeSWwM3A-1; Mon, 25 May 2020 08:12:00 -0400
X-MC-Unique: xhpsipWeOuuZmfJeSWwM3A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5B9F835B40;
 Mon, 25 May 2020 12:11:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 895F05D788;
 Mon, 25 May 2020 12:11:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 66E5A16E16; Mon, 25 May 2020 14:11:54 +0200 (CEST)
Date: Mon, 25 May 2020 14:11:54 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 22/22] [RfC] acpi: flip default to off for microvm
Message-ID: <20200525121154.hrgfjrcz7r3sazqr@sirius.home.kraxel.org>
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-23-kraxel@redhat.com>
 <20200521123624.4f50fcf7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200521123624.4f50fcf7@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 02:40:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 21, 2020 at 12:36:24PM +0200, Igor Mammedov wrote:
> On Wed, 20 May 2020 15:20:03 +0200
> Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >  hw/i386/microvm.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> > index 602c6a8f75f3..b5c445b5403b 100644
> > --- a/hw/i386/microvm.c
> > +++ b/hw/i386/microvm.c
> > @@ -517,6 +517,7 @@ static void microvm_machine_initfn(Object *obj)
> >  static void microvm_class_init(ObjectClass *oc, void *data)
> >  {
> >      MachineClass *mc = MACHINE_CLASS(oc);
> > +    X86MachineClass *x86mc = X86_MACHINE_CLASS(oc);
> >  
> >      mc->init = microvm_machine_state_init;
> >  
> > @@ -537,6 +538,9 @@ static void microvm_class_init(ObjectClass *oc, void *data)
> >      /* Machine class handlers */
> >      mc->reset = microvm_machine_reset;
> >  
> > +    /* acpi is off by default */
> > +    x86mc->acpi_default = false;
> 
> Since we don't care about compat stuff for microvm yet,
> I'd preffer default 'on', as in long run it allows to boot larger range of guests
> without need for tuning QEMU and guest configuration
> (i.e. it's the least troublesome case for ordinary user)

I fully agree and I'll happily drop patches 21+22 and have microvm
default to acpi=on.  See also:
   https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg01315.html

Older patch versions got multiple review comments asking for acpi=off by
default, so I've added these two patches as RfC to show how this could
be done.  RfC because (1) the topic is controversial and (2) these are
not final.  I'd move 21/22 up in the series and squash 22/22 into the
"add acpi to microvm" patch in case we decide for acpi=off as default.

take care,
  Gerd


