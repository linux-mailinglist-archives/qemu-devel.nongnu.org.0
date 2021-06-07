Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A8B39DC80
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 14:33:36 +0200 (CEST)
Received: from localhost ([::1]:38462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqERj-0007nu-W4
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 08:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lqEQT-000780-R2
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 08:32:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lqEQQ-0000ER-QS
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 08:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623069134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nqwc4PsU3niFHTKRG/xy4cgJlE3pDWcE68+VQZtXMQQ=;
 b=gqd1JhAiLe4NdWcoE8opqGP/EtRiup1Xz0SbMzxYJuJ0lXnX3HW/PvH2V2r7VtfwDkYAWO
 wgZNC6weKIaGpUsHalufVgRted4mLe8tWh/xoxj8urrNiQI+3AVt12+d24N1HPZQjkRE5F
 C8yR2LKkjLwE38yf5FTLj449JGfOaRw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-vd1EqbIZMamVyUleEvPJkA-1; Mon, 07 Jun 2021 08:32:13 -0400
X-MC-Unique: vd1EqbIZMamVyUleEvPJkA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFE16107ACCA;
 Mon,  7 Jun 2021 12:32:11 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B9DB5D9E3;
 Mon,  7 Jun 2021 12:32:06 +0000 (UTC)
Date: Mon, 7 Jun 2021 14:32:06 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v3 4/7] ACPI ERST: include ERST feature in build of ACPI
 support
Message-ID: <20210607143206.159bf987@redhat.com>
In-Reply-To: <1622225659-16847-5-git-send-email-eric.devolder@oracle.com>
References: <1622225659-16847-1-git-send-email-eric.devolder@oracle.com>
 <1622225659-16847-5-git-send-email-eric.devolder@oracle.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 28 May 2021 14:14:16 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

> This change includes ERST in the build of ACPI.
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
>  acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu_hotplug.c'))

this should be part of the patch that introduces erst.c,
unless there is a good reason for not doing so.


