Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6219B2CD45C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:13:21 +0100 (CET)
Received: from localhost ([::1]:46464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmY4-0001E1-FW
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:13:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkmKI-0001G1-6R
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:59:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkmKE-0003US-4E
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:59:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606993140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EysyiiScW/Fxyfgpmth1iDPP71CE0n32Ce1lMZGSun0=;
 b=QUYAl767+xTV/8ulPyJYWBbcLwwPT38TAKQzLOCTEf8/VUcQs5FgDV8LbuZ8QcSukwSxRq
 KHFmM1f47+xKHErZZXdaanmcTSV3HmR3YFx6plAKlTB6p62QFl3QyO+A9AFhBwc3xUdzgi
 u43+VJaife0xwekb5dNRYRZEVq4VnSw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-MOFfwJzUO9iXl4wkqRHTOQ-1; Thu, 03 Dec 2020 05:58:57 -0500
X-MC-Unique: MOFfwJzUO9iXl4wkqRHTOQ-1
Received: by mail-wm1-f69.google.com with SMTP id r5so1379763wma.2
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 02:58:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EysyiiScW/Fxyfgpmth1iDPP71CE0n32Ce1lMZGSun0=;
 b=WSNf2tJxKNHP/Ro1eRJVZhxojcpROOYDT8aj6Nm2WO8kpbdZv2PdO8FYCGFtIxrnr6
 8knsBNrsrOZ2tWHEguWyuwk3/zDeoF129XiCTjaEZohZACt1q05qFV/lS7XBY/oDbU7Z
 +wWDaWSk3EhFOACPSQSSA+OSg1DfeRSkgue6x5/NYVJBo16sNK0mXzKhHX7atc9+3JdN
 oxCVODtOFgICKr/CLZKWHetBGd10c5Foqy+GoK5kMongYFF1cwo4+M4H0egSaSO8pFi+
 /S4qGsJYrwdzCZGPDoDTppVfDO2Jmo+ic5codBeanCDEZuWD2MzgoLakdirlJ45f816/
 GVzQ==
X-Gm-Message-State: AOAM533rfZHbs3e6uCgc6fZuKhzBJEk2iiaw/ZCAZY4QJWN13qwKHNrY
 CtbkUfk6fLJIxXnPYUfcLolaWXXCa7MfO7sWAfTAYzriIn6MCCEzVcaPFnRPOROFBZztgsMWg/E
 /g0Thu+e8n2DSJCA=
X-Received: by 2002:a5d:66c3:: with SMTP id k3mr3029480wrw.123.1606993136540; 
 Thu, 03 Dec 2020 02:58:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkx3aRdbUPAh/0MYvIhiYv4BsrVDaeTjLYJlMxXu8hBm3YUtw/IhF+L4ba/u1KOs5zTqNzxg==
X-Received: by 2002:a5d:66c3:: with SMTP id k3mr3029465wrw.123.1606993136367; 
 Thu, 03 Dec 2020 02:58:56 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id b200sm1055526wmb.10.2020.12.03.02.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 02:58:55 -0800 (PST)
Date: Thu, 3 Dec 2020 05:58:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/6] pc,vhost: fixes
Message-ID: <20201203054505-mutt-send-email-mst@kernel.org>
References: <20201202101655.122214-1-mst@redhat.com>
 <CAFEAcA8N1Qh0gUX8oTTPOEuq_+DRzJ+9V1RqKzVhXN+4aoBZGw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8N1Qh0gUX8oTTPOEuq_+DRzJ+9V1RqKzVhXN+4aoBZGw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 10:20:03AM +0000, Peter Maydell wrote:
> On Wed, 2 Dec 2020 at 11:03, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > Patch 5 gave me pause but we do need patch 6 as
> > it's a guest triggerable assert, and it seemed
> > cleaner to just take the whole patchset than cherry-pick.
> 
> Is this only "fixes a guest triggerable assert"?

My understanding is that without the patches a rhel7 guest triggers
the assert if started with vtd enabled and virtio-net with
iommu_platform=on.

https://bugs.launchpad.net/qemu/+bug/1885175


> If so, that's
> not sufficiently important to require an rc5 at this point.
> 
> thanks
> -- PMM

For sure most people don't use vtd ...

-- 
MST


