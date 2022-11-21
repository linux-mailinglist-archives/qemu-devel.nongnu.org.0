Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35E1632C3E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 19:44:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxBm3-0000F6-ST; Mon, 21 Nov 2022 13:44:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxBly-0000Cm-7k
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 13:44:04 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxBlu-0002P0-I9
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 13:44:01 -0500
Received: by mail-pg1-x536.google.com with SMTP id b62so11990333pgc.0
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 10:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jrp3uk3o+CKUCV2V6pKo4t7FkfEMj5M5cNIwZlW33pg=;
 b=bAoulAW7Ph4fz4L5cWzU0MXLGv74RWwaWpMNtG7kKlQlKgYXjTsN4qVHTyGPh3wSV2
 cfBOTSOwrB4vts3auPnEhvihu7d5X2VVcMhK2kbCZBFeCF87k+UlpJtD7UaJQZuCaZ9d
 2FzSc0cmix6q/ejXk1n7hBl30ugUC5LsiYOGWfj6mHaCCRrytWO3g4aGkqaZUM7oGb7x
 mUSXHUtGodO94/9OP5bjcfxsfi5CJjVS3t2drdIq/HI6SHzpSYfd6Z/x/nVc49uA3C+I
 SBtUor8hXQsqNJYgFmO00Izb3G0CHsqwiE7ApU80x81aojSS0+HO+q6muOLytcjwpze4
 xbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jrp3uk3o+CKUCV2V6pKo4t7FkfEMj5M5cNIwZlW33pg=;
 b=ZVBCdQG4CO7E32nCZtHAejC9qPC4M+8rA8gYGxjc5eUOksDN+TXjnV8ae6TsPyLICu
 4q6jhYlhZmdTfMxEFlIfk7Roadi+e2l3zrbdOYoPK7Hv1YT3fc+gy7OfBEDOWC4AwtXD
 f77zTK2CkfbDVQFZK86BrtRMNOdARO52t2sFQC71qIJ7ADWl6UWx8YM6EOY04Sofb6au
 JG8+4X+ijIsWYfA34kSHmBxQ/N2yZlf/E3OGJgl1Be3ycK8KvxRvhvMC2Rn5P5MTJKRn
 yv3Jb1VIZpJtazqaSR9ie7sOYLr4bg51CMXQMl4mCfoWm6yDzqq7IqwmmpUQxrKZWTt6
 BPhQ==
X-Gm-Message-State: ANoB5pmqeV42zRxMuUerefBsQMHleHxyE0mVqnezQTapkU7bTBRFBIsy
 FHwmyjlfDuA1TfwRpe9p9uphxL+HA8BknEHyXdU9Lw==
X-Google-Smtp-Source: AA0mqf7ZfS5Gy2zCswl64XDpmQFDJSHPeUW7e0JzRqyyixcs2BAeaQiQbG3kfcy67qTtFWslNTkdi/IB0XIcyuBkqZM=
X-Received: by 2002:a65:45c5:0:b0:46b:2753:2a60 with SMTP id
 m5-20020a6545c5000000b0046b27532a60mr2726206pgr.192.1669056237027; Mon, 21
 Nov 2022 10:43:57 -0800 (PST)
MIME-Version: 1.0
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-19-alex.bennee@linaro.org>
In-Reply-To: <20221111182535.64844-19-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Nov 2022 18:43:45 +0000
Message-ID: <CAFEAcA8LtBB+bG0xd=_t_pe3u6XiS+pPi1Vfykqb0HTjofCB8A@mail.gmail.com>
Subject: Re: [PATCH v5 18/20] hw/i386: convert apic access to use MemTxAttrs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 11 Nov 2022 at 18:36, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This allows us to correctly model invalid accesses to the interrupt
> controller as well as avoiding the use of current_cpu hacks to find
> the APIC structure. We have to ensure we check for MSI signals first
> which shouldn't arrive from the CPU but are either triggered by PCI or
> internal IOAPIC writes.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>

> +static MemTxResult apic_mem_write(void *opaque, hwaddr addr, uint64_t va=
l,
> +                                  unsigned int size, MemTxAttrs attrs)
>  {
>      DeviceState *dev;
>      APICCommonState *s;
>      int index =3D (addr >> 4) & 0xff;
>
>      if (size < 4) {
> -        return;
> +        return MEMTX_ERROR;
>      }
>
> +    /*
> +     * MSI and MMIO APIC are at the same memory location, but actually
> +     * not on the global bus: MSI is on PCI bus APIC is connected
> +     * directly to the CPU.
> +     *
> +     * We can check the MemTxAttrs to check they are coming from where
> +     * we expect. Even though the MSI registers are reserved in APIC
> +     * MMIO and vice versa they shouldn't respond to CPU writes.
> +     */
>      if (addr > 0xfff || !index) {
> -        /* MSI and MMIO APIC are at the same memory location,
> -         * but actually not on the global bus: MSI is on PCI bus
> -         * APIC is connected directly to the CPU.
> -         * Mapping them on the global bus happens to work because
> -         * MSI registers are reserved in APIC MMIO and vice versa. */
> +        switch (attrs.requester_type) {
> +        case MTRT_MACHINE: /* MEMTX_IOPIC */
> +        case MTRT_PCI:     /* PCI signalled MSI */
> +            break;

If we always treat MTRT_MACHINE and MTRT_PCI identically, do we really
need to have different MTRT types for them ?

> +        default:
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: rejecting write from %d"=
,
> +                          __func__, attrs.requester_id);
> +            return MEMTX_ACCESS_ERROR;
> +        }
>          MSIMessage msi =3D { .address =3D addr, .data =3D val };
>          apic_send_msi(&msi);
> -        return;
> +        return MEMTX_OK;
>      }

thanks
-- PMM

