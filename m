Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BEB360D9A
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 17:04:22 +0200 (CEST)
Received: from localhost ([::1]:50258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX3XY-0003Pi-5O
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 11:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lX3TK-00021y-9z
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:00:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lX3TC-0004xw-7D
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 10:59:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618498785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ek2ZboNs3N7NikmlRssAamesZ5Gv66almwdp8Po0v0c=;
 b=VoNaruiPi04rNAYKY9KCHS31kQnD4IFoZjJL6IfWL5cNHHjx54/cO7Qi4574FldCut93Pt
 jXNqCgdN1mmZL8P5+gMx+L4KgFtts8Dzcmxyf7B6mEYI08q4/vt/jqM++KC4iMgyfwYm6I
 AxhpkzPKDFVVT+ObRAXJbZylptEzV3w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-5inTwRgrPoK6grZLdWcVDQ-1; Thu, 15 Apr 2021 10:59:43 -0400
X-MC-Unique: 5inTwRgrPoK6grZLdWcVDQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24A916D586;
 Thu, 15 Apr 2021 14:59:42 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB0C819C93;
 Thu, 15 Apr 2021 14:59:40 +0000 (UTC)
Date: Thu, 15 Apr 2021 16:59:37 +0200
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG
 CPUs section
Message-ID: <20210415145937.trnl46pedoababsa@kamzik.brq.redhat.com>
References: <20210415130148.4066310-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210415130148.4066310-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 15, 2021 at 03:01:48PM +0200, Philippe Mathieu-Daudé wrote:
> We want the ARM maintainers and the qemu-arm@ list to be
> notified when this file is modified. Add an entry to the
> 'ARM TCG CPUs' section in the MAINTAINERS file.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 36055f14c59..d5df4ba7891 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -156,6 +156,7 @@ S: Maintained
>  F: target/arm/
>  F: tests/tcg/arm/
>  F: tests/tcg/aarch64/
> +F: tests/qtest/arm-cpu-features.c
>  F: hw/arm/
>  F: hw/cpu/a*mpcore.c
>  F: include/hw/cpu/a*mpcore.h
> -- 
> 2.26.3
>

Acked-by: Andrew Jones <drjones@redhat.com>


