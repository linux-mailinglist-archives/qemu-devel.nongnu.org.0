Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EE53610D1
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 19:10:53 +0200 (CEST)
Received: from localhost ([::1]:39328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX5W0-0006iu-3n
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 13:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lX56T-0002R9-OZ
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:44:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lX56O-0001n8-Fk
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:44:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618505062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8rDoCHy5gsIdQML8PzNPW1ZGuIj31Ots9VRp0j3cLPQ=;
 b=YmWnDHfQC4DUKf9Z/fDLW2xYc/T1D1JIw/ORoWZ/m9bcgjN3yq5xw98ORKWp5xZNagZusH
 mPXEmMAYCilB1Bba3LAkN+N/x7km5TA3aEIjQ6gzQmJx4FuuCJyxO/Kv6TKjVqYtsN0bAf
 iQerTfaHn8/Z+zm6XwXBq1iU51pRl/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-ctKt4yaaMwaxQHFyGLqexg-1; Thu, 15 Apr 2021 12:44:18 -0400
X-MC-Unique: ctKt4yaaMwaxQHFyGLqexg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B646107ACC7;
 Thu, 15 Apr 2021 16:44:17 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68A0D5D740;
 Thu, 15 Apr 2021 16:44:10 +0000 (UTC)
Date: Thu, 15 Apr 2021 18:44:04 +0200
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 05/12] qtest/arm-cpu-features: Restrict
 sve_tests_sve_off_kvm test to KVM
Message-ID: <20210415164404.r2ho6qmvmxsmipda@kamzik.brq.redhat.com>
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-6-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210415163304.4120052-6-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 15, 2021 at 06:32:57PM +0200, Philippe Mathieu-Daudé wrote:
> The sve_tests_sve_off_kvm() test is KVM specific.
> Only run it if KVM is available.
> 
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/qtest/arm-cpu-features.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 7f4b2521277..66300c3bc20 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -604,6 +604,8 @@ int main(int argc, char **argv)
>      if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("kvm")) {
>          qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
>                              NULL, test_query_cpu_model_expansion_kvm);
> +        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
> +                            NULL, sve_tests_sve_off_kvm);
>      }
>  
>      if (g_str_equal(qtest_get_arch(), "aarch64")) {
> @@ -611,8 +613,6 @@ int main(int argc, char **argv)
>                              NULL, sve_tests_sve_max_vq_8);
>          qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-off",
>                              NULL, sve_tests_sve_off);
> -        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
> -                            NULL, sve_tests_sve_off_kvm);
>      }
>  
>      return g_test_run();
> -- 
> 2.26.3
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


