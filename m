Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDB225C694
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 18:21:05 +0200 (CEST)
Received: from localhost ([::1]:59660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDryy-0000JL-R9
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 12:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDrxs-0007q9-0N
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 12:19:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59216
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDrxq-00013J-IM
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 12:19:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599149993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m8enFmEO7qliwVdr2nq551eepepJrkvxFa4Aty2d3vU=;
 b=NPnYXJpbyOBPEI3jCPvsbWp37e55k9IknoeD0wClcv0XL3ZKspPWkxkQAeIDY7vxeWgKTb
 T2Uabg7XYwNbB9tGl40XgH+mvUZq6x7phy1+09wkEx3SvaJvYnt9roh1aF+CtIIpGm1AbR
 JLAmnamsPuWIKGh7f5zoRxJ2SUhxG6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-cdNe9nNQPZuto4wwk2aiPQ-1; Thu, 03 Sep 2020 12:19:52 -0400
X-MC-Unique: cdNe9nNQPZuto4wwk2aiPQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34ACD425DA
 for <qemu-devel@nongnu.org>; Thu,  3 Sep 2020 16:19:51 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9BDC10013D9;
 Thu,  3 Sep 2020 16:19:47 +0000 (UTC)
Date: Thu, 3 Sep 2020 12:19:46 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 15/63] i8259: Rename TYPE_I8259 to TYPE_PIC
Message-ID: <20200903161946.GI4940@habkost.net>
References: <20200902224311.1321159-1-ehabkost@redhat.com>
 <20200902224311.1321159-16-ehabkost@redhat.com>
 <bb2d291d-158f-0e79-e384-f6d011b4922e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bb2d291d-158f-0e79-e384-f6d011b4922e@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:58:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, berrange@redhat.com,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 03, 2020 at 02:47:33PM +0200, Philippe Mathieu-Daudé wrote:
> On 9/3/20 12:42 AM, Eduardo Habkost wrote:
> > This will make the type name constant consistent with the name of
> > the type checking macro.
> > 
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: qemu-devel@nongnu.org
> > ---
> >  hw/intc/i8259.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
> > index 344fd04db1..e536cc90be 100644
> > --- a/hw/intc/i8259.c
> > +++ b/hw/intc/i8259.c
> > @@ -37,10 +37,10 @@
> >  
> >  //#define DEBUG_IRQ_LATENCY
> >  
> > -#define TYPE_I8259 "isa-i8259"
> > +#define TYPE_PIC "isa-i8259"
> 
> I disagree with this patch, as we have various PIC and only one I8259.

Like in the I8254 case, I agree with your point.  I will suggest
renaming the PIC macro to I8259 instead.

-- 
Eduardo


