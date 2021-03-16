Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759E233DDA5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 20:36:22 +0100 (CET)
Received: from localhost ([::1]:56648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMFUL-0003tV-GD
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 15:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lMElF-0006Zo-GV
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:49:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lMElD-0004x9-RB
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:49:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615920582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mFwOp3mbM8oLaBYPtvwS7W7nwrHxU8pBFinLLZ0lwSI=;
 b=G9q1ekQ4pr1faVBnbt3rjLUdHkfXevMXBQZzGY8KGWGx3d5cpweV168OFDomkLbgBqQoKN
 jun8DDPcLrPaxBMERyU+My6dkxG7Voa8EvtCwYGs4IwQD5P9/aW4qQcvNCn0WTe1ETghoi
 SVt+0J2mEd7T2151HkIor5h+iVVx+gg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-ttnC7vItNgiI21z2I8i9GQ-1; Tue, 16 Mar 2021 14:49:40 -0400
X-MC-Unique: ttnC7vItNgiI21z2I8i9GQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C06648189CA;
 Tue, 16 Mar 2021 18:49:38 +0000 (UTC)
Received: from localhost (unknown [10.40.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81E7E2C169;
 Tue, 16 Mar 2021 18:49:37 +0000 (UTC)
Date: Tue, 16 Mar 2021 19:49:35 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Windows 10 won't run on default x86_64 machine anymore
Message-ID: <20210316194935.65f591cf@redhat.com>
In-Reply-To: <6cd8d02b-aa48-5fa9-a1fb-bc3fea43b1e2@redhat.com>
References: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
 <20210315185302.29b0d90d@redhat.com>
 <YE/fUQRiFBfrWi5W@dropje.13thmonkey.org>
 <20210316015503.GA1008366@private.email.ne.jp>
 <20210316131304.220a53b9@redhat.com>
 <9e2e1d83-29c1-053a-fd43-187f6f824b39@redhat.com>
 <20210316141044.311688bb@redhat.com>
 <20210316174914.50efc26b@redhat.com>
 <6cd8d02b-aa48-5fa9-a1fb-bc3fea43b1e2@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
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
Cc: Reinoud Zandijk <reinoud@NetBSD.org>, qemu-devel@nongnu.org,
 Isaku Yamahata <isaku.yamahata@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Mar 2021 18:33:47 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 16/03/21 17:49, Igor Mammedov wrote:
> >                         | smm=on     | smm=off    |
> > --------------------------------------------------
> > QEMU6.0 pc-i440fx-5.2  |    pass    | pass       |
> > defaut smm-compat=on   |            |            |
> > --------------------------------------------------
> > QEMU6.0 pc-i440fx-6.0  |    pass    | fail       |
> > defaut smm-compat=off  |            |            |
> > -------------------------------------------------|
> > 
> > so it will break booting Windows on accelerators that do not support smm
> > by default starting from pc-i440fx-6.0 machine type.
> > 
> > It asserts in: 0xa5_FAILED_ACPI_TRANSITION_ACPI!ACPIEnableEnterACPIMode  
> 
> Since smm is part of the guest ABI, can we just set use "!smm || 
> smm-compat" whenever we use smm-compat right now?

if we can't fix issue before release, then we will have to do something like this.


> Paolo
> 
> 


