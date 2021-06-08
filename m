Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D65C53A83D3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:21:58 +0200 (CEST)
Received: from localhost ([::1]:53460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltAt3-0007jT-Ur
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ltArt-0006LE-0S
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:20:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ltArr-0005Wa-3n
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:20:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623770442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Env3el8FpSQxTHQa91umcHPfEZBrjkV0I88vvzxNt1M=;
 b=K5kR0tfGBJm/yfGUGptfYFhA9xUT9yFG1JMlvUvZuPohE9t6AAFJ4RptcAEo+k5rPGNnQ7
 KC2dXeIOc8CuvRUhbbZlGygMRkbkbvT+aKJDUFAwaORK/kaS81zFMZxEGffmx9Ne78Bklu
 h07I2RhrA/VkXMlQFVuzd7COMP80zuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-PBvaKYtGNvq1Sg1Zz_s-lQ-1; Tue, 15 Jun 2021 11:20:40 -0400
X-MC-Unique: PBvaKYtGNvq1Sg1Zz_s-lQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 901CC10B7466;
 Tue, 15 Jun 2021 15:20:39 +0000 (UTC)
Received: from localhost (unknown [10.22.8.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A5165C1C2;
 Tue, 15 Jun 2021 15:20:38 +0000 (UTC)
Date: Tue, 8 Jun 2021 09:52:07 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v8 3/9] i386: hardcode supported eVMCS version to '1'
Message-ID: <20210608125207.xxhvuh7ktxspo3bj@habkost.net>
References: <20210608120817.1325125-1-vkuznets@redhat.com>
 <20210608120817.1325125-4-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210608120817.1325125-4-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 DKIMWL_WL_HIGH=-0.197, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 02:08:11PM +0200, Vitaly Kuznetsov wrote:
> Currently, the only eVMCS version, supported by KVM (and described in TLFS)
> is '1'. When Enlightened VMCS feature is enabled, QEMU takes the supported
> eVMCS version range (from KVM_CAP_HYPERV_ENLIGHTENED_VMCS enablement) and
> puts it to guest visible CPUIDs. When (and if) eVMCS ver.2 appears a
> problem on migration is expected: it doesn't seem to be possible to migrate
> from a host supporting eVMCS ver.2 to a host, which only support eVMCS
> ver.1.

Should we rewrite this as "it wouldn't be possible to migrate",
as this patch fixes the problem and makes it possible?

> 
> Hardcode eVMCS ver.1 as the result of 'hv-evmcs' enablement for now. Newer
> eVMCS versions will have to have their own enablement options (e.g.
> 'hv-evmcs=2').
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo


