Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6AE5703D1
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 15:06:03 +0200 (CEST)
Received: from localhost ([::1]:38202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAt6v-0005xh-L5
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 09:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oAszR-0007Vd-04
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 08:58:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oAszL-0007qS-0O
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 08:58:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657544290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=21R1nTczZLehW8By3gai4NO9O5AME6Ss6MlzvVx11J4=;
 b=dtb1EZlkSaQV6YGeaeJk5WxnVKOb8JmI+Z4/tW/16uZyV1m4eKLVCFvIxtWFyMus2on9Bv
 i94WABpSqIqLHFePUrQ6u1/rYmXo8M0HuLA1jzoV7FdZloDSTevz4miDcLJiMD33CA2LrR
 /8+dyjuBBzLzKYT4myrhhyS7bbhPIBY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-Fyt8Q4cJP9u9e3NvBNPuHA-1; Mon, 11 Jul 2022 08:58:09 -0400
X-MC-Unique: Fyt8Q4cJP9u9e3NvBNPuHA-1
Received: by mail-ed1-f71.google.com with SMTP id
 w15-20020a056402268f00b0043ac600a6bcso3125936edd.6
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 05:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=21R1nTczZLehW8By3gai4NO9O5AME6Ss6MlzvVx11J4=;
 b=6n1M8gQD24DpDxlsrgKyb/u/8IUx5BBZ8M1jutaT7EL9FNYuIdaRuufKU/+I29vD/Q
 80UC+fhxS4sbx77IyTN8yX9htoOh5jL0PlBBzdonhG879CJZQuRuto6r1Hr72cvNTtE1
 Cxf5Mj5yFyCkwSjK5kN7tHUnYIQSJen5uBieaxgU5ayjQHPtCb4UKKQX1XuAj/BtLZt6
 4/7I4ZCFKeGwzD1PvvaGjR/7/FJeXBkOelAm8hZTV/4Z43p5zL+Em2kZGLpkBm7L/56t
 XM1WFeIeT8FRgMXyqE6qs+8+WPwx1RYbAXC7rMS++GVcGa+MBM0aTRU6K1+Zg7sQZiEl
 FH6Q==
X-Gm-Message-State: AJIora8ONhV++Tbm3ROyhaziUZdHnbOtzZ3wURlWHSgnA2eCFWU+SGfz
 QTcvNLdPTVFgk7DoqQYzKqhJPOX6pITaZVtCfMRpvYNdgyJRpvqkSW3RmUEmkFBWMTKDnFQKkNW
 B7UuBsEH3jyKNVoY=
X-Received: by 2002:a05:6402:510a:b0:43a:91ff:3f4b with SMTP id
 m10-20020a056402510a00b0043a91ff3f4bmr24585947edd.187.1657544288150; 
 Mon, 11 Jul 2022 05:58:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u/H0o9RgUavTVF7nbTEF4zBMfBIdSj8gSFuFC1wVnADxMtfVVuePT0WQmJ9vjKsGhEoL6bEQ==
X-Received: by 2002:a05:6402:510a:b0:43a:91ff:3f4b with SMTP id
 m10-20020a056402510a00b0043a91ff3f4bmr24585917edd.187.1657544287965; 
 Mon, 11 Jul 2022 05:58:07 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a1709064dca00b006fef557bb7asm2660858ejw.80.2022.07.11.05.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 05:58:07 -0700 (PDT)
Date: Mon, 11 Jul 2022 14:58:06 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>, Jonathan Cameron
 <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v6 07/10] i386/pc: handle unitialized mr in
 pc_get_cxl_range_end()
Message-ID: <20220711145806.1d47f365@redhat.com>
In-Reply-To: <b9ae2b09-4b25-34f7-e9ed-1aad3ebfadf5@oracle.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-8-joao.m.martins@oracle.com>
 <20220707150533.68892c2e@redhat.com>
 <b9ae2b09-4b25-34f7-e9ed-1aad3ebfadf5@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, 7 Jul 2022 16:21:07 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 7/7/22 14:05, Igor Mammedov wrote:
> > On Fri,  1 Jul 2022 17:10:11 +0100
> > Joao Martins <joao.m.martins@oracle.com> wrote:
> >   
> >> This in preparation to allow pc_pci_hole64_start() to be called early
> >> in pc_memory_init(), handle CXL memory region end when its underlying
> >> memory region isn't yet initialized.
> >>
> >> Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
> >> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> >> ---
> >>  hw/i386/pc.c | 13 +++++++++++++
> >>  1 file changed, 13 insertions(+)
> >>
> >> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> >> index 8655cc3b8894..d6dff71012ab 100644
> >> --- a/hw/i386/pc.c
> >> +++ b/hw/i386/pc.c
> >> @@ -857,6 +857,19 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
> >>                  start = fw->mr.addr + memory_region_size(&fw->mr);
> >>              }
> >>          }
> >> +    } else {  
> > 
> >   
> >> +        hwaddr cxl_size = MiB;
> >> +
> >> +        start = pc_get_cxl_range_start(pcms);
> >> +        if (pcms->cxl_devices_state.fixed_windows) {
> >> +            GList *it;
> >> +
> >> +            start = ROUND_UP(start + cxl_size, 256 * MiB);
> >> +            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
> >> +                CXLFixedWindow *fw = it->data;
> >> +                start += fw->size;
> >> +            }
> >> +        }  
> > 
> > /me wondering if this can replace block above that supposedly does
> > the same only using initialized cxl memory regions?
> >   
> 
> I was thinking about the same thing as of writing.
> 
> If the calculation returns the same values might as well just replace it
> as opposed to branching out similar logic.

Let's drop not needed code, so reader won't have to wonder why
the same thing is done in 2 different ways.

> 
> I can do that in v7.
> 


