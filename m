Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E087E652336
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:56:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dpR-0000ub-VV; Tue, 20 Dec 2022 09:42:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p7dpN-0000qf-Pv
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:42:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p7dpM-00024x-6T
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:42:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671547363;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q/m187eV/gcYh9QGafuDgYMZRK/+7aKaP9vGNwNkFE4=;
 b=UkoxRC4Vi2/BDaLuTBmbJiojdSYStX58C23W6jYZKWjyfxBxZGb7+voHCotmcKRuuv/C1V
 lNWKJpYuPDyX63JDhTamjBCtdmmXq5iMJIQ+ZMqF4GcuCo4oMdul0F5hJOqD3LvlD3Dvve
 sQfOmtmYF5040VhcPNemsBGnEntAe5k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-RmpFKiHvOcuRuNP5KJv-rw-1; Tue, 20 Dec 2022 09:42:39 -0500
X-MC-Unique: RmpFKiHvOcuRuNP5KJv-rw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7880080D0E8;
 Tue, 20 Dec 2022 14:42:39 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AB17492C14;
 Tue, 20 Dec 2022 14:42:38 +0000 (UTC)
Date: Tue, 20 Dec 2022 14:42:35 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 0/3] accel: Silent few -Wmissing-field-initializers warning
Message-ID: <Y6HJ21W6Q5h2UvrE@redhat.com>
References: <20221220143532.24958-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221220143532.24958-1-philmd@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Tue, Dec 20, 2022 at 03:35:29PM +0100, Philippe Mathieu-Daudé wrote:
> Silent few -Wmissing-field-initializers warnings enabled by -Wextra.
> 
> Philippe Mathieu-Daudé (3):
>   tcg: Silent -Wmissing-field-initializers warning
>   accel/kvm: Silent -Wmissing-field-initializers warning
>   softmmu: Silent -Wmissing-field-initializers warning
> 
>  accel/kvm/kvm-all.c | 4 ++--
>  softmmu/vl.c        | 2 +-
>  tcg/tcg-common.c    | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)

If we're going to the trouble of fixing violations (which is
good), then we shouuld also add  -Wmissing-field-initializers
(or -Wextra) to warn_flags in configure, to prevent regressions
again in future.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


