Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7AF2A9677
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Nov 2020 13:52:35 +0100 (CET)
Received: from localhost ([::1]:34964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kb1EI-0005yO-Hc
	for lists+qemu-devel@lfdr.de; Fri, 06 Nov 2020 07:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kb19t-0002va-FR
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 07:48:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kb19q-00035A-Dc
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 07:48:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604666875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nqs/jz3bX28xjh91WKoffJfnm1JDLmB0qriFKlRcmMM=;
 b=ZrfWIM9FlrW0DZrtSNZ840CHy5KtOkd4+hmmhakoh8X3U5xXPwWHS+qYtkrvZfZd6vGSBO
 p4JdT0ihcrWSWtrf7bWmAw0yYmcCKpBECkJVgegmHCR4pwlhh0XiF5skQ1Hgnk8n531DjI
 P8AGXyMW/ZeycKHuMXkmecgSeCDU3YE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-in20sThdN12l_fX4LjCSbA-1; Fri, 06 Nov 2020 07:47:52 -0500
X-MC-Unique: in20sThdN12l_fX4LjCSbA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFF7B1842178;
 Fri,  6 Nov 2020 12:47:51 +0000 (UTC)
Received: from gondolin (ovpn-114-59.ams2.redhat.com [10.36.114.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04D2A65F5E;
 Fri,  6 Nov 2020 12:47:49 +0000 (UTC)
Date: Fri, 6 Nov 2020 13:47:47 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 0/9] Add support for Control-Flow Integrity
Message-ID: <20201106134747.7c9a5050.cohuck@redhat.com>
In-Reply-To: <20201105221905.1350-1-dbuono@linux.vnet.ibm.com>
References: <20201105221905.1350-1-dbuono@linux.vnet.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/06 06:30:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  5 Nov 2020 17:18:56 -0500
Daniele Buono <dbuono@linux.vnet.ibm.com> wrote:

> This patch adds supports for Control-Flow Integrity checks
> on indirect function calls.
> 
> Requires the use of clang, and link-time optimizations
> 
> Changes in v3:
> 
> - clang 11+ warnings are now handled directly at the source,
> instead of disabling specific warnings for the whole code.
> Some more work may be needed here to polish the patch, I
> would kindly ask for a review from the corresponding
> maintainers

Process question :)

Would you prefer to have this series merged in one go, or should
maintainers pick the patches for their subsystem?

> - Remove configure-time checks for toolchain compatibility
> with LTO.
> - the decorator to disable cfi checks on functions has
> been renamed and moved to include/qemu/compiler.h
> - configure-time checks for cfi support and dependencies
> has been moved from configure to meson
> 
> Link to v2: https://www.mail-archive.com/qemu-devel@nongnu.org/msg753675.html
> Link to v1: https://www.mail-archive.com/qemu-devel@nongnu.org/msg718786.html
> 
> Daniele Buono (9):
>   fuzz: Make fork_fuzz.ld compatible with LLVM's LLD
>   s390x: fix clang 11 warnings in cpu_models.c
>   hw/usb: reorder fields in UASStatus
>   s390x: Avoid variable size warning in ipl.h
>   scsi: fix overflow in scsi_disk_new_request_dump
>   configure,meson: add option to enable LTO
>   cfi: Initial support for cfi-icall in QEMU
>   check-block: enable iotests with cfi-icall
>   configure/meson: support Control-Flow Integrity
> 
>  accel/tcg/cpu-exec.c          | 11 +++++++++
>  configure                     | 26 ++++++++++++++++++++
>  hw/s390x/ipl.h                |  4 +--
>  hw/scsi/scsi-disk.c           |  4 +++
>  hw/usb/dev-uas.c              |  2 +-
>  include/qemu/compiler.h       | 12 +++++++++
>  meson.build                   | 46 +++++++++++++++++++++++++++++++++++
>  meson_options.txt             |  4 +++
>  plugins/core.c                | 37 ++++++++++++++++++++++++++++
>  plugins/loader.c              |  7 ++++++
>  target/s390x/cpu_models.c     |  8 +++---
>  tcg/tci.c                     |  7 ++++++
>  tests/check-block.sh          | 18 ++++++++------
>  tests/qtest/fuzz/fork_fuzz.ld | 12 ++++++++-
>  util/main-loop.c              | 11 +++++++++
>  util/oslib-posix.c            | 11 +++++++++
>  16 files changed, 205 insertions(+), 15 deletions(-)
> 


