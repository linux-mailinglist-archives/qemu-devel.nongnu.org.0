Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0624CD289
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:39:43 +0100 (CET)
Received: from localhost ([::1]:39422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5La-00058H-73
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:39:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ5Gb-0004mI-Rw
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:34:35 -0500
Received: from [2a00:1450:4864:20::62e] (port=42868
 helo=mail-ej1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ5GY-0001ta-MS
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:34:32 -0500
Received: by mail-ej1-x62e.google.com with SMTP id hw13so16470330ejc.9
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 02:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uTrScVsusTLXMWHcI0BIzRW0YPtSMrLcZw1zqimLDyA=;
 b=5XFcjUs4aNHvHpGnwUvPQ1m4iz5BII0MjZ5Mwsep1YdZEodLw4Qk5ckLG5sY6hYgCO
 JC6JRE4Jy9q2UomWno6Khgo9VZOqLvmtNxMxb4PTGZxP3OAaFPv6Dp5GC8VhgWrkKQiH
 uRngFDauUnoV3uSw/39oxCO3c9D/nTCG6mWPK6lnFg50b5SDTCCJmIfrWrwdKnmlQ6EH
 RClQIaH+eTE/hMILa5Ak3FKz95TjFojTD9oymLH5+STjLr/sBD07xygbcAdDFzPKTJN2
 YiNV+nfu9a4ChiJg8M+qD0UiehU+c8cQa+p5JwrSQ3SsnoiMD+ozlNy5WVys76j8gtGa
 9XRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uTrScVsusTLXMWHcI0BIzRW0YPtSMrLcZw1zqimLDyA=;
 b=nm8MzXsx4C/JRudzWd9MWuYanyddBbA3O5USELlIaVjqbKsHKFz6haajLFSaUfyqN7
 IxJjyAnZV7EnaooGocQCUozqNsfeHz7dYL5DPux17Ge+xEL+DSloy26I2ES6nW0VDpRV
 pkOv9/ns7F1Pqolo+RtVIGnUJxPzecGrVPwBPztb9HzDdMA8nosb8Qq5ATn5lO59xbM6
 wGzkqSv/IjywwVd3gIUtzza+sMOeULikYwsSHTBw+2/x3jTEhZxw45UtvS7B3N5BSIx3
 S8jtPik8S5SR7mQKkpa7B7B3ZEUjG9NKKt38FyJ9hvYt9lbWQ8ECPI/NOuvIin9AGlcy
 ugcQ==
X-Gm-Message-State: AOAM533NxGUG7Bs4cvbhHQjDVgQ1ABxcmetyEWFXMHNkVzMqxWjq6H0q
 WAwN6CjAUnov6wyxzsx9uwpdBLSkTqLrdbJ4RoePyA==
X-Google-Smtp-Source: ABdhPJxzhVtlH3ti+I3HzxNz7uxageonEoxdVZdq7t/F8pctdaYrccDeWgykWgQGJtxH7nEYXKAWM2j3uZzatmXkpqo=
X-Received: by 2002:a17:906:3a18:b0:6cd:ba45:995f with SMTP id
 z24-20020a1709063a1800b006cdba45995fmr31553214eje.328.1646390064627; Fri, 04
 Mar 2022 02:34:24 -0800 (PST)
MIME-Version: 1.0
References: <20220228201733.714580-1-liavalb@gmail.com>
 <20220304052617-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220304052617-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 4 Mar 2022 16:04:13 +0530
Message-ID: <CAARzgwwRC4WQNRV6MKtoCJ+5irhs-zYfvto2Wq63p0BtZoc6GA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62e
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::62e;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62e.google.com
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
Cc: imammedo@redhat.com, shentey@gmail.com, Liav Albani <liavalb@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 4, 2022 at 3:56 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Feb 28, 2022 at 10:17:30PM +0200, Liav Albani wrote:
> > This can allow the guest OS to determine more easily if i8042 controller
> > is present in the system or not, so it doesn't need to do probing of the
> > controller, but just initialize it immediately, before enumerating the
> > ACPI AML namespace.
> >
> > To allow "flexible" indication, I don't hardcode the bit at location 1
> > as on in the IA-PC boot flags, but try to search for i8042 on the ISA
> > bus to verify it exists in the system.
> >
> > Why this is useful you might ask - this patch allows the guest OS to
> > probe and use the i8042 controller without decoding the ACPI AML blob
> > at all. For example, as a developer of the SerenityOS kernel, I might
> > want to allow people to not try to decode the ACPI AML namespace (for
> > now, we still don't support ACPI AML as it's a work in progress), but
> > still to not probe for the i8042 but just use it after looking in the
> > IA-PC boot flags in the ACPI FADT table.
>
> OK still waiting for v5.

Since the time is tight, I could quickly make the changes in patch 2
and send it over. I believe 8th is the last date for new changes.

