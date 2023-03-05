Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5616AAE80
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 08:42:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYj08-0002RK-VR; Sun, 05 Mar 2023 02:41:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYj06-0002RA-9r
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 02:41:46 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYj04-000756-2d
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 02:41:45 -0500
Received: by mail-wr1-x429.google.com with SMTP id g3so5913398wri.6
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 23:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678002102;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BFv1ZVhGZzADJt39TiMInkThidBmBk/uc/lnbYlWeys=;
 b=csIfqS/smzPN3mdRWyS2iE85gFENHlWmN1J6cPw7zFUD4mj1tajGO4bcU3b7PqENzF
 HFa5L/kxHflcYjHs3p4mB3iRuEyM3ReFUG4Z3ZoE9c6bzdPO+ZAoiaU4X0EUtwAc1VBV
 PJeAkW9FXO0xU23wjVrjxM0NcyccYButVYVxLxU/BvpiUHPrPHnyIvhAExWiXopvzNdK
 8nEQJmo5D7wFt55ZbDRWLq/T4vOrTzG2f61F1lehHK3bP4lSelZNu5Uo1s1qbCjEeJJK
 KlMceVKCK43mD8lYRwgpQcOBmqB7y3g4cHl+KuCgwFQK3i7QQh5kNDmadlH4fovk0DMj
 EMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678002102;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BFv1ZVhGZzADJt39TiMInkThidBmBk/uc/lnbYlWeys=;
 b=gGxNIxB6x99DQ1T+Ov4OPse8TaRHIZJ3Mm1+qBlFHjSm7a1LO+y3kcOBBFpaGmvbiO
 Sz4rk5V3daJ93kypHs9/ttHKoKa5hlw9Rk/EV9FlGlFjaliIQVPyRJypZYlH5GruLru3
 4TJrKRkJeGl/euKU7chAz/qNxRgpsxYCDst8dlptA3ufbUbgaIwyGIbwBjJSgiCUVQg0
 pajggo4Ch6tCGGxTpOS2UBAC0qxzCrryDaoaScH6CFLeCJIeJOk9BLYf64jakeKsfuUb
 UzSzdq4a8tDb0vbo05XJTd70kHxwfCNnYu22NDQpXAWV2iP7V2x69YcxAWkf12bMTIL0
 WNSA==
X-Gm-Message-State: AO0yUKXXXbeK4NhFHJlCBmd2Esus2VPa+Srr2VZH3vvHLgU53UWzhUCm
 alEaORYAlpTLleVuWVQw+yg=
X-Google-Smtp-Source: AK7set+kHC7u70nYybhgheObpyusylRZhlbLRrHwMwA04LDLxsC0RgPQx2uPlolmeV+/rupt7FJ3bA==
X-Received: by 2002:adf:eec2:0:b0:2c5:9c7a:866 with SMTP id
 a2-20020adfeec2000000b002c59c7a0866mr5146896wrp.51.1678002102399; 
 Sat, 04 Mar 2023 23:41:42 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-054-176-138.78.54.pool.telefonica.de.
 [78.54.176.138]) by smtp.gmail.com with ESMTPSA id
 b12-20020adff24c000000b002c556a4f1casm6676568wrp.42.2023.03.04.23.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Mar 2023 23:41:42 -0800 (PST)
Date: Sun, 05 Mar 2023 07:41:33 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH 00/12] Q35 PCI host fixes and QOM cleanup
In-Reply-To: <16134200-0C75-4FFE-834D-6E081D7CA96E@gmail.com>
References: <20230214131441.101760-1-shentey@gmail.com>
 <A090A42F-D368-4671-9C91-716DD2D7CA64@gmail.com>
 <20230301164900-mutt-send-email-mst@kernel.org>
 <16134200-0C75-4FFE-834D-6E081D7CA96E@gmail.com>
Message-ID: <9B20E043-A476-481A-B437-B9CFAC371FB7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x429.google.com
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



Am 2=2E M=C3=A4rz 2023 21:54:56 UTC schrieb Bernhard Beschow <shentey@gmai=
l=2Ecom>:
>
>
>Am 1=2E M=C3=A4rz 2023 21:49:37 UTC schrieb "Michael S=2E Tsirkin" <mst@r=
edhat=2Ecom>:
>>On Tue, Feb 21, 2023 at 03:39:28PM +0000, Bernhard Beschow wrote:
>>>=20
>>>=20
>>> Am 14=2E Februar 2023 13:14:29 UTC schrieb Bernhard Beschow <shentey@g=
mail=2Ecom>:
>>> >This series mostly cleans up QOM-related initialization code=2E It al=
so performs
>>> >
>>> >some modernization and fixing=2E
>>> >
>>> >
>>> >
>>> >The first patch originates from "PC and ICH9 clanups" series [1] whic=
h has been
>>> >
>>> >dropped in v3 in favor of another series [2]=2E Review comments in [2=
] suggest it
>>> >
>>> >needs more work, so bring the patch back here=2E
>>> >
>>> >
>>> >
>>> >Patch 2 fixes a clangd warning and patch 3 modernizes usage of the me=
mory API=2E
>>> >
>>> >
>>> >
>>> >Patches 4-9 clean up initialization code=2E
>>> >
>>> >
>>> >
>>> >The last four patches also clean up initialization code with the last=
 patch
>>> >
>>> >doing the actual cleanup=2E
>>> >
>>>=20
>>> Ping
>>
>>
>>sent some comments=2E
>
>I'll look into it over the weekend=2E I'm quite busy right now=2E

Forgot to mention: v2 is out!

>
>Best regards,
>Bernhard
>
>>Philippe was reviewing related patches maybe
>>he wants to poke at these too=2E
>>
>>> >
>>> >
>>> >Based-on: <20230213162004=2E2797-1-shentey@gmail=2Ecom>
>>> >
>>> >         "[PATCH v4 0/9] PC cleanups"
>>> >
>>> >
>>> >
>>> >Testing done:
>>> >
>>> >* `make check`
>>> >
>>> >* `make check-avocado`
>>> >
>>> >* `qemu-system-x86_64 -M q35 -m 2G -cdrom \
>>> >
>>> >     manjaro-kde-21=2E3=2E2-220704-linux515=2Eiso`
>>> >
>>> >
>>> >
>>> >[1] https://lore=2Ekernel=2Eorg/qemu-devel/20230131115326=2E12454-1-s=
hentey@gmail=2Ecom/
>>> >
>>> >[2] https://lore=2Ekernel=2Eorg/qemu-devel/20230203180914=2E49112-1-p=
hilmd@linaro=2Eorg/
>>> >
>>> >
>>> >
>>> >Bernhard Beschow (12):
>>> >
>>> >  hw/i386/pc_q35: Resolve redundant q35_host variable
>>> >
>>> >  hw/pci-host/q35: Fix contradicting =2Eendianness assignment
>>> >
>>> >  hw/pci-host/q35: Use memory_region_set_address() also for
>>> >
>>> >    tseg_blackhole
>>> >
>>> >  hw/pci-host/q35: Initialize PCMachineState::bus in board code
>>> >
>>> >  hw/pci-host/q35: Initialize "bypass-iommu" property from board code
>>> >
>>> >  hw/pci-host/q35: Initialize properties just once
>>> >
>>> >  hw/pci-host/q35: Initialize PCI hole boundaries just once
>>> >
>>> >  hw/pci-host/q35: Turn PCI hole properties into class properties
>>> >
>>> >  hw/pci-host/q35: Rename local variable to more idiomatic "phb"
>>> >
>>> >  hw/pci-host/q35: Propagate to errp rather than doing error_fatal
>>> >
>>> >  hw/pci-host/q35: Merge mch_realize() into q35_host_realize()
>>> >
>>> >  hw/pci-host/q35: Move MemoryRegion pointers to host device
>>> >
>>> >
>>> >
>>> > include/hw/pci-host/q35=2Eh |  17 +-
>>> >
>>> > hw/i386/pc_q35=2Ec          |  33 ++--
>>> >
>>> > hw/pci-host/q35=2Ec         | 325 ++++++++++++++++++----------------=
----
>>> >
>>> > 3 files changed, 178 insertions(+), 197 deletions(-)
>>> >
>>> >
>>> >
>>> >-- >
>>> >2=2E39=2E1
>>> >
>>> >
>>> >
>>

