Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFB3303C0B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:49:00 +0100 (CET)
Received: from localhost ([::1]:54846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4MqB-000784-BS
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:48:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4MhI-00082w-TA
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:39:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4MhH-0007Nw-4s
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:39:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611661186;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bncx0Tq8a0KwAfmSvEmmbMIJOD1AohjurucBuwqmOPI=;
 b=bBo1nwOhWfZrIld5gN80LtidLp3d/Exgy3+Rs7DiqVC0Pcmg7go4ku88HhzI5lNHxUQxYH
 M7NLPmC5LTuXLIBjaBBOtlFNJTubTmMAgc2tIJWuli7mttRJh9Nz0ro5C9tW3/v3fKx9fi
 GC196vssdFH+nmCs41mVLI+63F/dw9E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-djmHwoq2PF-rXjkiQrDSwg-1; Tue, 26 Jan 2021 06:39:36 -0500
X-MC-Unique: djmHwoq2PF-rXjkiQrDSwg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80FDE107ACE4;
 Tue, 26 Jan 2021 11:39:35 +0000 (UTC)
Received: from redhat.com (ovpn-115-101.ams2.redhat.com [10.36.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 915525C1A3;
 Tue, 26 Jan 2021 11:39:30 +0000 (UTC)
Date: Tue, 26 Jan 2021 11:39:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/2] gitlab-ci: Test Fedora capstone package
Message-ID: <20210126113927.GE3640294@redhat.com>
References: <20210126113649.3148417-1-philmd@redhat.com>
 <20210126113649.3148417-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210126113649.3148417-3-philmd@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 26, 2021 at 12:36:49PM +0100, Philippe Mathieu-Daudé wrote:
> Test building the 4 targets using the capstone disassembler
> with the capstone package provided on Fedora.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitlab-ci.yml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index de3a3d25b58..913940656de 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -493,6 +493,13 @@ build-tci:
>      - QTEST_QEMU_BINARY="./qemu-system-x86_64" ./tests/qtest/pxe-test
>      - QTEST_QEMU_BINARY="./qemu-system-s390x" ./tests/qtest/pxe-test -m slow
>  
> +build-capstone-distrib:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: fedora
> +    CONFIGURE_ARGS: --enable-capstone=system --disable-tools --disable-docs
> +    TARGETS: arm-softmmu ppc-softmmu x86_64-linux-user s390x-linux-user

Won't one of the existing jobs using Fedora automatically enable use
of the system capstone ?  I don't think we want to keep adding jobs
for each new possible configure arg. Instead try to re-use existing
jobs whereever possible.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


