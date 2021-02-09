Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F50315A01
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 00:28:00 +0100 (CET)
Received: from localhost ([::1]:34268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9cQJ-00054O-Kw
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 18:27:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l9cP3-0004by-Ak
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 18:26:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l9cOz-0001IR-KX
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 18:26:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612913195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uApCRa+vC3zVJiqWq8BbDvvOZizC1wx74BHVffOs3Ew=;
 b=LUwaiiMGHwv2sfD99S2OvBUUv/EHHspsBcTCokMJL9qCe+OPr5j96KZHQELIyqqUhp27k1
 dia6n0YE57UBAPeiUD+oRzDt1FgrugFoU6mOwtVimnclBJMxFKOtzWz+VCqCFzSrpzqDQb
 p9QtBQR98L94ToDGQDId5tRszfCh74A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-8u9CoamLPRahaLxmwC6DSg-1; Tue, 09 Feb 2021 18:26:33 -0500
X-MC-Unique: 8u9CoamLPRahaLxmwC6DSg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 105D079EC4;
 Tue,  9 Feb 2021 23:26:32 +0000 (UTC)
Received: from localhost (ovpn-114-196.rdu2.redhat.com [10.10.114.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 865B3100239A;
 Tue,  9 Feb 2021 23:26:31 +0000 (UTC)
Date: Tue, 9 Feb 2021 18:26:30 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v2] i386: Add the support for AMD EPYC 3rd generation
 processors
Message-ID: <20210209232630.GD1095605@habkost.net>
References: <161290460478.11352.8933244555799318236.stgit@bmoger-ubuntu>
MIME-Version: 1.0
In-Reply-To: <161290460478.11352.8933244555799318236.stgit@bmoger-ubuntu>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 09, 2021 at 03:04:05PM -0600, Babu Moger wrote:
> Adds the support for AMD 3rd generation processors. The model
> display for the new processor will be EPYC-Milan.
> 
> Adds the following new feature bits on top of the feature bits from
> the first and second generation EPYC models.
> 
> pcid          : Process context identifiers support
> ibrs          : Indirect Branch Restricted Speculation
> ssbd          : Speculative Store Bypass Disable
> erms          : Enhanced REP MOVSB/STOSB support
> fsrm          : Fast Short REP MOVSB support
> invpcid       : Invalidate processor context ID
> pku           : Protection keys support
> svme-addr-chk : SVM instructions address check for #GP handling
> 
> Depends on the following kernel commits:
> 14c2bf81fcd2 ("KVM: SVM: Fix #GP handling for doubly-nested virtualization")
> 3b9c723ed7cf ("KVM: SVM: Add support for SVM instruction address check change")
> 4aa2691dcbd3 ("8ce1c461188799d863398dd2865d KVM: x86: Factor out x86 instruction emulation with decoding")
> 4407a797e941 ("KVM: SVM: Enable INVPCID feature on AMD")
> 9715092f8d7e ("KVM: X86: Move handling of INVPCID types to x86")
> 3f3393b3ce38 ("KVM: X86: Rename and move the function vmx_handle_memory_failure to x86.c")
> 830bd71f2c06 ("KVM: SVM: Remove set_cr_intercept, clr_cr_intercept and is_cr_intercept")
> 4c44e8d6c193 ("KVM: SVM: Add new intercept word in vmcb_control_area")
> c62e2e94b9d4 ("KVM: SVM: Modify 64 bit intercept field to two 32 bit vectors")
> 9780d51dc2af ("KVM: SVM: Modify intercept_exceptions to generic intercepts")
> 30abaa88382c ("KVM: SVM: Change intercept_dr to generic intercepts")
> 03bfeeb988a9 ("KVM: SVM: Change intercept_cr to generic intercepts")
> c45ad7229d13 ("KVM: SVM: Introduce vmcb_(set_intercept/clr_intercept/_is_intercept)")
> a90c1ed9f11d ("(pcid) KVM: nSVM: Remove unused field")
> fa44b82eb831 ("KVM: x86: Move MPK feature detection to common code")
> 38f3e775e9c2 ("x86/Kconfig: Update config and kernel doc for MPK feature on AMD")
> 37486135d3a7 ("KVM: x86: Fix pkru save/restore when guest CR4.PKE=0, move it to x86.c")
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>

Queued, thanks!

-- 
Eduardo


