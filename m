Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF48D2D366B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:46:34 +0100 (CET)
Received: from localhost ([::1]:53628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlkf-0003Y5-NR
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:46:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kmlBn-00054m-Uu
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:10:32 -0500
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:39282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kmlBl-0005IS-4N
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:10:31 -0500
Received: by mail-il1-x143.google.com with SMTP id q1so16930123ilt.6
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 14:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q3f02N6G82r1ZKsxSvYTr7dT4gSK3kLqPX7QGpUL9lM=;
 b=gL6MRNs7K/yRHVr13PHTDGOIAliHYjw6jaMnvOeig+ADqSYr22Ibbv2Eb3Q0MqcAra
 3ZfxJvpufzZudT4s7MnQjq7qMK5O8eyQZfJAhgrmYYK9mBAGMLDEFvKkw0OpRDDNe1YC
 h8B7rLTqgUHS1DOm+L7e08l0PZ6tROYrY77+alNkDGojZJGbj7/KnaYHo9QxyGgCIfbM
 HktUDx6KEtwESWcNCvTTUQ2/jO2EcglGqa7yWm6sJO2GAYownfLA8LrkltxYse7i16Qt
 a1pTnacLm+5BEr1jUnc6Ry8kWtkLDtl2Bn8UHM270CXKYAXW7sBXrXZ5r1/yT/6KR2Ko
 aCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q3f02N6G82r1ZKsxSvYTr7dT4gSK3kLqPX7QGpUL9lM=;
 b=gCu31yrc+QSi3oyZAXILdkfXjn1c3u4dwcA6clejegkfJNE+AYBne2EQEokGsRy2QQ
 P+a5XurcinxwIRD8vz1vTzQpnBVKc5qoHZhELfpe6oAI0u22XOU5CV0I8UyGmBRTPNsk
 dr2J59h6cvWQQxaMDPzi64iR3q328S5qbURa3n90CodIVgyRgc946jpI6/uRNf9qoVSD
 7Y+udA9q54MhW2fjfPkGl30MVQ24e/qcL0DDxwNZ88YxC+nNvcJERrxK2JWW3OfzbKgh
 P6EIfYOqVV2fj2eBL8r9U5s+be37rI4o8ZxxkWbp+2MHB7I+PjAIMngK/NxB9SQB1t7f
 0eDA==
X-Gm-Message-State: AOAM533yxHj5ac7YOef32AYRp74vDwtDgU/IyCV6hiJTjuT4Wwf73juW
 EkTAlVlzmDEBIzvBzpDqWaOLLO3fn76dzxpupms=
X-Google-Smtp-Source: ABdhPJwsAjFgNxGVWyK37wpHbUD2mOX3OwvwMDZkHmd55heL+WNpmg0rhtDtpYrexFLYnzOewOsQDQEIoPsNfp8mCpw=
X-Received: by 2002:a92:5eda:: with SMTP id f87mr28141601ilg.131.1607465427774; 
 Tue, 08 Dec 2020 14:10:27 -0800 (PST)
MIME-Version: 1.0
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-17-cfontana@suse.de>
In-Reply-To: <20201208194839.31305-17-cfontana@suse.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 8 Dec 2020 14:10:01 -0800
Message-ID: <CAKmqyKMZA3FEdXKx0L1sRHN+tRhvyE7Pyg4cLzMSueQZFgfxaA@mail.gmail.com>
Subject: Re: [RFC v9 16/32] target/riscv: remove CONFIG_TCG,
 as it is always TCG
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x143.google.com
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 8, 2020 at 12:52 PM Claudio Fontana <cfontana@suse.de> wrote:
>
> for now only TCG is allowed as an accelerator for riscv,
> so remove the CONFIG_TCG use.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a52e0ce466..27dd1645c9 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -561,10 +561,9 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>      /* For now, mark unmigratable: */
>      cc->vmsd = &vmstate_riscv_cpu;
>  #endif
> -#ifdef CONFIG_TCG
>      cc->tcg_ops.initialize = riscv_translate_init;
>      cc->tlb_fill = riscv_cpu_tlb_fill;
> -#endif
> +
>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>
> --
> 2.26.2
>
>

