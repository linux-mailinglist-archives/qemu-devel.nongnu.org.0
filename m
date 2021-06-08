Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DD839F807
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 15:44:06 +0200 (CEST)
Received: from localhost ([::1]:60072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqc1V-0001x4-De
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 09:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqc0U-0000he-A7
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:43:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqc0R-0001jy-3N
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:43:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623159778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j7IuGQU1F3AWvAOwsLcLSr8dFpaMTUqq6KmFXk8GOcg=;
 b=YzU5jD8YjQhs++y8hXYeBf/5AJqGnXgeEO7GXqsFTwfHWL22d94a7Ap+5hEcDUXRfgp9i/
 DkqutUwMYhtU6LdaP6n6k9FFERiSlWafmQXHVtffCUxoI3NdDyWrcDWNdn1CJjB/CJDafv
 Zgv7RskBjGbhj0mf0QjQkvMmB8SIRkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-dJl7a552MwS4A6pWfkQ-5A-1; Tue, 08 Jun 2021 09:42:57 -0400
X-MC-Unique: dJl7a552MwS4A6pWfkQ-5A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB9BA800C60;
 Tue,  8 Jun 2021 13:42:53 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF2595C1BB;
 Tue,  8 Jun 2021 13:42:52 +0000 (UTC)
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <83b32ad3-18a6-c9d4-6561-c3c880234e09@redhat.com>
Date: Tue, 8 Jun 2021 09:42:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-97-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 "open list:IDE" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 11:53 AM, Alex Bennée wrote:
> The assumption that the qemu-system-aarch64 image can run all 32 bit
> machines is about to be broken and besides it's not likely this is

What's changing? I'm not deeply familiar with aarch64. Why is this 
assumption about to be broken?

> improving out coverage by much. Test the "virt" machine for both arm
> and aarch64 as it can be used by either architecture.
> 

Sounds fine to me, but I didn't write this part of the test. Thomas, you 
wrote this section IIRC -- does this reduce coverage in any meaningful way?

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/qtest/cdrom-test.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
> index 5af944a5fb..1e74354624 100644
> --- a/tests/qtest/cdrom-test.c
> +++ b/tests/qtest/cdrom-test.c
> @@ -220,13 +220,16 @@ int main(int argc, char **argv)
>               "magnum", "malta", "pica61", NULL
>           };
>           add_cdrom_param_tests(mips64machines);
> -    } else if (g_str_equal(arch, "arm") || g_str_equal(arch, "aarch64")) {
> +    } else if (g_str_equal(arch, "arm")) {
>           const char *armmachines[] = {
>               "realview-eb", "realview-eb-mpcore", "realview-pb-a8",
>               "realview-pbx-a9", "versatileab", "versatilepb", "vexpress-a15",
>               "vexpress-a9", "virt", NULL
>           };
>           add_cdrom_param_tests(armmachines);
> +    } else if (g_str_equal(arch, "aarch64")) {
> +        const char *aarch64machines[] = { "virt", NULL };
> +        add_cdrom_param_tests(aarch64machines);
>       } else {
>           const char *nonemachine[] = { "none", NULL };
>           add_cdrom_param_tests(nonemachine);
> 


