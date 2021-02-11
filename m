Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 570EE319157
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 18:44:40 +0100 (CET)
Received: from localhost ([::1]:59704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAG19-0004ku-EX
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 12:44:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAFxZ-0001aI-3a
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:40:57 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAFxW-0005hD-Uy
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:40:56 -0500
Received: by mail-pl1-x634.google.com with SMTP id u11so3673476plg.13
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 09:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QziDmZr8TTpasbvFZVUT/329P3XT1UCmwBzrVbDzVt8=;
 b=CZZ0dXb/akrEVv2gQQECboWALMHG7RAyWsSQM3mxEpIvbiek4NeIVFxUsJbwfNUS1F
 5l2Hwc3f005aESd3X699lGHhAOb7vfkMWnvZw0TzSLlkXPN/mwcP06Ate3WnBqutLlGw
 1vn4omxqbInwoBzJgbYQLZzODZnev3BBGI9as4f0skV7jhURhiiS4e+3Hb90+uogCy9J
 aDQ71xGirH1r0z2TRzWtPDbX7Me+ZLFWNdBoDZpNfRsHhZI1CEw5JOewM68MuwzUM1X8
 zfhcbbe2jGOmNIGQnCbus3G1gzKLviS5KedNNawoXnCKJUGm0kMO1ZiwAC91PUKILivP
 sGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QziDmZr8TTpasbvFZVUT/329P3XT1UCmwBzrVbDzVt8=;
 b=qa7/aah6riy2SiKp8PMp/G0MrZZD1HQvG9ohKL+xuvk6gwIOjVLo6YAYV1p2d4LbYI
 7NRJODKeB0AYpivfZrqstctqjEMNQh/krbgddakmvViuz4zgNsaWH4NLIWgYvDFTRtKg
 UBdmNH8Np3IzXPFDeED5pBOdx6nZ9Mi/GuDsiqK2G2i9KJRAhXtroJMWA46sQzLm+dM5
 blJaNODcKRf7lfGPxtjljGH2osh85iOuaOzqgMTcq9MwHpTm3zodQCgdpj7jOL+2Wjzc
 2veNlSdLVrM8qPIe988XjDaZ8sCxHmklXjDVF0Frf/HqxpQquJWIxqzOfiK4O03xJy7w
 hoMQ==
X-Gm-Message-State: AOAM532GQCJXp93F9hT4zIGT3pjYwqXOmpuBog3chZ4koBwSMSQpRHg6
 H0gFqP3/w81TfzKc3Yz9LnX8guiUyA9ybK7riEeRhQ==
X-Google-Smtp-Source: ABdhPJwnwxrzPvItcE7Xa8pNbvWQIHYnBMQTywNiPe0cxc7ZYs5qbKGkU8WIgEdLbvZvJ4SMYkxbpVcNIY7Jt3hhMWg=
X-Received: by 2002:a17:902:e989:b029:e2:8c9d:78ba with SMTP id
 f9-20020a170902e989b02900e28c9d78bamr8505067plb.81.1613065253570; Thu, 11 Feb
 2021 09:40:53 -0800 (PST)
MIME-Version: 1.0
References: <20210211171945.18313-1-alex.bennee@linaro.org>
 <20210211171945.18313-2-alex.bennee@linaro.org>
In-Reply-To: <20210211171945.18313-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Feb 2021 17:40:42 +0000
Message-ID: <CAFEAcA82Fv34Ri=s97rx8hUPrqMeL4xOS325DbY1fhoWmiE+9A@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] hw/board: promote fdt from ARM VirtMachineState to
 MachineState
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: julien@xen.org, Eduardo Habkost <ehabkost@redhat.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Stefano Stabellini <stefano.stabellini@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:Virt" <qemu-arm@nongnu.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 stefano.stabellini@xilinx.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Feb 2021 at 17:19, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The use of FDT's is quite common across our various platforms. To
> allow the generic loader to tweak it we need to make it available in
> the generic state. This creates the field and migrates the initial
> user to use the generic field. Other boards will be updated in later
> patches.

This commit message says this is being done for the generic loader,
but I deduce from the rest of the series that you aren't using
the generic loader (cf discussion on a previous version of the series)...

thanks
-- PMM

