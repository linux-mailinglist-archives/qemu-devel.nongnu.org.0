Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B293D2D7A7B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 17:05:25 +0100 (CET)
Received: from localhost ([::1]:53672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkv6-00044o-7D
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 11:05:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knklg-0004e0-E6
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:55:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knkle-0008L4-Ha
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:55:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607702137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PHfS7pmvHdKnBhI4EkTmnOsGS+Nm/mXApq3cOtE//4Y=;
 b=aPPCCLkmhnUc4CrolCL54aYIYm4S91ER/WEDNS/N2eSkbZTnUIt8PJDUf7zAQFDNYGOnua
 xDQNzKC/PM0AOn3BJ+pBTNNxBjfp8zXp3cQcufPPU9BMoJQNXGQBgSYJyc27sH00ZHN5/7
 48HfyEnMJ+27KjhRjjGLfbtP+ELaV7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-bGuf9B6qN7GazzQ54KnV0w-1; Fri, 11 Dec 2020 10:55:35 -0500
X-MC-Unique: bGuf9B6qN7GazzQ54KnV0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CDB215720;
 Fri, 11 Dec 2020 15:55:33 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-76.ams2.redhat.com [10.36.113.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13F5410016FE;
 Fri, 11 Dec 2020 15:55:31 +0000 (UTC)
Subject: Re: [PATCH 00/12] Compile QEMU with -Wimplicit-fallthrough
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201211152426.350966-1-thuth@redhat.com>
Message-ID: <8c24cb0c-391e-3f65-d01d-f7d32e12f9a7@redhat.com>
Date: Fri, 11 Dec 2020 16:55:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201211152426.350966-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/2020 16.24, Thomas Huth wrote:
> Coverity is already reporting switch-case statements where code
> can fall through from one case to another without a proper comment
> (since this could indicate a missing "break" and thus a bug).
> However, it's cumbersome to fix these issues after they have been
> merged already, it would be better if the author of the code would
> already take care of this when writing the patch. Fortunately,
> GCC and Clang can already warn about those code spots, too.
> So let's fix our remaining statements that fall through without
> a proper comment, so we can finally turn on -Wimplicit-fallthrough
> for all compilation runs.
> 
> Chen Qun (6):
>   hw/timer/renesas_tmr: silence the compiler warnings
>   target/i386: silence the compiler warnings in gen_shiftd_rm_T1
>   hw/intc/arm_gicv3_kvm: silence the compiler warnings
>   accel/tcg/user-exec: silence the compiler warnings
>   target/sparc/translate: silence the compiler warnings
>   target/sparc/win_helper: silence the compiler warnings
> 
> Thomas Huth (6):
>   disas/libvixl: Fix fall-through annotation for GCC >= 7
>   target/unicore32/translate: Add missing fallthrough annotations
>   hw/rtc/twl92230: Silence warnings about missing fallthrough statements
>   tcg/optimize: Add fallthrough annotations
>   tests/fp: Do not emit implicit-fallthrough warnings in the softfloat
>     tests
>   configure: Compile with -Wimplicit-fallthrough=2

I forgot to mention: There are two more spots in the ppc code that currently
cause some warnings, but the patches to fix those are already in David
Gibson's ppc pull request, so they should be handled soon.

 Thomas


