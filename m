Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C303212FD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 10:24:33 +0100 (CET)
Received: from localhost ([::1]:51490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE7SC-0002YY-3y
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 04:24:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lE7RH-00029K-2t
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 04:23:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lE7RE-0006kH-8j
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 04:23:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613985809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jIjJXgSfPqXYEVqTR9WcIfbC03imf82z5Ib8jeXM4/M=;
 b=GMlCGLsRIv/8gL3QVaPtaS5xm4GnM78znY/QzEgmPCNp6h9a4K2V/kKE3Jym/nQfLYifbB
 Lcvh+u+eHv9sImQ15zELtHzvoQg5EO+9rBHr4uccSLFKxwKSEvaeYS8l+52PSvFX2ocvRc
 DdPdvBNbOhOHDi6nDdAkVEMG0UYEsiQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-afcJY53DN0Oqv_2u2LfACw-1; Mon, 22 Feb 2021 04:23:26 -0500
X-MC-Unique: afcJY53DN0Oqv_2u2LfACw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AB9B803F47;
 Mon, 22 Feb 2021 09:23:25 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-97.ams2.redhat.com [10.36.112.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8742919C79;
 Mon, 22 Feb 2021 09:23:24 +0000 (UTC)
Subject: Re: [PATCH v2 00/15] tests/tcg: Add TriCore tests
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org
References: <20200604085441.103087-1-kbastian@mail.uni-paderborn.de>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <29328969-9f3a-182f-4fa8-08643f4afab4@redhat.com>
Date: Mon, 22 Feb 2021 10:23:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20200604085441.103087-1-kbastian@mail.uni-paderborn.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/06/2020 10.54, Bastian Koppelmann wrote:
> Hi Alex,
> 
> I managed to update the series to successfully run make check-tcg. This required
> some changes to the makefiles. I tried running the riscv64 and arm tests and so
> far I didn't break anything.
> 
> You can find the full tree here:
> https://github.com/bkoppelmann/qemu/tree/tricore-tcg-tests
> 
> Cheers,
> Bastian
> 
> Bastian Koppelmann (15):
>    docker/tricore: Use stretch-slim as a base image
>    tests/tcg: Add docker_as and docker_ld cmds
>    tests/tcg: Run timeout cmds using --foreground
>    hw/tricore: Add testdevice for tests in tests/tcg/
>    tests/tcg/tricore: Add build infrastructure
>    tests/tcg/tricore: Add macros to create tests and first test 'abs'
>    tests/tcg/tricore: Add bmerge test
>    tests/tcg/tricore: Add clz test
>    tests/tcg/tricore: Add dvstep test
>    tests/tcg/tricore: Add fadd test
>    tests/tcg/tricore: Add fmul test
>    tests/tcg/tricore: Add ftoi test
>    tests/tcg/tricore: Add madd test
>    tests/tcg/tricore: Add msub test
>    tests/tcg/tricore: Add muls test

  Hi Bastian,

I'm currently looking at the containers that we build in the gitlab-CI, and 
it seems that the "debian-tricore-cross" container is currently always built 
though it is never used.
So I'm wondering: Do you still plan to finish this series here and get it 
merged, or could we remove the "debian-tricore-cross" container from the 
gitlab-CI again?

  Thanks,
   Thomas


