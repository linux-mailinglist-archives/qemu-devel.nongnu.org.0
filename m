Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F699340E86
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 20:41:58 +0100 (CET)
Received: from localhost ([::1]:55648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMyWq-00053y-L4
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 15:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lMyVE-0004F5-MT
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 15:40:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lMyVC-0005jF-9h
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 15:40:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616096412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JEeoPwRZV+GYuXCY3HLoxlmpyuC7g+EzQrpOvLIIYlA=;
 b=Tl67in2hCz9keMp3yzhyrsYm6TOs1g0Ahg1dpxWglEQw/2CFxBWY2vdJ9FXRt/fE/EWck3
 di3YwtHA5vxsRbb9bT3cekCKBDMIzq5s3SDlB1IwcLIBDta74LnaeP2qky15SWZ9343Ijo
 qS69PJvXoBenX2n1/xwdMRD6lXiwIJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-6dN4F9GhMceE2sfNqe9N2A-1; Thu, 18 Mar 2021 15:40:11 -0400
X-MC-Unique: 6dN4F9GhMceE2sfNqe9N2A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26596802B7F;
 Thu, 18 Mar 2021 19:40:10 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89C6960C13;
 Thu, 18 Mar 2021 19:40:06 +0000 (UTC)
Subject: Re: iotest 051 failure on s390
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Max Reitz <mreitz@redhat.com>
References: <a574a10b-541f-ea49-9514-027b4a471e2a@de.ibm.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <1976d02d-bb1f-99fc-1516-2f1db2102682@redhat.com>
Date: Thu, 18 Mar 2021 15:40:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <a574a10b-541f-ea49-9514-027b4a471e2a@de.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Connor Kuehl <ckuehl@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 12:32 PM, Christian Borntraeger wrote:
> On s390 with latest master I do get
> 
> 051   fail       [17:30:00] [17:30:05]   5.4s                 output 
> mismatch (see 051.out.bad)
> --- /home/cborntra/REPOS/qemu/tests/qemu-iotests/051.out
> +++ 051.out.bad
> @@ -61,13 +61,13 @@
>   (qemu) quit
> 
>   Testing: -drive file=TEST_DIR/t.qcow2,node-name=123foo
> -QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=123foo: Invalid node 
> name
> +QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=123foo: Invalid 
> node-name: '123foo'
> 
>   Testing: -drive file=TEST_DIR/t.qcow2,node-name=_foo
> -QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=_foo: Invalid node name
> +QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=_foo: Invalid 
> node-name: '_foo'
> 
>   Testing: -drive file=TEST_DIR/t.qcow2,node-name=foo#12
> -QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=foo#12: Invalid node 
> name
> +QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=foo#12: Invalid 
> node-name: 'foo#12'
> 

Looks like we forgot to update 051.out in addition to 051.pc.out in 
785ec4b1. Easy to fix.

--js


