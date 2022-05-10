Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ADE520E49
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 09:10:36 +0200 (CEST)
Received: from localhost ([::1]:55658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noK0x-0002Px-5U
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 03:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1noJx6-00009E-Gq
 for qemu-devel@nongnu.org; Tue, 10 May 2022 03:06:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1noJx3-0003fB-GH
 for qemu-devel@nongnu.org; Tue, 10 May 2022 03:06:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652166391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=blz81KIswQAmuYzKbLZPZ+GNM8OE63GXV3nQaXfIIU0=;
 b=FGFznEwjUQIhqcoqCpD5PJXn6/WqM7kXKR8NN9ot0/IsP42uM5Oh0QUJa7EXGDIscNg4jq
 kSHT6bzPXeWZbi5CIASKSizcoPAtMdF1EH1HBBmxEtrhxiWpeOs15t5whvw1aDfzA4z8YD
 GWJ1DsgW+rL14RJ3FrkP7Z/PXzZZnYk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-x791_3JjOJGk9lN5YBZlWQ-1; Tue, 10 May 2022 03:06:30 -0400
X-MC-Unique: x791_3JjOJGk9lN5YBZlWQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 qf19-20020a1709077f1300b006f439243355so7888721ejc.3
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 00:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=blz81KIswQAmuYzKbLZPZ+GNM8OE63GXV3nQaXfIIU0=;
 b=rJhympFNrLe1mNOEnZKhE+ElwhsTVBb5PkbAkKDjnaIfbx/rDGYP51RSe+JhgB8hRk
 ft0L1gi0Prs96lxs7ma0honWtL7900wikjNwdKukVUuOc+TyEMDaadPckMPDWa38iO36
 xqQcnn11wp4R6EawhZzJKKGrGMPk/pqzzX0qGjqUY3KxzzhyUCtCY82hLfhzdaBbfIVH
 02n4PyE554AYVBXPFUrds7er8wCPnG38jXj1h3tGSWnya87RivPSPDn9S9hLxXT3ac1e
 H6TW6+eUcsV/WI0EHq2S0ovk5TRS0Bj3S91sik3eqrpLHpCeMvqU2gAti40ubu18KREq
 H6BQ==
X-Gm-Message-State: AOAM533F+ppZPciO4va51tCxqZtrQrs3BoqRGbWDCsrXYUM4iprVoUTI
 dbgMLqN/9K6pydThlN9pQsKe8QtGj2tPjytbrqbzmz2XPz7Oh32Ms6y6jAlOEr/H8GKDQQ4VMEp
 WVUhOJLZFjkRsRko=
X-Received: by 2002:a17:906:a219:b0:6e4:86a3:44ea with SMTP id
 r25-20020a170906a21900b006e486a344eamr18445579ejy.385.1652166388994; 
 Tue, 10 May 2022 00:06:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5ZBlgQDdCfoFic9UM8dtS7tMtd7mq2WbUfMsOAa9KiZhhIbAJ5wTzbDnN8RzymJqJpVpumg==
X-Received: by 2002:a17:906:a219:b0:6e4:86a3:44ea with SMTP id
 r25-20020a170906a21900b006e486a344eamr18445570ejy.385.1652166388840; 
 Tue, 10 May 2022 00:06:28 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 hb13-20020a170906b88d00b006f3ef214e08sm5876104ejb.110.2022.05.10.00.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 00:06:28 -0700 (PDT)
Date: Tue, 10 May 2022 09:06:27 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Suthikulpanit, Suravee" <suravee.suthikulpanit@amd.com>
Cc: qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, mst@redhat.com,
 pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 jon.grimm@amd.com
Subject: Re: [PATCH] pc: q35: Bump max_cpus to 512
Message-ID: <20220510090627.4097bd74@redhat.com>
In-Reply-To: <0227c1d2-21d5-24bc-026a-77022edf6f5a@amd.com>
References: <20220504131639.13570-1-suravee.suthikulpanit@amd.com>
 <20220509091249.392fdab6@redhat.com>
 <0227c1d2-21d5-24bc-026a-77022edf6f5a@amd.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, 9 May 2022 18:41:17 +0700
"Suthikulpanit, Suravee" <suravee.suthikulpanit@amd.com> wrote:

> Igor,
> 
> On 5/9/2022 2:12 PM, Igor Mammedov wrote:
> > On Wed, 4 May 2022 08:16:39 -0500
> > Suravee Suthikulpanit<suravee.suthikulpanit@amd.com>  wrote:
> >   
> >> This is the maximum number of vCPU supported by
> >> the AMD x2APIC virtualization.
> >>
> >> Signed-off-by: Suravee Suthikulpanit<suravee.suthikulpanit@amd.com>
> >> ---
> >>   hw/i386/pc_q35.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> >> index 302288342a..e82b1c690d 100644
> >> --- a/hw/i386/pc_q35.c
> >> +++ b/hw/i386/pc_q35.c
> >> @@ -357,7 +357,7 @@ static void pc_q35_machine_options(MachineClass *m)
> >>       machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_DEVICE);
> >>       machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
> >>       machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
> >> -    m->max_cpus = 288;
> >> +    m->max_cpus = 512;  
> > Maybe we should bump it to KVM VCPU maximum,  
> 
> Grepping through the Linux kernel source, the KVM_MAX_VCPUS macro is defined per architecture.
> AFAICT, the absolute maximum is for x86, which is 1024. Does that sound about right?

yep

> > and make sure we error out if asked for combination of
> > hardware/irqchip is not usable.  
> 
> Could you please elaborate on this part?

I meant that is you start with large VCPU number but accelerator/irqchip
can't create correct (usable) VM, QEMU should exit with error.
 
> Thanks,
> Suravee
> 


