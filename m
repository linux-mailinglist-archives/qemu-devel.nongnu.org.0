Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C958E35C91F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 16:48:36 +0200 (CEST)
Received: from localhost ([::1]:51490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVxrf-0005Zu-To
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 10:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lVxol-0004fk-MN
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:45:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lVxoU-0005sr-O5
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:45:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618238716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VnbAR8IHHNmiPgFzB4bE8bzCswKwlEOrCOUQNBUnB+U=;
 b=DUeJcjK0Lvu6ot3bvwu2V/ftaEk4hYBN7uZ/jKaJsLOLnnL/+qGMBZe+6L6NQTZOFxAUEa
 EmSChC8b3N05VjONkUmgcn4j6+9M2fcF+RmIr8q77Gmj8OsVdZdyxuXNDj02iLmsou/SA3
 MetjnFbYhBQrBIUY3WzNDvOF63auZ/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-0NHQLD1sPnS5KydTBw0Hgw-1; Mon, 12 Apr 2021 10:45:15 -0400
X-MC-Unique: 0NHQLD1sPnS5KydTBw0Hgw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E249D6D246;
 Mon, 12 Apr 2021 14:45:12 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E172620DE;
 Mon, 12 Apr 2021 14:45:10 +0000 (UTC)
Subject: Re: [PATCH v3] libqtest: refuse QTEST_QEMU_BINARY=qemu-kvm
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210412143050.725918-1-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ef3b4625-3f76-2d37-4589-b2f8dc49ed75@redhat.com>
Date: Mon, 12 Apr 2021 16:45:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210412143050.725918-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Qin Wang <qinwang@rehdat.com>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/04/2021 16.30, Stefan Hajnoczi wrote:
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
> Since this is an error that is triggered by the user and not a test
> failure, use exit(1) instead of abort(). Change the existing abort()
> call in qtest_get_arch() to exit(1) too for the same reason and to be
> consistent.
> 
> Reported-by: Qin Wang <qinwang@rehdat.com>
> Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> v3:
>   * Add newline to wrap error message output at 80 columns [Thomas]
>   * Drop information about working around this using a symlink [Thomas]
>   * Use exit(1) instead of abort() [Thomas]
> 
>   tests/qtest/libqtest.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 71e359efcd..825b13a44c 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -907,7 +907,14 @@ const char *qtest_get_arch(void)
>   
>       if (!end) {
>           fprintf(stderr, "Can't determine architecture from binary name.\n");
> -        abort();
> +        exit(1);
> +    }
> +
> +    if (!strstr(qemu, "-system-")) {
> +        fprintf(stderr, "QTEST_QEMU_BINARY must end with *-system-<arch> "
> +                "where 'arch' is the target\narchitecture (x86_64, aarch64, "
> +                "etc).\n");
> +        exit(1);
>       }
>   
>       return end + 1;
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


