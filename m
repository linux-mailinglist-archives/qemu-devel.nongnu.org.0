Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8B64C43CD
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 12:43:24 +0100 (CET)
Received: from localhost ([::1]:45860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNZ0N-000429-Tp
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 06:43:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNYwM-0001yN-UJ
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 06:39:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNYwF-0006hb-OY
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 06:39:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645789130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uxfBLDcZEud0oT6ukUMZPR1EaLiqmBK7HQtdPH+mzh4=;
 b=f+zjYoomAy3zlCg7ExIpO/i66qI/flQvc4mfq5Xz76/euI72Or2qQGdAwkSmSettMXxBU9
 z2aFPUsJU6DfOgty5MYf/+MUcmdt17/SQSlJTykwTFbyOGgJQiCgI8DE4JSdJaZyDMQ2yk
 J1JhRCPFYHIL3PRS69629Ee1XMp7Hok=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-o7g94nH-P6K2kEl0Ez36iw-1; Fri, 25 Feb 2022 06:38:49 -0500
X-MC-Unique: o7g94nH-P6K2kEl0Ez36iw-1
Received: by mail-ej1-f71.google.com with SMTP id
 go11-20020a1709070d8b00b006cf0d933739so2561266ejc.5
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 03:38:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uxfBLDcZEud0oT6ukUMZPR1EaLiqmBK7HQtdPH+mzh4=;
 b=r0BxRocCjSk8rbqN4+x0RaEDvpHwGliXHF+QIRFCW1g3SKp6JyUkSFnJoj2vl2yPDZ
 EK6FzIInUrg3eAwD78opYK7yeGr/42IZGF9TQCkJi9zNRaQEIW5AcTGhbbOIK2lsU2A8
 RFPrhn3j/p+tHr9hG0+g+beFP3Sl/FjKdEaOi4VoL0vfHKHOlFQkiWxRVuZSaKQybnfW
 G8WYTkWfBxob6vYh1fg16E9XoefpdHwt35nkcamo4MtGDqDDrXfK8YFLxY3E1ujOEPZY
 uaiN0AIZecS+MoAsIFMD4dnfVpsKs0Nrp7qGHgHX1bBKAohTdBYkc4vSWxbh0nyk1P+N
 lAWg==
X-Gm-Message-State: AOAM5303K9oXiqAAirhCHQC/Pub8f/CXsuX99v6LLQvvSUwujriFp2Vj
 CQy45hQfJGoFfdP/VLo6da3LV6hNNX72poNIZfpXwADZs9y2x+IREYkHv42D+kOs9QJ20seahYJ
 RtjL2Y4LJr5Xp4KQ=
X-Received: by 2002:a17:906:4ccd:b0:6b7:75ca:3eac with SMTP id
 q13-20020a1709064ccd00b006b775ca3eacmr5753404ejt.167.1645789127416; 
 Fri, 25 Feb 2022 03:38:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5rOQngSocS+2THq4V13QTz4SwZt6S278abjrL2ZILbDJJBkQ8azbQ4WWztI3xjJiaEudbGg==
X-Received: by 2002:a17:906:4ccd:b0:6b7:75ca:3eac with SMTP id
 q13-20020a1709064ccd00b006b775ca3eacmr5753388ejt.167.1645789127129; 
 Fri, 25 Feb 2022 03:38:47 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 a21-20020aa7cf15000000b00412be382294sm1208706edy.30.2022.02.25.03.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 03:38:46 -0800 (PST)
Date: Fri, 25 Feb 2022 12:38:45 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH v4 13/14] hw/mem/system-memory: add a memory sysbus device
Message-ID: <20220225123845.5cf81c26@redhat.com>
In-Reply-To: <2e1bef30-3227-5137-cab8-5dbd7011f39c@greensocs.com>
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-14-damien.hedde@greensocs.com>
 <20220223104450.196e9624@redhat.com>
 <9d0cfe90-01bc-6008-664f-74bdaa9c145c@greensocs.com>
 <20220224105521.1b760212@redhat.com>
 <2e1bef30-3227-5137-cab8-5dbd7011f39c@greensocs.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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
Cc: Ani Sinha <ani@anisinha.ca>, edgari@xilinx.com, mark.burton@greensocs.com,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Feb 2022 12:43:21 +0100
Damien Hedde <damien.hedde@greensocs.com> wrote:

> On 2/24/22 10:55, Igor Mammedov wrote:
> > On Wed, 23 Feb 2022 11:19:49 +0100
> > Damien Hedde <damien.hedde@greensocs.com> wrote:
> >   
> >> On 2/23/22 10:44, Igor Mammedov wrote:  
> >>> On Wed, 23 Feb 2022 10:07:05 +0100
> >>> Damien Hedde <damien.hedde@greensocs.com> wrote:
> >>>      
> >>>> This device can be used to create a memory wrapped into a
> >>>> sysbus device.
> >>>> This device has one property 'readonly' which allows
> >>>> to choose between a ram or a rom.
> >>>>     
> >>>      
> >>>> The purpose for this device is to be used with qapi command
> >>>> device_add.  
> >>> that's the way to add a device to QEMU but a don't actual
> >>> purpose described here, i.e. how board will use this
> >>> device/actual usecase and how it will be wired to board
> >>> and why it does have to be a sysbus device.
> >>>      
> >> Sorry, this was unclear.
> >>
> >> It is a sysbus device in order to use it like any other sysbus device.
> >> The memory region it contains is exposed as a sysbus mmio.  
> > 
> > aside of that sysbus is legacy fictional bus (albeit widely used),
> > it doesn't scale to non sysbus devices (me thinking about buss-less
> > pc-dimm & co) since eventually we would like to create mainstream
> > machine types via QMP as well.
> >   
> >> I can replace the commit message by the following paragraph:
> >>
> >> Boards instantiate memories by creating memory region objects which is
> >> not possible using QAPI commands.  
> > 
> > That's not entirely true, you can use object-add with hostmem backends
> > which do provide a means to allocate memory_region.
> > (there is no rom hostmem backend probably (i.e. one that return rom memory region)
> > but that could be added).
> > Another benefit of approach is that one can replace backing
> > memory any other backend (file/memfd/pmem...) without affecting
> > device model.  
> 
> I'm not familiar with memory backends. I need to take a look at them.
> >   
> >> To create a memory, the user can instantiate and map this device by
> >> issuing the following commands:
> >> device_add driver=sysbus-memory size=0x1000 id=someram
> >> sysbus-mmio-map device=someram addr=0  
> > 
> > I'd imagine more generic approach would look like:
> > 
> > object-add memory-backend-ram,id=mem1,size=0x1000,other_backend_twiks
> > device_add memdevice_frontend,memdev=mem1,addr=0x0
> > 
> > where [pre]plug hooks in machine can map device to
> > an appropriate address space/place at device realize time.
> > (see memory_device_[pre_]plug() for starters).
> >   
> 
> We cannot rely on hooks the machine would define, because we start
> from an empty machine. So anything must come from qapi and we would
> need to do something like that I suppose:
> object-add memory-backend-ram,id=mem1,size=0x1000,other_backend_twiks
> device_add sysbus-memory-frontend,memdev=mem1,id=memdev_fe
> sysbus-mmio-map device=memdev_fe addr=0

As I pointed out using legacy sysbus doesn't scale, also I'd avoid
spawning more new device based on it if it can be helped.

with bus-less design, machine is still empty, in advance prepared
plug callbacks, is practically meta-data saying which device class
map into which address space which is quite generic. It helps
to avoid having extra QMP command for mapping.
However if prebuilt mapping is problematic, maybe have an alternative
QMP command that would do mapping, just not limited to sysbus,
something like 

   map_at_as device=1 as={parent_mr_name,system,io} [addr=x overlap=y prio=z]

which should give you full control where and how to map device.
 
> Thanks,
> --
> Damien
> 
> 


