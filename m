Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AD72517C1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 13:36:57 +0200 (CEST)
Received: from localhost ([::1]:34654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAXG4-00078C-4g
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 07:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAXF5-0006Jm-74
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 07:35:55 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:55542
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAXF3-00085r-6E
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 07:35:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598355352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kOqpVTItpb56DxKAMvR5DSj01FFfKZR19Xaj5CjUPao=;
 b=ivBnY8Qo4qpigoghddwO8YG2nXqMI8cO1L6PBfdgFNEKnZ+MrPgWuWCX/Oz71CyGoauNVy
 +DwbS3lhTeaFeC1tbzZCLZ16+MVQr8uTKjgfVQ3ABvH84yOfrVfd2om9ZaMcmC7Can7zvG
 7O/OQeiu3iu4idHskF1fdSQ+AOrTPYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-6ToQSs2UOPKU_Jkda43RUA-1; Tue, 25 Aug 2020 07:35:50 -0400
X-MC-Unique: 6ToQSs2UOPKU_Jkda43RUA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34BB110ABDAD;
 Tue, 25 Aug 2020 11:35:49 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAFEF709D2;
 Tue, 25 Aug 2020 11:35:48 +0000 (UTC)
Date: Tue, 25 Aug 2020 07:35:48 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [PATCH v2 19/58] hvf: Move HVFState typedef to hvf.h
Message-ID: <20200825113548.GT642093@habkost.net>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
 <20200820001236.1284548-20-ehabkost@redhat.com>
 <20200821112355.GC89922@SPB-NB-133.local>
MIME-Version: 1.0
In-Reply-To: <20200821112355.GC89922@SPB-NB-133.local>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 01:35:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 21, 2020 at 02:23:55PM +0300, Roman Bolshakov wrote:
> On Wed, Aug 19, 2020 at 08:11:57PM -0400, Eduardo Habkost wrote:
> > Move typedef closer to the type check macros, to make it easier
> > to convert the code to OBJECT_DEFINE_TYPE() in the future.
> > 
> > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> > Changes v1 -> v2: none
> > 
> > ---
> > Cc: Cameron Esfahani <dirty@apple.com>
> > Cc: Roman Bolshakov <r.bolshakov@yadro.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Richard Henderson <rth@twiddle.net>
> > Cc: Eduardo Habkost <ehabkost@redhat.com>
> > Cc: qemu-devel@nongnu.org
> > ---
> >  include/sysemu/hvf.h       | 1 +
> >  target/i386/hvf/hvf-i386.h | 4 ++--
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/sysemu/hvf.h b/include/sysemu/hvf.h
> > index d3bed80ea8..760d6c79a2 100644
> > --- a/include/sysemu/hvf.h
> > +++ b/include/sysemu/hvf.h
> > @@ -35,6 +35,7 @@ void hvf_vcpu_destroy(CPUState *);
> >  
> >  #define TYPE_HVF_ACCEL ACCEL_CLASS_NAME("hvf")
> >  
> > +typedef struct HVFState HVFState;
> 
> Forward declaration of HVFState is missed before the typedef.

Why is that an issue?

-- 
Eduardo


