Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF194855B5
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 16:20:55 +0100 (CET)
Received: from localhost ([::1]:57290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n585u-0003Ov-Qp
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 10:20:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n583J-0000OL-Ci
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 10:18:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n583E-0007Iq-7O
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 10:18:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641395885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MO2XhhyfkTO8LwKVL5/tkDR+2YGHNiFePYmqj1FZPk4=;
 b=XwHoTusGyUVU5XGN9EDfPLIzqqYXt4PaGX8i43A+x6mP4if4q2oi7Rz8bai8/PPPy8gz3/
 gIwWlzVAzRYBNPVXdmGOY3BtIGJKHNa8SY+Q/P5J7LsOZseF9EINL+YyEsZQBctl7K7ll9
 gwLgyu+Nww2PtyjPYRs9DL+SJmYPLUQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-asBWOlhqNTOoReLs7tDdog-1; Wed, 05 Jan 2022 10:18:04 -0500
X-MC-Unique: asBWOlhqNTOoReLs7tDdog-1
Received: by mail-wr1-f70.google.com with SMTP id
 v1-20020adfc5c1000000b001a37fd2fa2dso3681374wrg.22
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 07:18:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MO2XhhyfkTO8LwKVL5/tkDR+2YGHNiFePYmqj1FZPk4=;
 b=IDkw7+AAuahKTg61nLDQzQXfzxmJ8MdFt0KCJzZjuqJ+vCVQHiTTi+hWBAzFCxBj7T
 kRziyz/n/cx+3f9nFZ3yJ2+O69plnTiLgtMh0yOWSuy+YvdmNtu7XjedDqgjuCs/hDar
 LSY6OiswXXlSRy0lI2hdnVpewToRmbN0D4U6+TXwGm69MMlUg21xb/n5KPP2YDEFpFId
 UVFsoUYSm0XTOh9PvhAJhBe6MFmFRoffeJ4oIGbA9UTbvup04q+5vAz4HdhS2+22kMXD
 nL1iWjmJ0KzMiHlm+aroymiWf6R1Qmp4WK9caI+eEgg6qMojyzAdGSaSY/ADXBGiXRbD
 RaYg==
X-Gm-Message-State: AOAM532++kp7sqrG1KdR+4VH+JxhSgvg9L8hvyf1xI/gkZ8AamFJ6JkH
 7t6UEc0BjwCRVNXhss+YuNx1NweY/TiqBQgzZdZCV8armpl4ynySv0U02yaFx1wUSBoj8OYxJqo
 8BlidS76vVgUPRpI=
X-Received: by 2002:adf:fa87:: with SMTP id h7mr45492900wrr.561.1641395883048; 
 Wed, 05 Jan 2022 07:18:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxS6ISfSouv5ehhqoomJc7qzeCONm8BASyhWvb4VjBzeTZY5w4mkdZsgBpdb1RbJG3+P+2UhQ==
X-Received: by 2002:adf:fa87:: with SMTP id h7mr45492886wrr.561.1641395882753; 
 Wed, 05 Jan 2022 07:18:02 -0800 (PST)
Received: from redhat.com ([2.55.4.139])
 by smtp.gmail.com with ESMTPSA id l26sm2757647wme.36.2022.01.05.07.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 07:18:02 -0800 (PST)
Date: Wed, 5 Jan 2022 10:17:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] trace-events,pci: unify trace events format
Message-ID: <20220105101752-mutt-send-email-mst@kernel.org>
References: <20211105192541.655831-1-lvivier@redhat.com>
 <20211107033751-mutt-send-email-mst@kernel.org>
 <e5011077-3285-cb70-9948-27f84b407dba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e5011077-3285-cb70-9948-27f84b407dba@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 11:57:58AM +0100, Laurent Vivier wrote:
> On 07/11/2021 09:38, Michael S. Tsirkin wrote:
> > On Fri, Nov 05, 2021 at 08:25:41PM +0100, Laurent Vivier wrote:
> > > Unify format used by trace_pci_update_mappings_del(),
> > > trace_pci_update_mappings_add(), trace_pci_cfg_write() and
> > > trace_pci_cfg_read() to print the device name and bus number,
> > > slot number and function number.
> > > 
> > > For instance:
> > > 
> > >    pci_cfg_read virtio-net-pci 00:0 @0x20 -> 0xffffc00c
> > >    pci_cfg_write virtio-net-pci 00:0 @0x20 <- 0xfea0000c
> > >    pci_update_mappings_del d=0x555810b92330 01:00.0 4,0xffffc000+0x4000
> > >    pci_update_mappings_add d=0x555810b92330 01:00.0 4,0xfea00000+0x4000
> > > 
> > > becomes
> > > 
> > >    pci_cfg_read virtio-net-pci 01:00.0 @0x20 -> 0xffffc00c
> > >    pci_cfg_write virtio-net-pci 01:00.0 @0x20 <- 0xfea0000c
> > >    pci_update_mappings_del virtio-net-pci 01:00.0 4,0xffffc000+0x4000
> > >    pci_update_mappings_add virtio-net-pci 01:00.0 4,0xfea00000+0x4000
> > > 
> > > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> > 
> > Looks good to me. We are in freeze, will queue. Pls ping after
> > the release to make sure it's not lost.
> 
> Ping ?
> 
> Thanks,
> 
> Laurent

tagged now, thanks!


