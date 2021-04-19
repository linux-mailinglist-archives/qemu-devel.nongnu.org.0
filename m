Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1D4364BEA
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:47:37 +0200 (CEST)
Received: from localhost ([::1]:56854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYanw-0007qN-OM
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lYaQr-0007t6-DI
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lYaQo-0002iR-Kt
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618863821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XpXVKhKTGEUmzz1ciagOjxC1nasAVaIB801aKeNt3lA=;
 b=CSE6NZDqoAXKZ0PeMwvOY8B2mCfjpqI75uf8k5CsDb8TMfNJurYCwetQqXbyxqZqqHpTs1
 r7uzbnTixrOvvGBLmNoIw/WDNY1vpDs/j3vqIoiD/3YilEKPhcvMSsWSl/ourTKBVWbQBc
 9kxtvG3SwQ57QEczIdskK2w/aUlCgT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-yFR0yzIxOFeknRpQnY9-Jg-1; Mon, 19 Apr 2021 16:23:39 -0400
X-MC-Unique: yFR0yzIxOFeknRpQnY9-Jg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B480E801984;
 Mon, 19 Apr 2021 20:23:37 +0000 (UTC)
Received: from localhost (unknown [10.22.10.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5519A610F1;
 Mon, 19 Apr 2021 20:23:37 +0000 (UTC)
Date: Mon, 19 Apr 2021 16:23:36 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3] qapi: introduce 'query-cpu-model-cpuid' action
Message-ID: <20210419202336.shf3yo7lmr7tmzvp@habkost.net>
References: <20210326173000.18750-1-valeriy.vdovin@virtuozzo.com>
 <YGGb9ohT/EztzFbr@redhat.com>
 <20210329112153.GA413337@dhcp-172-16-24-191.sw.ru>
 <YGG+k2PMJjc2yX2g@redhat.com>
 <15924dba-1618-0b7e-fbc3-42e4f02d8176@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <15924dba-1618-0b7e-fbc3-42e4f02d8176@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>, Denis Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 29, 2021 at 03:41:34PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 29.03.2021 14:48, Daniel P. Berrangé wrote:
[...]
> > > > There's feels like there's a lot of conceptual overlap with the
> > > > query-cpu-model-expansion command. That reports in a arch independant
> > > > format, but IIUC the property data it returns can be mapped into
> > > > CPUID leaf values. Is it not possible for you to use this existing
> > > > command and maintain a mapping of property names -> CPUID leaves ?
> > > As already stated in the use-case description above, having this method
> > > around, helps us in a way that we can just take values and return them
> > > to containers. QEMU code already does a great job, generating CPUID
> > > responses, we don't want to do the same in our own code.
> > 
> > This is asking QEMU to maintain a new QAPI command which does not appear
> > to have a use case / benefit for QEMU mgmt. It isn't clear to me that
> > this should be considered in scope for QMP.
> > 
> 
> Hmm. On the other hand,
> 
> 1. The command just exports some information, like a lot of other qmp query- commands, it doesn't look as something alien in the QEMU interface.
> 
> 2. We do have a use-case. Not a VM use-case, but a use-case of cpu handling subsystem.
> 
> Isn't it enough?
> 
> We want to handle cpu configurations in a compatible with QEMU way. The simplest thing for it is just generate needed information with help of QEMU. Note, that's not the only usage of QEMU binary for not-VM-running. QEMU binary may be used for different block-jobs and manipulating bitmaps in disk images (yes, now we also have qemu-storage-daemon, but still).
> 
> Do you have an idea how our task could be solved an a better way?

The new command would also be useful for writing automated tests
for the x86 CPUID compatibility code.  I don't object to its
inclusion.

-- 
Eduardo


