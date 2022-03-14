Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB0E4D8980
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 17:38:31 +0100 (CET)
Received: from localhost ([::1]:45744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTniH-0005Yc-1U
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 12:38:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTng6-0004dq-S8
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 12:36:14 -0400
Received: from [2607:f8b0:4864:20::b2c] (port=45036
 helo=mail-yb1-xb2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTng4-0007DG-V7
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 12:36:14 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id u61so31870559ybi.11
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 09:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZUeis3qBvb5fTEY81Om7fDOULrWlAPO3HpOWqy6oUQk=;
 b=Cqm6fuBk4JZQh5dBB5yQ6Z/PHSAMZI8UA3qwCY8tC9AT/wCNfn06GFiD/gersmp/AF
 GupDbDipLB+tPsZy9Gv3cqQsqfTaA0rMxHLSFdLrMobhDds1dlEJnfpr1SuHIn+2j/zR
 HOzzjx4fT2mD6lZddiKaFKgm8y52tEBQzOTiW9xIpiLKSetTl/tWNTuoyon2FNknIy8R
 STVDwS2FXt6eWYYB29c7ofp4Nm9Vrke13lsHjQY0usc184MI2Ey6eRZuG9nfckx/H6Bv
 JpB+5EEK1TsoNfePrk9oHx0rr5Jsk3BKXTg+XVKQ8eACOuKmitn4LhG8mbGVMXxT2UPD
 ifmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZUeis3qBvb5fTEY81Om7fDOULrWlAPO3HpOWqy6oUQk=;
 b=3m4MoCWyx1OQ+OenD/LPQFUohc8nYQd8d5THgQQXpcqt9zSkZNQ1JshQoOYpJjkQZL
 KaIFsMOVlFYcrx6JyJjODNNAJrgJFv55KOSN+5aey/NsVxgURZ353zU5sVL4gMzYyGlQ
 U/Is5yhlt8oAipwqogXfaQp0jysS4BLxtP5Gv0JpaW/gCf5OlIzWVGEQRcpJzOQGbZsM
 VpUD1uyLmucaUtY7wSnIXWjwe+Gb8KYonnVAkeVEkifwQfqDFp2wBskDE7gaPF8en/g0
 Mfk/OBBL5rDp4ennQw8nIBKKm/D+GrEwfMZ6kVO9UXOR/TINEghJnp1efGXCtmgAWeN9
 YxFA==
X-Gm-Message-State: AOAM533vL9uCI6qEoA4s3X+Tj1Hx9l3FSzejNxFXEpqvd6Uxo6n6A4TS
 Eg3WChOEMl/cvvJDTtudctwZczUgIabuDAxs7LvDLA==
X-Google-Smtp-Source: ABdhPJwh8QVrevpVXpFHsP6OdXzT5L9ltrKuwg1a6kdaUezDXbtkYWPtF8yiwoyTK9cXjsdmjMMBPwYQykryuVqBnjw=
X-Received: by 2002:a05:6902:510:b0:630:b29f:ce2e with SMTP id
 x16-20020a056902051000b00630b29fce2emr13385456ybs.67.1647275771690; Mon, 14
 Mar 2022 09:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220314154557.306-1-adeason@sinenomine.net>
 <20220314154557.306-2-adeason@sinenomine.net>
In-Reply-To: <20220314154557.306-2-adeason@sinenomine.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Mar 2022 16:36:00 +0000
Message-ID: <CAFEAcA8DZby3k7rZ3F4m037b_qjANzEk-ekVQYxAm5tN1_v84w@mail.gmail.com>
Subject: Re: [PATCH 1/2] util/osdep: Avoid madvise proto on modern Solaris
To: Andrew Deason <adeason@sinenomine.net>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Mar 2022 at 16:12, Andrew Deason <adeason@sinenomine.net> wrote:
>
> On older Solaris releases, we didn't get a protype for madvise, and so
> util/osdep.c provides its own prototype. Some time between the public
> Solaris 11.4 release and Solaris 11.4.42 CBE, we started getting an
> madvise prototype that looks like this:
>
>     extern int madvise(void *, size_t, int);
>
> Which conflicts with the prototype in util/osdeps.c. Instead of always
> declaring this prototype, check if madvise() is already declared, so
> we don't need to declare it ourselves.
>
> Signed-off-by: Andrew Deason <adeason@sinenomine.net>
> ---
> I'm not sure if a test is needed for this at all; that is, how much qemu
> cares about earlier Solaris. The madvise prototype exists earlier in
> Solaris 11 (I'm not sure when it started appearing usefully), but in
> 11.4 and earlier it was compatible with the char* prototype.

>  #ifdef CONFIG_SOLARIS
>  #include <sys/statvfs.h>
> +#ifndef HAVE_MADVISE_PROTO
>  /* See MySQL bug #7156 (http://bugs.mysql.com/bug.php?id=7156) for
>     discussion about Solaris header problems */
>  extern int madvise(char *, size_t, int);
>  #endif
> +#endif

Rather than keeping this inside a CONFIG_SOLARIS and only doing
the meson.build test if targetos == sunos, I would prefer it if we
unconditionally determined two things in meson.build:
 (1) do we have madvise in the usual way? (this is what we would
     want CONFIG_MADVISE to be, and might even be what it actually is)
 (2) do we have madvise but only if we provide a prototype for it
     ourselves? (maybe CONFIG_MADVISE_NO_PROTO)

and then in osdep.h provide the prototype if CONFIG_MADVISE_NO_PROTO.
(osdep.h is where we provide "this is a fixup to the system headers"
portability workarounds, which this seems to be.)

This isn't the only .c file that directly calls madvise() :
softmmu/physmem.c does also. That looks like maybe a bug though:
perhaps it should be calling qemu_madvise()...

Side note: do you know why CONFIG_SOLARIS includes sys/statvfs.h ?
Is that unrelated to madvise() ?

thanks
-- PMM

