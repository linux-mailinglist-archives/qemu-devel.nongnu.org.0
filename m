Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7F36A614F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 22:37:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX7dq-00085x-Cj; Tue, 28 Feb 2023 16:36:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pX7dm-00085S-UG
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:36:06 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pX7dl-0008Tk-1l
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:36:06 -0500
Received: by mail-ed1-x536.google.com with SMTP id i34so45844836eda.7
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 13:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677620163;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fkspXKIFCo/DLa6scIRI55yZnfTGbELE/HuEm4aUrn8=;
 b=U9pc7e5hei8O3QjnXjgLUp0yCtHPGEQNimG8OmdxkKLdZq45N3N4KYT9v3U9TEdMm9
 T7oa2gYCX/2+OIJ6W5qOfHk5m0okH/xaq2kiLhT9oQs8V1ZR7cYGrzehR3sE6OSvSP39
 hmkST74F7EBFdnlEgcOiNJP0BcqjCMRxcns3EpRUVgmsv8xJ+BYYyHU087UTYuMygUrO
 8gbcLqDkupRB0M5qewUh6YbWXFOfI5YKkdIHaSHivv09uo/3iIAwXG2ZTRS4op+cZuB0
 ijE1YAzViklNCUNHaBoGukDFOIaydEZEN7jyrqmNUVtng4SS+TGLP1xB75dvX6hnHSA1
 wg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677620163;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fkspXKIFCo/DLa6scIRI55yZnfTGbELE/HuEm4aUrn8=;
 b=gc/xeeYFQNTMQ8GwmTSjc2rvQAQbof3VcMMbWhyCOJeVHqBU8rPSC6+M2V0sEhY15P
 Xv2fFuXeg35NSWy4m1jp4mijCH/rPPLvr/OH05KSz4su269dneNIA6bpYcc+tgwiYExk
 I2SWECpwze293yGinPAsQbfprHDq2uzg53VJ8CN3nii1rL/SnA081lH3aK++9cUE3P8+
 pBPl8tNYRpJTZP29dqzcW9kmUK8D5hqQ1AEA29YjzZNUXMzYxG84UhDVIkpd+mNncLXO
 1mXrSRw9GHwWccF6ni7Io7/8WxVxHXHEZzu24E9mw+S697bMVV1JwcZt5xqtpOJ9gxHo
 Yk/A==
X-Gm-Message-State: AO0yUKXotsZmQw2GgGVFJtnT3bFyUuYbmMzFhHPENCJhte/nTkaY0qJj
 csDX/kSNRdrK0wBh/4LWIarm0J92IBQ=
X-Google-Smtp-Source: AK7set97Qhi8VOlZ7xvAudyPDOfFohUse7ctM0H2wom3RRHL9pDur0j6hKFAuA089aptDPBrPs5B0g==
X-Received: by 2002:a17:907:c207:b0:8f6:dc49:337f with SMTP id
 ti7-20020a170907c20700b008f6dc49337fmr5938100ejc.43.1677620163048; 
 Tue, 28 Feb 2023 13:36:03 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-013-091-172.77.13.pool.telefonica.de.
 [77.13.91.172]) by smtp.gmail.com with ESMTPSA id
 qp16-20020a170907207000b008eb5877a221sm4926695ejb.75.2023.02.28.13.36.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 13:36:02 -0800 (PST)
Date: Tue, 28 Feb 2023 21:35:53 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/4=5D_hw/southbridge/piix=3A_?=
 =?US-ASCII?Q?Use_OBJECT=5FDECLARE=5FSIMPLE=5FTYPE=28=29_macro?=
In-Reply-To: <20230210165754.34342-2-philmd@linaro.org>
References: <20230210165754.34342-1-philmd@linaro.org>
 <20230210165754.34342-2-philmd@linaro.org>
Message-ID: <6C95F114-3CC2-4258-8151-8CB678AA8DC3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



Am 10=2E Februar 2023 16:57:51 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>Manually convert to OBJECT_DECLARE_SIMPLE_TYPE() macro,
>similarly to automatic conversion from commit 8063396bf3
>("Use OBJECT_DECLARE_SIMPLE_TYPE when possible")=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> include/hw/southbridge/piix=2Eh | 8 +++-----
> 1 file changed, 3 insertions(+), 5 deletions(-)
>
>diff --git a/include/hw/southbridge/piix=2Eh b/include/hw/southbridge/pii=
x=2Eh
>index 0bf48e936d=2E=2Ea58bf13a41 100644
>--- a/include/hw/southbridge/piix=2Eh
>+++ b/include/hw/southbridge/piix=2Eh
>@@ -29,7 +29,7 @@
> #define PIIX_NUM_PIC_IRQS       16      /* i8259 * 2 */
> #define PIIX_NUM_PIRQS          4ULL    /* PIRQ[A-D] */
>=20
>-struct PIIXState {
>+struct PIIX3State {
>     PCIDevice dev;
>=20
>     /*
>@@ -57,14 +57,12 @@ struct PIIXState {
>     /* IO memory region for Reset Control Register (PIIX_RCR_IOPORT) */
>     MemoryRegion rcr_mem;
> };
>-typedef struct PIIXState PIIX3State;
>=20
> #define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
>-DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
>-                         TYPE_PIIX3_PCI_DEVICE)
>-
> #define TYPE_PIIX3_DEVICE "PIIX3"
> #define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
> #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
>=20
>+OBJECT_DECLARE_SIMPLE_TYPE(PIIX3State, PIIX3_PCI_DEVICE)
>+
> #endif

The PIIX consolidation series drops the "3" for reuse by PIIX4=2E Do we re=
ally need this?

