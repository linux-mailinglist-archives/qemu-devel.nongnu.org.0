Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BD253C9A0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 13:59:34 +0200 (CEST)
Received: from localhost ([::1]:45460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx5xk-0007sz-IP
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 07:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nx5uD-00052M-EW
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 07:55:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nx5uA-0006oC-Mk
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 07:55:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654257349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VhoPSLEifgFBRSvt4oTaKoS3WMrZaT+dJK0LGswuKk8=;
 b=bc4GhpleJksyG0yxGCQnkk8THCb/0bsMB8fheKWdU0btgXprleeDWUWZ1dOrA9CwnK8dlg
 QY3HIp+WSmjlVUl8ma8bV7iaztuLCThajBgaPJUAxAR1hj1wG96+60+POWrd6Qti+yqM4E
 YM29exwjsl/CG2OzjwoGKFyafQ0wh48=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-j_G7oe-sP1CIG55D1x6pgA-1; Fri, 03 Jun 2022 07:55:46 -0400
X-MC-Unique: j_G7oe-sP1CIG55D1x6pgA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 040F61010439;
 Fri,  3 Jun 2022 11:55:46 +0000 (UTC)
Received: from localhost (dhcp-192-194.str.redhat.com [10.33.192.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBA9A492C3B;
 Fri,  3 Jun 2022 11:55:45 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: f4bug@amsat.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2] tests: Prefer max cpu type when using AArch64 virt
 machine
In-Reply-To: <20220603111849.1481100-1-drjones@redhat.com>
Organization: Red Hat GmbH
References: <20220603111849.1481100-1-drjones@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Fri, 03 Jun 2022 13:55:44 +0200
Message-ID: <87y1ye7ygv.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 03 2022, Andrew Jones <drjones@redhat.com> wrote:

> The max cpu type is the best default cpu type for tests to use
> when specifying the cpu type for AArch64 mach-virt. Switch all
> tests to it.
>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  tests/avocado/boot_xen.py          |  6 +++---
>  tests/avocado/replay_kernel.py     |  2 +-
>  tests/avocado/reverse_debugging.py |  2 +-
>  tests/avocado/tcg_plugins.py       |  6 +++---
>  tests/qtest/bios-tables-test.c     | 12 ++++++------
>  tests/qtest/machine-none-test.c    |  4 ++--
>  tests/vm/aarch64vm.py              |  2 +-
>  tests/vm/ubuntu.aarch64            |  2 +-
>  8 files changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


