Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 910436A486F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:44:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWhYK-0007Bn-G7; Mon, 27 Feb 2023 12:44:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWhYI-0007B5-Lk
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:44:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWhYG-000258-2h
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:44:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677519879;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/cylLBDkCTL4wMEGvqlz+wg7IC5bIdz6tYhZJKdhXpU=;
 b=aQSgq86eG3xf0f9oIWyAFV3Hsq01iisRHL8C72aLyaSqjRveHbupdG3WpWP+0Wg686bcMM
 smV+5ZlKxUrB92yRJQxmsxQG3DPHgnQUFhFphwA5cjSKLQERhAtvxlHFINbaVBHtFVVPxA
 MslvrWAYPvWdOp5i+zV1uGSy1u4EIZ4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-2a5P9d1xPp6fH3mtuy1Ytg-1; Mon, 27 Feb 2023 12:44:35 -0500
X-MC-Unique: 2a5P9d1xPp6fH3mtuy1Ytg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 834B285A5B1;
 Mon, 27 Feb 2023 17:44:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69D352026D4B;
 Mon, 27 Feb 2023 17:44:33 +0000 (UTC)
Date: Mon, 27 Feb 2023 17:44:30 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: qemu-devel@nongnu.org, alxndr@bu.edu, pbonzini@redhat.com,
 bsd@redhat.com, stefanha@redhat.com, thuth@redhat.com,
 darren.kenny@oracle.com, Qiuhao.Li@outlook.com, fam@euphon.net,
 lvivier@redhat.com
Subject: Re: [PATCH] tests: Ensure TAP version is printed before other messages
Message-ID: <Y/zr/nN0O3K/GW02@redhat.com>
References: <20230227174019.1164205-1-rjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230227174019.1164205-1-rjones@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Feb 27, 2023 at 05:40:19PM +0000, Richard W.M. Jones wrote:
> These two tests were failing with this error:
> 
>   stderr:
>   TAP parsing error: version number must be on the first line
>   [...]
>   Unknown TAP version. The first line MUST be `TAP version <int>`. Assuming version 12.
> 
> This can be fixed by ensuring we always call g_test_init first in the
> body of main.
> 
> Thanks: Daniel Berrange, for diagnosing the problem
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>  tests/qtest/fuzz-lsi53c895a-test.c | 4 ++--
>  tests/qtest/rtl8139-test.c         | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


> 
> diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
> index a9254b455d..2012bd54b7 100644
> --- a/tests/qtest/fuzz-lsi53c895a-test.c
> +++ b/tests/qtest/fuzz-lsi53c895a-test.c
> @@ -112,12 +112,12 @@ static void test_lsi_do_dma_empty_queue(void)
>  
>  int main(int argc, char **argv)
>  {
> +    g_test_init(&argc, &argv, NULL);
> +
>      if (!qtest_has_device("lsi53c895a")) {
>          return 0;
[>      }
>  
> -    g_test_init(&argc, &argv, NULL);
> -
>      qtest_add_func("fuzz/lsi53c895a/lsi_do_dma_empty_queue",
>                     test_lsi_do_dma_empty_queue);
>  
> diff --git a/tests/qtest/rtl8139-test.c b/tests/qtest/rtl8139-test.c
> index 1beb83805c..4bd240e9ee 100644
> --- a/tests/qtest/rtl8139-test.c
> +++ b/tests/qtest/rtl8139-test.c
> @@ -207,9 +207,10 @@ int main(int argc, char **argv)
>          verbosity_level = atoi(v_env);
>      }
>  
> -    qtest_start("-device rtl8139");
> -
>      g_test_init(&argc, &argv, NULL);
> +
> +    qtest_start("-device rtl8139");

As a more general point I find it a little dubious that we spawn
QEMU from main() outside the context of the test case. I guess
that makes it slightly more efficient since we have one QEMU for
both test cases, but it is feels slightly oddball and obviously
leads to bugs like this one we see.

> +
>      qtest_add_func("/rtl8139/nop", nop);
>      qtest_add_func("/rtl8139/timer", test_init);
>  
> -- 
> 2.39.2
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


