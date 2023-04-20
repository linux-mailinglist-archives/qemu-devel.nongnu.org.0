Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C380A6E8E97
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:50:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQvN-0007LK-IA; Thu, 20 Apr 2023 05:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ppQvK-0006xq-En
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:49:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ppQvI-0008Jw-IW
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:49:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681984189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J4d7x1cNgCskwTe9CHC2x/9xeLP77gPxzHC/FoirtyI=;
 b=dyPwSwNwOKUGpAR2Ichsy9g09k5CBDhMVyp6MIzV9RB5FBniMwMuzBXFR9w4K5C17zsQ7c
 ojPOxCbeqedyk8S6HLspA9t0ZxCQdSoVQBcLK0o5I6nHlpvX3ACFFmngCX/JnhB94moQuM
 XxC1jLHYLFccG0P/bSMBvVpf6IKMRs8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-fdZoozD2NJe0vaZzJWZOzw-1; Thu, 20 Apr 2023 05:49:44 -0400
X-MC-Unique: fdZoozD2NJe0vaZzJWZOzw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8B8038237C8;
 Thu, 20 Apr 2023 09:49:43 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FE0C40C2064;
 Thu, 20 Apr 2023 09:49:43 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 gaosong@loongson.cn
Cc: "Michael S . Tsirkin" <mst@redhat.com>, maobibo@loongson.cn,
 zhaotianrui@loongson.cn
Subject: Re: [PATCH RFC v1 01/10] linux-headers: Add KVM headers for loongarch
In-Reply-To: <20230420093606.3366969-2-zhaotianrui@loongson.cn>
Organization: Red Hat GmbH
References: <20230420093606.3366969-1-zhaotianrui@loongson.cn>
 <20230420093606.3366969-2-zhaotianrui@loongson.cn>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Thu, 20 Apr 2023 11:49:41 +0200
Message-ID: <87bkji51e2.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Apr 20 2023, Tianrui Zhao <zhaotianrui@loongson.cn> wrote:

> Add asm-loongarch/kvm.h for loongarch KVM, and update
> the linux/kvm.h about loongarch part. The structures in
> the header are used as kvm_ioctl arguments.

Just a procedural note: It's probably best to explicitly mark this as a
placeholder patch until you can replace it with a full headers update.

>
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>  linux-headers/asm-loongarch/kvm.h | 99 +++++++++++++++++++++++++++++++
>  linux-headers/linux/kvm.h         |  9 +++
>  2 files changed, 108 insertions(+)
>  create mode 100644 linux-headers/asm-loongarch/kvm.h


