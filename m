Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D56644BF2A5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 08:32:18 +0100 (CET)
Received: from localhost ([::1]:43564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMPej-0000om-K9
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 02:32:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMPTn-00026X-L7
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 02:20:59 -0500
Received: from [2a00:1450:4864:20::62c] (port=36514
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMPTl-0002cl-LD
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 02:20:59 -0500
Received: by mail-ej1-x62c.google.com with SMTP id a23so39861422eju.3
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 23:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZTxq2O7p3CYHqAUrR+1cQVu5DPU0BJmWgFrTXPzw/+s=;
 b=WiymcIE+5eK4MtzDUrXKHdDlOUuC49V9dP1O3WKp5OTxzB3FYGeqOiT6jN+fdQ37gP
 JANs1dsVtonnDMV7hvi/Qvm99ZxGUoz0yycQ8lSbRE2+k7QbkccZGXIRvFGrgnW98qDS
 JXg/jaCpQQGWGtJL0LUNQXzjp/6vtDdnAyYWAOqTZLpEsieTq+AI35eIcEs5NiQYBNuj
 wjVODA1aLX+5AGDxH7pU1PoTa/SjFueyvj4RG47RSf7EhXasO2uDYmwI+AZP39K/C64b
 Jks91OAr44iWdPPUWHsm5b4OC/Me2eTFdOTVyU7yLP2ngGKysHyRV71IGfmLTyMZMC4c
 mCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZTxq2O7p3CYHqAUrR+1cQVu5DPU0BJmWgFrTXPzw/+s=;
 b=o+aFaIogfIlUuZLNiU4XxA+pKINk/6+pGa0s/idQ1NVWNQvMPkZlB9fuaX93+fzwSr
 etaKIv4DQIpG7ct10/2EyFwpbAFcmBzlWog9KAA1cbwT4ZO5flZNbpFLcfNQT2FlY1Ot
 4JIqMFOGnfTPrOvdzuVZ3nQcX2DTgYWyB6dIUwnL5O1Ks9p5APnMZLKAm1Qd53UnzBft
 WsNQNzYJiTWcoVz+ZJzpbHvBv5GH/aUFEut71Mmmv4afBRLAoFp3WNBkDUQ8Ali29V9u
 w9tnBsW6Bxflm3b2J64akw+7jMaziVyQ2E9mhYpQNwFbdZ40P1MJSX935eviweW45dvD
 /3lA==
X-Gm-Message-State: AOAM530eM3bghCKUFWiIf0tZApqIf4SB0lR99k71sJJWSHA9qi614l7a
 ra7y1FZOMlwUem1AtdhFLIXwMDb5+hBXN6+zn6uVlA==
X-Google-Smtp-Source: ABdhPJxpbL6pWEnjiaAqYz4j9g8n7aW4MhkfDuhDRQ67FCXLCbRcX1jBUHzT5wfSxYLNeYncnuH4E0jeZ2Nwy6E2n1A=
X-Received: by 2002:a17:906:abd4:b0:6bb:8aee:92c5 with SMTP id
 kq20-20020a170906abd400b006bb8aee92c5mr19048187ejb.660.1645514455646; Mon, 21
 Feb 2022 23:20:55 -0800 (PST)
MIME-Version: 1.0
References: <20220221191323.617323-1-liavalb@gmail.com>
 <20220221191323.617323-3-liavalb@gmail.com>
 <alpine.DEB.2.22.394.2202221154300.697295@anisinha-lenovo>
In-Reply-To: <alpine.DEB.2.22.394.2202221154300.697295@anisinha-lenovo>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 22 Feb 2022 12:50:44 +0530
Message-ID: <CAARzgwxC0g6HWGY_=roU5kbRbDR24vNDrwXAsSVXDkBReZY7sw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
To: Liav Albani <liavalb@gmail.com>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::62c;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: imammedo@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> >
> > diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> > index 68ca7e7fc2..756c69b3b0 100644
> > --- a/hw/i386/acpi-microvm.c
> > +++ b/hw/i386/acpi-microvm.c
> > @@ -189,6 +189,11 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
> >          .reset_val = ACPI_GED_RESET_VALUE,
> >      };
> >
> > +    if (isa_check_device_existence("i8042")) {
> > +        /* Indicates if i8042 is present or not */
> > +        pmfadt.iapc_boot_arch = (1 << 1);
> > +    }
> > +
> >      table_offsets = g_array_new(false, true /* clear */,
> >                                          sizeof(uint32_t));
>
>
> We should do the same thing for arm architecture as well?
> hw/arm/virt-acpi-build.c .

Probably not since the spec says
"These flags pertain only to IA-PC platforms. On other system
architectures, the entire field should be set
to 0."

adding qemu-arm for confirmation.

