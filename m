Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2197133901B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:35:35 +0100 (CET)
Received: from localhost ([::1]:49204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKit3-0000Q7-TI
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:35:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lKiGI-0007NC-L8
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:55:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lKiGG-0003zr-G1
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:55:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615557327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W7yfDTp+20tHMI7sZqJLmuEmzUa0qo67STQrMlepndw=;
 b=fsAaMRDyDPdzvSWW8ts+O5vkTdS2qOSgmfOCuyw+I3jhY1rvOwGvnZI9Vzp5brSK8wDboo
 vRM+wqVW3QdQ2vFibuUPArBVcTdSV1/7lEkKuPSupizWhpOhHFZlaVhwmoGfn4419g0c+S
 dnvLB7HqurucmN4Ngd4QBlSL9MRNA1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-44ihymx-OHK5guMH0TM0VA-1; Fri, 12 Mar 2021 08:55:26 -0500
X-MC-Unique: 44ihymx-OHK5guMH0TM0VA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C8D8839A42;
 Fri, 12 Mar 2021 13:55:24 +0000 (UTC)
Received: from gondolin (ovpn-113-3.ams2.redhat.com [10.36.113.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95D865C1D1;
 Fri, 12 Mar 2021 13:55:19 +0000 (UTC)
Date: Fri, 12 Mar 2021 14:55:16 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH] s390x/cpu_model: use official name for 8562
Message-ID: <20210312145516.6d7a9a63.cohuck@redhat.com>
In-Reply-To: <2dd31caa-0263-191d-f7ed-8471282403b2@de.ibm.com>
References: <20210311132746.1777754-1-cohuck@redhat.com>
 <2dd31caa-0263-191d-f7ed-8471282403b2@de.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Mar 2021 14:48:17 +0100
Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> On 11.03.21 14:27, Cornelia Huck wrote:
> > The single-frame z15 is called "z15 T02".
> > 
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>  
> 
> Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
> > ---
> >   target/s390x/cpu_models.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
> > index dd474c5e9ad1..b59ed4135615 100644
> > --- a/target/s390x/cpu_models.c
> > +++ b/target/s390x/cpu_models.c
> > @@ -87,7 +87,7 @@ static S390CPUDef s390_cpu_defs[] = {
> >       CPUDEF_INIT(0x3906, 14, 2, 47, 0x08000000U, "z14.2", "IBM z14 GA2"),
> >       CPUDEF_INIT(0x3907, 14, 1, 47, 0x08000000U, "z14ZR1", "IBM z14 Model ZR1 GA1"),
> >       CPUDEF_INIT(0x8561, 15, 1, 47, 0x08000000U, "gen15a", "IBM z15 GA1"),  
> 
> you could also change that formn "z15" to "z15 T01"
> > -    CPUDEF_INIT(0x8562, 15, 1, 47, 0x08000000U, "gen15b", "IBM 8562 GA1"),
> > +    CPUDEF_INIT(0x8562, 15, 1, 47, 0x08000000U, "gen15b", "IBM z15 T02 GA1"),
> >   };
> >   
> >   #define QEMU_MAX_CPU_TYPE 0x2964
> >   
> 

I now have:

Author: Cornelia Huck <cohuck@redhat.com>
Date:   Thu Mar 11 14:27:46 2021 +0100

    s390x/cpu_model: use official name for 8562
    
    The single-frame z15 is called "z15 T02" (and the multi-frame z15
    "z15 T01").
    
    Signed-off-by: Cornelia Huck <cohuck@redhat.com>
    Reviewed-by: David Hildenbrand <david@redhat.com>
    Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
    Message-Id: <20210311132746.1777754-1-cohuck@redhat.com>

diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index dd474c5e9ad1..050dcf2d42d2 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -86,8 +86,8 @@ static S390CPUDef s390_cpu_defs[] = {
     CPUDEF_INIT(0x3906, 14, 1, 47, 0x08000000U, "z14", "IBM z14 GA1"),
     CPUDEF_INIT(0x3906, 14, 2, 47, 0x08000000U, "z14.2", "IBM z14 GA2"),
     CPUDEF_INIT(0x3907, 14, 1, 47, 0x08000000U, "z14ZR1", "IBM z14 Model ZR1 GA1"),
-    CPUDEF_INIT(0x8561, 15, 1, 47, 0x08000000U, "gen15a", "IBM z15 GA1"),
-    CPUDEF_INIT(0x8562, 15, 1, 47, 0x08000000U, "gen15b", "IBM 8562 GA1"),
+    CPUDEF_INIT(0x8561, 15, 1, 47, 0x08000000U, "gen15a", "IBM z15 T01 GA1"),
+    CPUDEF_INIT(0x8562, 15, 1, 47, 0x08000000U, "gen15b", "IBM z15 T02 GA1"),
 };
 
 #define QEMU_MAX_CPU_TYPE 0x2964


