Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4D848639C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 12:19:34 +0100 (CET)
Received: from localhost ([::1]:45114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Qnt-0005XS-6i
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 06:19:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5QlI-0003HG-E4
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 06:16:54 -0500
Received: from [2a00:1450:4864:20::32c] (port=46743
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5QlG-0002gf-2r
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 06:16:51 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 d187-20020a1c1dc4000000b003474b4b7ebcso325500wmd.5
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 03:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WkFddHeiADyeDwdjOSgYjOcHfU0JFc9gAV+rc7sij4U=;
 b=cM7U4SxQTEVSH3NE52d366HdLTVuVHCH6zBQ0WH8tU5ftgA/GcxARRZbsXAnlk9Zi3
 FtN82v06M5Pl6wNdNYLfTOhJb3y/pZXzcy7Y9TOOC1+iqFgqgqUCUVGpaDYSJccOXSB0
 Nu4GRJZOBf1/ji/ktz+HKe5fQtj5bPOMuuu7+ck6H8sLof9HU0uvTygI3ViFkV42C+yL
 qFh7KKa5gkuwEriuQW22LEzevA6m6zR2MEMmcXm2TjBGQBeODeFzCY7L36cwaET7yysB
 e0iTBQ0CPnOl3Urmc2NRQZokJnbBHgI+PfHnYDcp9aNeWKSOK2wpyvjUbKkFMiF03TUo
 EOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WkFddHeiADyeDwdjOSgYjOcHfU0JFc9gAV+rc7sij4U=;
 b=DkW2dW4jiVLNJSZquaCMnrp0r+x2Uo9sTmJ8q9QTc/z/vTL4DiXJ6nVPtNOyWIhNx6
 yqcd8DjrLSIY/WjWQn9aODbwkH53TcyfoLTfySl9dkI2lA+532kJjkS2HAdkqv9OWQDd
 Gy6nhaoxqIbHgmaTWHTE7JK2uS5QjnPsj/V39pc7Xmsc+4SSV9/vLtPvsqmrsNkrbJL5
 tKTO+4VIWhKVYxTzQOIuYwo9dC4Wa8A5a7cly6zAG6POFAusXNtKKJgW0i7SMsZl0kF3
 pXjwU/Yt5qbF5eWaJmBC43m4TqM0JRdpkzJenPTIjdpKSa8b+pwRGTpt8nmbmJ+S0IkO
 xCxA==
X-Gm-Message-State: AOAM531vbt8Y8FO8UQe/76WYGEKn9JviQsGvUNkn9sN38xp0FW+U0t7r
 ArSho9ZCaHOkgRepWslCIz/JoY6AVK7i5v6MeNsYRQ==
X-Google-Smtp-Source: ABdhPJyrvKJ1yV8H8YUnTGt9Hlm2vRKy4P3VdaDWhK0nOzXrNk3kcwf6anjZKKnp8nkJXBQg5rREeH6Xx8LXKAov2fI=
X-Received: by 2002:a05:600c:1991:: with SMTP id
 t17mr6662712wmq.21.1641467808449; 
 Thu, 06 Jan 2022 03:16:48 -0800 (PST)
MIME-Version: 1.0
References: <87czl6jb79.fsf@linaro.org>
 <fbc66bb0-2c15-d789-bbaa-f9c3ba6f81e4@amsat.org>
 <87r19lj3l3.fsf@linaro.org>
In-Reply-To: <87r19lj3l3.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jan 2022 11:16:37 +0000
Message-ID: <CAFEAcA9XX26RHmNM59Zc13dwvhv83bAnomLp7Yj45Wmf16W66w@mail.gmail.com>
Subject: Re: Trying to understand QOM object creation and property linking
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 5 Jan 2022 at 21:05, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Can't be added as a subregion to the container...
>
>   qemu-system-arm: ../../softmmu/memory.c:2538: memory_region_add_subregi=
on_common: Assertion `!subregion->container' failed.

This assert means you tried to add the same MemoryRegion
as a subregion of more than one parent MR.

You can either:
 * pass all the CPUs the same container as their "memory" link,
   if they all see the same view of the world
 * if they have different views of the world, you need to
   create a container for each CPU to be the "memory" link,
   and to populate that container you need to create N-1 alias MRs
   of the board_memory MR (CPU 0's container can use the original
   board_memory MR; CPU 1, ... use the aliases).

Example of option 1: virt board
Example of option 2: hw/arm/armsse.c (look at what it does with
the s->cpu_container[] and s->container_alias[] arrays)

-- PMM

