Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC7663AC09
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 16:17:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozfrw-000697-25; Mon, 28 Nov 2022 10:16:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozfro-000686-HB
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:16:20 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozfrm-0007wI-KU
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:16:20 -0500
Received: by mail-yb1-xb30.google.com with SMTP id 1so13681966ybl.7
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 07:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8GMWFQOUXGSaFfctGrIpjQSYGbDJe8Vji+WzLKr2G0o=;
 b=kxNCuN4lhfQ5ZHwSREr5rN3WOI2WU/aNkI9FRROHLcp2kiHYUaINE/0TDRr4F6r2Ps
 v+OSDeycouYFg+Pfd5440FMBnlZTiryIfKi3D0WhaoccSyqFyIQxoPRmed6C1CTxKyHr
 ZTdUkLd+H6uozN2bUviut8noZ52YVEQc4fknLcMwSA2654KRIR+M2t3s9T50kA/XIdKZ
 ehtdHYH+mb1f8F3YDjomyozphDI9jm9fE2SS07MNE+3nX3uaZBtAeDGkdCiYqXtajRDN
 VUVx/SQe9np7opTi4n1rDh/nuYuRDqHJjw9Mgl4shakUEioth1Tqf9yaLGlYfj0CIWRx
 XYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8GMWFQOUXGSaFfctGrIpjQSYGbDJe8Vji+WzLKr2G0o=;
 b=mDTvKqbVX9xxYcRwrH2B6gKsxooSzotBmjBTBibsKyxPwdx7+pO53IJ294pqBiSnDL
 eQepCOEV8ZZlFKalcYnJb3DqL1jFPfBjbtcSYKBR64ujjhIYPo3gCRTxRmYLb9GGyju+
 oNTRR+QAEigb4tth96n1L164HL7msR4U68G7ZR2YA0GjqAnPsDX6TkR0pw/1lG78NoBE
 Bf76oKkw931iCiUjaHf3KQtoHcHwAEaB4pcBYqQyC0Mu2V1kOF5x7rtHh46TD+wvR/sr
 y/gq/OebBVYapHTIKnE5oleRQk+U4mQNVMaRT9VRk2okbBRQnzZTta/MI6sxl11GVvvy
 WHPQ==
X-Gm-Message-State: ANoB5pkbYSYcYVHAvhEZ7QrGVt9nlRKGGCbYxqK4/skDD2L7fg/vZ3DT
 Y3yJ6hZ8GTeFkh/TnF5vY3Dkf2h9VyTIuC2L+rg=
X-Google-Smtp-Source: AA0mqf4WE0wrDjJvnuKoNnhmGBh7l5HATmxycVoqKl7KNDLUeSRyF+8U68/+2NjnPiL/pMyHPIUktD97pIDG9R1a1r8=
X-Received: by 2002:a5b:f02:0:b0:6f7:6238:3c62 with SMTP id
 x2-20020a5b0f02000000b006f762383c62mr3175894ybr.209.1669648576250; Mon, 28
 Nov 2022 07:16:16 -0800 (PST)
MIME-Version: 1.0
References: <20221128134832.84867-1-philmd@linaro.org>
 <20221128134832.84867-5-philmd@linaro.org>
In-Reply-To: <20221128134832.84867-5-philmd@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 28 Nov 2022 10:16:04 -0500
Message-ID: <CAJSP0QUNU1CEJ8AMmo=tDC60ChY=Qo67nOEBBZmtaYeXvOybFQ@mail.gmail.com>
Subject: Re: [RFC PATCH-for-7.2 4/5] hw/display/qxl: Avoid buffer overrun in
 qxl_phys2virt (CVE-2022-4144)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>, 
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>, 
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb30.google.com
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

On Mon, 28 Nov 2022 at 08:53, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Have qxl_get_check_slot_offset() return false if the requested
> buffer size does not fit within the slot memory region.
>
> Similarly qxl_phys2virt() now returns NULL in such case, and
> qxl_dirty_one_surface() aborts.
>
> This avoids buffer overrun in the host pointer returned by
> memory_region_get_ram_ptr().
>
> Fixes: CVE-2022-4144 (out-of-bounds read)
> Reported-by: Wenxu Yin (@awxylitol)
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1336
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/display/qxl.c | 22 ++++++++++++++++++----
>  hw/display/qxl.h |  2 +-
>  2 files changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index 231d733250..afa157d327 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -1424,11 +1424,13 @@ static void qxl_reset_surfaces(PCIQXLDevice *d)
>
>  /* can be also called from spice server thread context */
>  static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqx=
l,
> -                                      uint32_t *s, uint64_t *o)
> +                                      uint32_t *s, uint64_t *o,
> +                                      size_t size_requested)
>  {
>      uint64_t phys   =3D le64_to_cpu(pqxl);
>      uint32_t slot   =3D (phys >> (64 -  8)) & 0xff;
>      uint64_t offset =3D phys & 0xffffffffffff;
> +    uint64_t size_available;
>
>      if (slot >=3D NUM_MEMSLOTS) {
>          qxl_set_guest_bug(qxl, "slot too large %d >=3D %d", slot,
> @@ -1453,6 +1455,18 @@ static bool qxl_get_check_slot_offset(PCIQXLDevice=
 *qxl, QXLPHYSICAL pqxl,
>          return false;
>      }
>
> +    size_available =3D memory_region_size(qxl->guest_slots[slot].mr);
> +    assert(qxl->guest_slots[slot].offset + offset < size_available);

Can this assertion be triggered by the guest (via an invalid pqxl
value)? I think the answer is no, but I don't know the the qxl code
well enough to be sure.

> +    size_available -=3D qxl->guest_slots[slot].offset + offset;
> +    if (size_requested > size_available) {
> +        qxl_set_guest_bug(qxl,
> +                          "slot %d offset %"PRIu64" size %zu: "
> +                          "overrun by %"PRIu64" bytes\n",
> +                          slot, offset, size_requested,
> +                          size_requested - size_available);
> +        return false;
> +    }
> +
>      *s =3D slot;
>      *o =3D offset;
>      return true;
> @@ -1471,7 +1485,7 @@ void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL =
pqxl, int group_id,
>          offset =3D le64_to_cpu(pqxl) & 0xffffffffffff;
>          return (void *)(intptr_t)offset;
>      case MEMSLOT_GROUP_GUEST:
> -        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset)) {
> +        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size))=
 {
>              return NULL;
>          }
>          ptr =3D memory_region_get_ram_ptr(qxl->guest_slots[slot].mr);
> @@ -1937,9 +1951,9 @@ static void qxl_dirty_one_surface(PCIQXLDevice *qxl=
, QXLPHYSICAL pqxl,
>      uint32_t slot;
>      bool rc;
>
> -    rc =3D qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset);
> -    assert(rc =3D=3D true);
>      size =3D (uint64_t)height * abs(stride);
> +    rc =3D qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size);
> +    assert(rc =3D=3D true);
>      trace_qxl_surfaces_dirty(qxl->id, offset, size);
>      qxl_set_dirty(qxl->guest_slots[slot].mr,
>                    qxl->guest_slots[slot].offset + offset,
> diff --git a/hw/display/qxl.h b/hw/display/qxl.h
> index bf03138ab4..7894bd5134 100644
> --- a/hw/display/qxl.h
> +++ b/hw/display/qxl.h
> @@ -157,7 +157,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL)
>   *
>   * Returns a host pointer to a buffer placed at offset @phys within the
>   * active slot @group_id of the PCI VGA RAM memory region associated wit=
h
> - * the @qxl device. If the slot is inactive, or the offset is out
> + * the @qxl device. If the slot is inactive, or the offset + size are ou=
t
>   * of the memory region, returns NULL.
>   *
>   * Use with care; by the time this function returns, the returned pointe=
r is
> --
> 2.38.1
>
>

