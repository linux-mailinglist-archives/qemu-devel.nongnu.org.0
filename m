Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB04C340693
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 14:12:17 +0100 (CET)
Received: from localhost ([::1]:42292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMsRk-0000aP-AO
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 09:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lMsPy-0007ey-P9
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 09:10:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lMsPt-0008Ph-6e
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 09:10:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616073017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ENuj9UqEoIBGeNMgO7o6g4Sh0jyqtSxXQjdRXAPy/r8=;
 b=MHTQgIB7rjDD5qYkfdlN7DtyDQj+dlb4MmD+qaRPFH8FerYRuvL1JO1GwH6ObNHdBlhrPo
 O4HdFm9ZDrYS31nBdgjMzknFaIVS1srMOe81r/LAHpz7lstzXj+ybOry1wJ6c2l/aLEnEU
 MLsjTomuDMiF2vBG0FzQBQUCcJBoNWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-onYVG1gvN8CZd5NjUf9tZQ-1; Thu, 18 Mar 2021 09:10:13 -0400
X-MC-Unique: onYVG1gvN8CZd5NjUf9tZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBCBB180FCB0;
 Thu, 18 Mar 2021 13:10:11 +0000 (UTC)
Received: from localhost (ovpn-116-229.rdu2.redhat.com [10.10.116.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 565A81A353;
 Thu, 18 Mar 2021 13:10:11 +0000 (UTC)
Date: Thu, 18 Mar 2021 09:10:10 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: arm_cpu_post_init (Was: Re: arm: "max" CPU class hierarchy
 changes possible?)
Message-ID: <20210318131010.GT3139005@habkost.net>
References: <CAFEAcA8T+u6QG9PQWs40PTSZ86SEeLQrciT8WHxFyH3UVbipiA@mail.gmail.com>
 <2e6a5d98-e022-0b39-5f30-92eb74491d3b@redhat.com>
 <2277fdf5-ec92-476a-8fe5-0d4eee23dfef@suse.de>
 <CAFEAcA_j-0+vmNFtPjcxEXC9r4bFrebDfGjq-x1SfguzUG4qcw@mail.gmail.com>
 <20210311191046.ykcelkwq7orajyu7@kamzik.brq.redhat.com>
 <5467e45c-cc8e-6422-0c56-398405a7c331@suse.de>
 <c3397f29-82eb-5a1b-803d-8184c9a8d508@suse.de>
 <20210318120837.cg4gfdpchjwiabav@kamzik.brq.redhat.com>
 <fc769a96-a304-7429-5dee-a65b52179b1c@suse.de>
 <20210318125908.zwpm47ftlsuen3zo@kamzik.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210318125908.zwpm47ftlsuen3zo@kamzik.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 18, 2021 at 01:59:08PM +0100, Andrew Jones wrote:
> On Thu, Mar 18, 2021 at 01:42:36PM +0100, Claudio Fontana wrote:
> > On 3/18/21 1:08 PM, Andrew Jones wrote:
> > > On Thu, Mar 18, 2021 at 12:32:30PM +0100, Claudio Fontana wrote:
> > >> And why do we have a separate arm_cpu_finalize_features()?
> > > 
> > > Separate, because it's not just called from arm_cpu_realizefn().
> > 
> > In particular it is also called by the monitor.c in qmp_query_cpu_model_expansion(),
> > 
> > which basically creates an object of the cpu subclass,
> > and then calls arm_cpu_finalize_[features]() explicitly on the object.
> > 
> > Is the qdev realize() method not called in this case? Should instead it be triggered, rather than initializing/realizing an incomplete object?
> 
> Can you elaborate on what you mean by "triggered"? The QMP query does the
> least that it can get away with while still reusing the CPU model's
> feature initialization code. Any suggestions for improving that,
> preferably in the form of a patch, would be welcome. If it works well for
> Arm, then it could probably be applied to other architectures. The Arm QMP
> query is modeled off the others.

This sound very similar to x86_cpu_expand_features(), so the
approach makes sense to me.

It wouldn't make sense to call realize() inside
qmp_query_cpu_model_expansion().  Realizing the CPU means
plugging it into the guest, and we would never want to do that
when executing a query command.

-- 
Eduardo


