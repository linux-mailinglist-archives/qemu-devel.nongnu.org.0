Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BFD30C3CB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:31:33 +0100 (CET)
Received: from localhost ([::1]:46162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xeO-0004E9-0u
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:31:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l6xYQ-0006l2-SU
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:25:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l6xYC-00047o-07
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:25:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612279507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lINru4o6l1RaD+QQYl1MdUTU61D0GGPdFYw9LlwHLqU=;
 b=Y24RbawFUygmW+KQ5g3Pi/lo7BI5hC35Rr48FW8I/kRh+aDe3Ue3NTlU9ZYYDEDARidKTd
 6DkQSLh4izQQQmI7CKP3jRVdEN5Zip/4Q5zUWJb8lvFPK59Kh+/9y9Fb8ZJoB/cUFQH5lE
 5Q6LYuqnagrsDXgu+oNGFH3ga32hDSo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-4VlkFGsRP4G84UGjM3jFEQ-1; Tue, 02 Feb 2021 10:25:05 -0500
X-MC-Unique: 4VlkFGsRP4G84UGjM3jFEQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A03CB801AC5;
 Tue,  2 Feb 2021 15:25:04 +0000 (UTC)
Received: from localhost (ovpn-3-197.rdu2.redhat.com [10.22.3.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 351085C1CF;
 Tue,  2 Feb 2021 15:25:04 +0000 (UTC)
Date: Tue, 2 Feb 2021 10:25:02 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/3] i386: Add missing "vmx-ept-wb" feature name
Message-ID: <20210202152502.GN3872207@habkost.net>
References: <20210201225404.3941395-1-ehabkost@redhat.com>
 <20210201225404.3941395-2-ehabkost@redhat.com>
 <CABgObfaWW+ON4AA6cqygOkCMrruMbUqCR32R=uVhxnm4yUa6eQ@mail.gmail.com>
 <20210201230544.GJ3872207@habkost.net>
 <CABgObfYrOG1QBHskP4=Rwcp2uwOZKDCE9_RF1mmJWngD90zSjA@mail.gmail.com>
 <20210202001814.GK3872207@habkost.net>
 <a240f44f-b39a-7255-6329-cba1d89b3271@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a240f44f-b39a-7255-6329-cba1d89b3271@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Babu Moger <babu.moger@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 02, 2021 at 08:54:30AM +0100, Paolo Bonzini wrote:
> On 02/02/21 01:18, Eduardo Habkost wrote:
> > On Tue, Feb 02, 2021 at 12:28:38AM +0100, Paolo Bonzini wrote:
> > > Il mar 2 feb 2021, 00:05 Eduardo Habkost <ehabkost@redhat.com> ha scritto:
> > > 
> > > > On Mon, Feb 01, 2021 at 11:59:48PM +0100, Paolo Bonzini wrote:
> > > > > Il lun 1 feb 2021, 23:54 Eduardo Habkost <ehabkost@redhat.com> ha
> > > > scritto:
> > > > > 
> > > > > > Not having a feature name in feature_word_info breaks error
> > > > > > reporting and query-cpu-model-expansion.  Add the missing feature
> > > > > > name to feature_word_info[FEAT_VMX_EPT_VPID_CAPS].feat_names[14].
> > > > > > 
> > > > > This is intentional, because there's no way that any hypervisor can run
> > > > if
> > > > > this feature is disabled.
> > > > 
> > > > If leaving the feature without name enables some desirable
> > > > behavior, that's by accident and not by design.  Which part of
> > > > the existing behavior is intentional?
> > > > 
> > > 
> > > Not being able to disable it.
> > 
> > We can make it a hard dependency of vmx, then.  We shouldn't
> > leave it without a name, though.
> 
> The feature is already added to the MSRs unconditionally in
> kvm_msr_entry_add_vmx.  I think we can just remove it from the models
> instead.

Sounds even simpler, and better.  I'll do it in v2.

-- 
Eduardo


