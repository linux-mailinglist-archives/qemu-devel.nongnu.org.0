Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E8A4CFF34
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:54:44 +0100 (CET)
Received: from localhost ([::1]:35172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCst-00015z-3b
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:54:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nRBYR-0002Za-RY
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:29:31 -0500
Received: from [2a00:1450:4864:20::52e] (port=38762
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nRBYQ-00087c-74
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:29:31 -0500
Received: by mail-ed1-x52e.google.com with SMTP id h13so7260059ede.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 03:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=J21zH3fYlhjS0GU+iaGX/TH24s6n7rV6E/CuIp+VM/U=;
 b=mNxZ697Ao/rFVk0WHrPMME6GBwGFO5JFv45qut5AjyfKX1xxV40WAt4v8y4kHRhpIT
 Zc2jRhuYfnrFS38Y7fnXjx5cq4NVMqJHCVIsvOeu4dITIaw3ZaH2w0BAloJkTaoYL34s
 3e388qPeWMerP2hhyletYTTxnPvvFWEOCzQeWloJYJioYGeAlpykds1wNGylvk3Ll//r
 JxspSVxWNVMDjeKjRc2qrg0vewuaXycea9I+9th1wiiQWVMj+NqPi6l5T0OCS8y/RjwQ
 iv5Qx1Ee5W5A5gjZQZsKqBi2FQnKGy+ruOyFNsmZa99g9HDjhleDg0nC9JYP7D3R0YdO
 8lpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=J21zH3fYlhjS0GU+iaGX/TH24s6n7rV6E/CuIp+VM/U=;
 b=fEheFgRwbD2McV/XaVEH8kbT/PesTQF6ch1R9iE/8j/C1BZSEYltey5MbzpJugYmNc
 HNWM/bQdMPQ4JYiVYLwSln2HO6rCJKIHnqz3B25R1q63O681HGUdqUHCaAsBPOHOVetc
 mJ0HQl1rUVGHDox7xrNHCyrOTdjmtQuHZ5w/bAd44a5PFDDp15ur+cNCxXgPamgGXI0Y
 +/i9V7uUrH8U+6Xm26OHXOhj/NIyWh2jeVG6UhTV5IWUwiMdG0GyPdUSUCRTBruu1waS
 Vkv204E31zM1s/ldl4dkASXbZcxi/nQ/SReGMJmoq0y3AajtNTxSZ8aDdZpQCcAJMJlE
 KEBg==
X-Gm-Message-State: AOAM531CPTZsW4+tOKEn+7yk6UWM0JM03T0kQPnFpUw0JWNXir4cgCuw
 exzeEK+9/lBqvsMxESrv1nk=
X-Google-Smtp-Source: ABdhPJw8JOQhg802JZqSJYhmOeK8OSKQx7e8tYqI/tnWzp2UhUA+hE0KzR0ddYdyKBO+c/uTSIkLLg==
X-Received: by 2002:a05:6402:268b:b0:416:1daf:7170 with SMTP id
 w11-20020a056402268b00b004161daf7170mr10321559edd.18.1646652568113; 
 Mon, 07 Mar 2022 03:29:28 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-143-092.89.12.pool.telefonica.de.
 [89.12.143.92]) by smtp.gmail.com with ESMTPSA id
 f15-20020a50e08f000000b004134a121ed2sm6201426edl.82.2022.03.07.03.29.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Mar 2022 03:29:27 -0800 (PST)
Date: Mon, 07 Mar 2022 11:29:26 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PULL 15/16] isa: Inline and remove one-line isa_init_irq()
In-Reply-To: <20220307101207.90369-16-philippe.mathieu.daude@gmail.com>
References: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
 <20220307101207.90369-16-philippe.mathieu.daude@gmail.com>
Message-ID: <E2DDF5EB-984C-42B9-9BA4-EA4C577EFA5B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 7=2E M=C3=A4rz 2022 10:12:06 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philippe=2Emathieu=2Edaude@gmail=2Ecom>:
>From: Bernhard Beschow <shentey@gmail=2Ecom>
>
>isa_init_irq() has become a trivial one-line wrapper for isa_get_irq()=2E
>It can therefore be removed=2E
>
>isa_ipmi_kcs)
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>Reviewed-by: Stefan Berger <stefanb@linux=2Eibm=2Ecom> (tpm_tis_isa)
>Acked-by: Corey Minyard <cminyard@mvista=2Ecom> (isa_ipmi_bt,
>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>Acked-by: Gerd Hoffmann <kraxel@redhat=2Ecom>
>Message-Id: <20220301220037=2E76555-8-shentey@gmail=2Ecom>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>---
> hw/isa/piix4=2Ec | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/hw/isa/piix4=2Ec b/hw/isa/piix4=2Ec
>index fc3c8b3fd1=2E=2E8607e0ac36 100644
>--- a/hw/isa/piix4=2Ec
>+++ b/hw/isa/piix4=2Ec
>@@ -216,7 +216,7 @@ static void piix4_realize(PCIDevice *dev, Error **err=
p)
>     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
>         return;
>     }
>-    isa_init_irq(ISA_DEVICE(&s->rtc), &s->rtc=2Eirq, s->rtc=2Eisairq);
>+    s->rtc=2Eirq =3D isa_get_irq(ISA_DEVICE(&s->rtc), s->rtc=2Eisairq);
> }
>=20
> static void piix4_init(Object *obj)

Hey Phil,

it looks like the majority of the patch is missing (only the resolved merg=
e conflict is there)=2E I can send this patch series rebased onto my Malta =
one which I could do later this day=2E

Best regards,
Bernhard

P=2ES=2E Unfortunately I can only do this work in my free time=2E Thus it =
can sometimes take a while until I respond=2E

