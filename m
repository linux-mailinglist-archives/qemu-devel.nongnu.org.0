Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2A94C0F88
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 10:49:37 +0100 (CET)
Received: from localhost ([::1]:57824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMoH9-0008FT-JH
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 04:49:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMnmS-0006YQ-Vm
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:17:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMnmN-0003oR-Nr
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:17:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645607857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B8q1URPfwAjEsMpocjz8hxjP4ZCcIPx2PwLRnv+Iadw=;
 b=J3hsHD539jY21gU5OaNNxznGj+3wNQGe+zN9Bf1NfqlWfQBWpzEUM+8tkfs1jvO8BgPoGg
 tIC1rUQ7mxWJniMkDC0JZnxaJXI/vQXNpLEGxYS8DVEWVl0Omb35g8TbpFheFQBe7UBh+0
 QSBI+wKmKBA+Ex5zKiBWDWS6zgif9S4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-XWgfy-eBNwGTKNnQe18c5g-1; Wed, 23 Feb 2022 04:16:55 -0500
X-MC-Unique: XWgfy-eBNwGTKNnQe18c5g-1
Received: by mail-wr1-f70.google.com with SMTP id
 w2-20020adfbac2000000b001ea99ca4c50so1717903wrg.11
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 01:16:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=B8q1URPfwAjEsMpocjz8hxjP4ZCcIPx2PwLRnv+Iadw=;
 b=EjaWsyOkOCRfzYcjiRu4c3VZtRqGs+dcBzy1ajkUSJrw7ewCwNTdYQknxCsvy3i67K
 bBT6isdz10fmL5MulyxqkFkd998G7xlzTPQzc8x++XJ2CH2g/dOQFqSzcncQVcltaokI
 3ViGxfpBS4fIReqAZ6tFmpk6FPRAQQQbufzNtELo6ezBTF/NTfEkNXkd76YPZ9JyUY8Z
 dhknXGNaRxdXNooF6dOa6mZn4nhwJcx+KTwdjGKdPac/WQblo4glFy2YdOO+WRY/nE4D
 0mdtUxjT6/R5wRFyNZkxB3kDZ1x/J3vWRrR6tGQFZz/3mOjXX2CRJBJ/d9sI5G4CPwkj
 Ziwg==
X-Gm-Message-State: AOAM531kCzplOX//yj3lku1UDKX/Zv/LynIt347x1DyHGlKFn9L+bij5
 ehYhR7NYBBNu+6YjAwNEiz1NablNlDNYh+qgFUYaHD/a41lXxcMfjQ37mA3WS1f1QNVIB4dP3WI
 AgphHZ78ve1/tt44=
X-Received: by 2002:adf:de85:0:b0:1e3:31ab:5981 with SMTP id
 w5-20020adfde85000000b001e331ab5981mr21982110wrl.18.1645607814598; 
 Wed, 23 Feb 2022 01:16:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/RkTndzDa6pjpz/0A5t22z96RKEVFr+f4tqwMkHscRnILOjdJuqzwHpq/laSTdummHJKnEQ==
X-Received: by 2002:adf:de85:0:b0:1e3:31ab:5981 with SMTP id
 w5-20020adfde85000000b001e331ab5981mr21982087wrl.18.1645607814350; 
 Wed, 23 Feb 2022 01:16:54 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id ay12sm39357200wrb.73.2022.02.23.01.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 01:16:53 -0800 (PST)
Date: Wed, 23 Feb 2022 09:16:51 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH RFCv2 2/4] i386/pc: relocate 4g start to 1T where
 applicable
Message-ID: <YhX7g0GjwE5u7+vf@work-vm>
References: <20220207202422.31582-3-joao.m.martins@oracle.com>
 <20220214155318.3ce80da0@redhat.com>
 <fa172a19-5db6-a844-27d7-8497d306024e@oracle.com>
 <20220214163158.4c4b210b@redhat.com>
 <20220215095358.5qcrgwlasheu63uj@sirius.home.kraxel.org>
 <YgzJE7ufEYm6OFyg@redhat.com> <YhOQfJ8x93+jDSZf@work-vm>
 <20220222094602.66d55613@redhat.com>
 <20220222094255.as2alzu65rhateml@sirius.home.kraxel.org>
 <20220223094343.2e600a22@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220223094343.2e600a22@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Igor Mammedov (imammedo@redhat.com) wrote:
> On Tue, 22 Feb 2022 10:42:55 +0100
> Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
> >   Hi,
> > 
> > > > And the upstream code is now pretty much identical except for the
> > > > default;  note that for TCG you do need to keep to 40 I think.  
> > > 
> > > will TCG work with 40bits on host that supports less than that?  
> > 
> > When I understand things correctly the problem is that the phys-bits
> > limit applies to the npt/ept tables too, effectively restricting guest
> > physical address space to host physical address space.
> > 
> > TCG is not affected by that and should work just fine.
> > 
> > Not sure what happens if you turn off npt/ept and run on softmmu.
> > Possibly that works fine too.
> > 
> > > Also quick look at host-phys-bits shows that it affects only 'host'
> > > cpu model and is NOP for all other models.  
> > 
> > I don't think so.  microvm forces host-phys-bits=on and that works with
> > all cpu models.
> 
> I just don't see how host-phys-bits can work for other than 'host' cpu model.
> It's true that property is available for all cpu models, but the field it sets
> is only used in target/i386/host-cpu.c, the same applies to host-phys-bits-limit.
> Am I missing something?

The hook in kvm/kvm-cpu.c kvm_cpu_realizefn:

    /*
     * The realize order is important, since x86_cpu_realize() checks if
     * nothing else has been set by the user (or by accelerators) in
     * cpu->ucode_rev and cpu->phys_bits, and updates the CPUID results in
     * mwait.ecx.
     * This accel realization code also assumes cpu features are already expanded.
     *
     * realize order:
     *
     * x86_cpu_realize():
     *  -> x86_cpu_expand_features()
     *  -> cpu_exec_realizefn():
     *            -> accel_cpu_realizefn()
     *               kvm_cpu_realizefn() -> host_cpu_realizefn()
     *  -> check/update ucode_rev, phys_bits, mwait
     */

Dave

> > 
> > take care,
> >   Gerd
> > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


