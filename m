Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2AF43E80D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 20:10:40 +0200 (CEST)
Received: from localhost ([::1]:46688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg9rK-0006T5-47
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 14:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mg9kj-0001tD-6D
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 14:03:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mg9kf-0005JT-Gz
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 14:03:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635444223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eOIJEpJ7ZyIaN+8A6+sXggPzsVq34cku0Q0Pe6bLhgA=;
 b=RTlcGlQGFp9jh50+gMvFAKqOdj+wV6bIXqAJdiwlxUxcOwqalg7in3vVaDfCsjV3JDyhnf
 4aZ3FI0dcVnvNZsmgasUNAA5eg9OS37gt/TzsEwfzSbIyFO6JrO9CfDmyN5XXF4eExKZYT
 bcInG34RQMlbNY+MvkdPySe49g8C8hk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-6m8aVmlTOa2eD6n2pMEpZw-1; Thu, 28 Oct 2021 14:03:40 -0400
X-MC-Unique: 6m8aVmlTOa2eD6n2pMEpZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74D60802B4F
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 18:03:39 +0000 (UTC)
Received: from thuth.remote.csb (unknown [10.39.193.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 908795C1B4;
 Thu, 28 Oct 2021 18:03:38 +0000 (UTC)
Subject: Re: [PATCH 2/2] build: use "meson test" as the test harness
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211028142826.57327-1-pbonzini@redhat.com>
 <20211028142826.57327-3-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <60e3154f-16a2-98d9-ec29-e4c6a2291c20@redhat.com>
Date: Thu, 28 Oct 2021 20:03:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211028142826.57327-3-pbonzini@redhat.com>
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
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/10/2021 16.28, Paolo Bonzini wrote:
> "meson test" starting with version 0.57 is just as capable and easy to
> use as QEMU's own TAP driver.  All existing options for "make check"
> work.  The only required code change involves how to mark "slow" tests.
> 
> The rules for .tap output are replaced by JUnit XML; GitLab is able
> to parse that output and present it in the CI pipeline report.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   Makefile              |   3 +-
>   meson.build           |   5 +-
>   scripts/mtest2make.py | 104 ++++--------
>   scripts/tap-driver.pl | 379 ------------------------------------------
>   scripts/tap-merge.pl  | 111 -------------
>   tests/fp/meson.build  |   2 +-
>   6 files changed, 41 insertions(+), 563 deletions(-)
>   delete mode 100755 scripts/tap-driver.pl
>   delete mode 100755 scripts/tap-merge.pl
[...]
> diff --git a/tests/fp/meson.build b/tests/fp/meson.build
> index 07e2cdc8d2..32d57031fc 100644
> --- a/tests/fp/meson.build
> +++ b/tests/fp/meson.build
> @@ -622,7 +622,7 @@ test('fp-test-mulAdd', fptest,
>        # no fptest_rounding_args
>        args: fptest_args +
>              ['f16_mulAdd', 'f32_mulAdd', 'f64_mulAdd', 'f128_mulAdd'],
> -     suite: ['softfloat-slow', 'softfloat-ops-slow'], timeout: 90)
> +     suite: ['softfloat', 'softfloat-ops', 'slow'], timeout: 90)
>   
>   fpbench = executable(
>     'fp-bench',
> 

Thanks for the update, this works definitely better than the RFC already. 
However, I spotted another oddity: "make check-softfloat" now is way slower 
than before, it takes more than 2 minutes now, while it finished within 20 
seconds before your change ... looks like you've included some slow tests 
into the normal run now?

  Thomas


