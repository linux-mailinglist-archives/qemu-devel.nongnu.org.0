Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ED547EEB6
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 13:05:02 +0100 (CET)
Received: from localhost ([::1]:54984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0jJl-0002Nb-Cj
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 07:05:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n0jGd-0007zE-NG
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 07:01:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n0jGb-0004PT-Md
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 07:01:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640347305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=38vDKLwEi4tYEVwCh1vbimpYcBVd9Lbh7gnh/dzyiCk=;
 b=cdJg1SAn8j09hn9jtnl4rHKy/GXX6ttt/ImwhbFGRpw9NNfmApncd5xH3f1uq0gwwcYb1c
 KlS62VRnuo0Hf4iTELhF/cPFKx3BhGHKECB48tqH3TexpIb8CJCHO/gNjHfA9383FH9iba
 Ht94KxeVMOtc/6l2O29wXNdylswNv4c=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-nIcomgTvO0ybvZtZbFYaUA-1; Fri, 24 Dec 2021 07:01:42 -0500
X-MC-Unique: nIcomgTvO0ybvZtZbFYaUA-1
Received: by mail-ed1-f72.google.com with SMTP id
 z8-20020a056402274800b003f8580bfb99so6683259edd.11
 for <qemu-devel@nongnu.org>; Fri, 24 Dec 2021 04:01:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=38vDKLwEi4tYEVwCh1vbimpYcBVd9Lbh7gnh/dzyiCk=;
 b=2PZavkLyBwhVxu8YuhbUUAxDcCHPG9cja8kQAwNy/8bZ1IJrRoy0C8BNua7MG2QKUB
 xaIa/hC3aQAV5TbX0xeGV0vRvuSL/2FS0n3dlWAAQCKxYKBaqa/MNooOz345xKmwv/sp
 i78HYwzTNBPBYYzF3TQ01q8mK0r08OPFy5b/WEtbpQUmudxpwiINtv9VqkCET8Utxbtq
 Q+GRVKfClYqIGsYcVCxV1TPZXQ/Jrv8M8F+OpDmnT304eNjPYcy6OQxe8T12DNRJSI9A
 MtK5Skyy8UOSy1kl/I+5VR6vnDf4LC4tgCX5W5IKobE+vg74vNNMI9k2nRkQFTXCDYhp
 eA+A==
X-Gm-Message-State: AOAM532IaBLTFcz4gAz1ZXX5L8T+othGytOo2fTmbwm6r2SZDpHiMvXU
 JJ2VNZ4zwhtgMBcyW0clxiSa2+xV7vzRxwVjgwiEb3O+zNwoYtdHLBSegRWcL9oy0fhmchXoNel
 SkcvgrQF8czoYUPU=
X-Received: by 2002:a05:6402:908:: with SMTP id
 g8mr5721231edz.59.1640347300913; 
 Fri, 24 Dec 2021 04:01:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxd/yC0HGqF0IaCRfptbiLLt9gCxJqfblKyK9xGHJE2eZtipHkuXMO0nDQEiLx0crmBShgL+A==
X-Received: by 2002:a05:6402:908:: with SMTP id
 g8mr5721201edz.59.1640347300728; 
 Fri, 24 Dec 2021 04:01:40 -0800 (PST)
Received: from gator.home (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id g2sm2669392ejt.43.2021.12.24.04.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 04:01:40 -0800 (PST)
Date: Fri, 24 Dec 2021 13:01:37 +0100
From: Andrew Jones <drjones@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v2] hw: Add compat machines for 7.0
Message-ID: <20211224120137.wydq4uodvziqefvz@gator.home>
References: <20211217143948.289995-1-cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211217143948.289995-1-cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 17, 2021 at 03:39:48PM +0100, Cornelia Huck wrote:
> Add 7.0 machine types for arm/i440fx/q35/s390x/spapr.
> 
> Acked-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> v1->v2: fix typo in i386 function chaining (thanks danpb!)
> 
> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  9 files changed, 71 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 6bce595aba20..4593fea1ce8a 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2856,10 +2856,17 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
>  
> +static void virt_machine_7_0_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(7, 0)
> +
>  static void virt_machine_6_2_options(MachineClass *mc)
>  {
> +    virt_machine_7_0_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(6, 2)
> +DEFINE_VIRT_MACHINE(6, 2)
>  
>  static void virt_machine_6_1_options(MachineClass *mc)
>  {

For the arm parts

Reviewed-by: Andrew Jones <drjones@redhat.com>


