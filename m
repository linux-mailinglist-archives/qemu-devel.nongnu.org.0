Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742DB2F9AD0
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 08:52:53 +0100 (CET)
Received: from localhost ([::1]:34594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1PLI-0005NE-0u
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 02:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1PIy-0004BE-JN
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 02:50:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1PIt-0004ZR-H6
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 02:50:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610956222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xs8emQ0MqBRW7hb3GRLqhn3Ns9bQ7gCOpRNhUiI1zvY=;
 b=HLQ9fH96MSauL7fEJWIkb9qvVbdu3kErwQTXD2QKxWelG1CWfFbFBODGrwThBfRYVKOoSV
 yzPum7jsCJc+AXhFXtAaFdAveVL8WFoHRaP3oRxbbmMmllRMxCT50bFC5BVInnVd60D137
 hev2v4kv0CBHTKAf29GcTPNj62hitog=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442--d6w19D0MTWm18O3XQyTEA-1; Mon, 18 Jan 2021 02:50:19 -0500
X-MC-Unique: -d6w19D0MTWm18O3XQyTEA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65CCB80667C;
 Mon, 18 Jan 2021 07:50:18 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-189.ams2.redhat.com [10.36.112.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F0D3272C8;
 Mon, 18 Jan 2021 07:50:05 +0000 (UTC)
Subject: Re: [PATCH 1/2] docs/fuzz: fix pre-meson path
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210117201014.271610-1-alxndr@bu.edu>
 <20210117201014.271610-2-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d94da0a9-0b54-9b65-cc3e-4232e51f1cab@redhat.com>
Date: Mon, 18 Jan 2021 08:50:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210117201014.271610-2-alxndr@bu.edu>
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
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/01/2021 21.10, Alexander Bulekov wrote:
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   docs/devel/fuzzing.rst | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
> index 8792358854..b9bb07988b 100644
> --- a/docs/devel/fuzzing.rst
> +++ b/docs/devel/fuzzing.rst
> @@ -119,7 +119,7 @@ Adding a new fuzzer
>   
>   Coverage over virtual devices can be improved by adding additional fuzzers.
>   Fuzzers are kept in ``tests/qtest/fuzz/`` and should be added to
> -``tests/qtest/fuzz/Makefile.include``
> +``tests/qtest/fuzz/meson.build``
>   
>   Fuzzers can rely on both qtest and libqos to communicate with virtual devices.
>   
> @@ -128,8 +128,7 @@ Fuzzers can rely on both qtest and libqos to communicate with virtual devices.
>   2. Write the fuzzing code using the libqtest/libqos API. See existing fuzzers
>      for reference.
>   
> -3. Register the fuzzer in ``tests/fuzz/Makefile.include`` by appending the
> -   corresponding object to fuzz-obj-y
> +3. Add the fuzzer to ``tests/qtest/fuzz/meson.build``.
>   
>   Fuzzers can be more-or-less thought of as special qtest programs which can
>   modify the qtest commands and/or qtest command arguments based on inputs
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


