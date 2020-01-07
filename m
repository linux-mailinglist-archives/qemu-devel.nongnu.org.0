Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AB9132476
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 12:05:41 +0100 (CET)
Received: from localhost ([::1]:46554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iomg7-0006mN-9U
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 06:05:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48370)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iolgQ-0007nO-1K
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 05:01:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iolgO-00026n-Li
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 05:01:53 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56976
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iolgO-00026c-Hu
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 05:01:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578391312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F1NShKNPGQreq5TlN4FooVJm8/jBQ0AAY8Gnx45nSKE=;
 b=BMxrUdUMH7/Orcev0lKV4oSItjFmhfLN89ALgHsu8HJEkfbYnIpCdntmjWj4M2MKD454yv
 bOWMhF9B7OCuVigq8o1/ePg1FxD2NSFMDoIfcrqrs3zBPVl4gSCOipp+6YajPnzLWX6bcn
 Af5XqAT9wrU2fYM8h8USRk41DIH4n/k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-Onf_4rSVNJmuDJ-9TwbuRw-1; Tue, 07 Jan 2020 05:01:51 -0500
Received: by mail-wr1-f71.google.com with SMTP id z14so28603272wrs.4
 for <qemu-devel@nongnu.org>; Tue, 07 Jan 2020 02:01:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m14dUcO9nYhGc07a/dbr7bGs6eBsDckucp42Kzd703s=;
 b=DvNvLSJgzNSdD04ViV4drpAVCImqSybZ9FIKkqRjk7XgRCuk0hZpP0Foied5jiio6p
 lUL8WLO3tjORx+gxe8a2GWg7zvH7XxzPen3UMPZosHHxt8NWXdoaHgue50wc4Md8yR7n
 sd4aBpJSI0MlYKg4fO3JsOaLKAUa4HrPsgnOG8j3fK5f9B5OSvlbxEDJADpnjixGs5AG
 WYVnDpiDclv1le9N8tF0O5NVGVQ2oCu7HJQyePVeAiF0uErLJ+kFAONZuqxMckoHiPTK
 tcQUI0zCTPsE3F4pyQn9hWWnpeXiWBZlMzMLeCXB1j0MtaUG+DF+VtBZk736doiYdPU0
 PXug==
X-Gm-Message-State: APjAAAVzDwWqF07owQA2kEoEJigu0n3xYrjylh3Km0DILfdDRzxKVi9R
 7iNiKyc+/LZ2/JxuQbn7olXbDDMaTotEoqCVbcn9pxWWQ/ap5Ewf2H4S1vDtIkiSCajaikWyRDS
 oIzPqYMDqdgt1qkU=
X-Received: by 2002:a7b:c317:: with SMTP id k23mr40015786wmj.75.1578391309782; 
 Tue, 07 Jan 2020 02:01:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqx+p131/0FyC/G5LqIJKDdq6YqPdQNFpIQJHqBMrJFAVpBxObFiGwNazYvpW5P+tCYsZrtEog==
X-Received: by 2002:a7b:c317:: with SMTP id k23mr40015763wmj.75.1578391309583; 
 Tue, 07 Jan 2020 02:01:49 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c6d:4079:b74c:e329?
 ([2001:b07:6468:f312:c6d:4079:b74c:e329])
 by smtp.gmail.com with ESMTPSA id v14sm74819004wrm.28.2020.01.07.02.01.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 02:01:49 -0800 (PST)
Subject: Re: [PATCH 04/14] hw/i386: Restrict fw_cfg to the PC machines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191231183216.6781-1-philmd@redhat.com>
 <20191231183216.6781-5-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a5ba0619-e236-7fb0-8c17-028670b69501@redhat.com>
Date: Tue, 7 Jan 2020 11:01:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191231183216.6781-5-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: Onf_4rSVNJmuDJ-9TwbuRw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/12/19 19:32, Philippe Mathieu-Daud=C3=A9 wrote:
> Only the PC-based machines use the fw_cfg device. In particular,
> the MicroVM machine does not use it. Only compile/link it when
> machines require it.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Cc: Sergio Lopez <slp@redhat.com>
> ---
>  hw/i386/Makefile.objs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/i386/Makefile.objs b/hw/i386/Makefile.objs
> index 6ebb6d0cf0..48f2693546 100644
> --- a/hw/i386/Makefile.objs
> +++ b/hw/i386/Makefile.objs
> @@ -5,7 +5,7 @@ obj-$(CONFIG_PC) +=3D pc.o pc_sysfw.o
>  obj-$(CONFIG_I440FX) +=3D pc_piix.o
>  obj-$(CONFIG_Q35) +=3D pc_q35.o
>  obj-$(CONFIG_MICROVM) +=3D microvm.o
> -obj-y +=3D fw_cfg.o
> +obj-$(CONFIG_PC) +=3D fw_cfg.o
>  obj-$(CONFIG_X86_IOMMU) +=3D x86-iommu.o
>  obj-$(CONFIG_VTD) +=3D intel_iommu.o
>  obj-$(CONFIG_AMD_IOMMU) +=3D amd_iommu.o
>=20

Ah no, this is hw/i386/fw_cfg.c; of course hw/nvram/fw_cfg.c has its own
Kconfig symbol.  Can you rename the file to pc-fwcfg.c and adjust the
commit message?

Paolo


