Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C814C310D10
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:17:21 +0100 (CET)
Received: from localhost ([::1]:43530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82rI-00020h-QD
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:17:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l82kA-0002CR-5O
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:09:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l82k8-0005KK-HQ
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612537793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zfoac5B+sviqFgAfFRBrU/xBnlwIHvIbt15KUvrLWj0=;
 b=OhpI/kYA7/7RT4aDlU/epCt43Znmv2EVUv+9whrPmeLyEvfnK1ZLdGM8rygebBh0vp0BLS
 b44CkLqffSIh9trJG50ONq+wahlFEdJxs0mQueL0q/4LhwGi7sNmQdhf3rcevmrUQOfueo
 Q0veuhbkwjTGNoYxzu0Q+z99sK6nBcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-Ou8EVkVoPcac2XMRWOn7pA-1; Fri, 05 Feb 2021 10:09:49 -0500
X-MC-Unique: Ou8EVkVoPcac2XMRWOn7pA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BC9C801978;
 Fri,  5 Feb 2021 15:09:48 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.195.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EB9160BF1;
 Fri,  5 Feb 2021 15:09:42 +0000 (UTC)
Date: Fri, 5 Feb 2021 16:09:38 +0100
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 5/9] hw/arm/virt: Improve CPU name in help message
Message-ID: <20210205150938.byuhrqe2yb7vz7jg@kamzik.brq.redhat.com>
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-6-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210205144345.2068758-6-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 05, 2021 at 03:43:41PM +0100, Philippe Mathieu-Daudé wrote:
> When selecting an incorrect CPU, there is a mismatch between the
> CPU name provided and the one displayed (which is some QEMU internal
> name):
> 
>   $ qemu-system-aarch64 -M virt -cpu cortex-a8
>   qemu-system-aarch64: mach-virt: CPU type cortex-a8-arm-cpu not supported
> 
> Strip the suffix to display the correct CPU name:
> 
>   $ qemu-system-aarch64 -M virt -cpu cortex-a8
>   qemu-system-aarch64: mach-virt: CPU type cortex-a8-arm
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/virt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 399da734548..7802d3a66e8 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1829,7 +1829,10 @@ static void machvirt_init(MachineState *machine)
>      finalize_gic_version(vms);
>  
>      if (!cpu_type_valid(machine->cpu_type)) {
> -        error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
> +        int len = strlen(machine->cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
> +
> +        error_report("mach-virt: CPU type %.*s not supported",
> +                     len, machine->cpu_type);
>          exit(1);
>      }
>  
> -- 
> 2.26.2
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


