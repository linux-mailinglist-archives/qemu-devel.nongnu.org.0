Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9538930C3C9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:30:56 +0100 (CET)
Received: from localhost ([::1]:45382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xdl-0003uG-G7
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:30:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l6xMR-0008Oz-W0
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:13:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l6xMJ-0006ro-4p
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:12:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612278770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qB+vY2n1Jsacjv2d9REmyBdUtAmDy1Mx14TEPXAHQaA=;
 b=YqNd2J1H+IoPVIRVR2TEBiyBjL/xtr96NRnOGiA49D4JW+YPRi2QMn0TX3A6TXaX+k4rqd
 /AcnJpPSWjn0nCeYSroC8dUtECpnDQ8JmfjI+V/1xRqMH0noyMUaCoWhqUF/btZpZjtJeo
 IkBNEFMl1SXejGg08uTVnjU0+/m29+A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-irJykOiANDmYcRNDebivbQ-1; Tue, 02 Feb 2021 10:12:48 -0500
X-MC-Unique: irJykOiANDmYcRNDebivbQ-1
Received: by mail-wm1-f72.google.com with SMTP id j204so1588637wmj.4
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 07:12:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qB+vY2n1Jsacjv2d9REmyBdUtAmDy1Mx14TEPXAHQaA=;
 b=R2gUVl88Q5zopxM+MbZhK7YPdAHFLUftsEuHdJX15mblCa1vOSf7lgnwEweKmkfR+X
 XZGuY3GfoQdtFPYxuSgXTtWH4HCcAWv1oxf96yQf+6Esg1Bfey8nK4g1UsYOTee+3wEk
 D3Xmy7wRrs8WAGnXASyIIZQF/6mc/OMPxhSXJt5vBSPaSjf5ocztE1WKbPplTujypTeN
 S0JoNkD/pFyYF8cMpOCn38AfIqfbJjbhD1DitPL+H+DoQp1vTG7cTDR3pxFLc37cpuXk
 0CDuH7ML4etru3ti/lDqhjxKseXpEIeQccVR0Mg1GKmeJNAbP7xf3Mxgpc6Vuv14oVQz
 +8dQ==
X-Gm-Message-State: AOAM533tWNDFzNesSxK+B1J9IArpyvZak1oBVQ+nYz/6Ey99B40Xz4Ii
 wLq9JpExYa/gohLAXhXr3XJ4/y8ZsZyn5GkAThNO2jn45opo7XHMvX2Vi4w39xjcWMfuuB5/f4T
 CUbEg4zahdVMzvm0ZJ6F46+AdwmW17aEvNqY/Sp3cRsrVZJA/wbJgPhdubWVT
X-Received: by 2002:a1c:149:: with SMTP id 70mr4076091wmb.165.1612278765936;
 Tue, 02 Feb 2021 07:12:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRR1RK4aHxNCHrYVMLZMbemuZfawfFyK5NCcHtFWAb5THbOIbToZRbrVjDNnysIjI/qcRJcQ==
X-Received: by 2002:a1c:149:: with SMTP id 70mr4076053wmb.165.1612278765584;
 Tue, 02 Feb 2021 07:12:45 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id l18sm3486837wme.37.2021.02.02.07.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 07:12:44 -0800 (PST)
Date: Tue, 2 Feb 2021 10:12:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/9] tests/acpi: update expected data files
Message-ID: <20210202151116.1573669-8-mst@redhat.com>
References: <20210202151116.1573669-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210202151116.1573669-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marian Postevca <posteuca@mutex.one>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marian Postevca <posteuca@mutex.one>

Signed-off-by: Marian Postevca <posteuca@mutex.one>
Message-Id: <20210119003216.17637-5-posteuca@mutex.one>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/data/acpi/microvm/APIC         | Bin 70 -> 70 bytes
 tests/data/acpi/microvm/APIC.ioapic2 | Bin 82 -> 82 bytes
 tests/data/acpi/microvm/APIC.pcie    | Bin 110 -> 110 bytes
 tests/data/acpi/microvm/DSDT         | Bin 365 -> 365 bytes
 tests/data/acpi/microvm/DSDT.ioapic2 | Bin 365 -> 365 bytes
 tests/data/acpi/microvm/DSDT.pcie    | Bin 3031 -> 3031 bytes
 tests/data/acpi/microvm/DSDT.rtc     | Bin 404 -> 404 bytes
 tests/data/acpi/microvm/DSDT.usb     | Bin 414 -> 414 bytes
 tests/data/acpi/microvm/FACP         | Bin 268 -> 268 bytes
 tests/data/acpi/pc/APIC              | Bin 120 -> 120 bytes
 tests/data/acpi/pc/APIC.acpihmat     | Bin 128 -> 128 bytes
 tests/data/acpi/pc/APIC.cphp         | Bin 160 -> 160 bytes
 tests/data/acpi/pc/APIC.dimmpxm      | Bin 144 -> 144 bytes
 tests/data/acpi/pc/DSDT              | Bin 5065 -> 5065 bytes
 tests/data/acpi/pc/DSDT.acpihmat     | Bin 6390 -> 6390 bytes
 tests/data/acpi/pc/DSDT.bridge       | Bin 6924 -> 6924 bytes
 tests/data/acpi/pc/DSDT.cphp         | Bin 5529 -> 5529 bytes
 tests/data/acpi/pc/DSDT.dimmpxm      | Bin 6719 -> 6719 bytes
 tests/data/acpi/pc/DSDT.hpbridge     | Bin 5026 -> 5026 bytes
 tests/data/acpi/pc/DSDT.hpbrroot     | Bin 3084 -> 3084 bytes
 tests/data/acpi/pc/DSDT.ipmikcs      | Bin 5137 -> 5137 bytes
 tests/data/acpi/pc/DSDT.memhp        | Bin 6424 -> 6424 bytes
 tests/data/acpi/pc/DSDT.numamem      | Bin 5071 -> 5071 bytes
 tests/data/acpi/pc/DSDT.roothp       | Bin 5261 -> 5261 bytes
 tests/data/acpi/pc/FACP              | Bin 116 -> 116 bytes
 tests/data/acpi/pc/HMAT.acpihmat     | Bin 280 -> 280 bytes
 tests/data/acpi/pc/HPET              | Bin 56 -> 56 bytes
 tests/data/acpi/pc/NFIT.dimmpxm      | Bin 240 -> 240 bytes
 tests/data/acpi/pc/SLIT.cphp         | Bin 48 -> 48 bytes
 tests/data/acpi/pc/SLIT.memhp        | Bin 48 -> 48 bytes
 tests/data/acpi/pc/SRAT.acpihmat     | Bin 280 -> 280 bytes
 tests/data/acpi/pc/SRAT.cphp         | Bin 304 -> 304 bytes
 tests/data/acpi/pc/SRAT.dimmpxm      | Bin 392 -> 392 bytes
 tests/data/acpi/pc/SRAT.memhp        | Bin 264 -> 264 bytes
 tests/data/acpi/pc/SRAT.numamem      | Bin 224 -> 224 bytes
 tests/data/acpi/pc/SSDT.dimmpxm      | Bin 734 -> 734 bytes
 tests/data/acpi/pc/WAET              | Bin 40 -> 40 bytes
 tests/data/acpi/q35/APIC             | Bin 120 -> 120 bytes
 tests/data/acpi/q35/APIC.acpihmat    | Bin 128 -> 128 bytes
 tests/data/acpi/q35/APIC.cphp        | Bin 160 -> 160 bytes
 tests/data/acpi/q35/APIC.dimmpxm     | Bin 144 -> 144 bytes
 tests/data/acpi/q35/DSDT             | Bin 7801 -> 7801 bytes
 tests/data/acpi/q35/DSDT.acpihmat    | Bin 9126 -> 9126 bytes
 tests/data/acpi/q35/DSDT.bridge      | Bin 7819 -> 7819 bytes
 tests/data/acpi/q35/DSDT.cphp        | Bin 8265 -> 8265 bytes
 tests/data/acpi/q35/DSDT.dimmpxm     | Bin 9455 -> 9455 bytes
 tests/data/acpi/q35/DSDT.ipmibt      | Bin 7876 -> 7876 bytes
 tests/data/acpi/q35/DSDT.memhp       | Bin 9160 -> 9160 bytes
 tests/data/acpi/q35/DSDT.mmio64      | Bin 8932 -> 8932 bytes
 tests/data/acpi/q35/DSDT.numamem     | Bin 7807 -> 7807 bytes
 tests/data/acpi/q35/DSDT.tis         | Bin 8407 -> 8407 bytes
 tests/data/acpi/q35/FACP             | Bin 244 -> 244 bytes
 tests/data/acpi/q35/HMAT.acpihmat    | Bin 280 -> 280 bytes
 tests/data/acpi/q35/HPET             | Bin 56 -> 56 bytes
 tests/data/acpi/q35/MCFG             | Bin 60 -> 60 bytes
 tests/data/acpi/q35/NFIT.dimmpxm     | Bin 240 -> 240 bytes
 tests/data/acpi/q35/SLIT.cphp        | Bin 48 -> 48 bytes
 tests/data/acpi/q35/SLIT.memhp       | Bin 48 -> 48 bytes
 tests/data/acpi/q35/SRAT.acpihmat    | Bin 280 -> 280 bytes
 tests/data/acpi/q35/SRAT.cphp        | Bin 304 -> 304 bytes
 tests/data/acpi/q35/SRAT.dimmpxm     | Bin 392 -> 392 bytes
 tests/data/acpi/q35/SRAT.memhp       | Bin 264 -> 264 bytes
 tests/data/acpi/q35/SRAT.mmio64      | Bin 224 -> 224 bytes
 tests/data/acpi/q35/SRAT.numamem     | Bin 224 -> 224 bytes
 tests/data/acpi/q35/SSDT.dimmpxm     | Bin 734 -> 734 bytes
 tests/data/acpi/q35/TPM2.tis         | Bin 76 -> 76 bytes
 tests/data/acpi/q35/WAET             | Bin 40 -> 40 bytes
 tests/data/acpi/virt/APIC            | Bin 168 -> 168 bytes
 tests/data/acpi/virt/APIC.memhp      | Bin 168 -> 168 bytes
 tests/data/acpi/virt/APIC.numamem    | Bin 168 -> 168 bytes
 tests/data/acpi/virt/DSDT            | Bin 5204 -> 5204 bytes
 tests/data/acpi/virt/DSDT.memhp      | Bin 6565 -> 6565 bytes
 tests/data/acpi/virt/DSDT.numamem    | Bin 5204 -> 5204 bytes
 tests/data/acpi/virt/DSDT.pxb        | Bin 7689 -> 7689 bytes
 tests/data/acpi/virt/FACP            | Bin 268 -> 268 bytes
 tests/data/acpi/virt/FACP.memhp      | Bin 268 -> 268 bytes
 tests/data/acpi/virt/FACP.numamem    | Bin 268 -> 268 bytes
 tests/data/acpi/virt/GTDT            | Bin 96 -> 96 bytes
 tests/data/acpi/virt/GTDT.memhp      | Bin 96 -> 96 bytes
 tests/data/acpi/virt/GTDT.numamem    | Bin 96 -> 96 bytes
 tests/data/acpi/virt/MCFG            | Bin 60 -> 60 bytes
 tests/data/acpi/virt/MCFG.memhp      | Bin 60 -> 60 bytes
 tests/data/acpi/virt/MCFG.numamem    | Bin 60 -> 60 bytes
 tests/data/acpi/virt/NFIT.memhp      | Bin 224 -> 224 bytes
 tests/data/acpi/virt/SLIT.memhp      | Bin 48 -> 48 bytes
 tests/data/acpi/virt/SPCR            | Bin 80 -> 80 bytes
 tests/data/acpi/virt/SPCR.memhp      | Bin 80 -> 80 bytes
 tests/data/acpi/virt/SPCR.numamem    | Bin 80 -> 80 bytes
 tests/data/acpi/virt/SRAT.memhp      | Bin 226 -> 226 bytes
 tests/data/acpi/virt/SRAT.numamem    | Bin 106 -> 106 bytes
 tests/data/acpi/virt/SSDT.memhp      | Bin 736 -> 736 bytes
 91 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/tests/data/acpi/microvm/APIC b/tests/data/acpi/microvm/APIC
index 7472c7e830b6c7139720e93dd544d4441556661d..68dbd44a7e35a356083f086df60f70e424c4249f 100644
GIT binary patch
delta 30
jcmZ>BlW+|1barE4U|=k9@^|(KR&a_4a8>|<i4uAMWUdB~

delta 30
jcmZ>BlW+|1barE4U|_uN<nQbetl$(8;0zL*D4_=cZv+RB

diff --git a/tests/data/acpi/microvm/APIC.ioapic2 b/tests/data/acpi/microvm/APIC.ioapic2
index a305f89d99eca881109ba54090da0f90262a402c..3063c52cd3e9bbed29c06031b375900f4a49b9e0 100644
GIT binary patch
delta 30
jcmWFvl5h<0bPi%*U|?)^@^|(KR&a_4a8>|<i4s--X`lwr

delta 30
jcmWFvl5h<0bPi%*U|@Xa<nQbetl$(8;0zL*C}9NvbM^<%

diff --git a/tests/data/acpi/microvm/APIC.pcie b/tests/data/acpi/microvm/APIC.pcie
index 6c51081b50beb061c5f4e5baa134585d82db4c39..4e8f6ed8d6a866429fc17aecdeafc3fb5ef65fa3 100644
GIT binary patch
delta 30
jcmd1HlW+|1bk1X7U|_6q@^|(KR&a_4a8>|<i4tJ|ayADz

delta 30
jcmd1HlW+|1bk1X7U|_uO<nQbetl$(8;0zL*C=mt#e2fS<

diff --git a/tests/data/acpi/microvm/DSDT b/tests/data/acpi/microvm/DSDT
index b43f427a222a933d3f34aceab6224a2c6115c365..f477668f2ee80241e47b340ad4a30f5480df2049 100644
GIT binary patch
delta 33
ncmaFM^p;7&CD<h-myv;iNzlpP*&|rNDI&mG0SGoqgfapEm1773

delta 33
mcmaFM^p;7&CD<h-myv;iDapy-*&|rNDI&lbB(_l^lo0@*#|Z)e

diff --git a/tests/data/acpi/microvm/DSDT.ioapic2 b/tests/data/acpi/microvm/DSDT.ioapic2
index aee44dd3de1bb16585bf571ff0ca8e44d467d009..e5924a49962e0cff4228bcfc77ebcf48cb4a2219 100644
GIT binary patch
delta 33
ncmaFM^p;7&CD<h-myv;i>9mu-vq!LkQ$&EX0uXGJ2xSBSqcI4)

delta 33
mcmaFM^p;7&CD<h-myv;iNyf?F*&|rNDI&lbB(_l^lo0@$l?c25

diff --git a/tests/data/acpi/microvm/DSDT.pcie b/tests/data/acpi/microvm/DSDT.pcie
index e590b98f9960025f75dd0544492d3088781406dc..3fb373fd970f0a33f30f57b1917720754396f0e9 100644
GIT binary patch
delta 33
ncmcaEeqCI`CD<k8IyVCYlZTVPvq!LkQ$&EX0uXGJ*v}0Bq{0aw

delta 33
mcmcaEeqCI`CD<k8IyVCY(@ZCSXOCb7r-%S&kl03v{oDYrCJG+_

diff --git a/tests/data/acpi/microvm/DSDT.rtc b/tests/data/acpi/microvm/DSDT.rtc
index 5960d6929a2f88d76aaa324b88b80908ff0698dc..e375473b5f033d374dd2a64a9f814fd16c3e262f 100644
GIT binary patch
delta 33
ncmbQjJcU`pCD<io3L^sp(|sp@XOCb7r-%S&1t8ccQNsuTlA#E0

delta 33
mcmbQjJcU`pCD<io3L^splYx`Jvq!LkQ$&C>NNl4-4I==G1qf~c

diff --git a/tests/data/acpi/microvm/DSDT.usb b/tests/data/acpi/microvm/DSDT.usb
index 14423381ea235ed42f6f0f7d98e793c271a4e7c1..d63fd84620a2689120b32262f964e6a098d71632 100644
GIT binary patch
delta 33
ncmbQoJdatzCD<io9wP$-lcJNqvq!LkQ$&EX0uXGJXk!EbhzkeU

delta 33
mcmbQoJdatzCD<io9wP$-Q<0Ouvq!LkQ$&C>NNl4-8zTUcZwS}`

diff --git a/tests/data/acpi/microvm/FACP b/tests/data/acpi/microvm/FACP
index 0ba5795d622349e1521138e4123544637b4ab9af..f12cef5cb6461118d4f6c847bad5c173613443c6 100644
GIT binary patch
delta 32
lcmeBS>S2;_b94^iVPs%nm2mQR_6SyRiU@F40D_4UUjS?i2T}k4

delta 32
lcmeBS>S2;_b94^iVPs%nt#k5s_6SyRiU@E9iA|LF0swY)2vPt5

diff --git a/tests/data/acpi/pc/APIC b/tests/data/acpi/pc/APIC
index 84509e0ae4cabeb5ead3e42a4edfa50abddbc17d..208331db53b7dd5c6205cce0e95427636b86dd64 100644
GIT binary patch
delta 30
jcmb=ZkZ=s}bgp1vU|{TW@^|(KR&a_4a8>|<i4q9_c5nx7

delta 30
jcmb=ZkZ=s}bgp1vU|@Xf<nQbetl$(8;0zL*D3JgFfW`=J

diff --git a/tests/data/acpi/pc/APIC.acpihmat b/tests/data/acpi/pc/APIC.acpihmat
index a21f164699bfccd8992ea1bdb5717f2dc3025496..812c4603f2701494f6bb761570323158a20d4043 100644
GIT binary patch
delta 32
lcmZo*Y+#gd4DfVrU|?WiEO+vE_6SyRiU@F40D_4U831{32Ymnl

delta 32
lcmZo*Y+#gd4DfVrU|?WiyyfKY>=CTs6cOMI5}PQI0RV%>2z>wm

diff --git a/tests/data/acpi/pc/APIC.cphp b/tests/data/acpi/pc/APIC.cphp
index 1bf8a0a63bc1c9b716d937b96eb34b05016b9366..65cc4f4a9aa2676140a6525cdac1e838274b1e07 100644
GIT binary patch
delta 32
mcmZ3$xPVc@F~HM#0RsaAqlA;cvq!LkQ$&EX0uW4;=l}qHf(M=e

delta 32
lcmZ3$xPVc@F~HM#0RsaAW3`jNvq!LkQ$&C>NNl1+2LOlI2%Z1{

diff --git a/tests/data/acpi/pc/APIC.dimmpxm b/tests/data/acpi/pc/APIC.dimmpxm
index 427bb08248e6a029c1c988f74f5e48f93ee4ebe0..d904d4a70ddecbb79a83a267af8e26f925e9f4c6 100644
GIT binary patch
delta 32
mcmbQhIDt{ZF~HM#0s{jBqqmd4vq!LkQ$&EX0uW4;r~m+axCfB{

delta 32
lcmbQhIDt{ZF~HM#0s{jB<2omQXOCb7r-%S&kk~|t3IK)<2$28)

diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
index f6173df1d598767a79aa34ad7585ad7d45c5d4f3..11ef89bd322271ee30f3971b880dadfda565d413 100644
GIT binary patch
delta 33
ncmX@9eo|e+CD<k8q%Z>mqra2Cvq!LkQ$&EX0uXGJ*eDDDq~{48

delta 33
mcmX@9eo|e+CD<k8q%Z>m;{qptXOCb7r-%S&kl03vjlux0O9~wT

diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
index 67f3f7249eaaa9404ebf0f2d0a324b8c8e3bd445..c561e91be79f80dbea1cf4eb0f8658541a3aab2f 100644
GIT binary patch
delta 33
ncmexn_{~tlCD<k8n*;*`Baf56vq!LkQ$&EX0uXGJxF-PsvZM*D

delta 33
mcmexn_{~tlCD<k8n*;*`W2}?Evq!LkQ$&C>NNl6TJqZB42nwtK

diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index 643390f4c4138b37fc481656d3f555d0eeedcb02..a234075518fa8e187349d64c313779cc25db8299 100644
GIT binary patch
delta 33
ncmeA%>oJpX33dtLk!E0EobKfB>=CTs6cOO800bK)zDNN8jxGqE

delta 33
mcmeA%>oJpX33dtLk!E0EeBtEp>=CTs6cOMI65A;8MG63zk_nyw

diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
index 1ddcf7d8812f5d8d4d38fe7e7b35fd5885806046..6ac47a7d1001c711b957f8e28cab1a143d2cf65f 100644
GIT binary patch
delta 33
ncmbQKJyTo4CD<iorYHjg<7Ov+XOCb7r-%S&1t8cc(I^T4oSO*E

delta 33
mcmbQKJyTo4CD<iorYHjgBa4&2vq!LkQ$&C>NNl4-qbLBA{|L<h

diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
index c44385cc01879324738ffb7f997b8cdd762cbf97..d24377279c307adeaba2b98aba20677872dfbbda 100644
GIT binary patch
delta 33
ncmdmQvfo6)CD<jzUW$Q%agLL}vq!LkQ$&EX0uXGJP?rJ#o#+T^

delta 33
mcmdmQvfo6)CD<jzUW$Q%@vW1;vq!LkQ$&C>NNl5ox)cDYObKcL

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index 4ecf1eb13bf49499f729b53a6d0114672a76e28d..9dfac45eab12b680bc963d0528553a7149a378cc 100644
GIT binary patch
delta 33
ncmZ3azDQldCD<iokuU=TV~3N!vq!LkQ$&EX0uXGJ=n@71n`{WW

delta 33
mcmZ3azDQldCD<iokuU=T<4q@jXOCb7r-%S&kl03vE@1$r&<VN#

diff --git a/tests/data/acpi/pc/DSDT.hpbrroot b/tests/data/acpi/pc/DSDT.hpbrroot
index a3046226ec1dcb234b726029b3790dfedb3b9221..6ff6f198c7caf445d25c01117a6357b398358cbf 100644
GIT binary patch
delta 33
mcmeB?=#h|c33dtL;bCB4G;s2F_6SyRiU@F40D_GYU$_B%-3Q$O

delta 33
mcmeB?=#h|c33dtL;bCB4Y;^K>_6SyRiU@E9iEWhl!VLh3K?vOd

diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
index f1638c5d079a9442c09390426a913010df6efd8d..1814f291b704d737d3578b83fbcc6e090384943a 100644
GIT binary patch
delta 33
ncmbQJF;PRpCD<iIP=tYj@sX3ivq!LkQ$&EX0uXGJ_$dqkk#z{u

delta 33
mcmbQJF;PRpCD<iIP=tYj(b&n~*&|rNDI&lbB(_oFr!WAB*$C4B

diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
index 4c19e45e66918c61674785c99e4474e58866f125..3c81339d397969e954c94eb03f2654c57e024a6e 100644
GIT binary patch
delta 32
mcmbPXG{Z>3CD<iILXv@j(ZR{z*&|rNDI&mG0SFdKNCE(XM+aO0

delta 32
lcmbPXG{Z>3CD<iILXv@jaiWvIvq!LkQ$&C>NNk~mBmj!52wVUF

diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
index 40cfd933259af05ac2aee07fca32f22122255211..195f8da900c5fc56c504adfef756af8f74f5823d 100644
GIT binary patch
delta 33
ncmX@FeqLR|CD<k8yf6a;<4-4lXOCb7r-%S&1t8ccv0WGdv!My!

delta 33
mcmX@FeqLR|CD<k8yf6a;qnDGvvq!LkQ$&C>NNl6Tc3}Xk1qt5(

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index 078fc8031b479cc77b6527a2b7b4bd576b6e6028..1d0a2c2f3cc4bfac75948d2ed6a69403cd18379b 100644
GIT binary patch
delta 33
mcmeCx?A4TT33dtT6=7gtEOqjC_6SyRiU@F40D_GYr6K^6H3(S%

delta 33
mcmeCx?A4TT33dtT6=7gtJm%!@>=CTs6cOMI65A+IDgpqVnF(0{

diff --git a/tests/data/acpi/pc/FACP b/tests/data/acpi/pc/FACP
index 261ebdc5d1c3bdf18fb7935314a04fd7f6f92a7a..5fe21a5967aaaa2e72bf213d91f57a573cd4d38f 100644
GIT binary patch
delta 30
jcmXRZk#KW#4k%$@U|_U%@^|(KR&a_4a8>|<i4rjYZ#f4H

delta 30
jcmXRZk#KW#4k%$@U|?M6<nQbetl$(8;0zL*C=mkyd87yo

diff --git a/tests/data/acpi/pc/HMAT.acpihmat b/tests/data/acpi/pc/HMAT.acpihmat
index c00f7ba6cd0acecbc4b158f430d29b2f32988522..a9d8e5cd47d7c0eb8c88c26f26fe52a493188ea9 100644
GIT binary patch
delta 32
mcmbQiG=oXP!`CrHf{}rN$;rvz*&|rNDI&mG0SFdKFaiK`n+D1N

delta 32
lcmbQiG=oXP!`CrHf{}rNX@--(vq!LkQ$&C>NNk}5BLICu2g(2d

diff --git a/tests/data/acpi/pc/HPET b/tests/data/acpi/pc/HPET
index df689b8f99c1c43cfd7d63bdede3bcdfd23b7de1..19f704abdd3909a0983232ee7b93318811f71b19 100644
GIT binary patch
literal 56
xcmeYWa1F6wU|?X};^gn_5v<@85#X!<1dKp25F11@E^2E4Qb2IwAB1LL002JR3IPBB

literal 56
xcmeYWa1F6wU|?WmcJg=j2v%^42ypfQiZKGkKx`1rxTviGNCClxe-N610RT2D3IPBB

diff --git a/tests/data/acpi/pc/NFIT.dimmpxm b/tests/data/acpi/pc/NFIT.dimmpxm
index 598d331b751cd3cb2137d431c1f34bb8957a0d31..02d23385bcb767c5c060061caafea7fdb4dc31fb 100644
GIT binary patch
delta 32
mcmeys_<>Qv&&@OB0|NsC<5eerXOCb7r-%S&1t6FxaRUISp9!x3

delta 32
lcmeys_<>Qv&&@OB0|NsCql%Nivq!LkQ$&C>NNl3S4FI0-39kSE

diff --git a/tests/data/acpi/pc/SLIT.cphp b/tests/data/acpi/pc/SLIT.cphp
index 74ec3b4b461ffecca36d8537975c202a5f011185..67f00813af7b2356fe74eed943ab8dcf2291578b 100644
GIT binary patch
literal 48
scmWIc@eDCwU|?W;;pFe^5v<@85#X!<1dKp25F11@0Wk=0iHdRo0OYg>0RR91

literal 48
scmWIc@eDCwU|?X>aq@Te2v%^42yhMtiZKGkKx`1r1jHb~B`V4V0NaKK0RR91

diff --git a/tests/data/acpi/pc/SLIT.memhp b/tests/data/acpi/pc/SLIT.memhp
index 74ec3b4b461ffecca36d8537975c202a5f011185..67f00813af7b2356fe74eed943ab8dcf2291578b 100644
GIT binary patch
literal 48
scmWIc@eDCwU|?W;;pFe^5v<@85#X!<1dKp25F11@0Wk=0iHdRo0OYg>0RR91

literal 48
scmWIc@eDCwU|?X>aq@Te2v%^42yhMtiZKGkKx`1r1jHb~B`V4V0NaKK0RR91

diff --git a/tests/data/acpi/pc/SRAT.acpihmat b/tests/data/acpi/pc/SRAT.acpihmat
index 1dcae90aec688e88f9d212e632faaaaf2e0dc7bc..e0b36e97f69f9726ae03182bdbbcf06d654f43a8 100644
GIT binary patch
delta 32
mcmbQiG=oVZILI+Xf{}rNvC7Hc*&|rNDI&mG0SFdKFaiL1BL@)x

delta 32
lcmbQiG=oVZILI+Xf{}rN@qm-Rvq!LkQ$&C>NNk}5BLIRG2oV4P

diff --git a/tests/data/acpi/pc/SRAT.cphp b/tests/data/acpi/pc/SRAT.cphp
index ff2137642f488ec70b85207ed6c20e7351d61e98..d8ce4f5a9c3ea4cb8e74abc6ea9b8078e6291c2e 100644
GIT binary patch
delta 33
ncmdnMw1G(?ILI-?fRTZL@q?4Uvq!LkQ$&EX0uXGJkYEG=k);Rs

delta 33
mcmdnMw1G(?ILI-?fRTZL(ag!;*&|rNDI&lbB(_mPf)N0Smk0L%

diff --git a/tests/data/acpi/pc/SRAT.dimmpxm b/tests/data/acpi/pc/SRAT.dimmpxm
index 5a13c61b9041c6045c29643bf93a111fb1c0c76a..7eed48cf2dd1f562e163e1982cead651ee208dfb 100644
GIT binary patch
delta 33
mcmeBR?qHS(4ss0XU}RumRC4ln_6SyRiU@F40D_GY1&jcJi3f`S

delta 33
mcmeBR?qHS(4ss0XU}Rum%y9B|_6SyRiU@E9iEWf9U<3e*dkBjF

diff --git a/tests/data/acpi/pc/SRAT.memhp b/tests/data/acpi/pc/SRAT.memhp
index e508b4ae3cd9e3000209a4f9597913faa4206ec1..a5b5f9adef5bfb4c461ef69d47a14f77bba12fe7 100644
GIT binary patch
delta 32
lcmeBR>R^%x4ss0PU}RumjB)aJ_6SyRiU@F40D_4U9{_T82ciG~

delta 32
lcmeBR>R^%x4ss0PU}RumT;$~M>=CTs6cOMI5}PRT0RVew2%-Q0

diff --git a/tests/data/acpi/pc/SRAT.numamem b/tests/data/acpi/pc/SRAT.numamem
index 119922f4973f621602047d1dc160519f810922a3..56da58e2699cb13fcd41b5e1667ceeddbdd443b5 100644
GIT binary patch
delta 32
mcmaFB_<&I&ILI;N0RsaA<9a85XOCb7r-%S&1t6FxaRLCKiV0Ex

delta 32
lcmaFB_<&I&ILI;N0RsaA<5wqtXOCb7r-%S&kk~|t69B1v3Q_<7

diff --git a/tests/data/acpi/pc/SSDT.dimmpxm b/tests/data/acpi/pc/SSDT.dimmpxm
index ac55387d57e48adb99eb738a102308688a262fb8..a50a961fa1d9b0dd8ea4096d652c83bcf04db20b 100644
GIT binary patch
delta 33
ocmcb|dXH5iIM^lR9uortqnMMwvq!LkUzm%hudjl_Mu}rg0HV1GKL7v#

delta 33
ocmcb|dXH5iIM^lR9uortW0;e_vq!LkUzm%huP+0`Mu}rg0HzrUKL7v#

diff --git a/tests/data/acpi/pc/WAET b/tests/data/acpi/pc/WAET
index c2240f58dff6b2f765386b5a2e506fda4800be3e..ac0db59183096ea1d93832a421015385ba93aba0 100644
GIT binary patch
literal 40
mcmWG{bPds9U|?Xhbn<uh2v%^42yj*a0!E-1hz+8dfEWOl3kCrI

literal 40
mcmWG{bPds9U|?YEaPoKd2v%^42yhMuiZKGkKx`1r1jGQWX$JuS

diff --git a/tests/data/acpi/q35/APIC b/tests/data/acpi/q35/APIC
index 84509e0ae4cabeb5ead3e42a4edfa50abddbc17d..208331db53b7dd5c6205cce0e95427636b86dd64 100644
GIT binary patch
delta 30
jcmb=ZkZ=s}bgp1vU|{TW@^|(KR&a_4a8>|<i4q9_c5nx7

delta 30
jcmb=ZkZ=s}bgp1vU|@Xf<nQbetl$(8;0zL*D3JgFfW`=J

diff --git a/tests/data/acpi/q35/APIC.acpihmat b/tests/data/acpi/q35/APIC.acpihmat
index a21f164699bfccd8992ea1bdb5717f2dc3025496..812c4603f2701494f6bb761570323158a20d4043 100644
GIT binary patch
delta 32
lcmZo*Y+#gd4DfVrU|?WiEO+vE_6SyRiU@F40D_4U831{32Ymnl

delta 32
lcmZo*Y+#gd4DfVrU|?WiyyfKY>=CTs6cOMI5}PQI0RV%>2z>wm

diff --git a/tests/data/acpi/q35/APIC.cphp b/tests/data/acpi/q35/APIC.cphp
index 1bf8a0a63bc1c9b716d937b96eb34b05016b9366..65cc4f4a9aa2676140a6525cdac1e838274b1e07 100644
GIT binary patch
delta 32
mcmZ3$xPVc@F~HM#0RsaAqlA;cvq!LkQ$&EX0uW4;=l}qHf(M=e

delta 32
lcmZ3$xPVc@F~HM#0RsaAW3`jNvq!LkQ$&C>NNl1+2LOlI2%Z1{

diff --git a/tests/data/acpi/q35/APIC.dimmpxm b/tests/data/acpi/q35/APIC.dimmpxm
index 427bb08248e6a029c1c988f74f5e48f93ee4ebe0..d904d4a70ddecbb79a83a267af8e26f925e9f4c6 100644
GIT binary patch
delta 32
mcmbQhIDt{ZF~HM#0s{jBqqmd4vq!LkQ$&EX0uW4;r~m+axCfB{

delta 32
lcmbQhIDt{ZF~HM#0s{jB<2omQXOCb7r-%S&kk~|t3IK)<2$28)

diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index d25cd7072932886d6967f4023faac1e1fa6e836c..008a3d7d0fd64224b0880412c0077e28e930fa5a 100644
GIT binary patch
delta 33
ncmexq^V3GcCD<jTQjURvajBEPvq!LkQ$&EX0uXGJNR$HrwMPka

delta 33
mcmexq^V3GcCD<jTQjURv@tc#svq!LkQ$&C>NNl4-q8tFfs|s@f

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index 722e06af83abcde203a2b96a8ec81fd3bab9fc98..2723b690089c9e75869708cb92d3081b6bb5ec65 100644
GIT binary patch
delta 33
ncmZ4HzRX?1CD<ionKA<dW0I4<vq!LkQ$&EX0uXGJ=u-v&qe2M;

delta 33
mcmZ4HzRX?1CD<ionKA<d<7Ov+XOCb7r-%S&kl03vK4k!{rV0cA

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index 06bac139d668ddfc7914e258b471a303c9dbd192..86711455576518f9ddd1f524d82a447946be32ba 100644
GIT binary patch
delta 33
mcmeCS?Y5P033dtTmSbRGv~%)z_6SyRiU@F40D_GY#c}|YGzeAz

delta 33
mcmeCS?Y5P033dtTmSbRG?052a_6SyRiU@E9iEWf9mIDBum<d(@

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index 2b933ac482e6883efccbd7d6c96089602f2c0b4d..42b7819ea8c9337e943c34e826af19723f99a358 100644
GIT binary patch
delta 33
ncmX@<aMD4-CD<jzQ-Ohjk<-cF*&|rNDI&mG0SGoq7%Bh&nfnMM

delta 33
mcmX@<aMD4-CD<jzQ-OhjG0Mr`*&|rNDI&lbB(_n)Pyqm>UkM`s

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index bd8f8305b028ef20f9b6d1a0c69ac428d027e3d1..7c3526d9670305e41020e5d95a3d0e9897b1e6d3 100644
GIT binary patch
delta 33
ncmaFw`QB5)CD<k8y$S;Z<5eerXOCb7r-%S&1t8ccaa{!f#t90c

delta 33
mcmaFw`QB5)CD<k8y$S;ZqneYyvq!LkQ$&C>NNl6Tbrk@;Z3>|P

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index a8f868e23c25688ab1c0371016c071f23e9d732f..8d3ccc3e75164c2884fbe21659100e12fc70ae38 100644
GIT binary patch
delta 33
ncmX?Nd&E}4CD<k8h#Uh0<4q@jXOCb7r-%S&1t8ccu|^I6v%d+|

delta 33
mcmX?Nd&E}4CD<k8h#Uh0qn4Auvq!LkQ$&C>NNl6T8aV)~BMH?2

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index 9a802e4c67022386442976d5cb997ea3fc57b58f..f1c545d94b856fa8d19b8433233d80397cb05714 100644
GIT binary patch
delta 33
ncmX@%e!^YCCD<k8gfasI<8&u~XOCb7r-%S&1t8ccu|XLCvn2_^

delta 33
mcmX@%e!^YCCD<k8gfasI;|nK$XOCb7r-%S&kl03v4axw$i3-60

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index 948c2dc7264c31932b490ca00691a7c4d9aefdb0..4fb285f2efea00964ea0f5c4172c213f0817b563 100644
GIT binary patch
delta 33
ncmaFj`ovYjCD<k8i4p??qmPrnvq!LkQ$&EX0uXGJIHLprw%7^a

delta 33
mcmaFj`ovYjCD<k8i4p??<6I|yXOCb7r-%S&kl03vGfDu#JPP0d

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index 44ec1b0af400da6d298284aa959aa38add7e6dd5..dd9dc9d02501afb50da7b9e77daabeee8968c340 100644
GIT binary patch
delta 33
ncmexw^WR3oCD<jTUXFo*(cj76*&|rNDI&mG0SGoqq{{&Su>lD+

delta 33
mcmexw^WR3oCD<jTUXFo*ae<S+vq!LkQ$&C>NNl4-x*PzzWePO_

diff --git a/tests/data/acpi/q35/DSDT.tis b/tests/data/acpi/q35/DSDT.tis
index 30da3ec27958881801dacc954a343321ba26a2ae..b8e380340209a38163ef6ca2f6f9dfaf458ab08d 100644
GIT binary patch
delta 33
ncmccac->LLCD<k8x&i|OW4V*Rvq!LkQ$&EX0uXGJ*slNpv`-1k

delta 33
mcmccac->LLCD<k8x&i|O;|V8!XOCb7r-%S&kl03v{R#lSvkJ=q

diff --git a/tests/data/acpi/q35/FACP b/tests/data/acpi/q35/FACP
index 72c9d97902a4bbf14896023d9ba78e0899d6517b..f6a864cc863c7763f6c09d3814ad184a658fa0a0 100644
GIT binary patch
delta 32
mcmeyu_=Qoz&CxmF3j+fK^G+v!XOCb7r-%S&1t6FxaR&gT)d`LO

delta 32
lcmeyu_=Qoz&CxmF3j+fKv%HhPvq!LkQ$&C>NNl3S9RQs`361~&

diff --git a/tests/data/acpi/q35/HMAT.acpihmat b/tests/data/acpi/q35/HMAT.acpihmat
index c00f7ba6cd0acecbc4b158f430d29b2f32988522..a9d8e5cd47d7c0eb8c88c26f26fe52a493188ea9 100644
GIT binary patch
delta 32
mcmbQiG=oXP!`CrHf{}rN$;rvz*&|rNDI&mG0SFdKFaiK`n+D1N

delta 32
lcmbQiG=oXP!`CrHf{}rNX@--(vq!LkQ$&C>NNk}5BLICu2g(2d

diff --git a/tests/data/acpi/q35/HPET b/tests/data/acpi/q35/HPET
index df689b8f99c1c43cfd7d63bdede3bcdfd23b7de1..19f704abdd3909a0983232ee7b93318811f71b19 100644
GIT binary patch
literal 56
xcmeYWa1F6wU|?X};^gn_5v<@85#X!<1dKp25F11@E^2E4Qb2IwAB1LL002JR3IPBB

literal 56
xcmeYWa1F6wU|?WmcJg=j2v%^42ypfQiZKGkKx`1rxTviGNCClxe-N610RT2D3IPBB

diff --git a/tests/data/acpi/q35/MCFG b/tests/data/acpi/q35/MCFG
index 79ceb27a038c6e29d098b98dda2e229495f96b7c..696bc969f2cd51f2e243090c9aff8619651b2dc1 100644
GIT binary patch
literal 60
rcmeZuc5}C3U|?YEaq@Te2v%^42yj*a0!E-1hz+8Vzy>J$KZphZEJX+b

literal 60
rcmeZuc5}C3U|?W;@8s|75v<@85#a0#6k`O6f!H7#32cC}|AS}%SE304

diff --git a/tests/data/acpi/q35/NFIT.dimmpxm b/tests/data/acpi/q35/NFIT.dimmpxm
index 598d331b751cd3cb2137d431c1f34bb8957a0d31..02d23385bcb767c5c060061caafea7fdb4dc31fb 100644
GIT binary patch
delta 32
mcmeys_<>Qv&&@OB0|NsC<5eerXOCb7r-%S&1t6FxaRUISp9!x3

delta 32
lcmeys_<>Qv&&@OB0|NsCql%Nivq!LkQ$&C>NNl3S4FI0-39kSE

diff --git a/tests/data/acpi/q35/SLIT.cphp b/tests/data/acpi/q35/SLIT.cphp
index 74ec3b4b461ffecca36d8537975c202a5f011185..67f00813af7b2356fe74eed943ab8dcf2291578b 100644
GIT binary patch
literal 48
scmWIc@eDCwU|?W;;pFe^5v<@85#X!<1dKp25F11@0Wk=0iHdRo0OYg>0RR91

literal 48
scmWIc@eDCwU|?X>aq@Te2v%^42yhMtiZKGkKx`1r1jHb~B`V4V0NaKK0RR91

diff --git a/tests/data/acpi/q35/SLIT.memhp b/tests/data/acpi/q35/SLIT.memhp
index 74ec3b4b461ffecca36d8537975c202a5f011185..67f00813af7b2356fe74eed943ab8dcf2291578b 100644
GIT binary patch
literal 48
scmWIc@eDCwU|?W;;pFe^5v<@85#X!<1dKp25F11@0Wk=0iHdRo0OYg>0RR91

literal 48
scmWIc@eDCwU|?X>aq@Te2v%^42yhMtiZKGkKx`1r1jHb~B`V4V0NaKK0RR91

diff --git a/tests/data/acpi/q35/SRAT.acpihmat b/tests/data/acpi/q35/SRAT.acpihmat
index 1dcae90aec688e88f9d212e632faaaaf2e0dc7bc..e0b36e97f69f9726ae03182bdbbcf06d654f43a8 100644
GIT binary patch
delta 32
mcmbQiG=oVZILI+Xf{}rNvC7Hc*&|rNDI&mG0SFdKFaiL1BL@)x

delta 32
lcmbQiG=oVZILI+Xf{}rN@qm-Rvq!LkQ$&C>NNk}5BLIRG2oV4P

diff --git a/tests/data/acpi/q35/SRAT.cphp b/tests/data/acpi/q35/SRAT.cphp
index ff2137642f488ec70b85207ed6c20e7351d61e98..d8ce4f5a9c3ea4cb8e74abc6ea9b8078e6291c2e 100644
GIT binary patch
delta 33
ncmdnMw1G(?ILI-?fRTZL@q?4Uvq!LkQ$&EX0uXGJkYEG=k);Rs

delta 33
mcmdnMw1G(?ILI-?fRTZL(ag!;*&|rNDI&lbB(_mPf)N0Smk0L%

diff --git a/tests/data/acpi/q35/SRAT.dimmpxm b/tests/data/acpi/q35/SRAT.dimmpxm
index 5a13c61b9041c6045c29643bf93a111fb1c0c76a..7eed48cf2dd1f562e163e1982cead651ee208dfb 100644
GIT binary patch
delta 33
mcmeBR?qHS(4ss0XU}RumRC4ln_6SyRiU@F40D_GY1&jcJi3f`S

delta 33
mcmeBR?qHS(4ss0XU}Rum%y9B|_6SyRiU@E9iEWf9U<3e*dkBjF

diff --git a/tests/data/acpi/q35/SRAT.memhp b/tests/data/acpi/q35/SRAT.memhp
index e508b4ae3cd9e3000209a4f9597913faa4206ec1..a5b5f9adef5bfb4c461ef69d47a14f77bba12fe7 100644
GIT binary patch
delta 32
lcmeBR>R^%x4ss0PU}RumjB)aJ_6SyRiU@F40D_4U9{_T82ciG~

delta 32
lcmeBR>R^%x4ss0PU}RumT;$~M>=CTs6cOMI5}PRT0RVew2%-Q0

diff --git a/tests/data/acpi/q35/SRAT.mmio64 b/tests/data/acpi/q35/SRAT.mmio64
index ac35f3dac4f47b86e41c7f35ee40bac14174b37e..f5e1e3932a8e2e61c6cd691e7d07ed72046e7ce8 100644
GIT binary patch
delta 32
mcmaFB_<&I&ILI;N0RsaA<5wqtXOCb7r-%S&1t6FxaRLCPb_tjO

delta 32
lcmaFB_<&I&ILI;N0RsaAqqUR2vq!LkQ$&C>NNl3S2>_gE377x?

diff --git a/tests/data/acpi/q35/SRAT.numamem b/tests/data/acpi/q35/SRAT.numamem
index 119922f4973f621602047d1dc160519f810922a3..56da58e2699cb13fcd41b5e1667ceeddbdd443b5 100644
GIT binary patch
delta 32
mcmaFB_<&I&ILI;N0RsaA<9a85XOCb7r-%S&1t6FxaRLCKiV0Ex

delta 32
lcmaFB_<&I&ILI;N0RsaA<5wqtXOCb7r-%S&kk~|t69B1v3Q_<7

diff --git a/tests/data/acpi/q35/SSDT.dimmpxm b/tests/data/acpi/q35/SSDT.dimmpxm
index 98e6f0e3f3bb02dd419e36bdd1db9b94c728c406..617a1c911c7d6753bcedc8ecc52e3027a5259ad6 100644
GIT binary patch
delta 33
ocmcb|dXH5iIM^lR9uortBb$@Ivq!LkUzm%hudjl_Mu}rg0HKKqF8}}l

delta 33
ocmcb|dXH5iIM^lR9uortqnnezvq!LkUzm%huP+0`Mu}rg0Ho;&F8}}l

diff --git a/tests/data/acpi/q35/TPM2.tis b/tests/data/acpi/q35/TPM2.tis
index 7878a6e79a6a406d99ca1f5e9a528eb392b8d793..fe0f05987be40f1c1742ae189df7821adc522fc0 100644
GIT binary patch
literal 76
wcmWFu@HO&bU|?Vob@F%i2v%^42yj*a0!E-1hz+8V0UI(0%m%6W&kkY&0CHRh0RR91

literal 76
wcmWFu@HO&bU|?V=a`Jcf2v%^42yhMoiZKGkKx`0=4A_u4U^Ym_e|8WP0Iiz{0RR91

diff --git a/tests/data/acpi/q35/WAET b/tests/data/acpi/q35/WAET
index c2240f58dff6b2f765386b5a2e506fda4800be3e..ac0db59183096ea1d93832a421015385ba93aba0 100644
GIT binary patch
literal 40
mcmWG{bPds9U|?Xhbn<uh2v%^42yj*a0!E-1hz+8dfEWOl3kCrI

literal 40
mcmWG{bPds9U|?YEaPoKd2v%^42yhMuiZKGkKx`1r1jGQWX$JuS

diff --git a/tests/data/acpi/virt/APIC b/tests/data/acpi/virt/APIC
index 797dfde2841c51b7e72065602e99ce1714347f0d..023f15f12e74fb9a3a6d3d9dc994541016947d6a 100644
GIT binary patch
delta 32
mcmZ3%xPno_F~HM#1p@;EbAXe-vq!LkQ$&EX0uW4;m;eBTNC)@;

delta 32
lcmZ3%xPno_F~HM#1p@;E^JXW1XOCb7r-%S&kk~|t2>_0s2>1X1

diff --git a/tests/data/acpi/virt/APIC.memhp b/tests/data/acpi/virt/APIC.memhp
index 797dfde2841c51b7e72065602e99ce1714347f0d..023f15f12e74fb9a3a6d3d9dc994541016947d6a 100644
GIT binary patch
delta 32
mcmZ3%xPno_F~HM#1p@;EbAXe-vq!LkQ$&EX0uW4;m;eBTNC)@;

delta 32
lcmZ3%xPno_F~HM#1p@;E^JXW1XOCb7r-%S&kk~|t2>_0s2>1X1

diff --git a/tests/data/acpi/virt/APIC.numamem b/tests/data/acpi/virt/APIC.numamem
index 797dfde2841c51b7e72065602e99ce1714347f0d..023f15f12e74fb9a3a6d3d9dc994541016947d6a 100644
GIT binary patch
delta 32
mcmZ3%xPno_F~HM#1p@;EbAXe-vq!LkQ$&EX0uW4;m;eBTNC)@;

delta 32
lcmZ3%xPno_F~HM#1p@;E^JXW1XOCb7r-%S&kk~|t2>_0s2>1X1

diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
index ea8a0869af1637ab75fe335e100256a2acf85e16..134d8ae5b602e0aaade6756b99c9abca45279284 100644
GIT binary patch
delta 33
ncmcbjaYaMICD<h-M1+BXiQmcJ*&|rNDI&mG0SGoq*oXiCmv0CT

delta 33
mcmcbjaYaMICD<h-M1+BXDZ$C#*&|rNDI&lbB(_n)Mg#z%(+Lg$

diff --git a/tests/data/acpi/virt/DSDT.memhp b/tests/data/acpi/virt/DSDT.memhp
index 897648637cc6c8af47c67a9a349477c0240f833b..140976b23ebea792bec12435a2a547ac5f5cd8f9 100644
GIT binary patch
delta 33
ncmZ2#ywq62CD<iosU!mflf9F_vq!LkQ$&EX0uXGJ=#>Njnwtos

delta 33
mcmZ2#ywq62CD<iosU!mf(*!4fXOCb7r-%S&kl03vUP%C?{|TZ1

diff --git a/tests/data/acpi/virt/DSDT.numamem b/tests/data/acpi/virt/DSDT.numamem
index ea8a0869af1637ab75fe335e100256a2acf85e16..134d8ae5b602e0aaade6756b99c9abca45279284 100644
GIT binary patch
delta 33
ncmcbjaYaMICD<h-M1+BXiQmcJ*&|rNDI&mG0SGoq*oXiCmv0CT

delta 33
mcmcbjaYaMICD<h-M1+BXDZ$C#*&|rNDI&lbB(_n)Mg#z%(+Lg$

diff --git a/tests/data/acpi/virt/DSDT.pxb b/tests/data/acpi/virt/DSDT.pxb
index ce3b67dff277e23f43925b1adcbb55c9d0b4eee3..eaa507b4bba45186d58c03695e46c5bba6a2695a 100644
GIT binary patch
delta 33
ncmeCQ>9mn>33dtLlw)9Ey6@!g>=CTs6cOO800bK)KFR_Blt>8e

delta 33
mcmeCQ>9mn>33dtLlw)9EGH~*D_6SyRiU@E9iEWhlC<_3KtO)G@

diff --git a/tests/data/acpi/virt/FACP b/tests/data/acpi/virt/FACP
index 27de99f51bfe846b1f8796ace49d83f5b33a1aed..1f764220f8533c427168e80ccf298604826a00b4 100644
GIT binary patch
literal 268
ycmZ>BbPnKQWME(ob@F%i2v%^42yj*a0-z8Bhz+8t3j|P&V`iYf6{t24%>w}Cy9NOO

literal 268
ycmZ>BbPnKQWME+3?d0$55v<@85#a0w6axw|fY>0Kx<CNcIA#XwTY+i=(L4a*H3tCz

diff --git a/tests/data/acpi/virt/FACP.memhp b/tests/data/acpi/virt/FACP.memhp
index 27de99f51bfe846b1f8796ace49d83f5b33a1aed..1f764220f8533c427168e80ccf298604826a00b4 100644
GIT binary patch
literal 268
ycmZ>BbPnKQWME(ob@F%i2v%^42yj*a0-z8Bhz+8t3j|P&V`iYf6{t24%>w}Cy9NOO

literal 268
ycmZ>BbPnKQWME+3?d0$55v<@85#a0w6axw|fY>0Kx<CNcIA#XwTY+i=(L4a*H3tCz

diff --git a/tests/data/acpi/virt/FACP.numamem b/tests/data/acpi/virt/FACP.numamem
index 27de99f51bfe846b1f8796ace49d83f5b33a1aed..1f764220f8533c427168e80ccf298604826a00b4 100644
GIT binary patch
literal 268
ycmZ>BbPnKQWME(ob@F%i2v%^42yj*a0-z8Bhz+8t3j|P&V`iYf6{t24%>w}Cy9NOO

literal 268
ycmZ>BbPnKQWME+3?d0$55v<@85#a0w6axw|fY>0Kx<CNcIA#XwTY+i=(L4a*H3tCz

diff --git a/tests/data/acpi/virt/GTDT b/tests/data/acpi/virt/GTDT
index 10107a65e958ff6495bb8c17d63d0539690f59f6..9408b71b59c0e0f2991c0053562280155b47bc0b 100644
GIT binary patch
delta 30
jcmYdDkZ=!i2}xjJU|{NT@^|(KR&a_4a8>|<i4q<FaRdh^

delta 30
jcmYdDkZ=!i2}xjJU|_oG<nQbetl$(8;0zL*DB%GBdOHXw

diff --git a/tests/data/acpi/virt/GTDT.memhp b/tests/data/acpi/virt/GTDT.memhp
index 10107a65e958ff6495bb8c17d63d0539690f59f6..9408b71b59c0e0f2991c0053562280155b47bc0b 100644
GIT binary patch
delta 30
jcmYdDkZ=!i2}xjJU|{NT@^|(KR&a_4a8>|<i4q<FaRdh^

delta 30
jcmYdDkZ=!i2}xjJU|_oG<nQbetl$(8;0zL*DB%GBdOHXw

diff --git a/tests/data/acpi/virt/GTDT.numamem b/tests/data/acpi/virt/GTDT.numamem
index 10107a65e958ff6495bb8c17d63d0539690f59f6..9408b71b59c0e0f2991c0053562280155b47bc0b 100644
GIT binary patch
delta 30
jcmYdDkZ=!i2}xjJU|{NT@^|(KR&a_4a8>|<i4q<FaRdh^

delta 30
jcmYdDkZ=!i2}xjJU|_oG<nQbetl$(8;0zL*DB%GBdOHXw

diff --git a/tests/data/acpi/virt/MCFG b/tests/data/acpi/virt/MCFG
index e8987e1af0ec3829770bf4fe11fab02b06160dd2..f4ae3203a4e9258a397c9912332178640209637b 100644
GIT binary patch
literal 60
scmeZuc5}C3U|?W;<K*w`5v<@85#X!<1dKp25F11z0RaaH=Rb%706Iko0RR91

literal 60
scmeZuc5}C3U|?YMck*}k2v%^42ypfViZKGkKx`0=1Oyx)oc|yS05YNo0RR91

diff --git a/tests/data/acpi/virt/MCFG.memhp b/tests/data/acpi/virt/MCFG.memhp
index e8987e1af0ec3829770bf4fe11fab02b06160dd2..f4ae3203a4e9258a397c9912332178640209637b 100644
GIT binary patch
literal 60
scmeZuc5}C3U|?W;<K*w`5v<@85#X!<1dKp25F11z0RaaH=Rb%706Iko0RR91

literal 60
scmeZuc5}C3U|?YMck*}k2v%^42ypfViZKGkKx`0=1Oyx)oc|yS05YNo0RR91

diff --git a/tests/data/acpi/virt/MCFG.numamem b/tests/data/acpi/virt/MCFG.numamem
index e8987e1af0ec3829770bf4fe11fab02b06160dd2..f4ae3203a4e9258a397c9912332178640209637b 100644
GIT binary patch
literal 60
scmeZuc5}C3U|?W;<K*w`5v<@85#X!<1dKp25F11z0RaaH=Rb%706Iko0RR91

literal 60
scmeZuc5}C3U|?YMck*}k2v%^42ypfViZKGkKx`0=1Oyx)oc|yS05YNo0RR91

diff --git a/tests/data/acpi/virt/NFIT.memhp b/tests/data/acpi/virt/NFIT.memhp
index 738c6f74c0ce7dc329cc72cc7b930460ceb9b6a0..203db8c7be82551eb6744b8a47625a96a6be449d 100644
GIT binary patch
delta 32
mcmaFB_<&Ku&&@OB0RsaAW0RA=vq!LkQ$&EX0uW4;H~|2hX$c$v

delta 32
lcmaFB_<&Ku&&@OB0RsaA<3%TbXOCb7r-%S&kk~|t69A>U3LF3c

diff --git a/tests/data/acpi/virt/SLIT.memhp b/tests/data/acpi/virt/SLIT.memhp
index 74ec3b4b461ffecca36d8537975c202a5f011185..67f00813af7b2356fe74eed943ab8dcf2291578b 100644
GIT binary patch
literal 48
scmWIc@eDCwU|?W;;pFe^5v<@85#X!<1dKp25F11@0Wk=0iHdRo0OYg>0RR91

literal 48
scmWIc@eDCwU|?X>aq@Te2v%^42yhMtiZKGkKx`1r1jHb~B`V4V0NaKK0RR91

diff --git a/tests/data/acpi/virt/SPCR b/tests/data/acpi/virt/SPCR
index 377271a0e7817cc21a28c02123a89facad63604f..24e0a579e7d73f432a614380e29aa95113344186 100644
GIT binary patch
delta 30
jcmWFtkO&TN4hmpkU|>4!<nQbetl$(8;H&@y6D2GFaMcGZ

delta 30
jcmWFtkO&TN4hmpkU|<q<@^|(KR&a_4a0ZD@l&}B*XW<7c

diff --git a/tests/data/acpi/virt/SPCR.memhp b/tests/data/acpi/virt/SPCR.memhp
index 377271a0e7817cc21a28c02123a89facad63604f..24e0a579e7d73f432a614380e29aa95113344186 100644
GIT binary patch
delta 30
jcmWFtkO&TN4hmpkU|>4!<nQbetl$(8;H&@y6D2GFaMcGZ

delta 30
jcmWFtkO&TN4hmpkU|<q<@^|(KR&a_4a0ZD@l&}B*XW<7c

diff --git a/tests/data/acpi/virt/SPCR.numamem b/tests/data/acpi/virt/SPCR.numamem
index 377271a0e7817cc21a28c02123a89facad63604f..24e0a579e7d73f432a614380e29aa95113344186 100644
GIT binary patch
delta 30
jcmWFtkO&TN4hmpkU|>4!<nQbetl$(8;H&@y6D2GFaMcGZ

delta 30
jcmWFtkO&TN4hmpkU|<q<@^|(KR&a_4a0ZD@l&}B*XW<7c

diff --git a/tests/data/acpi/virt/SRAT.memhp b/tests/data/acpi/virt/SRAT.memhp
index 9a35adb40c6f7cd822e5af37abba8aad033617cb..01294cc892148dcd3e2bf9feff3fa936e2eb9e45 100644
GIT binary patch
delta 32
mcmaFF_=r&=ILI;N5d#AQvzU{=vq!LkQ$&EX0uW4;I0XQfnh3)H

delta 32
lcmaFF_=r&=ILI;N5d#AQbBvR}vq!LkQ$&C>NNl3SDFC003Bv#Y

diff --git a/tests/data/acpi/virt/SRAT.numamem b/tests/data/acpi/virt/SRAT.numamem
index 9526e5a28eb2a315d3bc9d9b11852319d5a8898e..d45f40338ce4c06ba68163214f149b2414c5f18b 100644
GIT binary patch
delta 30
jcmd1Gk_ZlR49Q|(U|>#l@^|(KR&a_4a8>|<i4s8oa$E;6

delta 30
jcmd1Gk_ZlR49Q|(U|?SD<nQbetl$(8;0zL*C=mnzdrk;2

diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/virt/SSDT.memhp
index 375d7b6fc85a484f492a26ccd355c205f2c34473..e8b850ae2239d8f496b12de672c2a1268e2f269d 100644
GIT binary patch
delta 33
ocmaFB`hZm;IM^lR0TTlQ<9{cAXOCb7zc3e1Uta}<jS?rA0JOLYFaQ7m

delta 33
ocmaFB`hZm;IM^lR0TTlQqrH>Avq!LkUzm%huP+0`Mu`(l0HqiSFaQ7m

-- 
MST


