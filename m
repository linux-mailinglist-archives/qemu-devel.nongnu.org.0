Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0284A376996
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 19:41:53 +0200 (CEST)
Received: from localhost ([::1]:39284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf4U3-0002n5-Iy
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 13:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lf4RW-0001ve-88
 for qemu-devel@nongnu.org; Fri, 07 May 2021 13:39:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lf4RN-0006Wz-BH
 for qemu-devel@nongnu.org; Fri, 07 May 2021 13:39:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620409141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kQ9iMimd7vtYXGSSI9nEta4IkP2tbRn7soP24UEnqJQ=;
 b=FTIryk+iSEzLv45Yzwk+N7UqFgfjHAg+L8rPZY4jrsOYkbms8hm1hzExDMQmtwyrj0RJSD
 slQYRg51GToulsSB5m+kT3jsmVlxi6xWsFqinZuDqAAMgwTC7HJ/U74j1Ote3P1c3EPqP6
 bddrdTGVdryHF6QTJSHK2U4wwlDberY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-MW37-5gUPH-iFjKz5JeYCQ-1; Fri, 07 May 2021 13:38:58 -0400
X-MC-Unique: MW37-5gUPH-iFjKz5JeYCQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A04561854E2A;
 Fri,  7 May 2021 17:38:56 +0000 (UTC)
Received: from [10.3.113.56] (ovpn-113-56.phx2.redhat.com [10.3.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27FD7100164A;
 Fri,  7 May 2021 17:38:49 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] bitops.h: Improve find_xxx_bit() documentation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210507170634.2058801-1-philmd@redhat.com>
 <20210507170634.2058801-2-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <99c170d8-d6f3-87ad-6270-73f620c1e172@redhat.com>
Date: Fri, 7 May 2021 12:38:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210507170634.2058801-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Chai Wen <chaiwen@baidu.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/7/21 12:06 PM, Philippe Mathieu-Daudé wrote:
> Document the following functions return the bitmap size
> if not matching bit is found:

s/not/no/

> 
> - find_first_bit
> - find_next_bit
> - find_last_bit
> - find_first_zero_bit
> - find_next_zero_bit
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/qemu/bitops.h | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 

> @@ -150,6 +151,9 @@ unsigned long find_last_bit(const unsigned long *addr,
>   * @addr: The address to base the search on
>   * @offset: The bitnumber to start searching at
>   * @size: The bitmap size in bits
> + *
> + * Returns the bit number of the next set bit,
> + * or @size if there is no set bit in the bitmap.
>   */
>  unsigned long find_next_bit(const unsigned long *addr,

Misleading - there might be a set bit prior to @offset.  Better might be:

or @size if there are no further set bits in the bitmap.

>                              unsigned long size,
> @@ -160,6 +164,9 @@ unsigned long find_next_bit(const unsigned long *addr,
>   * @addr: The address to base the search on
>   * @offset: The bitnumber to start searching at
>   * @size: The bitmap size in bits
> + *
> + * Returns the bit number of the next cleared bit,
> + * or @size if there is no clear bit in the bitmap.
>   */
>  
>  unsigned long find_next_zero_bit(const unsigned long *addr,

similarly,

or @size if there are no further clear bits in the bitmap.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


