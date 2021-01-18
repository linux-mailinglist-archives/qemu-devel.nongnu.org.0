Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077A52F9AD1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 08:53:01 +0100 (CET)
Received: from localhost ([::1]:35406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1PLQ-0005hK-3Y
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 02:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1PJP-0004LS-5V
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 02:50:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1PJL-0004lS-Nf
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 02:50:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610956250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GMoFPVyImnVMWpfanf0MGCEsAma+g+xjUYvSDl9K2C0=;
 b=HES9R5CY7GyqKwSLiCijnHrS6ZHY3DvDnsKLdBDnVliHL954xURzlpRK3kBt/PFNHRN+3o
 BgqODHoB0hlsJSf8ti7HGAXAXBZUqO6hKfp1bEG7oOEWcd4iwFAIsS+hGRoqk0OIzJ5TyY
 QmN/ePocJQ0JCXuq+A058iV2fCJbRVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-fgVI_upsONavhayvn3Dn4Q-1; Mon, 18 Jan 2021 02:50:48 -0500
X-MC-Unique: fgVI_upsONavhayvn3Dn4Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD357107ACE3;
 Mon, 18 Jan 2021 07:50:47 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-189.ams2.redhat.com [10.36.112.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64D2B71C9B;
 Mon, 18 Jan 2021 07:50:40 +0000 (UTC)
Subject: Re: [PATCH 2/2] fuzz: log the arguments used to initialize QEMU
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210117201014.271610-1-alxndr@bu.edu>
 <20210117201014.271610-3-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d97f0ac0-244b-eecf-848e-c09c1fcea474@redhat.com>
Date: Mon, 18 Jan 2021 08:50:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210117201014.271610-3-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
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

On 17/01/2021 21.10, Alexander Bulekov wrote:
> This is useful for building reproducers. Instead checking the code or
> the QEMU_FUZZ_ARGS, the arguments are at the top of the crash log.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   tests/qtest/fuzz/fuzz.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
> index 238866a037..496d11a231 100644
> --- a/tests/qtest/fuzz/fuzz.c
> +++ b/tests/qtest/fuzz/fuzz.c
> @@ -159,6 +159,8 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
>       char *target_name;
>       const char *bindir;
>       char *datadir;
> +    GString *cmd_line;
> +    gchar *pretty_cmd_line;
>       bool serialize = false;
>   
>       /* Initialize qgraph and modules */
> @@ -217,7 +219,7 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
>       }
>   
>       /* Run QEMU's softmmu main with the fuzz-target dependent arguments */
> -    GString *cmd_line = fuzz_target->get_init_cmdline(fuzz_target);
> +    cmd_line = fuzz_target->get_init_cmdline(fuzz_target);
>       g_string_append_printf(cmd_line, " %s -qtest /dev/null ",
>                              getenv("QTEST_LOG") ? "" : "-qtest-log none");
>   
> @@ -226,6 +228,13 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
>       wordexp(cmd_line->str, &result, 0);
>       g_string_free(cmd_line, true);
>   
> +    if (getenv("QTEST_LOG")) {
> +        pretty_cmd_line  = g_strjoinv(" ", result.we_wordv + 1);
> +        printf("Starting %s with Arguments: %s\n",
> +                result.we_wordv[0], pretty_cmd_line);
> +        g_free(pretty_cmd_line);
> +    }
> +
>       qemu_init(result.we_wordc, result.we_wordv, NULL);
>   
>       /* re-enable the rcu atfork, which was previously disabled in qemu_init */
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


