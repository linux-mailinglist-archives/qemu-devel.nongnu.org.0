Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E8263A333
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 09:37:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozZcV-0007EB-KU; Mon, 28 Nov 2022 03:36:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ozZcH-0007B0-3Y
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:36:05 -0500
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ozZcF-00056D-68
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:35:52 -0500
Received: by mail-lj1-x229.google.com with SMTP id a7so12258490ljq.12
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 00:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x2EC7dnQbBofq4sgW7nodHhx4X/l2nb9HggSki/KAts=;
 b=gk22ISHQjcwWUwgGxU03m+bDWil3nULg+iuxh2k2gRxBTJi+07wf2Dzh/CLvP+x5WF
 o1/U9984ZhFZ0z0KAsyvGFGBLZBHhEe5PAwhl6paOM9pqdG52XlmKuj/2+4SY0ZJ+n1a
 OMXijA6HcMuUOMVReJCcre4BYThU7kG1Rf+/cdW6Puuwq3ymMx5tToeDtB9k0yg0s/HS
 JGe3ZmKpduOuFI6wtbEbFIPS/cpjn9jl6EsQYf6zmz2olLheqMQsvzj7C/2eG/F+y4h0
 PRCAUPxwbQYMW3fjiGVRb+UGCrH4howlH4+gNMD/l08zZPvwtdmCFRyuITqERLTeXPP1
 I+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x2EC7dnQbBofq4sgW7nodHhx4X/l2nb9HggSki/KAts=;
 b=0IO2l5kvZq97g3bwnwjt38ezq9U7W0eS0BUhleSvbPiPOfvEbGjhqeyT0jiAcXa8IQ
 QeTWsyPvA8izadH+cV209rQgbivf7HuUp4UudvgKBpFqe/fDgTyZxj+eLE3d1NtBDw4W
 wuWE4o8zlGELFTyZ0LSPUK/FZq7EQ9toOwllOqKdOCwHQyME9thpMRbbe+0tptxa0q3b
 M0Ct1cRUJoHjmwhrWS3H0t1XN1kuNCknhuQKCzJEkryasnZX/GZWnElvEvC2BHe8b2J5
 yFhpYj7iIQaK+jtrZkpng1Fq/8nlPr/QyZ3oD9oESH4Sq3ukPLzXH8cHxd5KoDeJkKCz
 zuFQ==
X-Gm-Message-State: ANoB5plKNKCqmEDjXRR0PVkD3RNDiCwotA3AxyuFYFBuJ4ibhXIyca1k
 I3CoeA8Dky548EGY0Sw2SQJ0B+brBM1JX3qr9t4=
X-Google-Smtp-Source: AA0mqf5WgsMcZgaVn2ptKwtTo8hFbksgCbvljR57P9pe7XASqHoelnynGTF3XctF4t5iI4yzsDP5VKTxUCV1Pa0Hpt0=
X-Received: by 2002:a2e:8ed8:0:b0:279:78e1:c7a4 with SMTP id
 e24-20020a2e8ed8000000b0027978e1c7a4mr7933613ljl.529.1669624547292; Mon, 28
 Nov 2022 00:35:47 -0800 (PST)
MIME-Version: 1.0
References: <20221125154030.42108-1-philmd@linaro.org>
 <20221125173119.46665-1-philmd@linaro.org>
 <20221125173119.46665-2-philmd@linaro.org>
In-Reply-To: <20221125173119.46665-2-philmd@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 28 Nov 2022 12:35:35 +0400
Message-ID: <CAJ+F1CKD95i6B5QGZYtHzenTwweX3=99c_UELCyJu+JhtzQA4A@mail.gmail.com>
Subject: Re: [RFC PATCH-for-7.2 4/4] hw/display/qxl: Avoid buffer overrun in
 qxl_phys2virt (CVE-2022-4144)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Mauro Matteo Cascella <mcascell@redhat.com>, 
 Alexander Bulekov <alxndr@bu.edu>, Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x229.google.com
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

Hi

On Fri, Nov 25, 2022 at 9:35 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Return NULL if the requested buffer size does not fit
> within the slot memory region.
>
> Reported-by: Wenxu Yin (@awxylitol)
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1336
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/display/qxl.c | 11 ++++++++++-
>  hw/display/qxl.h |  2 +-
>  2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index 231d733250..e5e162f82d 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -1462,7 +1462,7 @@ static bool qxl_get_check_slot_offset(PCIQXLDevice =
*qxl, QXLPHYSICAL pqxl,
>  void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id,
>                      size_t size)
>  {
> -    uint64_t offset;
> +    uint64_t offset, ptr_end_offset;
>      uint32_t slot;
>      void *ptr;
>
> @@ -1474,6 +1474,15 @@ void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL=
 pqxl, int group_id,
>          if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset)) {
>              return NULL;
>          }
> +
> +        ptr_end_offset =3D qxl->guest_slots[slot].offset + offset + size=
;

This is unlikely subject to int overflow, but perhaps it's worth
considering using some int128 instead?

> +        if (ptr_end_offset > memory_region_size(qxl->guest_slots[slot].m=
r)) {

> +            qxl_set_guest_bug(qxl,
> +                              "slot %d offset %"PRIu64" size %zu: "
> +                              "overrun by %"PRIu64" bytes\n",
> +                              slot, offset, size, ptr_end_offset - offse=
t);
> +            return NULL;
> +        }
>          ptr =3D memory_region_get_ram_ptr(qxl->guest_slots[slot].mr);
>          ptr +=3D qxl->guest_slots[slot].offset;
>          ptr +=3D offset;
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


--=20
Marc-Andr=C3=A9 Lureau

