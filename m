Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74630443F6B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 10:31:05 +0100 (CET)
Received: from localhost ([::1]:46702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miCbn-0003JD-Sp
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 05:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1miCXC-00022f-IE
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 05:26:18 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:60068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1miCXA-0002Z5-EX
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 05:26:18 -0400
Received: from [192.168.137.126] (pop.92-184-102-202.mobile.abo.orange.fr
 [92.184.102.202])
 by beetle.greensocs.com (Postfix) with ESMTPSA id C105E2077F;
 Wed,  3 Nov 2021 09:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1635931573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppHB4sUQdn4sKOm8HOyfjtFdLkO1AbDRvsccPGZ3vSI=;
 b=xqi01F06WZYoxvQIn3h1BB9KI2WjTgfKxiLjvlmcL3K8ognhJTQWN0aOx8S0zBYD5YK7yv
 oKTqKCe/v6ByjLg1RJ7rHJyEcE2rCqBDPtGcnI1qbvRxAZyAVTbsJ4SObaxITsjj8Z+dMY
 qxR9XHt0sb1modH4gjwQ0boXVZL2a5o=
Message-ID: <2d491730-1da4-e502-3f68-90f0745fac9b@greensocs.com>
Date: Wed, 3 Nov 2021 10:25:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH] qdev-monitor: Fix use after free on duplicate device ID
 error
Content-Language: en-US-large
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211103073848.1459138-1-armbru@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20211103073848.1459138-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/3/21 08:38, Markus Armbruster wrote:
> Fixes: 4a1d937796de0fecd8b22d7dbebf87f38e8282fd
> Reported-by: Coverity CID 1465223
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

Thanks,
Damien
> ---
>   softmmu/qdev-monitor.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index e49d9773d2..14c1fb76c5 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -592,8 +592,8 @@ const char *qdev_set_id(DeviceState *dev, char *id, Error **errp)
>           if (prop) {
>               dev->id = id;
>           } else {
> -            g_free(id);
>               error_setg(errp, "Duplicate device ID '%s'", id);
> +            g_free(id);
>               return NULL;
>           }
>       } else {
> 

