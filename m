Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB38A21F5B2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 17:05:30 +0200 (CEST)
Received: from localhost ([::1]:55204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvMUr-0006bD-I7
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 11:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1jvMTq-0005dq-BU
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 11:04:26 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:33979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1jvMTk-0007Bx-D3
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 11:04:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=pL55OrtNA6fq0INk0RiPWpwon7m0ketUprxQsZPJLAc=; b=Q9/6Ol4QKgz5J2g980KA9nmqlB
 O3Q5kR8b2KhwLJwl73DaCQe0PKK0/uURMcn77gVh9Ib/hZKJJZ7kapwlo6VAN9Cpi0LhznSZMbJnQ
 j0S5w9aK13k8v9Qsd3s2+LUW2HWdyNwpyW8k7SzYRH0m5Dn2BuybTjpaQw2FQE/FKClw1obobgz3e
 o7shCAqzcBh+jZJeGPJ0r2zFb6Rl0jSzsQ+G/y3vHMAfsNXXILeP8EQhTVaWmmPKmqv2e6PGxJBUP
 J+4Tud4MP9IxfI2RZHB6dmU0b9vw/o3f3HrZ2GmH3vl0CQb26jYvR9nR+1pmZTvG/SK/doe6wMLfl
 m2RdyYSA==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Prasad J Pandit <pjp@fedoraproject.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 P J P <ppandit@redhat.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: introduce cve or security quotient field
Date: Tue, 14 Jul 2020 17:04:14 +0200
Message-ID: <1699681.v8m9r4P7fX@silver>
In-Reply-To: <dbb871bf-6772-1105-5bcd-7bbc3ba0f14b@redhat.com>
References: <20200714083631.888605-1-ppandit@redhat.com>
 <20200714134856.GC5120@linux.fritz.box>
 <dbb871bf-6772-1105-5bcd-7bbc3ba0f14b@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/14 11:04:16
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 14. Juli 2020 15:56:24 CEST Thomas Huth wrote:
> >> The challenge I see is that wiring up a runtime flag into every relevant
> >> part of the QEMU codebase is an pretty large amount of work. Every
> >> device,
> >> every machine type, every backend type, every generic subsystem will all
> >> need checks for this flag. It is possible, but it isn't going to be quick
> >> or easy, especially with poor error reporting support in many areas.
> > 
> > Would it make more sense as a configure flag that decides whether or not
> > to compile in potentially problematic devices/backends?
> 
> I guess there are users for both. Some people prefer to compile their
> reduced QEMU binary (remember Nemu?), while the users from the normal
> Linux distros might benefit more from a runtime switch, I guess.
> 
> I wonder whether it's somehow possible to unify both approaches, so that
> we could mark the secure/insecure objects in the Makefiles already and
> then either don't link them for the Nema-style users, or mark the
> objects via some linker magic (?) as insecure, so we could flag them
> during runtime if a certain parameter has been used...? No clue whether
> that's possible at all, I'm just brainstorming...

Then what about new (i.e. experimental) features? Those would then need to be 
moved into separate objects for that, otherwise they would be handled with the 
same (high) security level. Moving them to other units complicates patches.

It might make sense being able to mark the security level of a unit, while 
also being able to override the security level of individual functions (i.e. 
by some magic macro, similar to existing macro 'coroutine_fn').

However despite the details, that concept in general has the limitation of 
being a somewhat undeterministic runtime feature; i.e. it might abort 
immediately (good) or who knows when (bad). Hence being able to also associate 
a security level with runtime parameters would be beneficial to cause the 
abortion to happen rather immediately.

Best regards,
Christian Schoenebeck



