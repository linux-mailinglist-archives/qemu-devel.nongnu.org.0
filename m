Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4759842BC2C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:53:12 +0200 (CEST)
Received: from localhost ([::1]:53470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maawh-0005PK-9D
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1maafQ-00080r-U6
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:35:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1maafL-0007Vp-0L
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:35:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634117712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZTKRszVVxh4cNNNrBxZ/ELkjttXYs1zNHg2NC0pK2Rs=;
 b=TqUGkzQidzohH8+RZnaI8jloyU+Ao7yM6wLk5r7g/Pv63fUnVr0SHQc0FMMK6N4GXSaNEf
 +TVSDDeLBEnSm32NeJ2TZE27CbXgHplleHsaufeEyMKNxd7gbBICyqGULEdRd8YhjuTaJj
 yh0qiCpUoGKDDPeCQ3uu2hChlvoxH50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-9ng6Z4VxMkiO80hr7nSUKQ-1; Wed, 13 Oct 2021 05:32:29 -0400
X-MC-Unique: 9ng6Z4VxMkiO80hr7nSUKQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B19A6A40C1;
 Wed, 13 Oct 2021 09:32:28 +0000 (UTC)
Received: from starship (unknown [10.35.206.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FF89196F8;
 Wed, 13 Oct 2021 09:32:26 +0000 (UTC)
Message-ID: <aff9dc19c1cc0b2fc40ca795a44b5cf32d2d97d0.camel@redhat.com>
Subject: Re: [PATCH 0/3] KVM: qemu patches for few KVM features I developed
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 13 Oct 2021 12:32:25 +0300
In-Reply-To: <20210914155214.105415-1-mlevitsk@redhat.com>
References: <20210914155214.105415-1-mlevitsk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2021-09-14 at 18:52 +0300, Maxim Levitsky wrote:
> These patches implement the qemu side logic to support
> the KVM features I developed recently.
> 
> First two patches are for features that are already accepted
> upstream, and I already posted them on the qemu mailing list once.
> 
> And the 3rd patch is for nested TSC scaling on SVM
> which isn't yet accepted in KVM but can already be added to qemu since
> it is conditional on KVM supporting it, and ABI wise it only relies
> on SVM spec.
> 
> Best regards,
>     Maxim Levitsky
> 
> Maxim Levitsky (3):
>   KVM: use KVM_{GET|SET}_SREGS2 when supported.
>   gdbstub: implement NOIRQ support for single step on KVM
>   KVM: SVM: add migration support for nested TSC scaling
> 
>  accel/kvm/kvm-all.c   |  30 +++++++++++
>  gdbstub.c             |  60 +++++++++++++++++----
>  include/sysemu/kvm.h  |  17 ++++++
>  target/i386/cpu.c     |   5 ++
>  target/i386/cpu.h     |   7 +++
>  target/i386/kvm/kvm.c | 122 +++++++++++++++++++++++++++++++++++++++++-
>  target/i386/machine.c |  53 ++++++++++++++++++
>  7 files changed, 282 insertions(+), 12 deletions(-)
> 
> -- 
> 2.26.3
> 
> 
Kind ping on these patches.

Best regards,
	Maxim Levitsky


