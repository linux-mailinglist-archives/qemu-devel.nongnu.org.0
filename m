Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E275625C78A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 18:56:36 +0200 (CEST)
Received: from localhost ([::1]:44738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDsXL-0008Ve-VJ
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 12:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDsWC-0007Lx-Fg
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 12:55:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDsW9-0006Yd-TO
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 12:55:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599152119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4gA54MDOFVg8MWzvqUShddu13u2PcM6g0YChuGpv+Yo=;
 b=BA2Us3VDqYK2bTqZYDyhkS5SLGIwkoAHvqGpS14zjMDU3bdG7HfmznArqkdPGKrsjsYIG8
 AyaJidV6scxJNYfGfjeWiVt7vgzg7H1zHGEo5pgQA7QRYBLbuT6WB/sG7+MWPEQnKOkFFY
 iaqxbDVhBFUytDGwjGuXNCQy77a3SZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-tQrQAq70NGyWcB1tTWNL9w-1; Thu, 03 Sep 2020 12:55:18 -0400
X-MC-Unique: tQrQAq70NGyWcB1tTWNL9w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7691B81F002
 for <qemu-devel@nongnu.org>; Thu,  3 Sep 2020 16:55:15 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D32C6198B;
 Thu,  3 Sep 2020 16:55:12 +0000 (UTC)
Date: Thu, 3 Sep 2020 12:55:11 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 14/63] i8254: Rename TYPE_I8254 to TYPE_PIT
Message-ID: <20200903165511.GP4940@habkost.net>
References: <20200902224311.1321159-1-ehabkost@redhat.com>
 <20200902224311.1321159-15-ehabkost@redhat.com>
 <9a2be0a5-1d7f-1813-5bdb-2c741f07c593@redhat.com>
 <20200903161809.GH4940@habkost.net>
 <20200903164429.GD441291@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200903164429.GD441291@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:47:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 03, 2020 at 05:44:29PM +0100, Daniel P. Berrangé wrote:
> On Thu, Sep 03, 2020 at 12:18:09PM -0400, Eduardo Habkost wrote:
> > On Thu, Sep 03, 2020 at 02:47:03PM +0200, Philippe Mathieu-DaudÃƒÂ© wrote:
> > > On 9/3/20 12:42 AM, Eduardo Habkost wrote:
> > > > This will make the type name constant consistent with the name of
> > > > the type checking macro.
> > > > 
> > > > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > > > ---
> > > > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > > Cc: qemu-devel@nongnu.org
> > > > ---
> > > >  include/hw/timer/i8254.h | 4 ++--
> > > >  hw/timer/i8254.c         | 4 ++--
> > > >  2 files changed, 4 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/include/hw/timer/i8254.h b/include/hw/timer/i8254.h
> > > > index 1a522a2457..ddd925074f 100644
> > > > --- a/include/hw/timer/i8254.h
> > > > +++ b/include/hw/timer/i8254.h
> > > > @@ -45,7 +45,7 @@ typedef struct PITCommonClass PITCommonClass;
> > > >  DECLARE_OBJ_CHECKERS(PITCommonState, PITCommonClass,
> > > >                       PIT_COMMON, TYPE_PIT_COMMON)
> > > >  
> > > > -#define TYPE_I8254 "isa-pit"
> > > > +#define TYPE_PIT "isa-pit"
> > > 
> > > I disagree with this patch, as we have various PIT and only one I8254.
> > 
> > I was unsure about this, and I agree with your point.  I will
> > suggest renaming the PIT macro to I8254 instead.
> 
> IMHO the macro name should be directly related to the object name
> string with non-alnum characters replaced by underscore.
> 
> ie since the object type is "isa-pit", then the macro should be
> TYPE_ISA_PIT

I think that's a good idea in this specific case because it's a
short name (I will do it).  But I don't think we'll be able to
always follow that rule, as the QOM type name is user-visible.

-- 
Eduardo


