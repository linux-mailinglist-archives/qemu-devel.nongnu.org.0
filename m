Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D16D23B8638
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:25:57 +0200 (CEST)
Received: from localhost ([::1]:45196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyc68-0008V0-VJ
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:25:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lyc54-0007iJ-47
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:24:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lyc51-00089u-9A
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625066686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xTBOEKFg5DfU3UkFBylOa51gLlrq6ihhhZV3I6OI9Gg=;
 b=NviwcvQ3c6yyGeMGNu5Bv9sLNQqZvrjaSbDwnaNv+r0ZQyuVbpWEzuUY1JIA+J6nC3KG9w
 UUpZS+hFK4vHualAWZENt6+abg/MqOSceIl3CXWDHrAwSNma65aKASr0rWNmfgznO68jm2
 WA3K+rlew96NTHVSRCv2OS4k7st+y3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-vRYCc6EDOkGfnNtDpY0f9Q-1; Wed, 30 Jun 2021 11:24:43 -0400
X-MC-Unique: vRYCc6EDOkGfnNtDpY0f9Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 389D41005A36;
 Wed, 30 Jun 2021 15:24:42 +0000 (UTC)
Received: from localhost (ovpn-112-48.ams2.redhat.com [10.36.112.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D46B65DF35;
 Wed, 30 Jun 2021 15:24:41 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [RFC v6 12/13] target/s390x: move kvm files into kvm/
In-Reply-To: <20210629141931.4489-13-acho@suse.com>
Organization: Red Hat GmbH
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-13-acho@suse.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 30 Jun 2021 17:24:40 +0200
Message-ID: <878s2rl6iv.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: cfontana@suse.com, Claudio Fontana <cfontana@suse.de>, acho@suse.com,
 jose.ziviani@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29 2021, "Cho, Yu-Chen" <acho@suse.com> wrote:

> move kvm files into kvm/
> After the reshuffling, update MAINTAINERS accordingly.
> Make use of the new directory:
>
> target/s390x/kvm/
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
>  MAINTAINERS                        |  3 +--
>  hw/intc/s390_flic_kvm.c            |  2 +-
>  hw/s390x/s390-stattrib-kvm.c       |  2 +-
>  hw/s390x/tod-kvm.c                 |  2 +-
>  hw/vfio/ap.c                       |  2 +-
>  meson.build                        |  1 +
>  target/s390x/cpu-sysemu.c          |  2 +-
>  target/s390x/cpu.c                 |  2 +-
>  target/s390x/cpu_models.c          |  2 +-
>  target/s390x/diag.c                |  2 +-
>  target/s390x/interrupt.c           |  2 +-
>  target/s390x/{ => kvm}/kvm.c       |  2 +-
>  target/s390x/{ => kvm}/kvm_s390x.h |  0
>  target/s390x/kvm/meson.build       | 17 +++++++++++++++++
>  target/s390x/kvm/trace-events      |  7 +++++++
>  target/s390x/kvm/trace.h           |  1 +
>  target/s390x/machine.c             |  2 +-
>  target/s390x/meson.build           | 16 +---------------
>  target/s390x/mmu_helper.c          |  2 +-
>  target/s390x/trace-events          |  6 ------
>  20 files changed, 40 insertions(+), 35 deletions(-)
>  rename target/s390x/{ => kvm}/kvm.c (99%)
>  rename target/s390x/{ => kvm}/kvm_s390x.h (100%)
>  create mode 100644 target/s390x/kvm/meson.build
>  create mode 100644 target/s390x/kvm/trace-events
>  create mode 100644 target/s390x/kvm/trace.h

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


