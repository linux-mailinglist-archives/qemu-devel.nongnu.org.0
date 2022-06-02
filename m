Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C206253C01B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 23:00:15 +0200 (CEST)
Received: from localhost ([::1]:49514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwrvS-0002yJ-T6
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 17:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nwrtj-0002FW-KT
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 16:58:27 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nwrth-0000VC-SD
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 16:58:27 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x17so7932587wrg.6
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 13:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=KItyHji4cwsRu4K+2ZKJvbYxG3R9yUH0ZlTTUNmGjsg=;
 b=JAXuc6ArQVpEszzTnVeWPllTDD+dQOQMTbWa3afjCIw75NhT0hgoiXFFURQqC+1mvF
 tT1EA4Sa+540OoC3m+hO9nIsqHBc0gT4KbIUp0+eVfs9L2nuWlo74wvosBuLPpOXT5cN
 eFd45fEJLoyJPCM2Mp8K/KReH50ixpgXwZTVrSxtLydZUJ3p0k25sHuVobqodu9SaPbI
 otZxwcp5K0TocjNRVK9wQ/UaL9HGyIE3ZzEBI/7erqJ8G50hy7zsD7kNFfMVF64WEwcf
 dCDXt13d9IpC0vKHDUp72uwrS200B4tz+/DFYrjNCDc0lIfQsVbyteNFFQPPGvRihB3R
 SMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=KItyHji4cwsRu4K+2ZKJvbYxG3R9yUH0ZlTTUNmGjsg=;
 b=CDCCzGfiYFCKTfu+h5PnunvjBaUtkKu2cNx4HeBxtcf3dlatsJhS8Z7Wob5GOmaHn5
 9gPUkMcRYBhtPQ1ACL/rvpH9FhLXB2h+3g5gspQM9FEzwXbfmdMeVOOafevk4Z38WxnD
 k+98oYxWPdt3ld4u5XQKKhHyKQMAa0J3ijgiMUdsTzJtxdOZBzNbE9kiUL7l+qPyUyNE
 6SmOoNv/3SMvgk+aTGBAA1jJAbHVYDVMpAvWjatoVaJr1i8Z3A7To4RLXYAXZMfwoaau
 NB2PQgvKhuqmRKth4WzOtSmF/suvUDYHxe/6Y6In0QlWexkRnZW3uZCfxexyMWfFph4W
 Od3Q==
X-Gm-Message-State: AOAM532tbqMS3cEIgLyTu7EFkhCtDyKNwXeLe8kUacSmb/D04R3xLsOk
 tFy6a3W3rSKS1bp4YA4FfbY=
X-Google-Smtp-Source: ABdhPJxzA3toP7xVwL5XjuGLSephiwP5sfpdjZuAkXfYOA0M5G337AomNUvUaklvGRPqX/AbX/FRgQ==
X-Received: by 2002:a5d:638b:0:b0:20f:c623:2597 with SMTP id
 p11-20020a5d638b000000b0020fc6232597mr4987004wru.271.1654203503957; 
 Thu, 02 Jun 2022 13:58:23 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf303d006574a04136d3cc25.dip0.t-ipconnect.de.
 [2003:fa:af30:3d00:6574:a041:36d3:cc25])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a5d4a8f000000b0020c5253d8edsm5286883wrq.57.2022.06.02.13.58.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Jun 2022 13:58:23 -0700 (PDT)
Date: Thu, 02 Jun 2022 20:58:20 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?=
 <philippe.mathieu.daude@gmail.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
CC: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_00/11=5D_hw/acpi/piix4=3A_r?=
 =?US-ASCII?Q?emove_legacy_piix4=5Fpm=5Finit=28=29_function?=
In-Reply-To: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
References: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
Message-ID: <95BF4F92-C111-424F-80AC-6CE9503025D7@gmail.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 30=2E Mai 2022 11:27:07 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <phili=
ppe=2Emathieu=2Edaude@gmail=2Ecom>:
>From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>
>This series moves the outstanding logic from piix4_pm_init() into
>the relevant instance init() and realize() functions, changes the
>IRQs to use qdev gpios, and then finally removes the now-unused
>piix4_pm_initfn() function=2E
>
>v2:
>- Addressed Ani & Bernhard review comments

Patch 4 still introduces the redundant include in acpi/piix4=2Ec, and perh=
aps all includes already included in the new piix4=2Eh could still be remov=
ed alrogether [1]=2E Anyway:
Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

[1] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-05/msg05756=
=2Ehtml

>
>If no further comments I plan to queue this via mips-next end of
>this week=2E
>
>Regards,
>
>Phil=2E
>
>Mark Cave-Ayland (11):
>  hw/acpi/piix4: move xen_enabled() logic from piix4_pm_init() to
>    piix4_pm_realize()
>  hw/acpi/piix4: change smm_enabled from int to bool
>  hw/acpi/piix4: convert smm_enabled bool to qdev property
>  hw/acpi/piix4: move PIIX4PMState into separate piix4=2Eh header
>  hw/acpi/piix4: alter piix4_pm_init() to return PIIX4PMState
>  hw/acpi/piix4: rename piix4_pm_init() to piix4_pm_initfn()
>  hw/acpi/piix4: use qdev gpio to wire up sci_irq
>  hw/acpi/piix4: use qdev gpio to wire up smi_irq
>  hw/i386/pc_piix: create PIIX4_PM device directly instead of using
>    piix4_pm_initfn()
>  hw/isa/piix4=2Ec: create PIIX4_PM device directly instead of using
>    piix4_pm_initfn()
>  hw/acpi/piix4: remove unused piix4_pm_initfn() function
>
> hw/acpi/piix4=2Ec               | 77 ++++++-----------------------------
> hw/i386/acpi-build=2Ec          |  1 +
> hw/i386/pc_piix=2Ec             | 16 +++++---
> hw/isa/piix4=2Ec                | 11 +++--
> include/hw/acpi/piix4=2Eh       | 75 ++++++++++++++++++++++++++++++++++
> include/hw/southbridge/piix=2Eh |  6 ---
> 6 files changed, 107 insertions(+), 79 deletions(-)
> create mode 100644 include/hw/acpi/piix4=2Eh
>


