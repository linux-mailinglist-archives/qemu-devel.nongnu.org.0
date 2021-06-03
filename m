Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B99439AE83
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 01:18:46 +0200 (CEST)
Received: from localhost ([::1]:34746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lowbs-0007Wp-N9
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 19:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lowb7-0006rn-48
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 19:17:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lowb4-0005wS-CT
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 19:17:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622762273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rZQ3dQE3+897qG4eMpDKiy6iW4SoHV63CjHrdlw30Zo=;
 b=ew50G76chKF2/B/0y4VbyUbHCQf39GGL4NtZEcdB4jow944mij2a0ppf5BJZaosWQMDCgN
 xb609JgOpD1PTAorYYkuHo4XmXp2gHA/2SEsHNG4xed01AglNCBmFP1ZanYae0HwGYRofA
 5g2SwaTBIqWmyzXb0RQz3Nbp6/8b7co=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-vErDCnb0MNiaTKmOwhj5Ww-1; Thu, 03 Jun 2021 19:17:51 -0400
X-MC-Unique: vErDCnb0MNiaTKmOwhj5Ww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A763B107ACCD;
 Thu,  3 Jun 2021 23:17:50 +0000 (UTC)
Received: from localhost (ovpn-120-94.rdu2.redhat.com [10.10.120.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30BFE5C277;
 Thu,  3 Jun 2021 23:17:47 +0000 (UTC)
Date: Thu, 3 Jun 2021 19:17:46 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v7 9/9] qtest/hyperv: Introduce a simple hyper-v test
Message-ID: <20210603231746.sirz53n3lxigj4vi@habkost.net>
References: <20210603114835.847451-1-vkuznets@redhat.com>
 <20210603114835.847451-10-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210603114835.847451-10-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 03, 2021 at 01:48:35PM +0200, Vitaly Kuznetsov wrote:
> For the beginning, just test 'hv-passthrough' and a couple of custom
> Hyper-V  enlightenments configurations through QMP. Later, it would
> be great to complement this by checking CPUID values from within the
> guest.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  MAINTAINERS               |   1 +
>  tests/qtest/hyperv-test.c | 225 ++++++++++++++++++++++++++++++++++++++
>  tests/qtest/meson.build   |   3 +-
>  3 files changed, 228 insertions(+), 1 deletion(-)
>  create mode 100644 tests/qtest/hyperv-test.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5f55404f2fae..862720016b3a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1537,6 +1537,7 @@ F: hw/isa/apm.c
>  F: include/hw/isa/apm.h
>  F: tests/unit/test-x86-cpuid.c
>  F: tests/qtest/test-x86-cpuid-compat.c
> +F: tests/qtest/hyperv-test.c

Maybe it makes sense to keep it here by now, but I believe we
should eventually create a section for hyperv in MAINTAINERS.

CCing Michael and Marcel, who are the people listed in this
MAINTAINERS section.


>  
>  PC Chipset
>  M: Michael S. Tsirkin <mst@redhat.com>
[...]
> +int main(int argc, char **argv)
> +{
> +    const char *arch = qtest_get_arch();
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    if (!strcmp(arch, "i386") || !strcmp(arch, "x86_64")) {

Is this necessary when the test is already being added to
qtests_i386/qtests_x86_64 only?

> +        qtest_add_data_func("/hyperv/hv-all-but-evmcs",
> +                            NULL, test_query_cpu_hv_all_but_evmcs);
> +        qtest_add_data_func("/hyperv/hv-custom",
> +                            NULL, test_query_cpu_hv_custom);
> +        if (kvm_has_sys_hyperv_cpuid()) {
> +            qtest_add_data_func("/hyperv/hv-passthrough",
> +                                NULL, test_query_cpu_hv_passthrough);
> +       }
> +    }
> +
> +    return g_test_run();
> +}
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index c3a223a83d6a..958a88d0c8b4 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -83,7 +83,8 @@ qtests_i386 = \
>     'vmgenid-test',
>     'migration-test',
>     'test-x86-cpuid-compat',
> -   'numa-test']
> +   'numa-test',
> +   'hyperv-test']
>  
>  dbus_daemon = find_program('dbus-daemon', required: false)
>  if dbus_daemon.found() and config_host.has_key('GDBUS_CODEGEN')
> -- 
> 2.31.1
> 

-- 
Eduardo


