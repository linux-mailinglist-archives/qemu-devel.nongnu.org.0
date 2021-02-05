Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F3D310D18
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:21:12 +0100 (CET)
Received: from localhost ([::1]:58278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82v1-0008Ka-1A
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:21:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l82oH-00086T-Rw
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:14:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l82oG-00074X-Cf
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:14:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612538051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=49ygXWRs0CatUif4ptldKyb1Fvl6nhagyM54rn4V3as=;
 b=Jdy4jjYIbPU/yhaHdY0iBWlnjnHBYqHSfNtAfb7ajIpyxygMptWec9s6blRsD7FTVR6dxM
 hQnF2Phb4ZfQaJKp14f4kZoIiMPTY4UCpGWO8Sm81gBuNSRRrw0vrLC9cpH1/LiI/JzyNg
 EZcnFzwRfbt6QuEa7EHtMwUv9ngILg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-ubZFkprmMWunKvCa_zVW5Q-1; Fri, 05 Feb 2021 10:14:06 -0500
X-MC-Unique: ubZFkprmMWunKvCa_zVW5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E1AB8710E2;
 Fri,  5 Feb 2021 15:14:05 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.195.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 123B75C1B4;
 Fri,  5 Feb 2021 15:14:02 +0000 (UTC)
Date: Fri, 5 Feb 2021 16:14:00 +0100
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 7/9] hw/arm/virt: Do not include 64-bit CPUs in 32-bit
 build
Message-ID: <20210205151400.43qnu4qatrbsliwp@kamzik.brq.redhat.com>
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-8-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210205144345.2068758-8-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 05, 2021 at 03:43:43PM +0100, Philippe Mathieu-Daudé wrote:
> Similarly to commit 210f47840dd, remove 64-bit CPUs (which have
> never been available on 32-bit build, see commit d14d42f19bf),
> to fix:
> 
>   $ make check-qtest-arm
>   ...
>   Running test qtest-arm/device-introspect-test
>   missing object type 'cortex-a53-arm-cpu'
>   Broken pipe
>   ../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
>   ERROR qtest-arm/device-introspect-test - too few tests run (expected 6, got 5)
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/virt.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 6ffe091804f..f5e4a6ec914 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -199,9 +199,11 @@ static const int a15irqmap[] = {
>  static const char *valid_cpus[] = {
>      ARM_CPU_TYPE_NAME("cortex-a7"),
>      ARM_CPU_TYPE_NAME("cortex-a15"),
> +#ifdef TARGET_AARCH64
>      ARM_CPU_TYPE_NAME("cortex-a53"),
>      ARM_CPU_TYPE_NAME("cortex-a57"),
>      ARM_CPU_TYPE_NAME("cortex-a72"),
> +#endif /* TARGET_AARCH64 */
>      ARM_CPU_TYPE_NAME("host"),
>      ARM_CPU_TYPE_NAME("max"),
>  };
> -- 
> 2.26.2
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


