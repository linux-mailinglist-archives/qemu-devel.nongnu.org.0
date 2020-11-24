Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA562C2395
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 12:05:49 +0100 (CET)
Received: from localhost ([::1]:58898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khW8q-0005uz-Vg
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 06:05:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1khW6M-0004HM-0p
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 06:03:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1khW6K-0007R4-G2
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 06:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606215791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LxJNbyYwn5HqddHpWCOriAwBHX5K/F+rj6ZLFJCk+bo=;
 b=QEGagxgWz0s4MR5VclFMbYOEekO1aB755Q6jL4oE++eO0gVU0DqxDTw+C949M4GDrxkxTj
 KKi3BEk2/sA7Ruvx5zfAUJcq3tG9E/VZs1gydlPHHBmBgReS9QBiYbysOrbKS10bU/W55q
 BxAQVys9rp3oy8vKAqs2SFkvdkQqUQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-sURCyTnFM0esNnktN5P3TQ-1; Tue, 24 Nov 2020 06:03:09 -0500
X-MC-Unique: sURCyTnFM0esNnktN5P3TQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E88118C8C03;
 Tue, 24 Nov 2020 11:03:08 +0000 (UTC)
Received: from gondolin (ovpn-113-136.ams2.redhat.com [10.36.113.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EE7F10023B2;
 Tue, 24 Nov 2020 11:03:07 +0000 (UTC)
Date: Tue, 24 Nov 2020 12:03:05 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] hw/watchdog/wdt_diag288: Remove unnecessary includes
Message-ID: <20201124120305.1957dfe6.cohuck@redhat.com>
In-Reply-To: <20201118090344.243117-1-thuth@redhat.com>
References: <20201118090344.243117-1-thuth@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Nov 2020 10:03:44 +0100
Thomas Huth <thuth@redhat.com> wrote:

> Both headers, sysbus.h and module.h, are not required to compile this file.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/watchdog/wdt_diag288.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/hw/watchdog/wdt_diag288.c b/hw/watchdog/wdt_diag288.c
> index 71a945f0bd..4c4b6a6ab7 100644
> --- a/hw/watchdog/wdt_diag288.c
> +++ b/hw/watchdog/wdt_diag288.c
> @@ -14,12 +14,10 @@
>  #include "qemu/osdep.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/watchdog.h"
> -#include "hw/sysbus.h"
>  #include "qemu/timer.h"
>  #include "hw/watchdog/wdt_diag288.h"
>  #include "migration/vmstate.h"
>  #include "qemu/log.h"
> -#include "qemu/module.h"
>  
>  static WatchdogTimerModel model = {
>      .wdt_name = TYPE_WDT_DIAG288,

Thanks, applied.


