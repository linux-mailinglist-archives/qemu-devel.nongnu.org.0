Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 739963F7D54
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 22:49:08 +0200 (CEST)
Received: from localhost ([::1]:33846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIzpa-0008Vc-66
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 16:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mIzoq-0007rC-VL
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 16:48:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mIzoo-0002Yi-Mj
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 16:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629924497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n5HAg4qAi42vaMlzvWrsVs3pq7kNzWulEuMNzkHw1Gc=;
 b=FA+S/ntHiNJIo3WwZwAOTulH6Lnw51+9U2t7lofdV/8krez2+C69JrCfDB7Ga5rWdQyeLV
 DrBETPqG7MWDc0g8JaRv2JRpyMVgj4qdlqHsL/u8GZuUtqg2XgdIpY9xx77A/Tgh25FQ4+
 a6qZj5gcDEWVMk7L4Gw8Cv+HiV175ss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-342wsPM6N0Gb6jmhmtmZsw-1; Wed, 25 Aug 2021 16:48:15 -0400
X-MC-Unique: 342wsPM6N0Gb6jmhmtmZsw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3CE51B18BC9;
 Wed, 25 Aug 2021 20:48:14 +0000 (UTC)
Received: from localhost (unknown [10.22.32.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 373951ABD2;
 Wed, 25 Aug 2021 20:48:14 +0000 (UTC)
Date: Wed, 25 Aug 2021 16:48:13 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: Live migration regarding Intel PT
Message-ID: <20210825204813.tfhrj3dg2vlqxm4u@habkost.net>
References: <e31344c9-e9e6-7d78-3a53-2c0e5e5f39d7@intel.com>
MIME-Version: 1.0
In-Reply-To: <e31344c9-e9e6-7d78-3a53-2c0e5e5f39d7@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Chao Peng <chao.p.peng@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 25, 2021 at 02:59:37PM +0800, Xiaoyao Li wrote:
> Hi Eduardo,
> 
> I have some question regrading Intel PT live migration.
> 
> Commit "e37a5c7fa459 (i386: Add Intel Processor Trace feature support)"
> expose Intel PT with a fixed capabilities of CPUID 0x14 for live migration.
> And the fixed capabilities are the value reported on ICX(IceLake). However,
> the upcoming SPR(Sapphire Rapids) has less capabilities of
> INTEL_PT_CYCLE_BITMAP than ICX. It fails to enable PT in guest on SPR
> machine.
> 
> If change the check on INTEL_PT_CYCLE_BITMAP to allow different value to
> allow it work on SPR. I think it breaks live migration, right?

If I understand your description correctly, I don't think that
would break live migration.

Generating different CPUID data for the same CPU model+flags
would break live migration.

However, merely allowing a wider set of configurations to work
wouldn't break live migration, as long as the same CPU
model+flags generates the same CPUID data on any host.


> 
> For me, not making each sub-function of PT as configurable in QEMU indeed
> makes it hard for live migration. [...]

Making all sub-functions of PT configurable would be welcome.
actually.  That would allow us to support a wider range of
configurations and keep live migration working at the same time.


> [...] Why not make PT as unmigratable in the
> first place when introducing the support in QEMU?

I don't know, this was not my decision.  Now we support live
migration in a few specific cases (ICX hosts), and I assume we
don't want to stop supporting it.

If you just want to support a larger set of hosts when live
migration is not needed, you can add support to that use case
too.  e.g.: "-cpu host,migratable=off" and/or
"-cpu ...,intel-pt-passthrough=on" could do host passthrough of
intel-pt sub-leaves (and block live migration).

-- 
Eduardo


