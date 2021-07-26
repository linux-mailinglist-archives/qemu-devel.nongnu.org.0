Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680653D5AAB
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 15:46:03 +0200 (CEST)
Received: from localhost ([::1]:40612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m80vh-0006lV-SX
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 09:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m80u9-0005J5-HT
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 09:44:27 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:39472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m80u6-0005gM-9C
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 09:44:25 -0400
Received: by mail-pl1-x62c.google.com with SMTP id e5so9688909pld.6
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 06:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Fv18/onioAibVOnut0cdstMv+OJ+1flSy5pCIzx9Zfs=;
 b=WJkZrbb6A6ztpDlXRvTAu/AomHtK1LjHBI7y34qDv9JIqmJLrAocVjRtbu+FgZNu3N
 HZwvRNp67/cNqFbTXJjq454Mioewt3YRuibKTsfALhkh1IwgofKTwckYf4VU9kYJXjDa
 dKoC+1zlk4RRNkBmRfGV3a3Db5e4eDDJZfnuznTENZLhU+tP12oD1PCkmiaSbJHqLp57
 Ubn+/hK5koNh+wKDVaqvA/mRu396pmxhlQeo07FZ/132wguRCWPYkphoDweitELUYYA7
 N9q8zHl3mDHdGO3YQQqgu3lN926ocbD3l7kQG6PfTTrZPpRPOmK8VpEsIOnkuC6BViZx
 0RHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Fv18/onioAibVOnut0cdstMv+OJ+1flSy5pCIzx9Zfs=;
 b=l5QBUTxSojhx9yWLlFUCo9YibsK/9XFtMAQG8r+gh7Phb+K0naC0Yed2RDRFQjIkCn
 KYbqi+SK6mLgUbC/+yl3+BOrnEF1juaqesR8YteHUU4JZVq9Kpfi0waxtkreuAtT5uyL
 ebAYvpEWHOouI/xpvDtLIbNhDCb7+4Z4z4yH63zmtBt5VovzvZd3cpDjGx5sAB0ipgvY
 QH+qHYHTfmWzIxKuaDclOTwXShgwrMIzamSlY7TDK2rt8ili/KhkFIFWm/xS148/mnt8
 KyDiCLeBsCNbGunp6+jww2I52NLB/2bn/XdYH175LO1AsT3eUZlcY/klAaMf/mvOAc0X
 YC6Q==
X-Gm-Message-State: AOAM531plcURGiii6PsABXRaCY3W2kmiCehkQhZj+e6jo0Cjph0CfPbH
 LE95KMAXCielHD+DJzmUKZqvAA==
X-Google-Smtp-Source: ABdhPJwpcCaFf6VznTVIsyBSxo+CHNOo6JPxg55J23Re41gcDrb4SI3N+22JXMDt5Tofga749WAMMw==
X-Received: by 2002:a17:90a:4295:: with SMTP id
 p21mr16786895pjg.149.1627307060802; 
 Mon, 26 Jul 2021 06:44:20 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.238.202])
 by smtp.googlemail.com with ESMTPSA id a23sm85256pfa.16.2021.07.26.06.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 06:44:20 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Mon, 26 Jul 2021 19:14:05 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] hw/acpi: some cosmetic improvements to existing code
In-Reply-To: <20210726135949.6e55593b@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2107261912520.39003@anisinha-lenovo>
References: <20210721141610.139310-1-ani@anisinha.ca>
 <20210726135949.6e55593b@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, jusual@redhat.com, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, 26 Jul 2021, Igor Mammedov wrote:

> On Wed, 21 Jul 2021 19:46:10 +0530
> Ani Sinha <ani@anisinha.ca> wrote:
>
> > All existing code using acpi_get_i386_pci_host() checks for a non-null
> > return from this function call. This change brings the same check to
> > acpi_pcihp_disable_root_bus() function. Also adds a comment describing
> > why we unconditionally pass a truth value to the last argument when calling
> > acpi_pcihp_reset() from ich9 platform.
> >
> > Fixes: c0e427d6eb5fef ("hw/acpi/ich9: Enable ACPI PCI hot-plug")
> >
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  hw/acpi/ich9.c  | 1 +
> >  hw/acpi/pcihp.c | 5 +++++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> > index 778e27b659..58d8430eb9 100644
> > --- a/hw/acpi/ich9.c
> > +++ b/hw/acpi/ich9.c
> > @@ -281,6 +281,7 @@ static void pm_reset(void *opaque)
> >      pm->smi_en_wmask = ~0;
> >
> >      if (pm->use_acpi_hotplug_bridge) {
> > +        /* on root PCIE bus, we always use native or SHPC based hotplug */
> I had an impression that root bus doesn't support hotplug at all,
> and to have hotplug there one should attach a root-port to root bus at
> start up time.

Yes this is correct.
https://github.com/qemu/qemu/blob/master/docs/pcie.txt
https://libvirt.org/pci-hotplug.html

I will update the comment accordingly.


