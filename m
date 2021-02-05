Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B691310CD7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:02:48 +0100 (CET)
Received: from localhost ([::1]:33630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82dD-0002Cw-Jp
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l82aO-0000mh-Uo
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:59:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l82aM-0000wo-Es
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:59:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612537188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ht3z6TxE4YCJiZkm6NyVKJYkr+VCvf3AJToMCN9EiLI=;
 b=PvErIauoI5fZBNgut78HQqg9dbKMDpHv3Ye7D1OyhCc7lh24Fwbr4ssyCrZMSzzlFE6Pf6
 kJPA3PFcQ9+p22cB8uPXcxCFWd42K5I9ZbJw9zBWfXA8JiPdjQM1jl5DB8UJveCbBRlh20
 nWXs3bLHuN9bPA9PpXVih2nJqfWuLHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-SqaPxc8qOtiODea7qHniXQ-1; Fri, 05 Feb 2021 09:59:45 -0500
X-MC-Unique: SqaPxc8qOtiODea7qHniXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C43784E240;
 Fri,  5 Feb 2021 14:59:44 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.195.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC35C5D9CC;
 Fri,  5 Feb 2021 14:59:41 +0000 (UTC)
Date: Fri, 5 Feb 2021 15:59:38 +0100
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/9] tests/qtest/arm-cpu-features: Remove Cortex-A15 check
Message-ID: <20210205145938.dvjk7jsfatgm56cy@kamzik.brq.redhat.com>
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-2-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210205144345.2068758-2-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 05, 2021 at 03:43:37PM +0100, Philippe Mathieu-Daudé wrote:
> Support for ARMv7 has been dropped in commit 82bf7ae84ce
> ("target/arm: Remove KVM support for 32-bit Arm hosts"),
> no need to check for Cortex A15 host cpu anymore.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  tests/qtest/arm-cpu-features.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 8252b85bb85..c59c3cb002b 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -515,10 +515,6 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>          QDict *resp;
>          char *error;
>  
> -        assert_error(qts, "cortex-a15",
> -            "We cannot guarantee the CPU type 'cortex-a15' works "
> -            "with KVM on this host", NULL);
> -

This isn't testing anything regarding 32-bit KVM host support. It's
testing that an error is returned when a given cpu type that can't
be known to work with KVM is used. We know that the cortex-a15 can't
be known to work. If we were to use a 64-bit cpu type here then there's
a chance that it would work, failing the test that an error be returned.

>          assert_has_feature_enabled(qts, "host", "aarch64");
>  
>          /* Enabling and disabling pmu should always work. */
> -- 
> 2.26.2
> 
>

This file could use a cleanup patch regarding the dropping of 32-bit KVM
support though. At least the comment in main(), "For now we only run KVM
specific tests..." could be reworded. It was written that way when we
planned to try testing on 32-bit KVM too eventually, but we never did,
and now we'll never need to.

Thanks,
drew


