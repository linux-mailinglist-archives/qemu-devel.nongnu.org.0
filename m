Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BACD382C99
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:53:05 +0200 (CEST)
Received: from localhost ([::1]:47390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lick3-0000NI-S7
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1licjJ-00087o-8d
 for qemu-devel@nongnu.org; Mon, 17 May 2021 08:52:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1licjG-0003XG-K1
 for qemu-devel@nongnu.org; Mon, 17 May 2021 08:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621255932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sxP3FOhHDrlsitWhfqS+AhxfDWe5ZpPw7B+qaNfKUi4=;
 b=QMyL8V52BKo0HLGhftbI5yM4INOpSqKgnLEC27W1LB9xrCb/q09+reZPW+FpGIoNcqYp0L
 DdP3iBFtICS33t6w3ex1ZAKGhscUX0xk03wkYfi8nwo13rLaoD3TVLACvv6a5O5O8Lyc//
 F88GwD2T3ku/nWsxc2d3SSg+GqBAFo4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-z3MHtprfMF2mnf4TNQY9yQ-1; Mon, 17 May 2021 08:52:10 -0400
X-MC-Unique: z3MHtprfMF2mnf4TNQY9yQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 819A3A0CAD;
 Mon, 17 May 2021 12:52:09 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-112-35.ams2.redhat.com [10.36.112.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6A2B100F49F;
 Mon, 17 May 2021 12:52:07 +0000 (UTC)
Date: Mon, 17 May 2021 14:52:05 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH 2/2] tests/tcg/x86_64: add vsyscall smoke test
Message-ID: <20210517145205.20359f18.cohuck@redhat.com>
In-Reply-To: <20210512040250.203953-3-iii@linux.ibm.com>
References: <20210512040250.203953-1-iii@linux.ibm.com>
 <20210512040250.203953-3-iii@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 May 2021 06:02:50 +0200
Ilya Leoshkevich <iii@linux.ibm.com> wrote:

> Having a small test will prevent trivial regressions in the future.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  tests/tcg/x86_64/Makefile.target |  6 +++++-
>  tests/tcg/x86_64/vsyscall.c      | 11 +++++++++++
>  2 files changed, 16 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tcg/x86_64/vsyscall.c

> diff --git a/tests/tcg/x86_64/vsyscall.c b/tests/tcg/x86_64/vsyscall.c
> new file mode 100644
> index 0000000000..b9b7f87459
> --- /dev/null
> +++ b/tests/tcg/x86_64/vsyscall.c
> @@ -0,0 +1,11 @@
> +#include <stdio.h>
> +#include <time.h>
> +
> +#define VSYSCALL_PAGE 0xffffffffff600000
> +#define TIME_OFFSET 0x400
> +typedef time_t (*time_func)(time_t *);
> +
> +int main(void)
> +{
> +    printf("%ld\n", ((time_func)(VSYSCALL_PAGE + TIME_OFFSET))(NULL));
> +}

Fails in https://gitlab.com/cohuck/qemu/-/jobs/1267727559 ("error:
control reaches end of non-void function").


