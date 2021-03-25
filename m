Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB645349553
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:24:34 +0100 (CET)
Received: from localhost ([::1]:46748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRqb-0007Nd-Uv
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lPRkM-0001Cn-A1
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:18:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lPRkG-000508-JB
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:18:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616685477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MjNBfeMe4/WSPmg2OrF2uWaT9khsMZt6S9AElHkt8go=;
 b=HXgiAEJbrzuLfLQFxf719R8PEooU1xCU3hFqE+mUVZbG4Jwxw45BmNU+4EgpIgkA8+y8Yj
 xWWTG0stARCLD/CXWTuToaTXJCt8kpo8T4lhwmRSHom4SUX2GQY3f5iXWGWtK2jHfmAyJ/
 zo2r/+f0cZAPcJhQ1bxrG5cRTnv1NCc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-ZY4hIKOQOVOxQ9P5e0KhWg-1; Thu, 25 Mar 2021 11:17:53 -0400
X-MC-Unique: ZY4hIKOQOVOxQ9P5e0KhWg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B550B8189C6;
 Thu, 25 Mar 2021 15:17:52 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-55.ams2.redhat.com
 [10.36.114.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EBF517A9B;
 Thu, 25 Mar 2021 15:17:50 +0000 (UTC)
Subject: Re: [PATCH 0/1] iotests: fix 051.out expected output after error
To: Connor Kuehl <ckuehl@redhat.com>, qemu-block@nongnu.org
References: <20210318200949.1387703-1-ckuehl@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <20c77baa-b6fc-1fad-0b65-e4f0b432a782@redhat.com>
Date: Thu, 25 Mar 2021 16:17:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318200949.1387703-1-ckuehl@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
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
 jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.03.21 21:09, Connor Kuehl wrote:
> Oops, sorry about the churn. I can see why this would have caused a
> failure but I'm surprised I can't reproduce this when I run the test
> locally.
> 
> Christian, would you be willing to test this patch out as a quick sanity
> check too?
> 
> Connor Kuehl (1):
>    iotests: fix 051.out expected output after error text touchups
> 
>   tests/qemu-iotests/051.out | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Thanks, applied to my block branch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block

Max


