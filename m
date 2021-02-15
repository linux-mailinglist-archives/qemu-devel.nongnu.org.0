Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AC431BA7F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:43:40 +0100 (CET)
Received: from localhost ([::1]:52624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBeA7-0005Bz-G5
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:43:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lBdwd-0000BK-Sj
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:29:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lBdwc-0002MO-1z
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:29:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613395780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E9Ul5s4ogqmdCEgBFPmlxq/bAd+0MIL5UPPzUN77VKI=;
 b=Cq9RvWlik//GSNNnYuD8RFUwObW0XApD0ziN/aF8XynZAt6qzn5BTCWssJ3pW4HCxYUgx2
 LLALpjEk/p2GXJlP+8o4JnLx6M6Ln4WAAoEzkYZ1IiFyUCm3v3hkWgMBsEIvAx7N8PAy8V
 reOuffVybsKk+HH227L+AiWKlStVzlQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-N3bIv_84MMOUuomzjVeD7g-1; Mon, 15 Feb 2021 08:29:38 -0500
X-MC-Unique: N3bIv_84MMOUuomzjVeD7g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE35C801965
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 13:29:37 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-80.ams2.redhat.com [10.36.112.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20E1460C0F;
 Mon, 15 Feb 2021 13:29:36 +0000 (UTC)
Subject: Re: [PULL 00/19] i386, qgraph patches for 2020-02-15
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210215131626.65640-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <91c8a2f1-a0f7-3b79-e64f-dbeabad53c62@redhat.com>
Date: Mon, 15 Feb 2021 14:29:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215131626.65640-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/02/2021 14.16, Paolo Bonzini wrote:
> The following changes since commit 41d306ec7d9885752fec434904df08b9c1aa3add:
> 
>    Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-02-09 10:04:51 +0000)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to bf98b5857a101f9032377044c250ab728464bcb0:
> 
>    hvf: Fetch cr4 before evaluating CPUID(1) (2021-02-09 18:47:45 +0100)
> 
> ----------------------------------------------------------------
> * HVF fixes
> * Extra qos-test debugging output (Christian)
> * SEV secret address autodetection (James)
> * SEV-ES support (Thomas)
> * Relocatable paths bugfix (Stefan)
> 
> ----------------------------------------------------------------
> Alexander Graf (2):
>        hvf: x86: Remove unused definitions
>        hvf: Fetch cr4 before evaluating CPUID(1)
> 
> Hill Ma (1):
>        hvf: Guard xgetbv call
> 
> James Bottomley (2):
>        pc: add parser for OVMF reset block
>        sev: update sev-inject-launch-secret to make gpa optional
> 
> Paolo Bonzini (1):
>        sev/i386: Allow AP booting under SEV-ES
> 
> Stefan Weil (1):
>        util/cutils: Skip "." when looking for next directory component
> 
> Tom Lendacky (5):
>        sev/i386: Add initial support for SEV-ES
>        sev/i386: Require in-kernel irqchip support for SEV-ES guests
>        sev/i386: Don't allow a system reset under an SEV-ES guest
>        kvm/i386: Use a per-VM check for SMM capability
>        sev/i386: Enable an SEV-ES guest based on SEV policy
> 
> Vladislav Yaroshchuk (2):
>        target/i386/hvf: add vmware-cpuid-freq cpu feature
>        target/i386/hvf: add rdmsr 35H MSR_CORE_THREAD_COUNT
> 
> qemu_oss--- via (5):
>        libqos/qgraph: add qos_node_create_driver_named()
>        libqos/qgraph_internal: add qos_printf() and qos_printf_literal()
>        tests/qtest/qos-test: dump qos graph if verbose
>        tests/qtest/qos-test: dump environment variables if verbose
>        tests/qtest/qos-test: dump QEMU command if verbose

Looks like Christian's "From:" got mangled ...

  Thomas


