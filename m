Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 331773580FC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 12:41:11 +0200 (CEST)
Received: from localhost ([::1]:55912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUS62-0004JB-7d
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 06:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lUS47-000314-Rl
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:39:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lUS3y-0006cX-R8
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:39:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617878341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tb9hdh1OgWdgpwmQ6x9UVOVgRpWGo7rPZss+ucLZ01g=;
 b=TDCgsndFr4k9/kGMV6OwhX/MJTpobO+RllXezfeSd0WRgm/Kc1m7hhhXGcd1Fcmg5Mc+aL
 zoFRilaOhvFiUqyicap2/z7C3cSOZjtMKSZ7jbMNTr6y8QJE6hi1eQPUr/ALQg0I6hGf1V
 QxDmznWvlicjVTdXy4WuccdBpf667aE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-niT55d2xMfCKX7pgUdFGeg-1; Thu, 08 Apr 2021 06:37:43 -0400
X-MC-Unique: niT55d2xMfCKX7pgUdFGeg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79CAA107ACCA;
 Thu,  8 Apr 2021 10:37:42 +0000 (UTC)
Received: from [10.36.113.107] (ovpn-113-107.ams2.redhat.com [10.36.113.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76A2914108;
 Thu,  8 Apr 2021 10:37:37 +0000 (UTC)
Subject: Re: [PATCH] libqtest: refuse QTEST_QEMU_BINARY=qemu-kvm
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210407104511.343061-1-stefanha@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <025a45d2-1191-ba09-7d3b-ce748794563f@redhat.com>
Date: Thu, 8 Apr 2021 12:37:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210407104511.343061-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qin Wang <qinwang@rehdat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/04/2021 12:45, Stefan Hajnoczi wrote:
> Some downstreams rename the QEMU binary to "qemu-kvm". This breaks
> qtest_get_arch(), which attempts to parse the target architecture from
> the QTEST_QEMU_BINARY environment variable.
> 
> Print an error instead of returning the architecture "kvm". Things fail
> in weird ways when the architecture string is bogus.
> 
> Arguably qtests should always be run in a build directory instead of
> against an installed QEMU. In any case, printing a clear error when this
> happens is helpful.
> 
> Reported-by: Qin Wang <qinwang@rehdat.com>
> Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tests/qtest/libqtest.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 71e359efcd..2fc249c0b5 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -910,6 +910,14 @@ const char *qtest_get_arch(void)
>          abort();
>      }
>  
> +    if (strcmp(end + 1, "kvm") == 0) {
> +        fprintf(stderr, "QTEST_QEMU_BINARY must end with *-<arch>. If you are "
> +                        "using qemu-kvm, please create a symlink like ln -s "
> +                        "path/to/qemu-kvm qemu-system-x86_64 and use that "
> +                        "instead.\n");
> +        abort();
> +    }
> +
>      return end + 1;
>  }
>  

I think it would be more generic to check we have the "-system-" string in the name.

Thanks,
Laurent


