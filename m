Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFFA31C430
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 00:06:56 +0100 (CET)
Received: from localhost ([::1]:55350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBmxC-0006ch-KW
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 18:06:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBmvb-00060s-Hw
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 18:05:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBmvW-0001CG-W9
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 18:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613430309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1TcMyeuLSsJvzLVjG9fq3QW+F+WNzz7hEJoL4iBAsH0=;
 b=bRKD+ILBgr1SSwGXuSfRq0KWg0OXbKR1AncXckSxW7yjSZtMEdINOrHccXBQYqYiLkJ4wW
 pjRRyBvdpO79PY7tgaPhVoQ6O2e49FJS/kJVfR4oqfgMg2HS+PSsMHBYMlKdJf0Fx/8fyY
 C7ldF4fsCPNneK4GCs2XJJFgNzbvPDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-flBqTFCcMC63LCbxp7NJxw-1; Mon, 15 Feb 2021 18:05:06 -0500
X-MC-Unique: flBqTFCcMC63LCbxp7NJxw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E78F192AB79
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 23:05:05 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F09C25B697;
 Mon, 15 Feb 2021 23:05:04 +0000 (UTC)
Subject: Re: [PATCH] maint: Tell git that *.py files should use python diff
 hunks
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210215222524.1820223-1-eblake@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <3ba77bdb-25c4-9b31-2fa5-d1af4898a331@redhat.com>
Date: Mon, 15 Feb 2021 18:05:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210215222524.1820223-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 5:25 PM, Eric Blake wrote:
> Git's default hunk pattern recognizer favors the C language, but it
> also includes several built-in diff styles that give saner results in
> other languages.  In particular, telling git to treat all .py files as
> python changes the beginning of diff hunks as follows:
> 

As a language recommendation, "gives [improved|better|more readable] 
results".

> |  --- a/python/qemu/machine.py
> |  +++ b/python/qemu/machine.py
> | -@@ -337,12 +337,12 @@ class QEMUMachine:
> | +@@ -337,12 +337,12 @@ def _post_shutdown(self) -> None:
> |               self._qmp.close()
> 

Much better.

> which makes it much easier to tell what function a patch is touching,
> rather than a non-descript listing of what class contains the changes.
> 
> Sadly, our python files that don't use .py suffix (such as numerous
> iotests) do not benefit from this glob.
> 

Probably not a big deal, since those generally don't have class-based 
code anyway.

> Reported-by: John Snow <jsnow@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: John Snow <jsnow@redhat.com>

> ---
>   .gitattributes | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/.gitattributes b/.gitattributes
> index 3d2fe2ecda8b..3e03ee01c0d9 100644
> --- a/.gitattributes
> +++ b/.gitattributes
> @@ -1,2 +1,3 @@
>   *.c.inc         diff=c
>   *.h.inc         diff=c
> +*.py            diff=python
> 


