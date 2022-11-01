Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BC561550B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 23:33:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opzob-00066G-GR; Tue, 01 Nov 2022 18:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1opzoY-000644-An; Tue, 01 Nov 2022 18:32:58 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1opzoW-0000nj-9N; Tue, 01 Nov 2022 18:32:58 -0400
Received: by mail-wr1-x42d.google.com with SMTP id k8so22105786wrh.1;
 Tue, 01 Nov 2022 15:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a+Je3emlqwz311FGts3u9Oxxxyu5cMaoFK7FHON+5Rw=;
 b=fbZx6zzWF0hHE4zCdZTU1NtI+LgBNUx8M2NoCv9Ma3KZqJDNAG4+Q66OPmMTSlgM9E
 9aIuveFPLAeQw8Q/w38ZHVojAMdatvDmalm85f0hebXAQocT0/PQc1D1L4cC7o4AJZfx
 yxnVGaTWInE0gDs4oOXvjbFw0CFY0a5Uf5uVRZjY42sj93RhDTPzx6XrTkValoTUNk3X
 R+oFER6MPO0Q9vdvrsA6P2VfYW+YrrCiROlPzvLhDF2o8dr8w/Ks7JLcrfVK5kQ20Upg
 w6jkltlsNbPZsfvWcweSFIpw9DcJzK1pYLsC6lRa2ho6MdpMtalu4+p4VZM0louuyA1/
 2NwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a+Je3emlqwz311FGts3u9Oxxxyu5cMaoFK7FHON+5Rw=;
 b=Q5eFLqGwmxSMZpaZz5gwPIoYuRR+IS6AFditC2Z/UVN6hdpx15XQ175vf7YbN4mG+U
 q4W1TmW8voUQwgASwDjugnYIxB/q+8fKPsTiXS1WDz4F7yPDeu/q2yqcPbGMy1uLmq6r
 hL07+7yUBUuPM8CitpvB+Ivv2VjUEY/w7nJdDyrnzMT8pQhv2rU/HMjXpqUWQ8VYnGT2
 BgYsg6/unxGEr66HTkUyu0CenyVhHr+1xX2niYh/3dG4amnRn7G8qmJy4Awe2DVPPaaR
 H7TFMMqE5aA5YW/WUUx4ap1anFdX3bKVYGf/91lC4NcBu/cN+XffyYPgFT6Z7ntUzY1k
 E4aQ==
X-Gm-Message-State: ACrzQf1U30IN/WwYPuCep4o9a+izTk90ESs5ovmGcOSnYf/5Edbx0miU
 hG1zpiEMi1awWfa+9qYz3GI=
X-Google-Smtp-Source: AMsMyM6Az7AFXdlL1nGS77mNB+3H04jq5L1ujFqybrpnQ4puWCgN90WkNI84J+hnUnAfDZzvXrLUYg==
X-Received: by 2002:a5d:5643:0:b0:236:699c:6cd8 with SMTP id
 j3-20020a5d5643000000b00236699c6cd8mr13177308wrw.435.1667341974248; 
 Tue, 01 Nov 2022 15:32:54 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-183-156-150.77.183.pool.telefonica.de.
 [77.183.156.150]) by smtp.gmail.com with ESMTPSA id
 q17-20020a1cf311000000b003cf47fdead5sm39539wmq.30.2022.11.01.15.32.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 15:32:53 -0700 (PDT)
Date: Tue, 01 Nov 2022 22:32:45 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_1/6=5D_hw/sd/sdhci=3A_MMIO_r?=
 =?US-ASCII?Q?egion_is_implemented_in_32-bit_accesses?=
In-Reply-To: <20221031115402.91912-2-philmd@linaro.org>
References: <20221031115402.91912-1-philmd@linaro.org>
 <20221031115402.91912-2-philmd@linaro.org>
Message-ID: <C0DB8EC5-94F5-4376-ACDD-F987EFDE5604@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 31=2E Oktober 2022 11:53:57 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>

Indeed there is `offset & ~0x3` in both sdhci_{read,write}, so:
Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

>---
> hw/sd/sdhci=2Ec | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/hw/sd/sdhci=2Ec b/hw/sd/sdhci=2Ec
>index 0e5e988927=2E=2Ef9c5b58e6d 100644
>--- a/hw/sd/sdhci=2Ec
>+++ b/hw/sd/sdhci=2Ec
>@@ -1332,6 +1332,10 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t =
val, unsigned size)
> static const MemoryRegionOps sdhci_mmio_ops =3D {
>     =2Eread =3D sdhci_read,
>     =2Ewrite =3D sdhci_write,
>+    =2Eimpl =3D {
>+        =2Emin_access_size =3D 4,
>+        =2Emax_access_size =3D 4,
>+    },
>     =2Evalid =3D {
>         =2Emin_access_size =3D 1,
>         =2Emax_access_size =3D 4,


