Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF5C660A52
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 00:37:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDwG4-0007xb-4j; Fri, 06 Jan 2023 18:36:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pDwG1-0007wi-ED
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:36:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pDwFz-00062l-MT
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:36:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673048174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J3Xb2Ke+Kp2uHOSLqQTMlgym1anyMQw7OAu2efaTu+U=;
 b=JsmiUSBGqv9yNweH/QMEUqev7Ga5oW1u618/jxXxkXk8vNAXUfIdDzavc/ex28jlR+WIs8
 Ni5wHg4OMygz0eLTlfkoPH/nSRL8M4dBWJ/s19TiX6WP1tvg16jwcXg1T24MWMKmSxY1tS
 Dr7V2hOse29Vqo1eWjCnyCeLccZo4fs=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-225-4JsJkoRPMvyCbmkbb8sXeg-1; Fri, 06 Jan 2023 18:36:13 -0500
X-MC-Unique: 4JsJkoRPMvyCbmkbb8sXeg-1
Received: by mail-il1-f199.google.com with SMTP id
 y5-20020a056e021be500b0030bc4f23f0aso1977843ilv.3
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 15:36:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J3Xb2Ke+Kp2uHOSLqQTMlgym1anyMQw7OAu2efaTu+U=;
 b=Ui41gopa5O+cozxhJ1AfxDqvNMT88WwSGo9+y4l4CX5mcsv6kub3p/09tCR9NTbF7m
 QDlOzePKB3NLNBfR3SrjmkwVjRW1efRMhhZQ70dXy4RfAJlC2/W82lFDGv2jFOYE0AgJ
 GTWf0e06T/YwbaJy+Yu+c7IjN5GCYsvQLaFEXlciN9tqKhFm0vb2fY4JlGx84DqX0+2z
 TvQldWzPTdrlS+8pDPqiqjgzLXPbO521I9vRglJAKkeHvLhU6oDKpTfsDzmFYrovbO4m
 lLikTIl9QrU0+ayL/vgE2KKV8qacRm0+qbXydw8swsvhExb3TeU2rf7bW1e8jhkUt5k/
 Rq9g==
X-Gm-Message-State: AFqh2koPcdJAAGxSIXFi9cPrz6mxAytuREqZ+Gieh/P+90M2geL9DwbV
 9q9OO5+1SkLJdka6iJ2oWE7j+4JLgDx+LZaQxupunbCr4rSLKN7zRdv+J2k4LVxtJnPwHQIycVK
 ptkZZN2jGQP5J8UY=
X-Received: by 2002:a92:cc92:0:b0:2ff:f702:e446 with SMTP id
 x18-20020a92cc92000000b002fff702e446mr34392103ilo.13.1673048172361; 
 Fri, 06 Jan 2023 15:36:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuMvwwr6ZuWPmwfpNoxb4pEkf70/pFzQXBvDA6T07DBzTnje2kBRi0xxEgo7FNQXFIKMoOodA==
X-Received: by 2002:a92:cc92:0:b0:2ff:f702:e446 with SMTP id
 x18-20020a92cc92000000b002fff702e446mr34392081ilo.13.1673048172074; 
 Fri, 06 Jan 2023 15:36:12 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 n14-20020a92d9ce000000b0030c5346962esm57181ilq.65.2023.01.06.15.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 15:36:11 -0800 (PST)
Date: Fri, 6 Jan 2023 16:36:09 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, "Ilya Leoshkevich"
 <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, "Juan Quintela"
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, John Snow
 <jsnow@redhat.com>, <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor
 Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun
 Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v5 00/14] vfio/migration: Implement VFIO migration
 protocol v2
Message-ID: <20230106163609.430628cd.alex.williamson@redhat.com>
In-Reply-To: <20221229110345.12480-1-avihaih@nvidia.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

On Thu, 29 Dec 2022 13:03:31 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> Hello,
> 
> Now that QEMU 8.0 development cycle has started and MIG_DATA_SIZE ioctl
> is in kernel v6.2-rc1, I am sending v5 of this series with linux headers
> update and with the preview patches in v4 merged into this series.
> 
> 
> 
> Following VFIO migration protocol v2 acceptance in kernel, this series
> implements VFIO migration according to the new v2 protocol and replaces
> the now deprecated v1 implementation.
> 
> The main differences between v1 and v2 migration protocols are:
> 1. VFIO device state is represented as a finite state machine instead of
>    a bitmap.
> 
> 2. The migration interface with kernel is done using VFIO_DEVICE_FEATURE
>    ioctl and normal read() and write() instead of the migration region
>    used in v1.
> 
> 3. Pre-copy is made optional in v2 protocol. Support for pre-copy will
>    be added later on.
> 
> Full description of the v2 protocol and the differences from v1 can be
> found here [1].
> 
> 
> 
> Patch list:
> 
> Patch 1 updates linux headers so we will have the MIG_DATA_SIZE ioctl.
> 
> Patches 2-3 are patches taken from Juan's RFC [2].
> As discussed in the KVM call, since we have a new ioctl to get device
> data size while it's RUNNING, we don't need the stop and resume VM
> functionality from the RFC.
> 
> Patches 4-9 are prep patches fixing bugs, adding QEMUFile function
> that will be used later and refactoring v1 protocol code to make it
> easier to add v2 protocol.
> 
> Patches 10-14 implement v2 protocol and remove v1 protocol.

Missing from the series is the all important question of what happens
to "x-enable-migration" now.  We have two in-kernel drivers supporting
v2 migration, so while hardware and firmware may still be difficult to
bring together, it does seem possible for the upstream community to
test and maintain this.

To declare this supported and not to impose any additional requirements
on management tools, I think migration needs to be enabled by default
for devices that support it.  Is there any utility to keeping around
some sort of device option to force it ON/OFF?  My interpretation of ON
seems rather redundant to the -only-migratable option, ie. fail the
device if migration is not supported, and I can't think of any
production use cases for OFF.  So maybe we simply drop the option as an
implicit AUTO feature and we can consider an experimental or supported
explicit feature later for the more esoteric use cases as they develop?
Thanks,

Alex


