Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806D935AAE6
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 06:42:47 +0200 (CEST)
Received: from localhost ([::1]:59862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lV5SI-0008Oi-0a
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 00:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lV5Qr-0007yF-7j
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 00:41:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lV5Qo-0005Vm-10
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 00:41:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618029672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FxyOssGsxhdV8a2oZ7vQDpmgvpGPRj2Mgjb0WLYqvhc=;
 b=SF4Xxp5+j5pv06z6ARpKCzt7rqaS9+mH5FjwJc8Sy7d9Rs3JUc/5uNBw7KPUw4UpkbrGKd
 F01GUlGsQ0bqLF5Xo7k2w36tUp9DKVpfi2UmRuP3DmgXoUY77Zq+5k3hErkNIfXgp1Vm1t
 8FNxuU//qdxYEw0XdnEWU1us5GGNZiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-whlUK-lbPR-dXyBJ7_qfDA-1; Sat, 10 Apr 2021 00:41:10 -0400
X-MC-Unique: whlUK-lbPR-dXyBJ7_qfDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79A0C8030B5
 for <qemu-devel@nongnu.org>; Sat, 10 Apr 2021 04:41:09 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-20.ams2.redhat.com [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7F3160C05;
 Sat, 10 Apr 2021 04:41:04 +0000 (UTC)
Subject: Re: [PATCH 2/2] docs/devel/qgraph: add troubleshooting information
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210409190109.476167-1-stefanha@redhat.com>
 <20210409190109.476167-3-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <13fb9be3-e928-d404-bcfe-25be7ef611d6@redhat.com>
Date: Sat, 10 Apr 2021 06:41:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210409190109.476167-3-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/04/2021 21.01, Stefan Hajnoczi wrote:
> It can be tricky to troubleshoot qos-test when a test won't execute. Add
> an explanation of how to trace qgraph node connectivity and find which
> node has the problem.
> 
> Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   docs/devel/qgraph.rst | 58 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 58 insertions(+)
> 
> diff --git a/docs/devel/qgraph.rst b/docs/devel/qgraph.rst
> index a9aff167ad..4635efb2c2 100644
> --- a/docs/devel/qgraph.rst
> +++ b/docs/devel/qgraph.rst
> @@ -92,6 +92,64 @@ The basic framework steps are the following:
>   Depending on the QEMU binary used, only some drivers/machines will be
>   available and only test that are reached by them will be executed.
>   
> +Troubleshooting unavailable tests
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +If there is no path from an available machine to a test then that test will
> +unavailable and cannot execute. This can happen if a test or driver did not set

"will be unavailable" ? or "will be marked as unavailable" ?

Apart from that, patch looks fine to me.

  Thomas


