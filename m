Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FAB2055C2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 17:24:16 +0200 (CEST)
Received: from localhost ([::1]:52534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnkmV-0005U6-GT
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 11:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jnka4-0001Mq-U6
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 11:11:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40499
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jnka3-0005Ax-62
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 11:11:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592925082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rCGS5k0INhd4YemKHzxTDqMBebfhncYuW+8a0Adp0s0=;
 b=P6xPQupvsIr8SGhgRE2K6i8uAMWB7yDWOwWI0BDi70bkdLC9nnXJZfWizTYisoCuKdo/fD
 DcOMSjE5vIMAHkMvmiNqhAYNYspykCGqSEuAztKiSTObX0B1ihtMgSVDt49N8w88tqVuEE
 i9jU9G9tBlgiSdGHZZNeax9FjeZsE08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-Xyd6f-OBNH66kWeugROIbg-1; Tue, 23 Jun 2020 11:11:16 -0400
X-MC-Unique: Xyd6f-OBNH66kWeugROIbg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE639107ACCA;
 Tue, 23 Jun 2020 15:11:14 +0000 (UTC)
Received: from localhost (unknown [10.40.208.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 843057CCC0;
 Tue, 23 Jun 2020 15:11:12 +0000 (UTC)
Date: Tue, 23 Jun 2020 17:11:08 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jon Doron <arilou@gmail.com>
Subject: Re: [PATCH v3 0/3] hyperv: vmbus: ACPI various corrections
Message-ID: <20200623171108.624027e6@redhat.com>
In-Reply-To: <20200618030027.759594-1-arilou@gmail.com>
References: <20200618030027.759594-1-arilou@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 01:53:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: rvkagan@yandex-team.ru, pbonzini@redhat.com, mail@maciej.szmigiero.name,
 qemu-devel@nongnu.org, vkuznets@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Jun 2020 06:00:24 +0300
Jon Doron <arilou@gmail.com> wrote:

> After doing further tests and looking at the latest HyperV ACPI DSDT.
> Do minor fix to our VMBus ACPI entry.
> 
> v3:
> Removed accidental change for the dct submodule head
> 
> v2:
> Renamed irq0 to irq now that there is a single IRQ required
> 
> Jon Doron (3):
>   hyperv: vmbus: Remove the 2nd IRQ
>   i386: acpi: vmbus: Add _ADR definition
>   acpi: i386: Move VMBus DSDT entry to SB
> 
>  hw/hyperv/vmbus.c                |  3 +--
>  hw/i386/acpi-build.c             | 17 +++++++++--------
>  include/hw/hyperv/vmbus-bridge.h |  3 +--
>  3 files changed, 11 insertions(+), 12 deletions(-)
> 

only 1/3 is ready, the rest is not yet ready


