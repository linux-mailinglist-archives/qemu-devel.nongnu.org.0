Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F04757A064
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 16:05:28 +0200 (CEST)
Received: from localhost ([::1]:34138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDnqp-00046H-Ew
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 10:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDnir-0000Y8-Sd
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:57:14 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:46761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDniq-0003m3-32
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:57:13 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-31c89653790so141304707b3.13
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 06:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6jzsQr9UfReMhZqfWjt1CjLy0wWyXKJwG101rCtSyIM=;
 b=SENIRze02vTGIx8t3fO2ZBMnp0uKX+oE3h0Ufu4MTjTcl+id/edsmzYtcK20pnwv1j
 sYbJt5NJBe+b5XHV1bbxaqmKcH9xqkkiO8R32+4wJzNNg/Zrw9KZJ3Dr2WAaSE3+9xzd
 W4atnjOdtkXZGIapJNo0N3hxv8MuUd2mpzGYHfZDUWGdnv07iQECYtHy0CXSqUt4XtWr
 pd95PnNL3ggkEabKIXq2zjLGHLRL9pChD44KQWPV9mGVK7oiWeooYcBP/4yA+KkyqsSx
 p36CdSkZYpD7U7h+yn/xrRG4xNOsJ5nIbuh1oF9aZQhDjpyeeJ9ynivGNrN0DzcCmExW
 2clw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6jzsQr9UfReMhZqfWjt1CjLy0wWyXKJwG101rCtSyIM=;
 b=ZsQ/uDzDQZGiJZrjuIkZOb2qIp45xX8swYVsILPfu0gF2xiSa2K6NzSquuifQ9dLyJ
 1RmbEqyh8Ct+c8qbLzShwZWlwN964OY5HXvvzYfdXTb16L4KGlYx8HAAaYt/DuwOfPAF
 Kik2SM6lR97Yiu+bGV034BmzWd7kvFcd83Mfbv/72skjItCukMVY6lziHzW/hjev4ZrB
 PIEQ8M9GjXF79H2jIntYxflTugeTv8Zo6m/Ge6lIPKjoM8sHHhumBsZHZPo09+0imUBo
 jWV/YKC/307lCBmWTAhDsL1/7HZrDlKmxidvH+qbJiPf2UItqAir6eO3ZXsoZUl7datj
 bVQw==
X-Gm-Message-State: AJIora8NTOkQjPvBDzmB2mQio/s23xtdzz5yX6gShqXouhcgpAJO/M7b
 gzeOrVFw9d0ThgBgylL2i3nCyle9/lEMa/k6KIbiJg==
X-Google-Smtp-Source: AGRyM1v5U/4JxWfzoB16dEZaXnnv71xnzrHKF11xQbCLpeL6KYQcpawD03Lu0mRaNU8PzZjc/JGA/XS9K3LfVl8/z6Y=
X-Received: by 2002:a0d:eb83:0:b0:31c:8741:a033 with SMTP id
 u125-20020a0deb83000000b0031c8741a033mr36699700ywe.455.1658239031190; Tue, 19
 Jul 2022 06:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220516204913.542894-1-mst@redhat.com>
 <20220516204913.542894-30-mst@redhat.com>
In-Reply-To: <20220516204913.542894-30-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jul 2022 14:57:00 +0100
Message-ID: <CAFEAcA9xeL7EReV1HqkwkYVZvtbH-uvx3oFM=G5Ec8wu=g0rsA@mail.gmail.com>
Subject: Re: [PULL v2 29/86] hw/cxl/host: Add support for CXL Fixed Memory
 Windows.
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Markus Armbruster <armbru@redhat.com>, Ben Widawsky <ben.widawsky@intel.com>, 
 Eric Blake <eblake@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Mon, 16 May 2022 at 21:52, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> From: Jonathan Cameron <jonathan.cameron@huawei.com>
>
> The concept of these is introduced in [1] in terms of the
> description the CEDT ACPI table. The principal is more general.
> Unlike once traffic hits the CXL root bridges, the host system
> memory address routing is implementation defined and effectively
> static once observable by standard / generic system software.
> Each CXL Fixed Memory Windows (CFMW) is a region of PA space
> which has fixed system dependent routing configured so that
> accesses can be routed to the CXL devices below a set of target
> root bridges. The accesses may be interleaved across multiple
> root bridges.

Hi; Coverity points out a memory leak in this function
(CID 1488872):

> +void cxl_fixed_memory_window_config(MachineState *ms,
> +                                    CXLFixedMemoryWindowOptions *object,
> +                                    Error **errp)
> +{
> +    CXLFixedWindow *fw = g_malloc0(sizeof(*fw));

Here we allocate memory...

> +    strList *target;
> +    int i;
> +
> +    for (target = object->targets; target; target = target->next) {
> +        fw->num_targets++;
> +    }
> +
> +    fw->enc_int_ways = cxl_interleave_ways_enc(fw->num_targets, errp);
> +    if (*errp) {
> +        return;

...but in the error returns here..

> +    }
> +
> +    fw->targets = g_malloc0_n(fw->num_targets, sizeof(*fw->targets));
> +    for (i = 0, target = object->targets; target; i++, target = target->next) {
> +        /* This link cannot be resolved yet, so stash the name for now */
> +        fw->targets[i] = g_strdup(target->value);
> +    }
> +
> +    if (object->size % (256 * MiB)) {
> +        error_setg(errp,
> +                   "Size of a CXL fixed memory window must my a multiple of 256MiB");
> +        return;

...here..

> +    }
> +    fw->size = object->size;
> +
> +    if (object->has_interleave_granularity) {
> +        fw->enc_int_gran =
> +            cxl_interleave_granularity_enc(object->interleave_granularity,
> +                                           errp);
> +        if (*errp) {
> +            return;

...and here we fail to free the memory we allocated.

> +        }
> +    } else {
> +        /* Default to 256 byte interleave */
> +        fw->enc_int_gran = 0;
> +    }
> +
> +    ms->cxl_devices_state->fixed_windows =
> +        g_list_append(ms->cxl_devices_state->fixed_windows, fw);
> +
> +    return;
> +}

Would you mind sending a patch to fix this bug ?
The neatest approach probably uses g_autofree and g_steal_pointer().

thanks
-- PMM

