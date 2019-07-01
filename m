Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5159199BE
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 10:35:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38949 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP0zr-00014u-Vw
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 04:35:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hP0ye-0000b5-N3
	for qemu-devel@nongnu.org; Fri, 10 May 2019 04:34:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hP0yc-00072l-Nx
	for qemu-devel@nongnu.org; Fri, 10 May 2019 04:34:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53044)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1hP0ya-000723-Qp
	for qemu-devel@nongnu.org; Fri, 10 May 2019 04:33:58 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 246E03082137;
	Fri, 10 May 2019 08:33:56 +0000 (UTC)
Received: from [10.40.205.9] (unknown [10.40.205.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 656F6600C7;
	Fri, 10 May 2019 08:33:55 +0000 (UTC)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190510012458.22706-1-richard.henderson@linaro.org>
	<20190510012458.22706-24-richard.henderson@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <216dcb42-a4de-b055-73d1-c77d81b25639@redhat.com>
Date: Fri, 10 May 2019 10:33:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190510012458.22706-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 10 May 2019 08:33:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5 23/24] target/ppc: Use
 qemu_guest_getrandom for DARN
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/05/2019 03:24, Richard Henderson wrote:
> We now have an interface for guest visible random numbers.
> 
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v5: Do not loop for darn64; use sizeof.
> ---
>   target/ppc/int_helper.c | 39 +++++++++++++++++++++++++++------------
>   1 file changed, 27 insertions(+), 12 deletions(-)
> 

Reviewed-by: Laurent Vivier <lvivier@redhat.com>



