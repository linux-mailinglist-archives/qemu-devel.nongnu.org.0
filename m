Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897033ACF9C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:59:42 +0200 (CEST)
Received: from localhost ([::1]:41124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGuD-00007k-JP
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1luGt1-0007rp-IV
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:58:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1luGsy-0002cM-1Q
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624031903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dv2VM57uNpnBQOUO1i7v5Iyn/6xlnAKkrsKUR7y0SNY=;
 b=ReFoKU61AbVCeNw18nJrjGZmZaWRy10Vnyo2T/77T9HNUfgfeW76hNAmDHTtsXwXXdHD48
 oegHRr3b6FAJvXxE91CMJxzUHsohUG9yp1OYoZ6pj6kg3KQOVuuFE6nURux8Wlaxy9sAl6
 Oyq4P8BetqTcr2e9zJ3mPgHt4EcZ/zg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-gY1REZGEPHuPW14VUjNvRg-1; Fri, 18 Jun 2021 11:58:19 -0400
X-MC-Unique: gY1REZGEPHuPW14VUjNvRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1DFB8015F8;
 Fri, 18 Jun 2021 15:58:18 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92FDF7A8D7;
 Fri, 18 Jun 2021 15:58:08 +0000 (UTC)
Date: Fri, 18 Jun 2021 17:58:07 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC 0/3] qtest: pick tests that require KVM at runtime
Message-ID: <20210618175807.2fa30126@redhat.com>
In-Reply-To: <20210618132647.07cf2008@redhat.com>
References: <20210616152455.1270264-1-imammedo@redhat.com>
 <d10ba45f-c71c-f472-fac7-9f8e5770c735@suse.de>
 <20210618132647.07cf2008@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: lvivier@redhat.com, thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 mst@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Jun 2021 13:26:47 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> On Thu, 17 Jun 2021 18:49:17 +0200
> Claudio Fontana <cfontana@suse.de> wrote:

[...]

> > Does this series work with --disable-kvm builds? (TCG-only builds?)  
> I'll test. But on the first glance it should work without issues.
> (i.e. kvm only tests will be skipped).

it didn't work, built fine but still tries to execute KVM test.
Fixed v3 is on the way

> 
> > 
> > Thanks,
> > 
> > CLaudio
> > 
> >   
> > > 
> > > For an example:
> > >  test q35 machine with intel_iommu
> > >  This test will run only is KVM is available and fail
> > >  to start QEMU if it fallsback to TCG, thus failing whole test.
> > >  So if test is executed in VM where nested KVM is not enabled
> > >  or on other than x86 host, it will break 'make check-qtest'
> > > 
> > > Series adds a lightweight qtest_has_kvm() check, which abuses
> > > build system and should help to avoid running KVM only tests
> > > on hosts that do not support it.
> > > 
> > > PS:
> > > there is an alternative 'query-accels' QMP command proposal
> > > https://patchwork.kernel.org/project/qemu-devel/patch/20210503211020.894589-3-philmd@redhat.com/
> > > which I think is more robust compared to qtest_has_kvm() and
> > > could be extended to take into account machine type.
> > > But it's more complex and what I dislike about it most,
> > > it requires execution of 'probing' QEMU instance to find
> > > execute 'query-accels' QMP command, which is rather resource
> > > consuming. So I'd use query-accels approach only when it's
> > > the only possible option to minimize load on CI systems.
> > > 
> > > Igor Mammedov (2):
> > >   tests: acpi: q35: test for x2APIC entries in SRAT
> > >   tests: acpi: update expected tables blobs
> > > 
> > > root (1):
> > >   tests: qtest: add qtest_has_kvm() to check if tested bynary supports
> > >     KVM
> > > 
> > >  tests/qtest/libqos/libqtest.h    |   7 +++++++
> > >  meson.build                      |   1 +
> > >  tests/data/acpi/q35/APIC.numamem | Bin 0 -> 2686 bytes
> > >  tests/data/acpi/q35/DSDT.numamem | Bin 7865 -> 35222 bytes
> > >  tests/data/acpi/q35/FACP.numamem | Bin 0 -> 244 bytes
> > >  tests/data/acpi/q35/SRAT.numamem | Bin 224 -> 5080 bytes
> > >  tests/qtest/bios-tables-test.c   |  10 +++++++---
> > >  tests/qtest/libqtest.c           |  20 ++++++++++++++++++++
> > >  8 files changed, 35 insertions(+), 3 deletions(-)
> > >  create mode 100644 tests/data/acpi/q35/APIC.numamem
> > >  create mode 100644 tests/data/acpi/q35/FACP.numamem
> > >     
> >   
> 
> 


