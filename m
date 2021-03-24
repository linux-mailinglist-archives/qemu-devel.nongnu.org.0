Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1E3348318
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:49:41 +0100 (CET)
Received: from localhost ([::1]:58878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPARg-0003vX-Mq
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPAPb-00032p-Cw
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:47:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPAPV-0003Yn-N5
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:47:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616618844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=natUgsMxpydh8t3e9h/tGFY7DJ+96PD09wWqvMU0Dqs=;
 b=dszht/9gKtyUXysdDaBuHZTjKyMm8dV0OzTKkBk78XWoaRlq3PQpb+wiJrSyi1+5+1CCKF
 uWC2gMhslPXq9jOO7GzDZSXoaLtcEalaNBXnEwgyzbusbKvuXT02iaNmU3rS6ZVLFJ8Iaz
 NCiJ7Ql/WeUAwsz/5IR10r/jPwXokhE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-nLn_StB9NKmClCR9aFaqSg-1; Wed, 24 Mar 2021 16:47:22 -0400
X-MC-Unique: nLn_StB9NKmClCR9aFaqSg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D1DF83DD33
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 20:47:18 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 332F319C93;
 Wed, 24 Mar 2021 20:47:18 +0000 (UTC)
Subject: Re: [PATCH] device-crash-test: Ignore errors about a bus not being
 available
To: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org
References: <20210323164718.1393792-1-thuth@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <46590e6c-a964-8e4c-fdb7-524ab5b9556f@redhat.com>
Date: Wed, 24 Mar 2021 16:47:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323164718.1393792-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 12:47 PM, Thomas Huth wrote:
> Recent QEMU versions now sometimes exit cleanly with an error message
> that a bus is not available for a specified device. Don't flag those
> as an error in the device-crash-test script.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   scripts/device-crash-test | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/device-crash-test b/scripts/device-crash-test
> index 6d809ac711..8331c057b8 100755
> --- a/scripts/device-crash-test
> +++ b/scripts/device-crash-test
> @@ -175,6 +175,7 @@ ERROR_RULE_LIST = [
>       {'log':r"Multiple VT220 operator consoles are not supported"},
>       {'log':r"core 0 already populated"},
>       {'log':r"could not find stage1 bootloader"},
> +    {'log':r"No '.*' bus found for device"},
>   
>       # other exitcode=1 failures not listed above will just generate INFO messages:
>       {'exitcode':1, 'loglevel':logging.INFO},
> 

ACK, though I don't consider myself a maintainer of this file. Whose 
tree does it go in? (Trivial, if nobody's?)

--js


