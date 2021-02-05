Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9959F310D14
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:19:45 +0100 (CET)
Received: from localhost ([::1]:51822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82tc-0005XQ-Kk
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:19:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l82mr-0005dr-2Q
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:12:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l82mp-0006TC-BP
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:12:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612537962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dkbrlN8kdtdbglYaZX1/Hk2/MbLaHTIhzSK7E907WME=;
 b=Iyis+/FJr+5/7y+4F3A/otcZXF33Dk+n65uUw9cZC1/lgTR2GqXDplnTsaTCPYtV7W/rAF
 TDC0Ce9Gf5rPMv3g4FTADSHJHoYy5eky/Tg0xn7PE0/zlKj81HxIY71p86yEeVopzDOjN9
 vN2QyTXVQMv6c5+U72+KduNL5eQ/sUM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-ALaUxsHHNEGV4KX1EWGc5A-1; Fri, 05 Feb 2021 10:12:40 -0500
X-MC-Unique: ALaUxsHHNEGV4KX1EWGc5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74F84100CCC1;
 Fri,  5 Feb 2021 15:12:39 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.195.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 589EB5D9FC;
 Fri,  5 Feb 2021 15:12:32 +0000 (UTC)
Date: Fri, 5 Feb 2021 16:12:29 +0100
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 6/9] hw/arm/virt: Display list of valid CPUs for the Virt
 machine
Message-ID: <20210205151229.ro6atrqa5bdwuj57@kamzik.brq.redhat.com>
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-7-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210205144345.2068758-7-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 05, 2021 at 03:43:42PM +0100, Philippe Mathieu-Daudé wrote:
> The Virt machine is restricted to a subset of the CPU provided
> by QEMU. Instead of having the user run '--cpu help' and try
> each CPUs until finding a match, display the list from start:
> 
>   $ qemu-system-aarch64 -M virt -cpu cortex-a8
>   qemu-system-aarch64: mach-virt: CPU type cortex-a8 not supported
>   qemu-system-aarch64: mach-virt: Please select one of the following CPU types:  cortex-a7, cortex-a15, cortex-a53, cortex-a57, cortex-a72, host, max
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/virt.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7802d3a66e8..6ffe091804f 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1830,9 +1830,20 @@ static void machvirt_init(MachineState *machine)
>  
>      if (!cpu_type_valid(machine->cpu_type)) {
>          int len = strlen(machine->cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
> +        g_autoptr(GString) s = g_string_new(NULL);
>  
>          error_report("mach-virt: CPU type %.*s not supported",
>                       len, machine->cpu_type);
> +
> +        for (n = 0; n < ARRAY_SIZE(valid_cpus); n++) {
> +            len = strlen(valid_cpus[n]) - strlen(ARM_CPU_TYPE_SUFFIX);
> +            g_string_append_printf(s, " %.*s", len, valid_cpus[n]);
> +            if (n + 1 < ARRAY_SIZE(valid_cpus)) {
> +                g_string_append_c(s, ',');
> +            }
> +        }
> +        error_report("mach-virt: Please select one of the following CPU types: %s",
> +                     g_string_free(s, FALSE));
>          exit(1);
>      }
>  
> -- 
> 2.26.2
>

It'd be nice if './qemu-system-aarch64 -M virt -cpu \?' would only output
the CPUs that the virt machine type supports. Then this error message
could suggest running that in order to get the list.

Thanks,
drew


