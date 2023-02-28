Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A44826A5A92
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 15:08:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX0dp-0000bE-JQ; Tue, 28 Feb 2023 09:07:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pX0dn-0000b2-JA
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:07:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pX0dk-00082A-Q8
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:07:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677593255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zrSnzj74ag5YU6Mp0Ke3cUH/yv6D2ccbvO/ENkpWNco=;
 b=L7aoA9T2XlNA8iQgkq/6J24BhcFU2QgdMjIxAWZSsqFmyvXIq0lRgg3TLCltTwF2yxfI+c
 NmhBoY2GpJ4DEV2EgLxuYKYm9BaT9ZZPgJMaGLR2BvjTEvQK2WQXPTz8HDSqIAqC8hdHGf
 cYXsWvSVL8e4r5+aW/aNLkKEqiN34ME=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-SfokZVGQNsmXWZz8vYdz7Q-1; Tue, 28 Feb 2023 09:07:33 -0500
X-MC-Unique: SfokZVGQNsmXWZz8vYdz7Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75E08863194;
 Tue, 28 Feb 2023 14:07:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F9E9492B12;
 Tue, 28 Feb 2023 14:07:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4D1A921E6A1F; Tue, 28 Feb 2023 15:07:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: <qemu-devel@nongnu.org>,  Michael Tsirkin <mst@redhat.com>,  Fan Ni
 <fan.ni@samsung.com>,  <linux-cxl@vger.kernel.org>,  <linuxarm@huawei.com>
Subject: Re: [PATCH] MAINTAINERS: Add Fan Ni as Compute eXpress Link QEMU
 reviewer
References: <20230228113926.11485-1-Jonathan.Cameron@huawei.com>
Date: Tue, 28 Feb 2023 15:07:24 +0100
In-Reply-To: <20230228113926.11485-1-Jonathan.Cameron@huawei.com> (Jonathan
 Cameron's message of "Tue, 28 Feb 2023 11:39:26 +0000")
Message-ID: <87r0u9g9yb.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:

> Fan Ni has offered to help out with QEMU CXL emulation reviewing.
> Add him as a designated reviewer.
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> --
> Thanks to Fan for stepping up after I requested help following Ben
> stepping down as co-maintainer. Fan base been active in testing
> and review recently so great to have Fan on board.
>
> Based on patch [PATCH] MAINTAINERS: Remove CXL maintainer Ben Widawsky
>
> Based-of: Message-id: 20230220212437.1462314-1-armbru@redhat.com

Glad you found a co-maintainer!

Acked-by: Markus Armbruster <armbru@redhat.com>


