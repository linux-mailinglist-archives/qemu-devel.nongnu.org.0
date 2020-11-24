Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE082C3424
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 23:41:49 +0100 (CET)
Received: from localhost ([::1]:55428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khh0N-0002v6-L9
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 17:41:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khgz6-0002R1-Tr
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 17:40:28 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:35600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khgz4-00064J-TL
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 17:40:28 -0500
Received: by mail-ej1-x633.google.com with SMTP id f23so280793ejk.2
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 14:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2skC0eDQQspFhyFqJC6WSLGpTsuxs9L+KJAOlyAN2YA=;
 b=KJyby2YOFHdiW1f/nl1JO8n3bFNwjXREAZlGi/7Ws0HvSrqNLRVrnjSmB05q0b/Pan
 wMQgxqYUuEY3wK4vh7piIiRWc4c6Tb98eE1YH34nheNBq23cLJUMQgZk8Zn7tJlJrmnl
 Ac4zYyXbpx5YpOWUit6ohojtdIHFEAgL1GtQodH6THBh0ImMNjvqv/x5BWGGiA+eVtP1
 5wpy+hzReeBTW2jPNEN9aGeR0ZY0gr9AZmcrvKWnhK19KVPMOYo7sTvB5XMdkqApgWaC
 dPDI3PE0/TYQSUrDxqYTK5IyZ7hWOtRsAFepgdS7q4+JkCbkRsinSSKSEmge/rJVttxB
 okNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2skC0eDQQspFhyFqJC6WSLGpTsuxs9L+KJAOlyAN2YA=;
 b=fSvh1QC9MydBN0qi4sSKeJOdtGJm9+FzhX66V62o6XnqKNsGdkCmff3ia5dmg6lL3/
 Eh6LrOhhoINSb2c+1x9UOWhAthCk3y66vENY028viZjfxAr/9Ita0486dYmTiwvMvv3R
 tdRwNQGBNGIVJseaOBs2t2n5xoe5MwETS+/JdeHhabjqo6X6FQG/TCJKnmEotMdRAFCm
 sSx/qy0PMEgp8VEfdPl15wXxV8F0K6fte2eFPoe/k7jgtptaiL/lQV8wZNHf2LOXo1a3
 e7tR/wf4Av6Lj6qcg3G6QZigFvKROtgDq65GH3Sy4pvFZVysBvat2yMVOEeabnhI+EQE
 ijDg==
X-Gm-Message-State: AOAM531POtdx/3tRriADhKQA6bCRKzSpBYKbIomYiDS2jjc0Ro83e+td
 y4iSFX3eNwxZd6NLVsARAiD6XWOEFQX9hJUMNi2r9A==
X-Google-Smtp-Source: ABdhPJye+shvZj6J0Bxzvr+QsSIZ+ZDX1PCqRVCvhZX4S/UyuZeIRa5TX1wEoDiUGAy+HYs/SgB4Suo5KYHtgh346C0=
X-Received: by 2002:a17:906:680d:: with SMTP id
 k13mr580919ejr.482.1606257625432; 
 Tue, 24 Nov 2020 14:40:25 -0800 (PST)
MIME-Version: 1.0
References: <20201124151500.2945356-1-ehabkost@redhat.com>
In-Reply-To: <20201124151500.2945356-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Nov 2020 22:40:14 +0000
Message-ID: <CAFEAcA-7MhM8uErhyvpVGerTJqmwurV7_rZ=urBzz=WUCGfVHg@mail.gmail.com>
Subject: Re: [PULL 0/1] PCI host devaddr property fix for 5.2
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Nov 2020 at 15:16, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> The following changes since commit d536d9578ec3ac5029a70b8126cb84bb6f2124a4:
>
>   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2020-11-24 10:59:12 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/ehabkost/qemu.git tags/machine-next-for-5.2-pull-request
>
> for you to fetch changes up to 28afbc1f11f5ae33b69deb162a551110717eec94:
>
>   Revert "hw/core/qdev-properties: Use qemu_strtoul() in set_pci_host_devaddr()" (2020-11-24 10:06:54 -0500)
>
> ----------------------------------------------------------------
> PCI host devaddr property fix for 5.2
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

