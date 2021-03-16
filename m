Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503E133D49E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 14:12:51 +0100 (CET)
Received: from localhost ([::1]:33198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM9VC-00087e-Cb
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 09:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lM9TJ-0007NY-OB
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:10:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lM9TI-0008E5-3B
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:10:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615900251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sz1s79oXZN5jSTYE752Ttw7QZimpEVMB+o74bNo7gKU=;
 b=D69zOF6nLw3cFqnT3aNVGO5rBtFgZCak30HCM5VEyJiP01DPzK4VGTs0iSGVAg92zATWFk
 vsnVKDLfz8yXVJRpxpHAF9pPgxZRhtX5r+aR8pWWi3wFaNKm6wLSUY/vUfp0ksC8m6Bq4t
 ubzus9XsGsDKhSXXHOndpgQRdzglpV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-dwQKpZGhOyC0ckJyWusygA-1; Tue, 16 Mar 2021 09:10:49 -0400
X-MC-Unique: dwQKpZGhOyC0ckJyWusygA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3943C1015C84;
 Tue, 16 Mar 2021 13:10:48 +0000 (UTC)
Received: from localhost (unknown [10.40.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72E5D102AE7E;
 Tue, 16 Mar 2021 13:10:46 +0000 (UTC)
Date: Tue, 16 Mar 2021 14:10:44 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Windows 10 won't run on default x86_64 machine anymore
Message-ID: <20210316141044.311688bb@redhat.com>
In-Reply-To: <9e2e1d83-29c1-053a-fd43-187f6f824b39@redhat.com>
References: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
 <20210315185302.29b0d90d@redhat.com>
 <YE/fUQRiFBfrWi5W@dropje.13thmonkey.org>
 <20210316015503.GA1008366@private.email.ne.jp>
 <20210316131304.220a53b9@redhat.com>
 <9e2e1d83-29c1-053a-fd43-187f6f824b39@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Reinoud Zandijk <reinoud@NetBSD.org>, qemu-devel@nongnu.org,
 Isaku Yamahata <isaku.yamahata@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Mar 2021 13:49:57 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 16/03/21 13:13, Igor Mammedov wrote:
> >>> Surprisingly without accelerator ie with tcg the default machine does seem to
> >>> get to the login prompt. Is the ACPI data tailored to indicate an
> >>> accelerator/VM or is it static? Could it be that the CPU reported by my
> >>> machine is causing the issue? With the NVMM accelerator it passes on the hosts  
> >>
> >> I think tcg case can be explained by x86_machine_is_smm_enabled()
> >>
> >>    bool x86_machine_is_smm_enabled(const X86MachineState *x86ms)
> >>    ...
> >>        if (tcg_enabled() || qtest_enabled()) {
> >>            smm_available = true;
> >>        } else if (kvm_enabled()) {
> >>            smm_available = kvm_has_smm();
> >>        }
> >>    ...
> >>
> >> Although I don't know about nvmm case, this function also needs to be updated
> >> if smi isn't supported.  
> > can you submit a patch for this please?  
> 
> nvmm is not part of upstream yet, so I guess it's up to Reinoud to fix 
> it.  Still, reproducing his testing conditions with KVM and -M smm=off 
> is probably interesting because it also affects HAX, HVF and WHPX which 
> are supported upstream.

I'm in process of preparing test env for it with reported Windows version,
so I'll try this case as well.

> 
> Paolo
> 


