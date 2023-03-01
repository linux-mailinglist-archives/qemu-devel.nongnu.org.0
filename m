Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D93146A6809
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 08:18:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXGid-0006OD-0T; Wed, 01 Mar 2023 02:17:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1pXGiU-0006LR-S9
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 02:17:35 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1pXGiS-00078H-U6
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 02:17:34 -0500
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 582203F22C
 for <qemu-devel@nongnu.org>; Wed,  1 Mar 2023 07:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1677655048;
 bh=QKsQ8l9IumEXVWV7TuEdX3URZpzq7WR5mdnaFgwQN0A=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=iaeft+Eff+i7FH1W7mQBgo5Wcb0HwiC2nKTuoyVKiOR+nMIppxyg61BNroR4U7lM2
 W1r1cs+qNBHJ3rDCMOes2oWYUpwcVRRqMxMeUmTNyJfFNTUocjfYOuHm3LUq2KTZ3f
 7kS3wYFSP2ASpySa2UEhms6Ou2P1+79pCAsm61el/Yl0JMOfa78PRE8v0iU4g1/BuT
 Zpju+Jskqa0G7msK8nB9HcIVxQJHRnUfPRKrEmxvJbD8Haplrze1L+8ZUQ3+WFGtir
 Vy31SydTEQVOFgJk8CDHkombhTU41KvUGM47ycY8m1gsgiGWWxh1P/fsEb8zpMZtsh
 jIbwU7HR+WO1Q==
Received: by mail-pj1-f71.google.com with SMTP id
 m1-20020a17090a668100b00237d84de790so3673023pjj.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 23:17:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QKsQ8l9IumEXVWV7TuEdX3URZpzq7WR5mdnaFgwQN0A=;
 b=PQNwhrJL1hU0GXN+mjWy9gpD3v52HVUwcFCAQUWfYAxuG4qwdkgzL7OZIsEts0MIAU
 IqbD+mh6tnTfxKs2wLgyQp1ELY7Qm9aUiEYqXYv7Fd6Bd8QV5ydni59tKtJp3vkexIZb
 IAqKDLGlLINAIrVaxuJniLws7sXrM3uj3cc5RuMiJg4jXnjz88omAL1zeqwnQr6kApNp
 iDar0OfsdqODlgMo9/R4zsniaTw8ahkBFRgR5mqB0Bus4jJr3ChnBPd/Jz5jiKA6WUfb
 xBddXlIypkPh+nNxShPpa6BAZymCGvEKzNyRPoW3PcfA/J34tnUa5CDrZrUDLc7Zozkn
 JBHw==
X-Gm-Message-State: AO0yUKU7K6Y/FaeuMY11pGnb723scHIpZyDLL82xsCJFNpS0TzXGb5+W
 7/v+XBLE43oGL9zoc+cwRibQIgte3LtDs2MWo3EVrcIRrRwVnRS7GE+9COFnUOSNbNoP/PRnprp
 mEmXHG29W2H6tO+c+Lu/K7dM+ETrNJ4HVBwCz4rpqgIuH5jdD
X-Received: by 2002:a17:902:da83:b0:19a:9434:af24 with SMTP id
 j3-20020a170902da8300b0019a9434af24mr2137458plx.10.1677655046869; 
 Tue, 28 Feb 2023 23:17:26 -0800 (PST)
X-Google-Smtp-Source: AK7set+rq/Y/FL90JgDZErVy6AH9TvseY++Jhx/YgJU06WEO+LxjliR99MDfyRlBg/YgNSm1GYrOw0c5EBKAFFt+/8M=
X-Received: by 2002:a17:902:da83:b0:19a:9434:af24 with SMTP id
 j3-20020a170902da8300b0019a9434af24mr2137436plx.10.1677655046111; Tue, 28 Feb
 2023 23:17:26 -0800 (PST)
MIME-Version: 1.0
References: <20230104090138.214862-1-lersek@redhat.com>
 <20230104072457-mutt-send-email-mst@kernel.org>
 <7122894b-ccbf-9d30-ee54-c23c25c0f82b@redhat.com>
In-Reply-To: <7122894b-ccbf-9d30-ee54-c23c25c0f82b@redhat.com>
From: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Date: Wed, 1 Mar 2023 08:17:00 +0100
Message-ID: <CAATJJ0K8Qt3-gNFT4nmweRFk-1bSHGicuLPim_V7EjgaXmLtGw@mail.gmail.com>
Subject: Re: [PATCH] acpi: cpuhp: fix guest-visible maximum access size to the
 legacy reg block
To: Laszlo Ersek <lersek@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>, Ani Sinha <ani@anisinha.ca>, 
 Ard Biesheuvel <ardb@kernel.org>, Igor Mammedov <imammedo@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-stable@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.125.188.123;
 envelope-from=christian.ehrhardt@canonical.com;
 helo=smtp-relay-internal-1.canonical.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Jan 5, 2023 at 8:14=E2=80=AFAM Laszlo Ersek <lersek@redhat.com> wro=
te:
>
> On 1/4/23 13:35, Michael S. Tsirkin wrote:
> > On Wed, Jan 04, 2023 at 10:01:38AM +0100, Laszlo Ersek wrote:
> >> The modern ACPI CPU hotplug interface was introduced in the following
> >> series (aa1dd39ca307..679dd1a957df), released in v2.7.0:
> >>
> >>   1  abd49bc2ed2f docs: update ACPI CPU hotplug spec with new protocol
> >>   2  16bcab97eb9f pc: piix4/ich9: add 'cpu-hotplug-legacy' property
> >>   3  5e1b5d93887b acpi: cpuhp: add CPU devices AML with _STA method
> >>   4  ac35f13ba8f8 pc: acpi: introduce AcpiDeviceIfClass.madt_cpu hook
> >>   5  d2238cb6781d acpi: cpuhp: implement hot-add parts of CPU hotplug
> >>                   interface
> >>   6  8872c25a26cc acpi: cpuhp: implement hot-remove parts of CPU hotpl=
ug
> >>                   interface
> >>   7  76623d00ae57 acpi: cpuhp: add cpu._OST handling
> >>   8  679dd1a957df pc: use new CPU hotplug interface since 2.7 machine =
type
> >>
...
>
> The solution to the riddle

Hi,
just to add to this nicely convoluted case an FYI to everyone involved
back then,
the fix seems to have caused a regression [1] in - as far as I've
found - an edge case.

[1]: https://gitlab.com/qemu-project/qemu/-/issues/1520

...

> Laszlo
>
>


--=20
Christian Ehrhardt
Senior Staff Engineer, Ubuntu Server
Canonical Ltd

