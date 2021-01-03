Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2302E89E7
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 02:42:11 +0100 (CET)
Received: from localhost ([::1]:49852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvsPK-00074W-FP
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 20:42:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1kvsMw-0005k5-8t
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 20:39:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:54986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1kvsMt-0005V6-Jd
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 20:39:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D161207A5
 for <qemu-devel@nongnu.org>; Sun,  3 Jan 2021 01:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609637977;
 bh=DdiV0466w6ksGEilSaCQtQjypNtQ16QtHij1MlUGVUE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=alD7UL6s9heTGODcekBIc/Ti8vwvDfr1D/nP1aLCX4uoO0DcefkLA4BsMF1UaxqHL
 3f1ONXCVXztWqinaLBFybw1II0fn42YsCssdyU/9SY9Y+8ElIeKXz38ahP6sPs/D31
 h3YE0HjTbp6tjDwOiPOgjV8azYBaYlI68IMWFJsru1XlqeGcZzANjlDuSQWl3Q60Tx
 eGur5fEXJ9wZnLYxDYsech3q15GsKv3ZeO9+J6fHIUUxGem9FhU8rmQlDRWDSOEFP4
 0e3dyYfk+C06R498b6Qm/2OW2Du1Z1FVyByrLQAGcYN41GGsHdX0eLMJQyN45W6O2Q
 zFK9sRbQ8Deaw==
Received: by mail-io1-f41.google.com with SMTP id u26so19138939iof.3
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 17:39:37 -0800 (PST)
X-Gm-Message-State: AOAM531+8a6u9NEV8gcBysRC6j9A6ZbifYWDeK8dLEAcrD/zejewqdbU
 VNq9C7VKaIt+Qr2CKyN4zYLGHw+bP4lSuUefpoQ=
X-Google-Smtp-Source: ABdhPJwPp7lviBcz5bbvGOIIm+zG5JowozKlGKQeimnBDsg6oIXoFB87w+2G5gHwvv4FF6+M0Aql7kS686B13ygM7Bk=
X-Received: by 2002:a6b:dc0f:: with SMTP id s15mr54158065ioc.180.1609637977029; 
 Sat, 02 Jan 2021 17:39:37 -0800 (PST)
MIME-Version: 1.0
References: <20201231224911.1467352-1-f4bug@amsat.org>
 <20201231224911.1467352-5-f4bug@amsat.org>
In-Reply-To: <20201231224911.1467352-5-f4bug@amsat.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 3 Jan 2021 09:39:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6n8ocQNaieJfiWb6qFGLoFnpQs2dbCNz2jb+dOEPDarw@mail.gmail.com>
Message-ID: <CAAhV-H6n8ocQNaieJfiWb6qFGLoFnpQs2dbCNz2jb+dOEPDarw@mail.gmail.com>
Subject: Re: [PATCH 04/18] hw/pci-host/bonito: Use
 pci_config_set_interrupt_pin()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Fri, Jan 1, 2021 at 6:49 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Replace pci_set_byte(PCI_INTERRUPT_PIN) by
> pci_config_set_interrupt_pin().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/pci-host/bonito.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index 4c903d4f682..fe94e6740b5 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -723,7 +723,8 @@ static void bonito_realize(PCIDevice *dev, Error **er=
rp)
>      pci_set_word(dev->config + PCI_SUBSYSTEM_ID, 0x0000);
>
>      pci_set_byte(dev->config + PCI_INTERRUPT_LINE, 0x00);
> -    pci_set_byte(dev->config + PCI_INTERRUPT_PIN, 0x01);
> +    pci_config_set_interrupt_pin(dev->config, 0x01); /* interrupt pin A =
*/
> +
>      pci_set_byte(dev->config + PCI_MIN_GNT, 0x3c);
>      pci_set_byte(dev->config + PCI_MAX_LAT, 0x00);
>
> --
> 2.26.2
>

