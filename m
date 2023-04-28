Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C340F6F1B56
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 17:20:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psPtP-0005wM-Vp; Fri, 28 Apr 2023 11:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1psPtG-0005w9-6G
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 11:20:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1psPtE-0003oD-IO
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 11:20:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682695203;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yB9CVTQp91YlfM2j+Vl4L4STqlP4qIfVVYVDPII5PAY=;
 b=AEyEWi35Ofd+u+dC5F0qwiCP7p9S579FZ9opLp/0f0bHuQOJvAfaN5+Yk0HfnE+YqZ2QCL
 XqfeeX8SbpiAHBLJYAVFpfqTjOgXfFeqwKJ/eMFhX3CFQ53dg18cszt74gy+cZyGbS6Mb1
 fBSFxIRBLnp+MvZW1g/qitLLvMK7fT4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-rGXzeRBxMfysXCuPy0vRpg-1; Fri, 28 Apr 2023 11:19:58 -0400
X-MC-Unique: rGXzeRBxMfysXCuPy0vRpg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86D12830D34;
 Fri, 28 Apr 2023 15:19:34 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6E8940C6EC4;
 Fri, 28 Apr 2023 15:19:31 +0000 (UTC)
Date: Fri, 28 Apr 2023 16:19:29 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>
Subject: Re: [PATCH] tests/qtest: Disable the spice test of readconfig-test
 on FreeBSD
Message-ID: <ZEvkAUOlPlt1ij0C@redhat.com>
References: <20230428151351.1365822-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230428151351.1365822-1-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Apr 28, 2023 at 05:13:51PM +0200, Thomas Huth wrote:
> The spice test is currently hanging on FreeBSD. It likely was
> never working before, since in the past, our configure script
> was failing to detect this feature due to a bug in the spice
> package there (it just got enabled recently by the commit
> https://cgit.freebsd.org/ports/commit/?id=cf16b1c9063351325f0 ).
> To get the CI working again, let's disable the failing test for
> now until someone has enough spare time to debug and fix the real
> underlying problem.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/qtest/readconfig-test.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


though could you file a gitlab bug report and link the bug report
in a comment at the #ifdef the code change, and in the commit
message.

> 
> diff --git a/tests/qtest/readconfig-test.c b/tests/qtest/readconfig-test.c
> index 2160603880..918d45684b 100644
> --- a/tests/qtest/readconfig-test.c
> +++ b/tests/qtest/readconfig-test.c
> @@ -86,8 +86,8 @@ static void test_x86_memdev(void)
>      qtest_quit(qts);
>  }
>  
> -
> -#ifdef CONFIG_SPICE
> +/* FIXME: The test is currently broken on FreeBSD */
> +#if defined(CONFIG_SPICE) && !defined(__FreeBSD__)
>  static void test_spice_resp(QObject *res)
>  {
>      Visitor *v;
> @@ -209,7 +209,7 @@ int main(int argc, char *argv[])
>          qtest_add_func("readconfig/x86/memdev", test_x86_memdev);
>          qtest_add_func("readconfig/x86/ich9-ehci-uhci", test_docs_config_ich9);
>      }
> -#ifdef CONFIG_SPICE
> +#if defined(CONFIG_SPICE) && !defined(__FreeBSD__)
>      qtest_add_func("readconfig/spice", test_spice);
>  #endif
>  
> -- 
> 2.31.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


