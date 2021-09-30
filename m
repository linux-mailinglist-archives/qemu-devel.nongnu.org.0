Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E7741D920
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 13:53:53 +0200 (CEST)
Received: from localhost ([::1]:50412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVudM-0002xM-Cy
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 07:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1mVucF-0002Dd-SR
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 07:52:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1mVucD-00034E-MI
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 07:52:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633002760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q7ecDDE2gg2yCNk5Vcwg8Uhl8w5cvRkFs6n2BRT4swQ=;
 b=T1qcgGYcAQ0nrDaXqkobT7ntDX3IfBgB0+Zk2JgHs0W25aE3NP2RMmUH9VyjkMeOM2Bc81
 Eb3oludAXdcv2OmliL0kcRX3VuNlvoa3QQOoI8/aUrbkZLp+uMsi5o7Dz2ytXiYB/5pRAE
 waZmLJZQBbUmcIUd12OYSFi1I4dP6Fs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-G3vizTh9Mm6z6kO_jUVSZA-1; Thu, 30 Sep 2021 07:52:39 -0400
X-MC-Unique: G3vizTh9Mm6z6kO_jUVSZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C3678145E5;
 Thu, 30 Sep 2021 11:52:38 +0000 (UTC)
Received: from starship (unknown [10.35.206.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 292D319C59;
 Thu, 30 Sep 2021 11:52:30 +0000 (UTC)
Message-ID: <376e11a40954de4705ba726371a50f98a8596e7c.camel@redhat.com>
Subject: Re: [PATCH 0/3] KVM: qemu patches for few KVM features I developed
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 30 Sep 2021 14:52:29 +0300
In-Reply-To: <20210914155214.105415-1-mlevitsk@redhat.com>
References: <20210914155214.105415-1-mlevitsk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Very polite ping on these patches.

Best regards,
   Maxim Levitsky


