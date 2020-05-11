Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E471CCEFF
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 03:09:41 +0200 (CEST)
Received: from localhost ([::1]:52102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXwwu-0004eI-4Q
	for lists+qemu-devel@lfdr.de; Sun, 10 May 2020 21:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1jXwvK-0003oo-Jf
 for qemu-devel@nongnu.org; Sun, 10 May 2020 21:08:02 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:35527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1jXwvJ-0000yU-IQ
 for qemu-devel@nongnu.org; Sun, 10 May 2020 21:08:02 -0400
Received: by mail-lf1-x141.google.com with SMTP id x73so6056500lfa.2
 for <qemu-devel@nongnu.org>; Sun, 10 May 2020 18:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G2O4DwfQ4GOHUmaQT0DJr7TP2U5TisQKHYkZj1DaqZA=;
 b=qk3pB8UO903Va1wci/GX3h6FnUw00wv7bi8J/PnIiY/vMSMPlPACf+rLuXwxeLXNS6
 CBdHru4bOue+lu9rCu72asfqXE+85AQICyYmIyvLVCH+xfvn3lFCm6tcWGDJP81Sj+gU
 /KLZfkPYA2bQJhqKwU1hk5elzJoq7PNz+LZX46Rql+qOjdueZXPbCSi2yjHnp5ZsYiU4
 fH0kEYfUHEPGWqhJgeR5dPVqId1oaObviTHXCPxhKKPfzxJYn9y19u7w5DfGwPmS47km
 MtwH1T7AomBOrFl5VUwYM4XYhMSt8ZD7RBU6vCvj9Ukeg8HpQrUyxrWZWUNdNhu5ws/v
 q69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G2O4DwfQ4GOHUmaQT0DJr7TP2U5TisQKHYkZj1DaqZA=;
 b=hgUGs2Ap9BYr2Hd93jrFh/piLmt8yN3j5x78JQL/9QnPDSgIs/XNW6sDlCu6RfBDuh
 MY55YjTixXxSOBKkpm36bx2fWPSsy02rfJpYiOilpo/PMQIPEcK5hHh/7nqdm1J6q5lN
 zzArryWlLB35nnCKiL/OB4HdB0+2ZBnQSfZ1fPreXWGPgcWGEuZyCtjZRoGQJ2M3dcQF
 i/4CkgFFXOcDpwNolullDUtFQcd4Ivla1l1f+GpqlB+Agkgi3/omQBIVOe71BkBF/lvX
 3I7NzOysn6Dz1kdrSyc3vE/BwT/3iVhlEuf7c2rhA6Ct+IflEKBSl0Cc5ylq/Y8IZqdv
 aVGQ==
X-Gm-Message-State: AOAM530Hh0hMoVUst64msT2OXGpKEXJR9j61XrQlEVTU4C79d89g/v1Y
 8hJ+QlgB6Jx0LzfAc4/iLb0F4jEflRBBMUh60Ag=
X-Google-Smtp-Source: ABdhPJytr+BUklTsnkcncN3J/ynjsCAshItc4RD0a1cFOv2qdZZxK7wX5+G+cDS7HpgsjyZwu75KTrSMXGvW88bO+9E=
X-Received: by 2002:a19:7d02:: with SMTP id y2mr8812341lfc.146.1589159278851; 
 Sun, 10 May 2020 18:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200510210128.18343-1-f4bug@amsat.org>
 <20200510210128.18343-4-f4bug@amsat.org>
In-Reply-To: <20200510210128.18343-4-f4bug@amsat.org>
From: chen huacai <zltjiangshi@gmail.com>
Date: Mon, 11 May 2020 09:15:41 +0800
Message-ID: <CABDp7VpFeiPukCGNa5LQ9=TuAxAA8f-2Uwic3Jtd7a1zJAskGQ@mail.gmail.com>
Subject: Re: [PATCH 03/12] hw/mips/fuloong2e: Move code and update a comment
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::141;
 envelope-from=zltjiangshi@gmail.com; helo=mail-lf1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Huacai Chen <chenhuacai@gmail.com>, qemu-level <qemu-devel@nongnu.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Huacai Chen <chenhc@lemote.com>

On Mon, May 11, 2020 at 5:03 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Move the RAM-related call closer to the RAM creation block,
> rename the ROM comment.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/mips/mips_fulong2e.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
> index f067fa9720..4e1a3646af 100644
> --- a/hw/mips/mips_fulong2e.c
> +++ b/hw/mips/mips_fulong2e.c
> @@ -316,12 +316,11 @@ static void mips_fulong2e_init(MachineState *machin=
e)
>          error_report("Invalid RAM size, should be 256MB");
>          exit(EXIT_FAILURE);
>      }
> +    memory_region_add_subregion(address_space_mem, 0, machine->ram);
>
> -    /* allocate RAM */
> +    /* Boot ROM */
>      memory_region_init_rom(bios, NULL, "fulong2e.bios", BIOS_SIZE,
>                             &error_fatal);
> -
> -    memory_region_add_subregion(address_space_mem, 0, machine->ram);
>      memory_region_add_subregion(address_space_mem, 0x1fc00000LL, bios);
>
>      /*
> --
> 2.21.3
>
>


--=20
Huacai Chen

