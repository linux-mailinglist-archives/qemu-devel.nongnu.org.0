Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3766A474A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 17:52:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWghV-0008Dw-VJ; Mon, 27 Feb 2023 11:50:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pWghT-0008CG-5T
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 11:50:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pWghO-0000QJ-4X
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 11:50:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677516600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l7gAfPxjYy1ZF+2eDrtb7tn+rvsV2iQvicqksHVx7l4=;
 b=ZwvTYsu9Gotpstm8npxMjsCtlbfPP5lBKHOZ25IRHNV7cOY1EUJP+3n8xcdQ7qge18I5VQ
 4mdhf3FxGp6ja7hP4v0+PQIDViwNhjXC9TCYMfE2OJchYy8ST5KdMGPM5ztWUfp05a65/4
 Gzt4dKxhOThGpTss1oEEmL0gskeLrPI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-iXQANjHrMdyknHDWa6E6mw-1; Mon, 27 Feb 2023 11:49:59 -0500
X-MC-Unique: iXQANjHrMdyknHDWa6E6mw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DD0610115E1;
 Mon, 27 Feb 2023 16:49:57 +0000 (UTC)
Received: from localhost (unknown [10.45.226.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3621D4044B30;
 Mon, 27 Feb 2023 16:49:57 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Miguel Luis <miguel.luis@oracle.com>, Peter Maydell
 <peter.maydell@linaro.org>, "Michael S . Tsirkin" <mst@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Haibo Xu <haibo.xu@linaro.org>, Andrew Jones <drjones@redhat.com>, Marc
 Zyngier <maz@kernel.org>
Cc: Miguel Luis <miguel.luis@oracle.com>
Subject: Re: [RFC PATCH 1/5] linux-headers: [kvm, arm64] add the necessary
 definitions to match host kernel
In-Reply-To: <20230227163718.62003-2-miguel.luis@oracle.com>
Organization: Red Hat GmbH
References: <20230227163718.62003-1-miguel.luis@oracle.com>
 <20230227163718.62003-2-miguel.luis@oracle.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 27 Feb 2023 17:49:55 +0100
Message-ID: <87v8jn3vf0.fsf@redhat.com>
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

On Mon, Feb 27 2023, Miguel Luis <miguel.luis@oracle.com> wrote:

> From: Haibo Xu <haibo.xu@linaro.org>
>
> linux-headers define host properties needed for the VMM to interact with
> KVM, so let's include them *while* they're not available yet on linux
> upstream since aarch64 nested virtualization is still a work in
> progress.
>
> Ref: https://lore.kernel.org/qemu-devel/636b5932e4cf061b6f97516e82d4319c1d29b871.1616052889.git.haibo.xu@linaro.org/
>
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
> ---
>  linux-headers/asm-arm64/kvm.h | 2 ++
>  linux-headers/linux/kvm.h     | 1 +
>  2 files changed, 3 insertions(+)

Can you please mark this explicitly as a placeholder for a proper
headers update? Just so that it doesn't get lost :)


