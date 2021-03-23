Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A435A346DDA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 00:24:04 +0100 (CET)
Received: from localhost ([::1]:46106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOqNX-00051z-Nn
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 19:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOqMM-0003gR-6Y
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 19:22:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOqMJ-0000El-H4
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 19:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616541766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bWflXN8WyBFil0s/327+c4W7nioBZUpdmyqb3dGs08c=;
 b=NBjHhdB+aw94N8+EEngFzoyoV22LlUS4rGxMIBdAJYOIgYHp3A8xJmoADYRujTq1/1XT0X
 K5X1gGl66A6aXZticiH0ewguE1bEUeyFHM8VgtTcMSd1uMHyL/NXpF1bYwcuj2fMGRQP+b
 mKsREpJfcRxHRn2FDyrXl+dgBr15SSU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-vqSAxZJCMIm8EFlpbo70Zg-1; Tue, 23 Mar 2021 19:22:44 -0400
X-MC-Unique: vqSAxZJCMIm8EFlpbo70Zg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE3E7107ACCD;
 Tue, 23 Mar 2021 23:22:43 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 208886087C;
 Tue, 23 Mar 2021 23:22:43 +0000 (UTC)
Subject: Re: [PATCH 1/1] iotests: fix 051.out expected output after error text
 touchups
To: Connor Kuehl <ckuehl@redhat.com>, qemu-block@nongnu.org
References: <20210318200949.1387703-1-ckuehl@redhat.com>
 <20210318200949.1387703-2-ckuehl@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <e6081f56-8467-db34-fa08-80969e8e2a7a@redhat.com>
Date: Tue, 23 Mar 2021 19:22:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318200949.1387703-2-ckuehl@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
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
Cc: kwolf@redhat.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 4:09 PM, Connor Kuehl wrote:
> A patch was recently applied that touched up some error messages that
> pertained to key names like 'node-name'. The trouble is it only updated
> tests/qemu-iotests/051.pc.out and not tests/qemu-iotests/051.out as
> well.
> 
> Do that now.
> 
> Fixes: 785ec4b1b9 ("block: Clarify error messages pertaining to
> 'node-name'")
> Signed-off-by: Connor Kuehl <ckuehl@redhat.com>

Reviewed-by: John Snow <jsnow@redhat.com>

> ---
>   tests/qemu-iotests/051.out | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qemu-iotests/051.out b/tests/qemu-iotests/051.out
> index de4771bcb3..db8c14b903 100644
> --- a/tests/qemu-iotests/051.out
> +++ b/tests/qemu-iotests/051.out
> @@ -61,13 +61,13 @@ QEMU X.Y.Z monitor - type 'help' for more information
>   (qemu) quit
>   
>   Testing: -drive file=TEST_DIR/t.qcow2,node-name=123foo
> -QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=123foo: Invalid node name
> +QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=123foo: Invalid node-name: '123foo'
>   
>   Testing: -drive file=TEST_DIR/t.qcow2,node-name=_foo
> -QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=_foo: Invalid node name
> +QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=_foo: Invalid node-name: '_foo'
>   
>   Testing: -drive file=TEST_DIR/t.qcow2,node-name=foo#12
> -QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=foo#12: Invalid node name
> +QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=foo#12: Invalid node-name: 'foo#12'
>   
>   
>   === Device without drive ===
> 


