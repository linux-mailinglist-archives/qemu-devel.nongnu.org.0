Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9F854FC0D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 19:18:42 +0200 (CEST)
Received: from localhost ([::1]:33930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2FcG-0007oK-8w
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 13:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o2FYK-0006BU-Qt
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 13:14:36 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:44940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o2FYJ-00050g-9G
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 13:14:36 -0400
Received: by mail-ed1-x529.google.com with SMTP id b8so6981063edj.11
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 10:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8tndABqXnSD7fzGGPtHJX5NQCVVm9lKjSswWm9x5Zyk=;
 b=CK/nTBCovyhd8vSkmzNl/4RK+ky780yFmY3IDXeqIa9CSx4wm/5qTcNCJ4BaJnCIJG
 3ctUv3UposKj8HDYNOP4+bxhlq+EhwxnP31eLJW6e005qZHPiYBa176p5dx6sKRHpbCn
 vgdcNiXmAHdwCf379ZWehvRIrG4eLv5+QgqUqB8tIlNEtGWCaB3TZSHtKGSj/xgDgwdf
 lR1ABFnFgEWHNRG6Zw+Zxx5v+a2Sec44V0dDIHwHOjfoMkNAWAC1xTD3fRGRUTjOgcVs
 IhB6D0mL0jJ8zf8CiEvI7opUOGou1wQHHue1eZg5tNEle0R9wnr54CQIYKAK93/To/CC
 o2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8tndABqXnSD7fzGGPtHJX5NQCVVm9lKjSswWm9x5Zyk=;
 b=KjFO3527m6KOGYKo4JjeDUNpToeLFXzmA+UvLdXCcSYklDVIlxvsHHDO9oPPC26/VK
 ZcbCDHOEz7OgyYZpYXSLXNg/4I7RFPzcEouqU23gc8Rz/iJ7CKU4RgLwbQXJSJRfH65e
 nNbLbWRPAj7McuIJHlPg9H1Avb4xnOqflV0rMiS38YOjb+z6JNj4VcggxfrpNGaz79o3
 ENScVMZzIJXKujGlKhjvAz21iC/YowlazoAre6bbVShsiO4cNSmXvpf81UX6toe0EVXL
 2TK8yH2PgtF6vdGFOVrWqLP9R4T/m1mM+xJsYMAulvRPDLgyrv2sVbPV0xfgu1vDZ073
 ofFQ==
X-Gm-Message-State: AJIora+wC+apknvpa16eCIHmoP6cTQ0pYQUWwABKGaKd9ixHP8tVA/M5
 c7LVaH4whAlaV92wPaBACk54AkKzQXdQVGUlm8Mc8Kqw2O4RqQ==
X-Google-Smtp-Source: AGRyM1uEzG0oTn8PpzY0/XIp9BO3C+khYvcKT5kExXhCL2y0eP6Y6TBb4mzQJgStp0RWqxbuChXj0ywDOdC4vbB+k9g=
X-Received: by 2002:a05:6402:524c:b0:42e:320:bfbc with SMTP id
 t12-20020a056402524c00b0042e0320bfbcmr13840531edd.65.1655486073357; Fri, 17
 Jun 2022 10:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAARzgwxLQt13Ago2jDSr4oqkrP0DHzjO8HP_wotwxnmi-=Wdmw@mail.gmail.com>
In-Reply-To: <CAARzgwxLQt13Ago2jDSr4oqkrP0DHzjO8HP_wotwxnmi-=Wdmw@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 17 Jun 2022 22:44:22 +0530
Message-ID: <CAARzgwzxOj=WKMhnMR7Xdgj0MGBRaO89zbc2FWV4j7+UU7j+Fw@mail.gmail.com>
Subject: Re: A new qemu acpi test with bios bits
To: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::529;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x529.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

oops, Phil's redhat email bounced!

On Fri, Jun 17, 2022 at 10:41 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> Hi :
> I am trying to write a new ACPI/smbios test framework that uses bios
> bits (https://biosbits.org/ ).
> This test will effectively:
> (a) use a pre-built bits software zip file kept somewhere (where to
> keep is TBD).
> (b) unzip it.
> (c) add a python based acpi and smbios test script to the unzipped
> bits directory.
> (d) make an iso out of the directory.
> (e) spawn a qemu instance with the iso. The iso is built such that it
> runs the acpi/smbios tests in batch mode. After running the test, the
> spawned instance is killed automatically (vm shutdown).
> (f) Collect the logs the vm has sent out.
> (g) look for test failures.
>
> My question is, what framework would be best to achieve the above? I
> looked around and it seems closest to the avocado based integration
> tests. I do not think it is qtest and qtest backend is not required
> here.
>
> Suggestions welcome.
> Thanks
> ani

