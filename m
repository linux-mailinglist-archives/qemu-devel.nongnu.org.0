Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B864D3A3D33
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 09:33:44 +0200 (CEST)
Received: from localhost ([::1]:51156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrbfj-000310-9q
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 03:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lrbef-0002L0-2f
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 03:32:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lrbeb-0006Xi-PE
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 03:32:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623396752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jmjFBLaVkjwG6BrCxvUlhKotUE/DzCllYD6YFfDS8Z4=;
 b=HmwjGVLS2WhpThk6gXHCPA9wqGCyuyeU+QNBZGayEtiYV1oufU+8i5Zrgik7k3w0o0RJnE
 JiQqE/4k7rCL8lK5v4oUEnbgiCjdn3GGG+NyeOSiGptjxdegxC9Vd2fPWRQFcMzlXUI2QV
 riGPVx3ldZ+34MdOUHFwbthZDpnwm10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-RjYRPoPPNHS2h5bHwC_7og-1; Fri, 11 Jun 2021 03:32:31 -0400
X-MC-Unique: RjYRPoPPNHS2h5bHwC_7og-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C24118D6A45;
 Fri, 11 Jun 2021 07:32:30 +0000 (UTC)
Received: from localhost (ovpn-113-95.ams2.redhat.com [10.36.113.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EA425D9C6;
 Fri, 11 Jun 2021 07:32:29 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/1] hw: virt: consider hw_compat_6_0
In-Reply-To: <20210610183500.54207-1-xypron.glpk@gmx.de>
Organization: Red Hat GmbH
References: <20210610183500.54207-1-xypron.glpk@gmx.de>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 11 Jun 2021 09:32:27 +0200
Message-ID: <87im2kzwj8.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Klaus Jensen <its@irrelevant.dk>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10 2021, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:

> virt-6.0 must consider hw_compat_6_0.
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
>  hw/arm/virt.c | 2 ++
>  1 file changed, 2 insertions(+)

Oops, forgot that hunk.

Fixes: da7e13c00b59 ("hw: add compat machines for 6.1")

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


