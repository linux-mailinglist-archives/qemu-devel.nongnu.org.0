Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B80667504C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 10:10:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pInOt-0001s6-O3; Fri, 20 Jan 2023 04:09:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pInOo-0001rb-Vl
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 04:09:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pInOn-0005Dk-DF
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 04:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674205764;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qdxUaV9mozHLjRlBMziRBgdv11zgDk/75M2FwOnPmLQ=;
 b=I27lnBOdkH7RqaS21qzSTMrDEQuA6scBpH1eyRbIOdMijxd+BVIr61P1MmmlyLkyEHOpQa
 A55AABFirW/Xct0QNYWqyAl8qJeLRh3aAQPFljkZc9JAFScvC3s4U9vshqILBo5P0mnVrn
 vkMvacAPABSIgfLWYH/RcLVsw8jfjZo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-DFwlkfOjM72uDLyaq4PYfQ-1; Fri, 20 Jan 2023 04:09:20 -0500
X-MC-Unique: DFwlkfOjM72uDLyaq4PYfQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D9881014708;
 Fri, 20 Jan 2023 09:09:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 867B840C6EC4;
 Fri, 20 Jan 2023 09:09:17 +0000 (UTC)
Date: Fri, 20 Jan 2023 09:09:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [RFC PATCH 3/3] tests/qtest/vnc-display-test: Disable on Darwin
Message-ID: <Y8paOpaUKhw0pP2m@redhat.com>
References: <20230119120514.28778-1-philmd@linaro.org>
 <20230119120514.28778-4-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230119120514.28778-4-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

On Thu, Jan 19, 2023 at 01:05:14PM +0100, Philippe Mathieu-Daudé wrote:
> This test is failing in gtk-vnc on Darwin:
> 
>   $ make check-qtest-aarch64
>   ...
>   19/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/vnc-display-test
>   ERROR **: 10:42:35.488: vnc-error: Unsupported auth type 17973672
> 
> While QEMU picks the sigaltstack coroutine backend, gtk-vnc uses
> the ucontext coroutine backend, which might be broken on Darwin.

s/might be/is completely and utterly/

The struct ucontext_t definition on macOS aarch64 is too small,
and so getcontext() smashes past the end of the struct overwriting
whatever follows the ucontext_t struct.



> 
> Disable this test (current problem being investigated in this thread:
> https://lore.kernel.org/qemu-devel/Y8kw6X6keB5l53nl@redhat.com/).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  tests/qtest/vnc-display-test.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


But keep an eye on this bug:

  https://github.com/Homebrew/homebrew-core/issues/115413

if it gets fixed before you send a PULL request, we can drop
this patch, or failing that, revert it later.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


