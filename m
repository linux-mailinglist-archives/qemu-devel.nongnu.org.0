Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6C36D3EAE
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 10:10:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjFFU-0003xp-1r; Mon, 03 Apr 2023 04:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pjFFO-0003xB-CI
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 04:09:05 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pjFFM-0000yX-Sf
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 04:09:02 -0400
Received: by mail-ed1-x52a.google.com with SMTP id er13so72785445edb.9
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 01:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680509339;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h7gZ4I+1THSU6WybzqtCa4itJGFjNPYCsJ3+ZxZ33L8=;
 b=g/yKJq8X2JpUJmxLRLkfW2Ei4bn+orZIp2D0WXpN1GZ8fDDktL6EaELr85Ejz5DqtK
 M2UYewx344latdwSIgrNpZqcOWCSxZPSz9KPBE08Fjt7braFb+Cn0U59CmirAOW6iLiy
 rC8auNdRyR0+Pgrda8sTcY8swp8rvrDMlM4Ci/izaFEF7vWBVKv6zJaY8Vn/59ZZso0B
 QSad5dETKrLhgqX+jCTxh6+1yopnRJzr94Kcc+ZXunE0a4h2viUpjqtvwpIvJFVIN+6X
 iDVk7Ii3wNE+Pz1f7gL5LFqzch0JlgA2B2dqA+6KAgy0pdh0b+dGQiY65MHJdvvQMfeW
 mjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680509339;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h7gZ4I+1THSU6WybzqtCa4itJGFjNPYCsJ3+ZxZ33L8=;
 b=soRmOHzf9CsITQZ5z8fLeiG/f5aCtHlN/jao5l98720tEzQhHXKMDNjan76GJfnDJH
 xbh6MqCAcxljdhcjAIcrPWducoBviQkRe/Pp5hpFFoQ5XYgedStIUkgf0BKQkOM18NvR
 +0hPUz3668UZow5YirPwwqkxMvQ+P5/ea8WkDKofdvTfwtC3uk2+4GMsUuqkRGojp27K
 nxrW5zEtTn63soCF1Q1NWAUKjq9SuskGZAgFQ40MvQdlp0mMz0zSCVs1uEAddu3ny97K
 gRUvP45vr80ubv60OdG0dSevo6joyV2Ww/1IeDbrZpPaHyVxFobIzfmNIj1uCjxd2WPV
 s5QQ==
X-Gm-Message-State: AAQBX9e5feTy6U3dSuTgdWqtQ9ENHPfjuyLKnEyFhb99ETOC2+zQTY+w
 T6Ua0lvbp7Yag/DCrNDsz4w=
X-Google-Smtp-Source: AKy350YggZvBQRQXxduHGJx+5C4Cd2Q1/ABqM+BmlNa87irJ7SgtPy2crbAhiUHp2jFkWurGwsvNoA==
X-Received: by 2002:a17:907:8694:b0:947:c221:eb38 with SMTP id
 qa20-20020a170907869400b00947c221eb38mr11083800ejc.13.1680509339124; 
 Mon, 03 Apr 2023 01:08:59 -0700 (PDT)
Received: from [127.0.0.1] ([62.214.191.67]) by smtp.gmail.com with ESMTPSA id
 r30-20020a50aade000000b004f9e6495f94sm4252444edc.50.2023.04.03.01.08.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 01:08:58 -0700 (PDT)
Date: Mon, 03 Apr 2023 08:08:49 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>, 
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/6=5D_hw/isa/piix3=3A_Reuse?=
 =?US-ASCII?Q?_piix3=5Frealize=28=29_in_piix3=5Fxen=5Frealize=28=29?=
In-Reply-To: <7F45B51F-F1E3-4F04-A46F-4C80509C7195@gmail.com>
References: <20230312120221.99183-1-shentey@gmail.com>
 <20230312120221.99183-3-shentey@gmail.com>
 <f52c41f7-e662-4afd-8ac9-ce2c0da2b1be@perard>
 <7F45B51F-F1E3-4F04-A46F-4C80509C7195@gmail.com>
Message-ID: <B4AB508E-C750-4D5E-BF89-908082A1CD84@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
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



Am 1=2E April 2023 22:36:45 UTC schrieb Bernhard Beschow <shentey@gmail=2E=
com>:
>
>
>Am 30=2E M=C3=A4rz 2023 13:00:25 UTC schrieb Anthony PERARD <anthony=2Epe=
rard@citrix=2Ecom>:
>>On Sun, Mar 12, 2023 at 01:02:17PM +0100, Bernhard Beschow wrote:
>>> This is a preparational patch for the next one to make the following
>>> more obvious:
>>>=20
>>> First, pci_bus_irqs() is now called twice in case of Xen where the
>>> second call overrides the pci_set_irq_fn with the Xen variant=2E
>>
>>pci_bus_irqs() does allocates pci_bus->irq_count, so the second call in
>>piix3_xen_realize() will leak `pci_bus->irq_count`=2E Could you look if
>>pci_bus_irqs_cleanup() can be called before the second pci_bus_irqs()
>>call, or maybe some other way to avoid the leak?
>
>Thanks for catching this! I'll post a v4=2E

V4 is out=2E

Thanks,
Bernhard

>
>I think the most fool-proof way to fix this is to free irq_count just bef=
ore the assignment=2E pci_bus_irqs_cleanup() would then have to NULL the at=
tribute such that pci_bus_irqs() can be called afterwards=2E
>
>BTW: I tried running qemu-system-x86_64 with PIIX4 rather than PIIX3 as X=
en guest with my pc-piix4 branch without success=2E This branch essentially=
 just provides slightly different PCI IDs for PIIX=2E Does xl or something =
else in Xen check these? If not then this means I'm still missing something=
=2E Under KVM this branch works just fine=2E Any idea?
>
>Thanks,
>Bernhard
>
>>
>>> Second, pci_bus_set_route_irq_fn() is now also called in Xen mode=2E
>>>=20
>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>> Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>>
>>Beside the leak which I think can happen only once, patch is fine:
>>Reviewed-by: Anthony PERARD <anthony=2Eperard@citrix=2Ecom>
>>
>>Thanks,
>>

