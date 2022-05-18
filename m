Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD3052B820
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 12:52:05 +0200 (CEST)
Received: from localhost ([::1]:35122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrHHg-0006QQ-Rx
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 06:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrHFB-0004bk-NM
 for qemu-devel@nongnu.org; Wed, 18 May 2022 06:49:29 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:39880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrHF6-0003kB-MF
 for qemu-devel@nongnu.org; Wed, 18 May 2022 06:49:26 -0400
Received: by mail-ed1-x533.google.com with SMTP id m12so2447764edb.6
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 03:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ldVEvdS4sz/FO7yBVFoNr0NsDA9JSFCU5uF8mdCxqRs=;
 b=oOwnwlKGa6erPhenfLsHcp5qN6PGX5YgYCBzIuh9vOm2CSAuy545aHt42Pd4cjDY3C
 DMm6NjN6jAy40WrZa5Gk5DEBIVmk3x/jq6Xt4au00iIRdfbAe704bvylSgjfQEcEWNMo
 DYWC4qPS/Us7mmqc2xzYWOGbR1jEc1CtJ2goS7BGpkR2VrcjxiVS39WQLEWYCN0ClwmQ
 3PfRc4EWzOcd0/txEueXP00CMigdOAqMwNSmVtpiFviuYfB9H2UXGJX5a5TtA49yZ6Gp
 tnAwL13ME3pIAFSlS5kIitH1OrGVKogtVaWYEfkBhdv7c+UFALiPUTsazwE4DirbeueG
 liuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ldVEvdS4sz/FO7yBVFoNr0NsDA9JSFCU5uF8mdCxqRs=;
 b=QX7E405noRJt1vSNQm7TIlzhqQKV8gm1B24iN70/cJ1nSV3tPw70CFWLde3Q8rt56w
 QMbqSL2E7CoWV8MjR2Z7oNyNa0PxBTow+Jxq/iEPXezUNnPGtxLRfNvSG8ybmzyqm/Cz
 F94oubXEm5V3X9daucGRB5XeJXn3o6TwZOZ4xVWdkCpybuUdMupevB3d/Ee0/4Hx0H2Q
 8vHDg5i4Rh7bMHDPYLhLGBZeflvTHbdmZPuZEoGphet/wI67XU5DYiKSUM+FMQM7WRN/
 KIX4dP+lPGA6zPPCmCzws3TNyPnV0WTl2yt6pDJkCflbUqxA2SsVzYZbGwsFsglS7Ct1
 hEoQ==
X-Gm-Message-State: AOAM530NQYagN/6gOaToNd2sfYWNSVrIOClY01bNB8A5nCrcZ9fGSuXe
 TYhUCZcpXjg7s2QqjloOlDqR9fS1/To2a+FXAfCfjA==
X-Google-Smtp-Source: ABdhPJwHGVadrpNdVfd9cOoBwPFLbDis7jAkXcPETFaalTU3OOUJT0RMcziZpWTe48oOZgmUaf6ZNBQCrubE2CRaUDU=
X-Received: by 2002:a05:6402:3223:b0:42a:e66e:f727 with SMTP id
 g35-20020a056402322300b0042ae66ef727mr3115868eda.109.1652870963033; Wed, 18
 May 2022 03:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220516152610.1963435-1-imammedo@redhat.com>
 <20220516152610.1963435-35-imammedo@redhat.com>
In-Reply-To: <20220516152610.1963435-35-imammedo@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 18 May 2022 16:19:11 +0530
Message-ID: <CAARzgwzVm3PEBTiB-4gcSaN2_ywOmyr-kfY+vyQw5CEAab7F5Q@mail.gmail.com>
Subject: Re: [PATCH 34/35] tests: acpi: update expected
 DSDT.tis.tpm2/DSDT.tis.tpm12 blobs
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, minyard@acm.org, 
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::533;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 16, 2022 at 8:57 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> expected move of tmp-tis device description directly under
> Device(ISA) node.
>
> for tpm-tis 2.0:
>
>   @@ -145,6 +145,189 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
>            {
>                Name (_ADR, 0x001F0000)  // _ADR: Address
>                OperationRegion (PIRQ, PCI_Config, 0x60, 0x0C)
>   +            Device (TPM)
>   +            {
>   +                Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // _HID: Hardware ID
>   +                Name (_STR, "TPM 2.0 Device")  // _STR: Description String
>   +                Name (_UID, One)  // _UID: Unique ID
>   +                Name (_STA, 0x0F)  // _STA: Status
>     ...
>   +            }
>
>   @@ -3281,189 +3464,6 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
>                Method (PCNT, 0, NotSerialized)
>                {
>                }
>   -
>   -            Device (TPM)
>   -            {
>   -                Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // _HID: Hardware ID
>   -                Name (_STR, "TPM 2.0 Device")  // _STR: Description String
>   -                Name (_UID, One)  // _UID: Unique ID
>   -                Name (_STA, 0x0F)  // _STA: Status
>     ...
>   -            }
>
> for tpm-tis 1.2:
>
>   @@ -145,6 +145,188 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
>            {
>                Name (_ADR, 0x001F0000)  // _ADR: Address
>                OperationRegion (PIRQ, PCI_Config, 0x60, 0x0C)
>   +            Device (TPM)
>   +            {
>   +                Name (_HID, EisaId ("PNP0C31"))  // _HID: Hardware ID
>   +                Name (_UID, One)  // _UID: Unique ID
>   +                Name (_STA, 0x0F)  // _STA: Status
>     ...
>   +            }
>
>   @@ -3281,188 +3463,6 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
>                Method (PCNT, 0, NotSerialized)
>                {
>                }
>   -
>   -            Device (ISA.TPM)
>   -            {
>   -                Name (_HID, EisaId ("PNP0C31"))  // _HID: Hardware ID
>   -                Name (_UID, One)  // _UID: Unique ID
>   -                Name (_STA, 0x0F)  // _STA: Status
>     ...
>   -            }
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Acked-by: Ani Sinha <ani@anisinha.ca>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h |   2 --
>  tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 8885 -> 8880 bytes
>  tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 8906 -> 8906 bytes
>  3 files changed, 2 deletions(-)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index 7b3bf9a207..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,3 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/q35/DSDT.tis.tpm2",
> -"tests/data/acpi/q35/DSDT.tis.tpm12",
> diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
> index 0b5c97fdb5da8b7b55d6b5f2af498a447fda7bf8..a97d884c50485f848054c6ac95ecfa055ff59e5b 100644
> GIT binary patch
> delta 89
> zcmdn$y1|vpCD<iogAxM+quxfYn~XZHW_t0#PVoWGo(9oP9;Tkbj`1AvjxIqw3=HxN
> r(G3BfL4izM30yqUO%AG?(-r)fHghwv%5nLz#DKI3xUo!@Qg8tPLai3C
>
> delta 95
> zcmdnsy497-CD<ios}chP<Nl3YHyJgY1@+>Co#F$WJq@Cp+yp#>9pgFT9bJNW7#QRk
> vq8kD{g94ej61aFa$Fi`>ak*;6fK&_kYEI5ka^Z|_a#hs>Y1z!r<i`X6>g5>c
>
> diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
> index 4e16b126cc1c32f2346078fa69c5261c245d15e8..1f5392919b5ea69696b49ff13aab5c37d0615919 100644
> GIT binary patch
> delta 85
> zcmX@*ddii{CD<k8loA62<JFB^HyJhj&Gq7go#F$WJq@CpoXkCg9pgFT9bJNW7#QRk
> nq8kD{g94ej61aFa$0_76ZRTcTmE-bbi2-R5aATP)rQiYpDU=p=
>
> delta 85
> zcmX@*ddii{CD<k8loA62<CBeCHyJgY1@+>Co#F$WJq@Cp+yp#>9pgFT9bJNW7#QRk
> nq8kD{g94ej61aFam$R_Sad~OSfK&@OX-{rba@owyl*0r7A8!`n
>
> --
> 2.31.1
>

