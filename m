Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0D56D963B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 13:48:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkO4w-00034O-UN; Thu, 06 Apr 2023 07:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pkO4v-000348-D4
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 07:46:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pkO4t-0005qm-0V
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 07:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680781612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7soZSDPU1U+JjCb3y7QsGZnSGB1QVMBxQnaBvKo6Lbw=;
 b=dnN29OdHMiMjtNIaSy4g26aLK/+1EFW18u20/ePHBcr8n6MR0fp/gD+w1EG4iCx3Yjq0Cg
 zbMP95EfgiHSsUP63HDJAZEWITeP9VC8C4Aiycj319JDTygTrm+NXO0yfw0D1PEgrBalRF
 DTsGgXGnQQBRu9K4mhhqXHMx+T9rDhM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-TZb7CeNXNxaGq2rCSLEhLQ-1; Thu, 06 Apr 2023 07:46:50 -0400
X-MC-Unique: TZb7CeNXNxaGq2rCSLEhLQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 fi8-20020a056402550800b004a26cc7f6cbso52495688edb.4
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 04:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680781609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7soZSDPU1U+JjCb3y7QsGZnSGB1QVMBxQnaBvKo6Lbw=;
 b=yl8PXg6SIAq8YNho7849wcpOhsrBhvLLNOHpRiBrNpABpyk9Kh8yUepUzSoL6JQ6FG
 BsLzrsG6TqmnhVjPUdZmfalvYPPTbqdZKCbGhcarlsu05sTAaSpaUYHU8qof7VyZQOhv
 0Xe4Ca1+Tt6fe6JtAXFl0Vk+SIsQeg8+lCpIZnjd5j1HbhajNJp4ggZ+f/fHuFFoKZ7m
 2QyCRCLa90ORzagwj+SkQZ84tZxb0eEk6fd7oXNd8ZvLOewGuMvROMzRyFKmp3+atGZv
 S/KTkZaPcz6ywd7KnyMuoS5KgIWuhKQSk5fTZMAhp3I/HAnLnMTCG/80FJgx7QMwOrJe
 wmSA==
X-Gm-Message-State: AAQBX9ctmqbel/U3rviHKMbXWKk9RtP84rPTNeGJzHVcLfVkBDYVlLWL
 /V751zP6efUbNnTxGzQYsMA0xsuyDRFCetnjJ/vSLnvD6WYJr+DwSIEHWHSocEYfFa72UywCSgz
 rfUxRo6VWMZTCeI0=
X-Received: by 2002:a17:907:8b0a:b0:949:ab5c:f10c with SMTP id
 sz10-20020a1709078b0a00b00949ab5cf10cmr2563315ejc.63.1680781609775; 
 Thu, 06 Apr 2023 04:46:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350YlOcQ+Y6PyEFyXmLwxrIPBbodbnRGsRdHqXUH4+GIYs8FsSyty5/iuB7g82nAFzlyrihcVbw==
X-Received: by 2002:a17:907:8b0a:b0:949:ab5c:f10c with SMTP id
 sz10-20020a1709078b0a00b00949ab5cf10cmr2563300ejc.63.1680781609523; 
 Thu, 06 Apr 2023 04:46:49 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 gn23-20020a1709070d1700b009476efd5244sm718730ejc.172.2023.04.06.04.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 04:46:48 -0700 (PDT)
Date: Thu, 6 Apr 2023 13:46:48 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 anisinha@redhat.com, jusual@redhat.com, pbonzini@redhat.com
Subject: Re: [PATCH] acpi: pcihp: make pending delete expire in 5sec
Message-ID: <20230406134648.477b7f64@imammedo.users.ipa.redhat.com>
In-Reply-To: <3akvszorhtqnaqkmwobfiivg5wdvkjrao36a2bworawbeii6ic@j2kelhsxvbwx>
References: <20230403161618.1344414-1-imammedo@redhat.com>
 <20230403131833-mutt-send-email-mst@kernel.org>
 <qdzi3oh24okot23eccd6d453wehyagbxhldoss4bup2whfohfo@hkzr2p3fq6na>
 <20230404103055.11f2de56@imammedo.users.ipa.redhat.com>
 <3akvszorhtqnaqkmwobfiivg5wdvkjrao36a2bworawbeii6ic@j2kelhsxvbwx>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 4 Apr 2023 12:46:45 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Tue, Apr 04, 2023 at 10:30:55AM +0200, Igor Mammedov wrote:
> > On Tue, 4 Apr 2023 09:03:59 +0200
> > Gerd Hoffmann <kraxel@redhat.com> wrote:
> >   
> > >   Hi,
> > >   
> > > > > Allowing pending delete expire brings ACPI PCI hotplug on par
> > > > > with native PCIe unplug behavior [1] which in its turn refers
> > > > > back to ACPI PCI hotplug ability to repeat unplug requests.    
> > >   
> > > > A bit concerned about how this interacts with failover,
> > > > and 5sec is a lot of time that I hoped we'd avoid with acpi.
> > > > Any better ideas of catching such misbehaving guests?    
> > > 
> > > The 5sec are coming from the pcie spec: The hot-unplug request can be
> > > canceled within 5 seconds by pressing the button again. The problem here
> > > is that both hotplug and hot-unplug use the same signaling path, so we
> > > really have to wait the 5 seconds to avoid the OS mis-interpreting the
> > > button press as 'cancel' event.  
> > 
> > Any pointer to spec?  
> 
> pcie base spec, section 6.7.1.5. Attention Button
> 
> > Does it apply to SHPC too?  
> 
> Yes (section 2.2.5. Attention Button).

shouldn't we set pending_deleted_expires_ms to 5sec for SHPC
as we do with PCIe?

> 
> take care,
>   Gerd
> 


