Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A312F9BDD
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:26:36 +0100 (CET)
Received: from localhost ([::1]:45238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Qnz-00053m-8k
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:26:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1Qmo-0003zy-9F
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:25:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1Qml-00070x-Ku
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:25:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610961918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qSs55K3UkCBFEVquSKy98H150ZuIdBUTUxh0LVBg2QI=;
 b=bQB9IbehtFAYpCAy1EDEeeqpgp+jtG0N+qdhxP3n8QJ/ETpPySQ1HBm1gkntJkHhIlOQJ/
 wz0DFCsMbGSaxhB9T8eC3H4rrvdSYziUMROWmXlT7Qv0ZNsqvPK+ce6NqMP6HQVi5tRtgy
 elg5XWG5OawMIuX9bKS8e6lR0+nBfvw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-N_EMQiABM1-ul3fw6kTIEQ-1; Mon, 18 Jan 2021 04:25:15 -0500
X-MC-Unique: N_EMQiABM1-ul3fw6kTIEQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05B1A806673;
 Mon, 18 Jan 2021 09:25:15 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-189.ams2.redhat.com [10.36.112.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C3E5709AB;
 Mon, 18 Jan 2021 09:25:07 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] fuzz: enable dynamic args for generic-fuzz configs
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210117230924.449676-1-alxndr@bu.edu>
 <20210117230924.449676-2-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <076dae16-6e1e-dab8-b822-926f1b4a9a76@redhat.com>
Date: Mon, 18 Jan 2021 10:25:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210117230924.449676-2-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/01/2021 00.09, Alexander Bulekov wrote:
> For some device configurations, it is useful to configure some
> resources, and adjust QEMU arguments at runtime, prior to fuzzing. This
> patch adds an "argfunc" to generic the generic_fuzz_config. When
> specified, it is responsible for configuring the resources and returning
> a string containing the corresponding QEMU arguments. This can be useful
> for targets that rely on e.g.:
>   * a temporary qcow2 image
>   * a temporary directory
>   * an unused TCP port used to bind the VNC server
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   tests/qtest/fuzz/generic_fuzz.c         | 10 +++++++++-
>   tests/qtest/fuzz/generic_fuzz_configs.h |  1 +
>   2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index be76d47d2d..6adf62a5be 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -936,12 +936,20 @@ static GString *generic_fuzz_cmdline(FuzzTarget *t)
>   
>   static GString *generic_fuzz_predefined_config_cmdline(FuzzTarget *t)
>   {
> +    gchar *args;
>       const generic_fuzz_config *config;
>       g_assert(t->opaque);
>   
>       config = t->opaque;
>       setenv("QEMU_AVOID_DOUBLE_FETCH", "1", 1);
> -    setenv("QEMU_FUZZ_ARGS", config->args, 1);
> +    if (config->argfunc) {
> +        args = config->argfunc();
> +        setenv("QEMU_FUZZ_ARGS", args, 1);
> +        g_free(args);
> +    } else {
> +        g_assert_nonnull(config->args);
> +        setenv("QEMU_FUZZ_ARGS", config->args, 1);
> +    }
>       setenv("QEMU_FUZZ_OBJECTS", config->objects, 1);
>       return generic_fuzz_cmdline(t);
>   }
> diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
> index 7fed035345..1a133655ee 100644
> --- a/tests/qtest/fuzz/generic_fuzz_configs.h
> +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
> @@ -16,6 +16,7 @@
>   
>   typedef struct generic_fuzz_config {
>       const char *name, *args, *objects;
> +    gchar* (*argfunc)(void); /* Result must be free
Reviewed-by: Thomas Huth <thuth@redhat.com>

... would it make sense to also add a cleanup function pointer here, so that 
the resources can also be freed cleanly after a test has succeeded (instead 
of using atexit() like suggested in your third patch)? Well, just an idea, 
it still can be done in a later patch.


