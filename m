Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF53D355C17
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 21:19:30 +0200 (CEST)
Received: from localhost ([::1]:33892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTrEX-0006aC-CV
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 15:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lTrCt-0005wU-C8
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 15:17:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lTrCo-0001KK-QK
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 15:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617736660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1i0Ii4ukR1KzgWs8D/E0lEJ6kWKgcCxC2AWkxsvYmPs=;
 b=eroJfzQFvjTmlt8KzlXmtHcO+4YAVM3dS6v12w5WyVBsfwxoSB8EkN/1IYw8AMmSDzBLYD
 Lb129kQ2L++ZKaAfVr2Q5fNEPwaW8L6FlyxiAwyNiE+S90k+KWVYzsrh1MEMBwziWmN6Gb
 4fAs6kiXo+GcwPypN6LhuSag6N9lNp4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-BxpLL4g-NXy4G9__h8Eu8g-1; Tue, 06 Apr 2021 15:17:36 -0400
X-MC-Unique: BxpLL4g-NXy4G9__h8Eu8g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5866D1085985;
 Tue,  6 Apr 2021 19:17:24 +0000 (UTC)
Received: from localhost (unknown [10.40.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B23125D9CA;
 Tue,  6 Apr 2021 19:17:21 +0000 (UTC)
Date: Tue, 6 Apr 2021 21:17:19 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v2 4/7] ACPI ERST: build step for ACPI ERST
Message-ID: <20210406211719.6fd9fa31@redhat.com>
In-Reply-To: <1612817879-21511-5-git-send-email-eric.devolder@oracle.com>
References: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
 <1612817879-21511-5-git-send-email-eric.devolder@oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
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
Cc: ehabkost@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 kwilk@oracle.com, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  8 Feb 2021 15:57:56 -0500
Eric DeVolder <eric.devolder@oracle.com> wrote:

> This change includes ERST in the build of ACPI support.
> 
> Signed-off-by: Eric DeVolder <eric.devolder@orace.com>
> ---
>  hw/acpi/meson.build | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> index dd69577..262a8ee 100644
> --- a/hw/acpi/meson.build
> +++ b/hw/acpi/meson.build
> @@ -4,6 +4,7 @@ acpi_ss.add(files(
>    'aml-build.c',
>    'bios-linker-loader.c',
>    'utils.c',
> +  'erst.c',
>  ))

this should be part of the patch that introduces erst.c

>  acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu_hotplug.c'))


