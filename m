Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4022D472BCE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 12:54:26 +0100 (CET)
Received: from localhost ([::1]:35210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwjuS-00070p-T1
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 06:54:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwjss-00060O-DB
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:52:46 -0500
Received: from [2a00:1450:4864:20::42b] (port=37485
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwjsp-00053L-Rs
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:52:46 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d9so26605933wrw.4
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 03:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=thQILh+35hw25mWGuSCRaI/xLJ09h06wKbtYwHEn9u0=;
 b=BrlOcBv7yxhqhZpRMEEpXL8X6JEcZ5eLEh00fSg8qH4WDnWjbUyT9v/cv9V2I/jYsN
 IMSzFAEEgj5ALLOAEYI9u+0pIwDjsTHw9jxbREcy3yQEWquhAm4pMKkIO6Qtjgc8lVlV
 eNBbApDh1M+RW3/nbj7wE/80KAR4+OyTIptUfhAIEoAaKO0tcIpcqWAoC1ZNL7XfvYzD
 hAT+rPDJFI6OHe0X93BqD+7LPUrTaNk0EhSxyjrObms/QfP/V/0z4zuirWrnYqsPobvn
 ThhHBifzhqLvpwUCTHiq/8SxLBJRl7n09JaucFpIIAiHMmPQ5hcA1RIDVuT1+Z7BajxO
 DZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=thQILh+35hw25mWGuSCRaI/xLJ09h06wKbtYwHEn9u0=;
 b=rML3ZYs/npdKGF5BGtZVqRYxNwp9F6zzX2+vHSD5lGefGDfRli+1WrsflsKfuBh8aK
 atoLB6zBxhXKIZti9DI0bTnMFw3ziDqaVh+PGRzziXZ9xMCXyWZpwrWbLctbkO2ZLgKu
 65BusMGuy9q0EhlYzlKsSIE7MofeSNs1lsBe8S6NPKm7/geCx7ZeYTCOWWEacMirTyhb
 coeGJlkKGwQ5geOt1TpVSIXyWJYAwaPX9pXvbTXMQRQ7tJOBT2Jjr/6LJTbyZYOkInBX
 +NL7A0bGFgQZwWJIASo5srrEZi7XX0kvgytg3bhqJr+veho+DaWccmr2t8jmUjMQwjZ0
 mw4Q==
X-Gm-Message-State: AOAM531WjRargEtHs7shnnnJyHBQqL+XBwGwQ8cYbFGLwht9xzrAbRVf
 GTCE+Q8fVK3kGSTQppNilJFhWQ==
X-Google-Smtp-Source: ABdhPJxKGWQ0uVwBXyxgO1PVWdvhTIpPu+fodxRyyWy9fR4YYhcPA4bLOuX1Q+UA0GL7X7Q4ZS88Kg==
X-Received: by 2002:a5d:64ce:: with SMTP id f14mr31552286wri.165.1639396362518; 
 Mon, 13 Dec 2021 03:52:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k187sm7344987wme.0.2021.12.13.03.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 03:52:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 03F311FF96;
 Mon, 13 Dec 2021 11:52:41 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-9-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 08/26] hw/intc/arm_gicv3_its: Don't misuse
 GITS_TYPE_PHYSICAL define
Date: Mon, 13 Dec 2021 11:52:35 +0000
In-reply-to: <20211211191135.1764649-9-peter.maydell@linaro.org>
Message-ID: <87bl1kn2lz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> The GITS_TYPE_PHYSICAL define is the value we set the
> GITS_TYPER.Physical field to -- this is 1 to indicate that we support
> physical LPIs.  (Support for virtual LPIs is the GITS_TYPER.Virtual
> field.) We also use this define as the *value* that we write into an
> interrupt translation table entry's INTTYPE field, which should be 1
> for a physical interrupt and 0 for a virtual interrupt.  Finally, we
> use it as a *mask* when we read the interrupt translation table entry
> INTTYPE field.
>
> Untangle this confusion: define an ITE_INTTYPE_VIRTUAL and
> ITE_INTTYPE_PHYSICAL to be the valid values of the ITE INTTYPE
> field, and replace the ad-hoc collection of ITE_ENTRY_* defines with
> use of the FIELD() macro to define the fields of an ITE and the
> FIELD_EX64() and FIELD_DP64() macros to read and write them.
> We use ITE in the new setup, rather than ITE_ENTRY, because
> ITE stands for "Interrupt translation entry" and so the extra
> "entry" would be redundant.
>
> We take the opportunity to correct the name of the field that holds
> the GICv4 'doorbell' interrupt ID (this is always the value 1023 in a
> GICv3, which is why we were calling it the 'spurious' field).
>
> The GITS_TYPE_PHYSICAL define is then used in only one place, where
> we set the initial GITS_TYPER value.  Since GITS_TYPER.Physical is
> essentially a boolean, hiding the '1' value behind a macro is more
> confusing than helpful, so expand out the macro there and remove the
> define entirely.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

