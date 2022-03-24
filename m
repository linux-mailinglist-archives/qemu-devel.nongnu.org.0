Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B37F4E60E5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 10:11:38 +0100 (CET)
Received: from localhost ([::1]:45402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXJVJ-0006t8-F7
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 05:11:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nXJSH-0004rT-KA
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 05:08:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nXJSD-0006hT-GG
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 05:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648112904;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=G0M7wtHPTa1OLiyLpzclxr4Vv/5PWruo5QNVOKsm6kw=;
 b=a9WoZ9//3LdxdPTC6re1iHGut2TZRtlrl/YbnELGgJhyWxlC+dMyU5KP3ups1uhfyPKdA6
 BQmuEc1z36CrEX+6vNo9bN75SDZY463zr7Zr5B+4l7ctxv4t9nBphRKK19QW3cSaFhWesS
 3Em7glbsVps0shggor2G9DVptEIj11c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-I0KoeGPBN2KcFB7mXuevpA-1; Thu, 24 Mar 2022 05:08:22 -0400
X-MC-Unique: I0KoeGPBN2KcFB7mXuevpA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D60A811E78;
 Thu, 24 Mar 2022 09:08:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B66B4010A39;
 Thu, 24 Mar 2022 09:08:20 +0000 (UTC)
Date: Thu, 24 Mar 2022 09:08:18 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: Re: [PATCH] hw/riscv: virt: Warn the user if -bios is provided when
 using KVM
Message-ID: <Yjw1At8ig+UzFKXn@redhat.com>
References: <20220323171346.792572-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
In-Reply-To: <20220323171346.792572-1-ralf.ramsauer@oth-regensburg.de>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: apatel@ventanamicro.com, Peter Maydell <peter.maydell@linaro.org>,
 anup@brainfault.org, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, stefan.huber@oth-regensburg.de,
 alistair23@gmail.com, jiangyifei@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 23, 2022 at 06:13:46PM +0100, Ralf Ramsauer wrote:
> The -bios option is silently ignored if used in combination with -enable-kvm.
> The reason is that the machine starts in S-Mode, and the bios typically runs in
> M-Mode.
> 
> Warn the user that the bios won't be loaded.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  hw/riscv/virt.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4496a15346..a4d13114ee 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1312,6 +1312,9 @@ static void virt_machine_init(MachineState *machine)
>       * when KVM is enabled.
>       */
>      if (kvm_enabled()) {
> +        if (machine->firmware && strcmp(machine->firmware, "none"))
> +            warn_report("BIOS is not supported in combination with KVM. "
> +                        "Ignoring BIOS.");

If the usage scenario isn't supportable, then ultimately we should be
raising an error and immediately exiting.

If you know of common usage that is already mistakenly passing -bios,
then we could start with a warning and list it as deprecated, then
change to an error_report 2 releases later. If we don't thing people
are often mistakenly passing -bios, then go straight for error_report
and exit.

>          g_free(machine->firmware);
>          machine->firmware = g_strdup("none");
>      }
> -- 
> 2.32.0
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


