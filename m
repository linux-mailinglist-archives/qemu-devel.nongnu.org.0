Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A5C5A127A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 15:39:05 +0200 (CEST)
Received: from localhost ([::1]:47518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRD4a-00065D-JT
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 09:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRD0m-0002Fj-W1
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 09:35:09 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:43740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRD0i-0003V2-V4
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 09:35:08 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-333a4a5d495so540819497b3.10
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 06:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=57O8tsLQIj34+F9o/XXXiBF2UB6oMe/d1gKDRn8OWlQ=;
 b=WZMhTuiSZsbGVVVAECE7hnZtP0tIl4O3yqTMBjRIX/GC/SpzPdt4/u68H3uWmSRMpx
 XGea+4A5X1yAixrLR+O8G5Br1ZO3uiQsYhi6eAYT+nge/tAOGrS3HRxsf5D5A7XKzBRl
 uEbII1AyOlUIa82G3IoT/dbgBBxB/671nK/5sfn9dXUpAcCNCrKHLTKeO3vXk5oPpIZM
 EpQCu+PWNjFncXKDj++q/VszSZZEs8l+3QEgsB6qlaEoYOXxLl3SMVtMWCIonBzi5Tx6
 SbBjGDlw234foyFG0iSYE1hC/KagrpDQXQtgoBj9+TuDPzjOOJ4lZCSza81BnEp0zzX9
 lPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=57O8tsLQIj34+F9o/XXXiBF2UB6oMe/d1gKDRn8OWlQ=;
 b=Kzl4Kj0kAwavRRcWzOUIaz7LcYVyeJVAJWrcCUZlfNZ5bYwCMdyIcxVd0kChGKiiFt
 3ST28h2u2+irqfWW58PzMci+1nU4E4N+zeHql/oUstYvEmWAcsuyFUPIOhO0MYjtKBPU
 qLueX4DZv3Y8suc0o2PmYT2R4ht1xXUP4TRcOV37fLyBAHQeudPZALl7jmN0RYalL2Qe
 yE80wzgNriw5K7qgb0VHm/oW4LAvixLdrl4T/HOIUAfRvfglyha3LNFmQvNeYszpg+5X
 DFo1V4pWBQ/Aj6zDvGQsfFm+tJSMjhUTM8y80T6bATKioX1OVw7fAsFFuBGB81bb1G2n
 DdZw==
X-Gm-Message-State: ACgBeo2O1kJBhlqxVPU/0rWRrbHdhrV9AVayLWwLvuzESxDUxm+GKzYB
 FOAQFbpQj52Qy0sAx0fKaM+FK0/2xephz6cO7kdh+w==
X-Google-Smtp-Source: AA6agR4vY7jwTCRj5pyXYBm/5CEsZQbTdS2hVf75m4RnDTSeLf0g9E0iDeY4Iog6pVY3YTeNVrGnNkgZbZ0jLPMmcCQ=
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr3276353ybq.140.1661434498551; Thu, 25
 Aug 2022 06:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220825132110.1500330-1-marcandre.lureau@redhat.com>
 <20220825132110.1500330-3-marcandre.lureau@redhat.com>
In-Reply-To: <20220825132110.1500330-3-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Aug 2022 14:34:16 +0100
Message-ID: <CAFEAcA-ZNFka26CDoPEvUROkt9UpFvmZXN5rTSt7MYJjtzdhHg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dump: fix kdump to work over non-aligned blocks
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qiaonuohan@cn.fujitsu.com, David Hildenbrand <david@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 25 Aug 2022 at 14:21, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Rewrite get_next_page() to work over non-aligned blocks. When it
> encounters non aligned addresses, it will allocate a zero-page and try
> to fill it.
>
> This solves a kdump crash with "tpm-crb-cmd" RAM memory region,
> qemu-kvm: ../dump/dump.c:1162: _Bool get_next_page(GuestPhysBlock **,
> uint64_t *, uint8_t **, DumpState *): Assertion `(block->target_start &
> ~target_page_mask) =3D=3D 0' failed.
>
> because:
> guest_phys_block_add_section: target_start=3D00000000fed40080 target_end=
=3D00000000fed41000: added (count: 4)
>
> Fixes:
> https://bugzilla.redhat.com/show_bug.cgi?id=3D2120480


>  static bool get_next_page(GuestPhysBlock **blockptr, uint64_t *pfnptr,
> -                          uint8_t **bufptr, DumpState *s)
> +                          uint8_t **bufptr, bool *allocptr, DumpState *s=
)
>  {
>      GuestPhysBlock *block =3D *blockptr;
> -    hwaddr addr, target_page_mask =3D ~((hwaddr)s->dump_info.page_size -=
 1);

In the old code, we treated the dump_info.page size as an indication
of the target's page size...

> -    uint8_t *buf;
> +    uint32_t page_size =3D s->dump_info.page_size;
> +    bool alloced =3D false;
> +    uint8_t *buf =3D NULL, *hbuf;
> +    hwaddr addr;
>
>      /* block =3D=3D NULL means the start of the iteration */
>      if (block =3D=3D NULL) {
>          *blockptr =3D block =3D QTAILQ_FIRST(&s->guest_phys_blocks.head)=
;
>          addr =3D block->target_start;
> +        *pfnptr =3D dump_paddr_to_pfn(s, addr);
>      } else {
> -        addr =3D dump_pfn_to_paddr(s, *pfnptr + 1);
> +        assert(block !=3D NULL);
> +        *pfnptr +=3D 1;
> +        addr =3D dump_pfn_to_paddr(s, *pfnptr);
>      }
>      assert(block !=3D NULL);
>
> -    if ((addr >=3D block->target_start) &&
> -        (addr + s->dump_info.page_size <=3D block->target_end)) {
> -        buf =3D block->host_addr + (addr - block->target_start);
> -    } else {
> -        /* the next page is in the next block */
> -        *blockptr =3D block =3D QTAILQ_NEXT(block, next);
> -        if (!block) {
> -            return false;
> +    while (1) {
> +        if (addr >=3D block->target_start && addr < block->target_end) {
> +            size_t n =3D MIN(block->target_end - addr, page_size - addr =
% page_size);
> +            hbuf =3D block->host_addr + (addr - block->target_start);
> +            if (!alloced) {
> +                if (n =3D=3D page_size) {
> +                    /* this is a whole host page, go for it */
> +                    assert(addr % page_size =3D=3D 0);

...but here we're claiming in this comment that it is the host's
page size.

Which is it ?

thanks
-- PMM

