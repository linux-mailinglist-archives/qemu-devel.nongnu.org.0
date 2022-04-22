Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB62550B39D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 11:09:22 +0200 (CEST)
Received: from localhost ([::1]:40132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhpI2-00073D-0a
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 05:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nhp6v-0007QA-01
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:57:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nhp6t-0000nU-CF
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:57:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650617869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eUV6zI0z4zEsB11g+emL2TQRL3OqYbXvx8EeAvXJurM=;
 b=cIofhHLQHOMOXYqks9MWCpapfeBqhG96go00kgBRbxgudlGz9hMPspTgA06Nev/R6z6i6r
 FpE2NrZwujK9K0QHjh7Gz9ed20Ss6eMkj5L0z4jHCFYgse2F7H/WCiqUeGF/G4TghP23Ru
 EKye5jP/GzUY0vmyhkAQe4vOFBEvlo4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-ZQIVZ0ZyOA2Q-idyMb4XyA-1; Fri, 22 Apr 2022 04:57:48 -0400
X-MC-Unique: ZQIVZ0ZyOA2Q-idyMb4XyA-1
Received: by mail-wm1-f72.google.com with SMTP id
 c62-20020a1c3541000000b0038ec265155fso5771991wma.6
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 01:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eUV6zI0z4zEsB11g+emL2TQRL3OqYbXvx8EeAvXJurM=;
 b=JRQExv5rXu1sYhxxYlrDGZLf+dv4kQdPHL5eN3dR2n8cBXYVCYPQkRKN/qrI4C/4TA
 +t95HeWXlEHQhM3/XN3+JX+wWVKLMaFpdgr/4T8abD6KdUiPiflsU92h40c5DP/Viij3
 Oo++4Aa7K2qs/QSwAyCSusCKT6C1WTS9FEw0lILBcZ9rr2L3rxWv0aP9xb6YTwXaC4gT
 YxokdC1YHG7oCUntaU/1JprZu89am0XG3i54Vt6FMbtgjzasR9xgLWhtmP7Apmqcns2O
 FSPCrSnUXd/BuYrS3P69yGR6mdbMswMsoWw0mXCmnEcsObfCZw5WRiw8dxBxTUfjpTS4
 vItQ==
X-Gm-Message-State: AOAM5334e9OoKBC9sF6pe3vFkM5ZC2WG0Z4ALBhW76Zzf6KkT7Gc6L9h
 XS4UCeeFo69ewWPI7bQcefgQuwLKUUKGEoBZycKTpRoiAB+1+OzO5oM5KYabcvRp+8Ug5Uzocvx
 LRR3GQGHJ9YD3w8M=
X-Received: by 2002:a05:600c:4ec6:b0:392:8b89:fce9 with SMTP id
 g6-20020a05600c4ec600b003928b89fce9mr3158027wmq.25.1650617867283; 
 Fri, 22 Apr 2022 01:57:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYqcvKkQ05TlPyTFA0Vo6L5PQkrBapZyQemdOMzn/wiVQEWfVDXblFvSjAXE7cx9PRCROM6w==
X-Received: by 2002:a05:600c:4ec6:b0:392:8b89:fce9 with SMTP id
 g6-20020a05600c4ec600b003928b89fce9mr3158012wmq.25.1650617867039; 
 Fri, 22 Apr 2022 01:57:47 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a1ca301000000b003929c4bf250sm4137513wme.13.2022.04.22.01.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 01:57:46 -0700 (PDT)
Date: Fri, 22 Apr 2022 10:57:45 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: Is it possible to support hotplug device to PXB bridge?
Message-ID: <20220422105745.7a20256e@redhat.com>
In-Reply-To: <YmJnYCMxG1S9pt4U@redhat.com>
References: <CAKM4Aewqpfy3AGFi3Y+roA4jDigYOEbW6oBb3XpsVyxFCYne7g@mail.gmail.com>
 <YmJnYCMxG1S9pt4U@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marcel@redhat.com, qemu-devel@nongnu.org, Eric Ren <renzhengeek@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Apr 2022 09:29:20 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Fri, Apr 22, 2022 at 03:17:11PM +0800, Eric Ren wrote:
> > Hi Marcel and all,
> >=20
> > It fails when I want to hotplug device to PXB bus. Then, I find this
> > commit that explicitely declares the fact that PXB bus does not support
> > hotplug device onto it.
> >=20
> > 7b346c742cd9 ("hw/pxb: declare pxb devices as not hot-pluggable")
> >=20
> > Could you please help confirm the possibility to make PXB bus hotplugga=
ble,
> > and the main work to achieve it if possible? =20
>=20
> Instead of trying to hotplug into the PXB, attach a 'pci-bridge' to the
> PXB and then you can hotplug into the latter instead.

there is no ACPI based hotplug for devices on pxb if I'm not mistaken, so
you'll likely need to enable shpc on pci-bridge.
=20
> > Yes, pxb-pcie with Q35 do support hotplug, but we use i440 machine a lo=
ng way,
> > not  willing to change machine type to have it. =20
>=20
> With regards,
> Daniel


