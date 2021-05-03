Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4D43720AB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 21:43:27 +0200 (CEST)
Received: from localhost ([::1]:48658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldeTW-0004W8-4j
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 15:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ldeSZ-0003XK-Hr
 for qemu-devel@nongnu.org; Mon, 03 May 2021 15:42:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ldeSX-0003yF-6n
 for qemu-devel@nongnu.org; Mon, 03 May 2021 15:42:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620070943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zHmQDWImzpys+Lyu8KjEvbBgQpl6C/70CrWhc1V0a8o=;
 b=cSFqA35/oT5XwqxUMNzxAnim9dH/0aREnbeP2uJYOl41j+XJifFMyw0F4SYRYfJ9rdrqJy
 Ym5+TU/P1o5xLFL0s5l+A9mYadmzNZH6gv9RXlFca6ymgmgdPcdw0SUjl7nJXHXrmuTKNj
 MR6CJzSbkl7uPuXmpHmt65ZxLN1qoZY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-xW6OsqJ8P02vEV4Ntvwjog-1; Mon, 03 May 2021 15:42:21 -0400
X-MC-Unique: xW6OsqJ8P02vEV4Ntvwjog-1
Received: by mail-wm1-f71.google.com with SMTP id
 g199-20020a1c9dd00000b02901355dd71edaso2668419wme.7
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 12:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zHmQDWImzpys+Lyu8KjEvbBgQpl6C/70CrWhc1V0a8o=;
 b=UlezTNrDeiCZiHwldI2bch/4Z9IU4S3HlIyCn1JPc5doj6deKf5gMkRgmSd28p1NIU
 KrHPoR071cC3Ygtw2DjbNFm5yPWyZtemOFJ+QJ6KFjRO3VbLwexyaUPz+LcDJRfD8W2F
 vxvW8ANf9T+Mstq9iOFoxd2crHNhZQSkDAz8lSHfs0ZV3cPpjtgT9dDykPU8HDl2IbHu
 EZwLd+B/+lOzmDqopI7fJkFqNLCdJ6XFi2Mmaq7WBlXUW1GT+7Y1nuyIBb026U6MXgQ5
 3/oqRFh9Uz3wjz8AWMxh0k+dCmR6nkhyebh/XI8AyY1FNj92hBCGHBj8tlZ0ti9Fo//Q
 GIFg==
X-Gm-Message-State: AOAM5305hdy8FpiHtcF30q+RKQnF00zVwDeNzTib/Z4Q2HlNQiTI9aEE
 kTQh7UWJPHKkiO6dJBgzPVyDAr+jTykrEKEiTCxqTsMNA1Qemak2AAxuYkK1PiTkut7q3XRex/+
 VgFWdIHA6vCh5Jyw=
X-Received: by 2002:a05:600c:220e:: with SMTP id
 z14mr23668210wml.0.1620070940188; 
 Mon, 03 May 2021 12:42:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzX89KMLy+PyWH6pYUAc8UA/yYEf3WFVHbgEfer+HthO0ye6EFBsjv97VBp/Jo+uM2wq/CjFQ==
X-Received: by 2002:a05:600c:220e:: with SMTP id
 z14mr23668200wml.0.1620070940033; 
 Mon, 03 May 2021 12:42:20 -0700 (PDT)
Received: from redhat.com (bzq-79-178-133-9.red.bezeqint.net. [79.178.133.9])
 by smtp.gmail.com with ESMTPSA id
 b8sm13581764wrx.15.2021.05.03.12.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 12:42:19 -0700 (PDT)
Date: Mon, 3 May 2021 15:42:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vincent Bernat <vincent@bernat.ch>
Subject: Re: [PATCH v4] hw/smbios: support for type 41 (onboard devices
 extended information)
Message-ID: <20210503154024-mutt-send-email-mst@kernel.org>
References: <20210401171138.62970-1-vincent@bernat.ch>
 <20210503170539.5e813f89@redhat.com> <m3sg338vcd.fsf@bernat.ch>
MIME-Version: 1.0
In-Reply-To: <m3sg338vcd.fsf@bernat.ch>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 03, 2021 at 09:34:42PM +0200, Vincent Bernat wrote:
>  ❦  3 mai 2021 17:05 +02, Igor Mammedov:
> 
> >> +            /*
> >> +             * We only handle the case were the device is attached to
> >> +             * the PCI root bus. The general case is more complex as
> >> +             * bridges are enumerated later and the table would need
> >> +             * to be updated at this moment.
> >> +             */
> >> +            if (!pci_bus_is_root(pci_get_bus(pdev))) {
> >> +                error_setg(errp,
> >> +                           "Cannot create type 41 entry for PCI device %s: "
> >> +                           "not attached to the root bus",
> >> +                           t41->pcidev);
> >> +                return;
> >> +            }
> > Is this limitation really necessary?
> >
> > As far as I see caller of this smbios_get_tables(), is called at machine_done time
> > when all devices (including bridges) present on CLI are created.
> 
> I wasn't sure how to get the segment group number in this case. It seems
> this is not exposed directly. There is a root_bus_path method returning
> a string that would need to be parsed to extract the segment group
> number. Looking a bit, it seems to be always 0.
> -- 
> Don't stop with your first draft.
>             - The Elements of Programming Style (Kernighan & Plauger)

and not just that. the code comments explains the motivation even
with a single segment.

-- 
MST


