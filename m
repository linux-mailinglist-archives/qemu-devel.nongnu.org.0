Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB2C4B6B8C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 12:54:17 +0100 (CET)
Received: from localhost ([::1]:60808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJwPQ-0004YM-JS
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 06:54:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vishwa.mg@gmail.com>)
 id 1nJwNd-0003nh-ML
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 06:52:25 -0500
Received: from [2607:f8b0:4864:20::1036] (port=55274
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vishwa.mg@gmail.com>)
 id 1nJwNK-0007c6-Ai
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 06:52:08 -0500
Received: by mail-pj1-x1036.google.com with SMTP id b8so5306265pjb.4
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 03:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=j8UaSfCrr34zqlSoHpHyJsiXIr02m/jhyOaoUGxw/fo=;
 b=BkZ6MnV7knDAKZwN8uzOCV1DCN6RVX3/b0g8HbvGlbLLmnhKR9D+3ONDHD/DVb6ucE
 k4H0iLGxlXEO5VrkXb9O9IxoasZvKXIZey3oAv2c+ZAhNw666RdaW0KWkSQ//rYICYkl
 dbl8SZGSFz+fMkB0dliU04z1qUvn5Y+WIpxWowFVC8XensJJkWlKXlu2KiS5FvYES6Qm
 zNaIPcoJZX9GIWc8m2oopq9gAVKE5scIkpy0tenoT+PDq2ARHvnFhHQhMOnAZ4eBxu4Q
 eIxa+D6WKWRYODts6HdCyAlH8Ft0Ssw3aQr2xzMQNRv3dt/Ulxz2y9jH3q9jJTa+VjHq
 Saeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=j8UaSfCrr34zqlSoHpHyJsiXIr02m/jhyOaoUGxw/fo=;
 b=cim3hxvwIyzh/Akcfyhz5R9c/7iFLMS2lPVB9vG1Scn2MJEWNVQ1kYuseLrGrEGmLJ
 s5UFjSEAFAKwAjanR22W5TSmf23AQFPFAsePA/eVqtRDnLcrOT6KQBXerzHGV9cUPw10
 a5jdYyl6NzQI8xTUhCtPQqojmqS66cErtGpNtxi6FgP9w70M+pDH0fDzF+hQAaBPEOEq
 zsJKm67TsKinHt7wodncGlQ9MzcQbFZeN+0P7Q5WzoJQTydEjzNv6YmPJrvrD7xsm79b
 6P8t5IZiPCQ12MnO5i3WURp2Hg133LyKO7K1wdfKGbb4r+11YwXoq9gW1dmImO/UsJm2
 ZzWA==
X-Gm-Message-State: AOAM532RCXX3t6QOWwXcAC0P1K3oHPmH1II5ea3fCsFDOzhdR3KYZ9oO
 Xgs4Wf58S1QjniPohkX7fa8r+2ld8z39Wk+msGtyI5me0i1a
X-Google-Smtp-Source: ABdhPJz7A/UnsPlLGXZgs9USZTkIqQo+3HogfyvPy/78vcbs5TuyTKUac7d75SVyYCrOmRSLOgNn8ICX2J8Z4S/FOsg=
X-Received: by 2002:a17:90b:3ec8:: with SMTP id
 rm8mr3994747pjb.138.1644925924097; 
 Tue, 15 Feb 2022 03:52:04 -0800 (PST)
MIME-Version: 1.0
From: Vishwanath MG <vishwa.mg@gmail.com>
Date: Tue, 15 Feb 2022 17:21:52 +0530
Message-ID: <CABDZEhG8wJo4x71HvM_oCNF7rQkjyy-YFV76j2+BuiwcXdyz4Q@mail.gmail.com>
Subject: Implementing ATC[Address Translation Cache] within emulated pcie
 end-point
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000063413b05d80d29c7"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=vishwa.mg@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000063413b05d80d29c7
Content-Type: text/plain; charset="UTF-8"

  Looking for QEMU support in emulating ATC inside pcie EP (emulated). So
that ATC behaviour can be modelled, deriving right set of ATC parameters
and the right caching algorithm.

Looked at patches
https://lists.nongnu.org/archive/html/qemu-devel/2016-11/msg00642.html
where ATS support has been added for  virtio kind of devices.

e.g, using virtio device
qemu-system-x86_64 \
    -machine q35,accel=kvm,kernel_irqchip=split \
    -enable-kvm \
    -vga none -nographic \
    -device intel-iommu,intremap=on,caching-mode=on,device-iotlb=on
    -device vfio-pci,host=03:00.0 \
    -device
virtio-net-pci,netdev=mynet0,disable-legacy=on,disable-modern=off,iommu_platform=on,ats=on

In our use case, virtio-net-pci would be simple pcie EP, which implements
ATC needs following infra
1. IOMMU invalidate request needs to be propagated to EP, so that ATC would
be flushed
2. Ability to send ATS requests to the hypervisor layer to populate IOTLB
entries
3. Ability to request for page to hypervisor, when page fault occurs at EP

exploring intel_iommu devices, to see if such a API;s are provided. Any
help in this
would be highly appreciated.

thanks
Vishwa.mg ( @samsung)

--00000000000063413b05d80d29c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">=C2=A0 Looking for QEMU support in emulating ATC inside pc=
ie EP (emulated). So<br>that ATC behaviour can be modelled, deriving right =
set of ATC parameters<br>and the right caching algorithm.<br><br>Looked at =
patches <a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/2016-11=
/msg00642.html">https://lists.nongnu.org/archive/html/qemu-devel/2016-11/ms=
g00642.html</a><br>where ATS support has been added for =C2=A0virtio kind o=
f devices.<br><br>e.g, using virtio device<br>qemu-system-x86_64 \<br>=C2=
=A0 =C2=A0 -machine q35,accel=3Dkvm,kernel_irqchip=3Dsplit \<br>=C2=A0 =C2=
=A0 -enable-kvm \<br>=C2=A0 =C2=A0 -vga none -nographic \<br>=C2=A0 =C2=A0 =
-device intel-iommu,intremap=3Don,caching-mode=3Don,device-iotlb=3Don<br>=
=C2=A0 =C2=A0 -device vfio-pci,host=3D03:00.0 \<br>=C2=A0 =C2=A0 -device vi=
rtio-net-pci,netdev=3Dmynet0,disable-legacy=3Don,disable-modern=3Doff,iommu=
_platform=3Don,ats=3Don<br><br>In our use case, virtio-net-pci would be sim=
ple pcie EP, which implements ATC needs following infra<br>1. IOMMU invalid=
ate request needs to be propagated to EP, so that ATC would be flushed<br>2=
. Ability to send ATS requests to the hypervisor layer to populate IOTLB en=
tries<br>3. Ability to request for page to hypervisor, when page fault occu=
rs at EP<br><br>exploring intel_iommu devices, to see if such a API;s are p=
rovided. Any help in this<br>would be highly appreciated.<br><br>thanks<br>=
Vishwa.mg ( @samsung)<br></div>

--00000000000063413b05d80d29c7--

