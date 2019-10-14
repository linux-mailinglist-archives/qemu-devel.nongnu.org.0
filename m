Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9893FD5E6B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 11:15:40 +0200 (CEST)
Received: from localhost ([::1]:46077 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJwS3-0004nL-9v
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 05:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59381)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iJwPR-0002s2-3u
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 05:12:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iJwPQ-0007tw-1A
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 05:12:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34404)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iJwPN-0007qk-GC; Mon, 14 Oct 2019 05:12:53 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8495C800DF4;
 Mon, 14 Oct 2019 09:12:51 +0000 (UTC)
Received: from [10.36.116.245] (ovpn-116-245.ams2.redhat.com [10.36.116.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0353600CD;
 Mon, 14 Oct 2019 09:12:47 +0000 (UTC)
Subject: Re: [PATCH 0/2] use helper when using abstract QOM parent functions
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
References: <20191012094323.234788-1-maozhongyi@cmss.chinamobile.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <daaf9908-027b-3e91-9145-2fe96bd91be0@redhat.com>
Date: Mon, 14 Oct 2019 11:12:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20191012094323.234788-1-maozhongyi@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Mon, 14 Oct 2019 09:12:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, hpoussin@reactos.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 10/12/19 11:43 AM, Mao Zhongyi wrote:
> Philippe introduced a series of helpers to make the
> device class_init() easier to understand when a device
> class change the parent hooks, some devices in the
> source tree missed helper, so convert it.
> 
> Cc: eric.auger@redhat.com
> Cc: peter.maydell@linaro.org
> Cc: hpoussin@reactos.org
> Cc: f4bug@amsat.org
> 
> Mao Zhongyi (2):
>   arm/smmuv3: use helpers to be more easier to understand when using
>     abstract QOM parent functions.
>   isa/pc87312: use helpers to be more easier to understand when using
>     abstract QOM parent functions.
> 
>  hw/arm/smmuv3.c  | 3 +--
>  hw/isa/pc87312.c | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 

for the series:
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

