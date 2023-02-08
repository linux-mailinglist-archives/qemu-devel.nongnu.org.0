Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5885968F181
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 15:58:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPlu3-0004W7-BV; Wed, 08 Feb 2023 09:58:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pPltw-0004Kj-Bg
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:58:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pPltu-0002tN-Hc
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:58:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675868301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o/6yJltgg8fxhk9xZZgNICcgJu6eEPphV8c1W1KPUe8=;
 b=MpVI6gbwc1mVJ6QQRQn0AGFBzvYpYDOiZoiCqfzREqmXZJHjAlX8/GFFulnpYuZJfYAMwF
 HF6/UDjfdKashJYEJ1Sc8AZ/mn8oZmQihUbAurAJ0XmClE3CkfXcT70WkZ3bFmcE5tHlhR
 2SAB/ZNy2rXZGR4dl8Pav4Lg26BQL9o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-2_mx6d6BOB2tyWjBz1_CwQ-1; Wed, 08 Feb 2023 09:58:15 -0500
X-MC-Unique: 2_mx6d6BOB2tyWjBz1_CwQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D421C3C10689;
 Wed,  8 Feb 2023 14:58:14 +0000 (UTC)
Received: from localhost (unknown [10.39.193.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 600E41121320;
 Wed,  8 Feb 2023 14:58:14 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Michal
 =?utf-8?B?UHLDrXZvem7DrWs=?=
 <mprivozn@redhat.com>, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 peterx@redhat.com, Juan Quintela <quintela@redhat.com>, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH v3 1/2] linux-headers: Update to v6.1
In-Reply-To: <20230207205711.1187216-2-peterx@redhat.com>
Organization: Red Hat GmbH
References: <20230207205711.1187216-1-peterx@redhat.com>
 <20230207205711.1187216-2-peterx@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 08 Feb 2023 15:58:12 +0100
Message-ID: <87sffgmcfv.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

On Tue, Feb 07 2023, Peter Xu <peterx@redhat.com> wrote:

> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  include/standard-headers/drm/drm_fourcc.h     |  34 ++++-
>  include/standard-headers/linux/ethtool.h      |  63 +++++++-
>  include/standard-headers/linux/fuse.h         |   6 +-
>  .../linux/input-event-codes.h                 |   1 +
>  include/standard-headers/linux/virtio_blk.h   |  19 +++
>  linux-headers/asm-generic/hugetlb_encode.h    |  26 ++--
>  linux-headers/asm-generic/mman-common.h       |   2 +
>  linux-headers/asm-mips/mman.h                 |   2 +
>  linux-headers/asm-riscv/kvm.h                 |   4 +
>  linux-headers/linux/kvm.h                     |   1 +
>  linux-headers/linux/psci.h                    |  14 ++
>  linux-headers/linux/userfaultfd.h             |   4 +
>  linux-headers/linux/vfio.h                    | 142 ++++++++++++++++++
>  13 files changed, 298 insertions(+), 20 deletions(-)

Acked-by: Cornelia Huck <cohuck@redhat.com>


