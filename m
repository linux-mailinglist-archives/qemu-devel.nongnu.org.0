Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4046E26457C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 13:51:07 +0200 (CEST)
Received: from localhost ([::1]:51618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGL6V-0004av-Sj
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 07:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kGL5S-00042i-VU
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 07:49:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58574
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kGL5Q-0004I3-TX
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 07:49:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599738595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sjkjxl7XUETbHB6ANruWZFnmDHT7amDR67npklsZH2s=;
 b=LhH9JwsXzYTFFGl7CXyfPa3nCEsIAlkf6eXmzkom/DzCixm0Iyy+jMo6Y+4JROMZbkQhbi
 M3osZx83wbJ13u2uWTWBvQmI2GTd5erghYXq3lF0QRJkjpwyERGd+lH/edYXbNPpL0JdoQ
 9sMoU1XYrcH9kTDEh6yBSc0muy81HlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-SgqgcIBnNWOnuR5o4e7goA-1; Thu, 10 Sep 2020 07:49:51 -0400
X-MC-Unique: SgqgcIBnNWOnuR5o4e7goA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A6E9802B6C;
 Thu, 10 Sep 2020 11:49:49 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC8FF1A923;
 Thu, 10 Sep 2020 11:49:45 +0000 (UTC)
Date: Thu, 10 Sep 2020 13:49:43 +0200
From: Andrew Jones <drjones@redhat.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 2/2] arm64: kvm: Introduce MTE VCPU feature
Message-ID: <20200910114943.cedbzlqfcgxg7jqs@kamzik.brq.redhat.com>
References: <20200904160018.29481-1-steven.price@arm.com>
 <20200904160018.29481-3-steven.price@arm.com>
 <20200909154804.mide6szbzgdy7jju@kamzik.brq.redhat.com>
 <3a7e18af-84bd-cee3-d68f-e08f225fc166@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a7e18af-84bd-cee3-d68f-e08f225fc166@arm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=207.211.31.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 03:02:23
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
Cc: Peter Maydell <Peter.Maydell@arm.com>, Juan Quintela <quintela@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, linux-kernel@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 10, 2020 at 10:21:07AM +0100, Steven Price wrote:
> > We either need a KVM cap or a new CPU feature probing interface to avoid
> > making userspace try features one at a time. It's too bad that VCPU_INIT
> > doesn't clear all offending features from the feature set when returning
> > EINVAL, because then userspace could create a scratch VCPU with everything
> > it supports in order to see what KVM also supports in one go.
> 
> If Peter's TELL_ME_WHAT_YOU_HAVE idea works out then perhaps we don't need
> the cap? Or would it still be useful?
>

We wouldn't need it, but we don't _need_ it now either. It's not very
convenient to probe vcpu features with scratch vcpus, especially if we
must probe one at a time, but it works. The TELL_ME_WHAT_YOU_HAVE idea
will only fix the one at a time issue, but still require a vcpu fd. If
this feature becomes a VM feature then a cap or VM level API would help
reduce the userspace probing work.

Thanks,
drew


