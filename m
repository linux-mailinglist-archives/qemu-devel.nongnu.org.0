Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D0B4C9871
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:40:26 +0100 (CET)
Received: from localhost ([::1]:56038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPBAP-0007c6-5d
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:40:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nPAaa-0006HW-VN
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:03:24 -0500
Received: from [2a00:1450:4864:20::62f] (port=40738
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nPAaY-0005YY-MH
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:03:24 -0500
Received: by mail-ej1-x62f.google.com with SMTP id p15so34274538ejc.7
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:subject:in-reply-to:references:message-id:mime-version
 :content-transfer-encoding;
 bh=EneF8QB96bbp/smwy9Gz/bMg2ZNgySBSsKvcpJt4d1U=;
 b=mC71vhu0t3SkPODltxP100JfmJZiqq1NkuxWSiwdc1gsmREpiNR2i8leDnJ0CGfuQb
 iKQwEQs7ppeWpJQC7CGisiO9WiPUg/d+v7gOdbgEQz1C1LovJwj5zzrdTovaeRIwgExZ
 AsunIv1dgwouC3x+zRLC83NHIvwo+cfEavMY4QcnWLioNsQdR2mju5w4xW1RYyXZxAga
 ORfgS0uiejs0dKHbuY1jVXlCobj7rHUUCQBznY3r2lccNdzrxupSDfLHGWnzTR7zm5TF
 Vy+S6uTCrKdZQ24MMjVcoTUygt2OIa2w9EXWvhkd55u9ek3s4WHdv5HqQdJE6O0SaGqZ
 6SoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=EneF8QB96bbp/smwy9Gz/bMg2ZNgySBSsKvcpJt4d1U=;
 b=1uFj3vjZu/74BB7Gvrs3k8fW76OwdO+YVDpvM3SDSUJAUWelgG02T5XRWxzhL29JyF
 7ypWAYWpPVysPetyEHJq7MhqH9fbpaNvNe5uarwUd0jwRo+Mro/LKB2u+0A0HXSyltH+
 Y43zav71zWYaiidphjHYP5L7tV3ZmFyL/ns0jyM+khuDBRahhGCbP7oVhTVXndw8oxVQ
 NclIaJuRuGQjiuTwXzYwxgpxtgnEAz/653NKOdv3+EhtOK+nLeYMGZuaYJAYmVO3q6m8
 HTZjDFi/vsY0uZyBdNfiT2hBZMitcaiRNekNQqW2wjXxKtMxnOJL9UirtYCRgcBa7cTv
 WPsg==
X-Gm-Message-State: AOAM531BE0blB1m6lXZlCdMCpINRe8SVSJJuSYWCjKN6BdKM61c709PV
 p/BaTOTlWflz1L8K7/pCJ6E=
X-Google-Smtp-Source: ABdhPJzR6WjyBf0KrMkH8wx762yPx4PyAEZpOcaVKHbKwq7lWuV2z3AWRINXkIr96JPQ1hC5WyJG+A==
X-Received: by 2002:a17:906:a1c2:b0:6d6:d54d:4fb1 with SMTP id
 bx2-20020a170906a1c200b006d6d54d4fb1mr7096690ejb.490.1646172201220; 
 Tue, 01 Mar 2022 14:03:21 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-055-004-046.78.55.pool.telefonica.de.
 [78.55.4.46]) by smtp.gmail.com with ESMTPSA id
 k7-20020a170906578700b006d59878f60csm5619982ejq.207.2022.03.01.14.03.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Mar 2022 14:03:20 -0800 (PST)
Date: Tue, 01 Mar 2022 22:03:17 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_00/22=5D_isa=3A_Resolve_un?=
 =?US-ASCII?Q?needed_IRQ_attributes_from_ISADevice?=
In-Reply-To: <6f9309d2-83d4-c09e-794f-3e9bb9202460@gmail.com>
References: <20220222193446.156717-1-shentey@gmail.com>
 <086da51d-1ed3-2726-d3f1-b5984b33991d@gmail.com>
 <6f9309d2-83d4-c09e-794f-3e9bb9202460@gmail.com>
Message-ID: <3B583940-46DB-4E3A-A167-0DE45AEED11B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 1=2E M=C3=A4rz 2022 12:04:24 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philippe=2Emathieu=2Edaude@gmail=2Ecom>:
>On 27/2/22 23:40, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 22/2/22 20:34, Bernhard Beschow wrote:
>>> v2:
>>> The newly QOM'ified devices now report an error to the user in their=
=20
>>> realize
>>> functions if the configured IRQ number is greater than 15=2E
>>>
>>> v1:
>>> The IRQ attributes of ISADevice are hardcoded to support up to two=20
>>> IRQs per
>>> device which creates an artificial limit=2E By not having the attribut=
es=20
>>> in the
>>> first place, this limitation can be avoided altogether=2E
>>>
>>> The IRQ attributes are mostly used for printing ('info qtree') and=20
>>> there is one
>>> user, hw/ppc/pnv, to use the attributes directly=2E As it turns out, t=
he=20
>>> printing
>>> is redundant if the IRQ numbers are exposed as QOM properties and=20
>>> hw/ppc/pnv
>>> can be easily ported away=2E
>>>
>>> The patch series is structured as follows: Patch 1-3 QOM'ify the last=
=20
>>> devices
>>> which rely on printing their IRQ numbers via the ISADevice attributes=
=2E=20
>>> Patch
>>> 4 and 5 remove the last users of the ISADevice attributes such that=20
>>> they can be
>>> removed in patch 6=2E The remainder of the patch series is cleanup=2E
>>>
>>> Patch 6 turns isa_init_irq() into a trivial wrapper for isa_get_irq()=
=2E=20
>>> That is,
>>> the former function becomes redundant=2E All users are therefore=20
>>> converted to use
>>> isa_get_irq() directly=2E Finally, the last patch removes the now unus=
ed
>>> isa_init_irq()=2E
>>>
>>>
>>> Bernhard Beschow (22):
>>> =C2=A0=C2=A0 hw/rtc/mc146818rtc: QOM'ify IRQ number
>>> =C2=A0=C2=A0 hw/rtc/m48t59-isa: QOM'ify IRQ number
>>> =C2=A0=C2=A0 hw/input/pckbd: QOM'ify IRQ numbers
>>> =C2=A0=C2=A0 hw/isa/isa-bus: Remove isabus_dev_print()
>>> =C2=A0=C2=A0 hw/ppc/pnv: Determine ns16550's IRQ number from QOM prope=
rty
>>> =C2=A0=C2=A0 isa: Drop unused attributes from ISADevice
>>> =C2=A0=C2=A0 hw/audio/cs4231a: Disuse isa_init_irq()
>>> =C2=A0=C2=A0 hw/audio/gus: Disuse isa_init_irq()
>>> =C2=A0=C2=A0 hw/audio/sb16: Disuse isa_init_irq()
>>> =C2=A0=C2=A0 hw/block/fdc-isa: Disuse isa_init_irq()
>>> =C2=A0=C2=A0 hw/char/parallel: Disuse isa_init_irq()
>>> =C2=A0=C2=A0 hw/char/serial-isa: Disuse isa_init_irq()
>>> =C2=A0=C2=A0 hw/ide/isa: Disuse isa_init_irq()
>>> =C2=A0=C2=A0 hw/input/pckbd: Disuse isa_init_irq()
>>> =C2=A0=C2=A0 hw/ipmi/isa_ipmi_bt: Disuse isa_init_irq()
>>> =C2=A0=C2=A0 hw/ipmi/isa_ipmi_kcs: Disuse isa_init_irq()
>>> =C2=A0=C2=A0 hw/isa/piix4: Disuse isa_init_irq()
>>> =C2=A0=C2=A0 hw/net/ne2000-isa: Disuse isa_init_irq()
>>> =C2=A0=C2=A0 hw/rtc/m48t59-isa: Disuse isa_init_irq()
>>> =C2=A0=C2=A0 hw/tpm/tpm_tis_isa: Disuse isa_init_irq()
>>> =C2=A0=C2=A0 hw/isa/isa-bus: Disuse isa_init_irq()
>>> =C2=A0=C2=A0 isa: Remove unused isa_init_irq()
>>=20
>> Series:
>> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>
>If you can address the few comments, I'll queue the v3 via the
>MIPS tree=2E

[X] Done

Thank you!

Bernhard
>
>Thanks,
>
>Phil=2E


