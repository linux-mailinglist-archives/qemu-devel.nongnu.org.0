Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789024D616F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 13:21:33 +0100 (CET)
Received: from localhost ([::1]:36954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSeGy-0005wE-IZ
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 07:21:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nSeEl-00046z-Op
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 07:19:15 -0500
Received: from [2a00:1450:4864:20::62d] (port=36428
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nSeEk-0004ck-7m
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 07:19:15 -0500
Received: by mail-ej1-x62d.google.com with SMTP id bi12so18774969ejb.3
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 04:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6OwLSV26TEcf7TPkq4O2ae/LXTeOZt3UJYU6F0yOLzs=;
 b=P0vb8tgBMf0Ra7/g4hXrYgk35oCBeqc8XZwS9N0+Pa/2V7A4a4quQ2DnCg8S/fdxy+
 dpDSkNAUU1l3pmA8HZcfH5i6Y1HZyg8NHGyDA6YZ5nFCt9Ym+eAooJ0gpguR90Mn9VGA
 vg1hpA9sAeFIlImIJjbbpqbA1a7D14tDdcwsTJQQnsIsPxsrWOQ2gb0dcMV4CFVInMGE
 FSeDdnYwRvifeZb6zRmIJeXWm7nXYKJ1j1EQi8ZLmkt+qAFBO47Zz2CMkBYIFp32Eeel
 f0DcXUPVn1SQE8Ad3XdTm70/vaeW1Dci8vBbjCtVpG2TBg9FWjh8dzkzR7MlTliHJk/L
 z6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6OwLSV26TEcf7TPkq4O2ae/LXTeOZt3UJYU6F0yOLzs=;
 b=w1unE03ni/HHj6yRxVOVCRwVdNiqdftbRlaoKgykd+j+KVmMOxMUB3OrwlRsj9vrx5
 7d9gcKkMrQ02UQegCC2mGIv9q9T0xhy3L/j5eQM39VorznaMaP7HFASS9h8Hi9If04mn
 aSvdasUDhRHM5rmA9kJ2X9WhDh3X9PONFD6KukVnSIf9bzgG3X8rkj4jAsrssx5FA3bB
 bXsWesB/Lg/EAJ4Z8OvzHOLJsP3h0OLufuxokhfWJxknkVJM5oA6G0U04GoV8EaDhhTs
 bVSI3togGeZGSY+317m/TwHFdcEPST3N/ycUc4bJmXTp7WHXQlXb4ZpI+80+ZTtV22te
 wFdQ==
X-Gm-Message-State: AOAM533xNsFzXPfCccQwcQXp12A8p7LlpvMVg9xw+RkjLPucvWhL5hcK
 zJ3StxHpQwU14+8RkCoBh2/vbUn9AF0KyI9ot6lzOg==
X-Google-Smtp-Source: ABdhPJzV25kLIdLVlCT9qEZ+nAtCP2zu9iqFTOcbuUiVfpfC5WDyKLet1Ar+e0SuRCCZAiwPixZqIjS7RvcIs7rQLOk=
X-Received: by 2002:a17:907:3e8f:b0:6db:492c:f224 with SMTP id
 hs15-20020a1709073e8f00b006db492cf224mr8678437ejc.230.1647001152523; Fri, 11
 Mar 2022 04:19:12 -0800 (PST)
MIME-Version: 1.0
References: <20220311053759.875785-1-kraxel@redhat.com>
 <20220311053759.875785-8-kraxel@redhat.com>
In-Reply-To: <20220311053759.875785-8-kraxel@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 11 Mar 2022 17:49:01 +0530
Message-ID: <CAARzgwy4rpT8BU_0PKMCY4mtDjf8uevSx022reVArtREHGohRg@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] tests/acpi: update expected data files
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::62d;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 11, 2022 at 11:09 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The switch to edk2 RELEASE builds changes the memory layout a bit,
> resulting in a acpi table change.

I would actually also refer to the actual change (submodule update
etc) that results in this change. Otherwise its hard to track/bosect
stuff.

>
>  DefinitionBlock ("", "SSDT", 1, "BOCHS ", "NVDIMM", 0x00000001)
>  {
>      Scope (\_SB)
>      {
>          Device (NVDR)
>          {
>              Name (_HID, "ACPI0012" /* NVDIMM Root Device */)  // _HID: Hardware ID
>              Method (NCAL, 5, Serialized)
>              {
>                  Local6 = MEMA /* \MEMA */
>                  {
>                      Return (NCAL (Arg0, Arg1, Arg2, Arg3, 0x02))
>                  }
>              }
>
>              Device (NV02)
>              {
>                  Name (_ADR, 0x03)  // _ADR: Address
>                  Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
>                  {
>                      Return (NCAL (Arg0, Arg1, Arg2, Arg3, 0x03))
>                  }
>              }
>          }
>      }
>
> -    Name (MEMA, 0x43D10000)
> +    Name (MEMA, 0x43F50000)
>  }
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  tests/data/acpi/virt/SSDT.memhp | Bin 736 -> 736 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/virt/SSDT.memhp
> index 375d7b6fc85a484f492a26ccd355c205f2c34473..4c363a6d95a7e2e826568c85f5719127748e7932 100644
> GIT binary patch
> delta 22
> dcmaFB`hb-yIM^lR0TTlQqx43uD@;sZodHo~2HXGu
>
> delta 22
> dcmaFB`hb-yIM^lR0TTlQqy0v%D@;rmodHrj2HXGu
>
> --
> 2.35.1
>

