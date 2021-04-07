Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23995357379
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 19:48:43 +0200 (CEST)
Received: from localhost ([::1]:47574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUCIE-0000PB-6I
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 13:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lUC8n-0001f7-D9; Wed, 07 Apr 2021 13:38:58 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:35729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lUC8j-00072p-Vf; Wed, 07 Apr 2021 13:38:57 -0400
Received: by mail-il1-x12b.google.com with SMTP id c3so8802503ils.2;
 Wed, 07 Apr 2021 10:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zF8MahqpSHuNCU/Vb40PI3wP1SoF/nqZHW/Z5QW+ay4=;
 b=hPCn1I+5Voon1qVOShPBOdRWkCpXgphPkPSC8JjInKHcTU+iIZQvqXe9XCKLSVCGPR
 938AZAAZ9rlnS2Tt8nKUCQEh6AfheKd4fctcUgXLjxA4sghe8WgJdeuI2BoyxpTKRfMJ
 K40rC0BVZ3Lv7AJlSAXsw38M0JnJDkcuOMRyIextJH2UI5gNUsLzr1pv/xlRrTVsTXIx
 DrhnKOSM9A2FHXT7nPsAR/hEH2KxATPaCl13K/Ymyhx0nE2K9uWeq42Uen+wnvaZthPi
 39F0a/vWNiQeqnyyyBBwDpD8aaupHAFsIKFxJliW4V/egRI0RmmMl4Dnn5rPJZyjTQV3
 Y2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zF8MahqpSHuNCU/Vb40PI3wP1SoF/nqZHW/Z5QW+ay4=;
 b=Vr08bT10KOh6uYSFNRW0r/WaTIVH11DVlnNQGzdntciCF2/9eR3/mJDrdqfB0mB20D
 JCQSI4k/lS2k8vr9B0WQmWkUdXgftZom68uMDTcsx5Z3mxH7btWfUUiOINMLF1ekVA95
 GMj/DVC1N4XTcbLxB+wuT3XAyxgnPi9+ABA/XgMzStMA50m4srLjDTOmNDdXpABIQb00
 GkWqwQzC7GGFaO7i8zIw/Hpy66HSp9TLuXgscnEkOin5K2MDKjy2Xcl2tSS8zk7rDTZH
 FmVmqOFDcREV3lpYy5AfLOoLEvc1So/q0dG9fM5ZqX4E78MiKX3srMP1cf9m8/RwDzDN
 WjFQ==
X-Gm-Message-State: AOAM533Ra9X+/+Wkh5UcA7eUhRw5CaFxyr0qpuB0DWiLow2MbwqQpdwX
 lhBDGtMtrzTRZ5bzHVkxJ5owxQqkD2MbNKh1pDHw8dyukDo=
X-Google-Smtp-Source: ABdhPJy2kMBdSDcnti5hNU7PmkUJnNTFOhueGD70pipUIsxRR/9f3oUcL0JSU8mDWaCZEQ8LufPucdta/Y5+vCzNIBY=
X-Received: by 2002:a92:d383:: with SMTP id o3mr3493534ilo.131.1617817132522; 
 Wed, 07 Apr 2021 10:38:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-22-clg@kaod.org>
In-Reply-To: <20210407171637.777743-22-clg@kaod.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Apr 2021 13:36:32 -0400
Message-ID: <CAKmqyKPjASNO4R7DchGyf+2LE8JuJ06bXi7N8O7FrfEu3VkJMg@mail.gmail.com>
Subject: Re: [PATCH 21/24] hw/block: m25p80: Add support for mt25qu02g
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 7, 2021 at 1:35 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The Micron mt25qu02g is a 3V 2Gb serial NOR flash memory supporting
> dual I/O and quad I/O, 4KB, 32KB, 64KB sector erase. It also supports
> 4B opcodes.
>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Francisco Iglesias <francisco.iglesias@xilinx.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/m25p80.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 183d3f44c259..2afb939ae28e 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -259,6 +259,7 @@ static const FlashPartInfo known_devices[] =3D {
>      { INFO_STACKED("n25q00a",   0x20bb21, 0x1000, 64 << 10, 2048, ER_4K,=
 4) },
>      { INFO_STACKED("mt25ql01g", 0x20ba21, 0x1040, 64 << 10, 2048, ER_4K,=
 2) },
>      { INFO_STACKED("mt25qu01g", 0x20bb21, 0x1040, 64 << 10, 2048, ER_4K,=
 2) },
> +    { INFO_STACKED("mt25qu02g", 0x20ba22, 0x1040, 64 << 10, 4096, ER_4K,=
 2) },
>
>      /* Spansion -- single (large) sector size only, at least
>       * for the chips listed here (without boot sectors).
> --
> 2.26.3
>
>

