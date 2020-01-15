Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E23113CC0C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 19:26:57 +0100 (CET)
Received: from localhost ([::1]:58638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irnNY-0003fP-Cc
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 13:26:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53832)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1irnHe-0003x2-Ar
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 13:20:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1irnHZ-000668-U3
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 13:20:49 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48295
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1irnHZ-00065j-On
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 13:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579112444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ufi6otA0/L7ztn0pDlPDF73eDYu14NmPNpW8h2WXe1k=;
 b=bb5LN8uBdMvdx+VdrC+NDeDb5+EjEuyISYRHVWFoxgI7gVJGTi2HBdig59NIs+G4XbHoBd
 nak6TOvihzK5yMwHBqN/3qh8KX51/KKw0BDrU3O0wnZ892AnOxEbXJtyD3VLQ3WZbOOhcL
 SQGyoV8m6uG6mRTpN44AUaU1zyv5aQ4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-lzUfKnRINhKAE4yamrKZYw-1; Wed, 15 Jan 2020 13:20:41 -0500
Received: by mail-wr1-f70.google.com with SMTP id i9so8296148wru.1
 for <qemu-devel@nongnu.org>; Wed, 15 Jan 2020 10:20:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9pNkcVjR0dksTldh+/H4WZ9q+TmTz78925pG2QZRYkQ=;
 b=ienY/+xDVi/xK0KiroXBex6DmDtjnigRC02cmvXIXZN9bFnSm/kN1R+yY01lifrFfo
 LYB2YhqWTNxL600Sie1TeeL/H7lE/JyMPOiwc82sE/OACWtFAJnaAUnB9VhAtaUknus1
 MlpZmCv3lAS7ON5aDfAJ1KqnXsAQkG6Y7yrvvS5dMW0XGrXoP21quk7GIJCfbU+3ZXEy
 mbdXoZqmPovyaWWgmjKzGBxQ/I18hQk5bEiUQLxRtWA/0gPld2Z1pf2z3xfJ/+mDIbiI
 XGw4z4uMNKViSMcSHAXo743r7PS6768gdhOGg1/yCJG2Gey5Hn9Mbx1ZhYRpzTHd3+7/
 ogsg==
X-Gm-Message-State: APjAAAWOUBo+RuDMMTJ/dm8/weVQen3NsXWkHZ6PSlhnCI19ULksVeaS
 h9YVsU1kQyTquBSJtgeR8kzXOUazXGQ/9SMZ2oxYaeDWHyFvhDxIDX6c5ETnEix/om1lrXQeVJU
 GK0su/n16kccf4q8=
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr1263377wmi.118.1579112440310; 
 Wed, 15 Jan 2020 10:20:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqzI/DkF0W+sf+pyYk/TqT3yI/uzDFIZyEFJfoY+3l9J4KFOxRBCxJBgRPCZarWv9AClqNlA+g==
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr1263348wmi.118.1579112440006; 
 Wed, 15 Jan 2020 10:20:40 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9?
 ([2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9])
 by smtp.gmail.com with ESMTPSA id s8sm24928409wrt.57.2020.01.15.10.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 10:20:39 -0800 (PST)
Subject: Re: [PATCH v2 40/86] cris:axis_dev88: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-41-git-send-email-imammedo@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7b94423f-9e99-2020-e567-310ead448b90@redhat.com>
Date: Wed, 15 Jan 2020 19:20:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1579100861-73692-41-git-send-email-imammedo@redhat.com>
Content-Language: en-US
X-MC-Unique: lzUfKnRINhKAE4yamrKZYw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/20 4:06 PM, Igor Mammedov wrote:
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>    MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: edgar.iglesias@gmail.com
> ---
>   hw/cris/axis_dev88.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c
> index be77604..cf6790f 100644
> --- a/hw/cris/axis_dev88.c
> +++ b/hw/cris/axis_dev88.c
> @@ -249,7 +249,6 @@ static struct cris_load_info li;
>   static
>   void axisdev88_init(MachineState *machine)
>   {
> -    ram_addr_t ram_size =3D machine->ram_size;
>       const char *kernel_filename =3D machine->kernel_filename;
>       const char *kernel_cmdline =3D machine->kernel_cmdline;
>       CRISCPU *cpu;
> @@ -261,16 +260,12 @@ void axisdev88_init(MachineState *machine)
>       struct etraxfs_dma_client *dma_eth;
>       int i;
>       MemoryRegion *address_space_mem =3D get_system_memory();
> -    MemoryRegion *phys_ram =3D g_new(MemoryRegion, 1);
>       MemoryRegion *phys_intmem =3D g_new(MemoryRegion, 1);
>  =20
>       /* init CPUs */
>       cpu =3D CRIS_CPU(cpu_create(machine->cpu_type));
>  =20
> -    /* allocate RAM */
> -    memory_region_allocate_system_memory(phys_ram, NULL, "axisdev88.ram"=
,
> -                                         ram_size);
> -    memory_region_add_subregion(address_space_mem, 0x40000000, phys_ram)=
;
> +    memory_region_add_subregion(address_space_mem, 0x40000000, machine->=
ram);
>  =20
>       /* The ETRAX-FS has 128Kb on chip ram, the docs refer to it as the
>          internal memory.  */
> @@ -351,6 +346,7 @@ static void axisdev88_machine_init(MachineClass *mc)
>       mc->init =3D axisdev88_init;
>       mc->is_default =3D 1;
>       mc->default_cpu_type =3D CRIS_CPU_TYPE_NAME("crisv32");
> +    mc->default_ram_id =3D "axisdev88.ram";
>   }
>  =20
>   DEFINE_MACHINE("axis-dev88", axisdev88_machine_init)
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


