Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4821629B85
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 15:06:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouwYV-0002ah-F5; Tue, 15 Nov 2022 09:04:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouwYI-0002Wn-E9
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:04:40 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouwYG-0001Mw-0p
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:04:38 -0500
Received: by mail-pf1-x42b.google.com with SMTP id k15so14214460pfg.2
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 06:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4vw0jWL1UY59JxLi28pCqqiElu56mQCm09t30sAn/ZM=;
 b=SrsNf4dFX4YGdqrq2RTAgzGZ44zQ/EJ6DU2J55sykOHfm25zOUUG/tlH+bJtxCpaYY
 TToC++quRtrCPuIOmT00/iZex40eiqrjm3USxtgtK3O3Byn+tcCMjCTOJvro+ssOVMzT
 83ebh/Y/fDxFoFoYw3/GUNvL2jfP4+pG1WlmADVHM3TQdw9lQjDMtrY6qhHvmG8RpOQw
 CK5S6gPTBA9c1al8NXqQCT0ObkdYOVoQqob+WVUrOkzHWcvdmCpQy5mfqYvCGwlTDGxM
 fgjHoXZ+j5X7C9B4l8ttXymEITW6IfNalGfX8EHdWj5sAjS++hDloN9yrb6bvgIi2HnE
 kleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4vw0jWL1UY59JxLi28pCqqiElu56mQCm09t30sAn/ZM=;
 b=nydVTRRPKteDujweXAkaqhCkMJW3M+pX3kdVWsXiqQRuH76497fTz7A+7xIu/HPUWG
 cfUsc2EBrbfCxiQ6FpSGDcHPff2u8AVTTzYezA2oKJcwtkb2uFsFsOFGR4hahd5ev0nM
 wOACgHljYLxMDnJeqp+9OuYdihTYXYurOLB5qwWWRHO1cuppOcavdwZsNA/6Wwy37COk
 WVcV//X0LdTNRr7vfU5FDxGNaFJSsD2EOKzn+9Iag1oQGnY8KMPASnawbQZDsETs4MxX
 caKBQSUQeqUEkZ3z+7zaBnFbQ4ad7ttRsEPRo/ON1VPxRa4F7YeQbi0IRaQ+OIas5fZh
 g7GA==
X-Gm-Message-State: ANoB5pnQi/iP0BMhaUCrXMJ/lJjl6ZFVL8arn5a6116F/EwfGuFqQc9A
 Sy5KI5SDCSg+3s1gG/l3F8jJ66sho9JlC/a0aVPWYw==
X-Google-Smtp-Source: AA0mqf65/14kGha/JvK4McwqbI9jQsfD+IZCEq9Y5FPrN98q/JBkZCdQ/Vr6zOYSjGp8TF5O7Ug/ytpbv/Di9odUE7U=
X-Received: by 2002:a63:1665:0:b0:426:9c23:9f94 with SMTP id
 37-20020a631665000000b004269c239f94mr15986791pgw.105.1668521074287; Tue, 15
 Nov 2022 06:04:34 -0800 (PST)
MIME-Version: 1.0
References: <20221115134048.2352715-1-alex.bennee@linaro.org>
 <20221115134048.2352715-3-alex.bennee@linaro.org>
In-Reply-To: <20221115134048.2352715-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Nov 2022 14:04:22 +0000
Message-ID: <CAFEAcA-fehcRRAEO2ukN5bcgZKqbXxOWrGn8-8Ez=Wwxy9VndA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] hw/intc: add implementation of GICD_IIDR to Arm GIC
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 15 Nov 2022 at 13:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> a66a24585f (hw/intc/arm_gic: Implement read of GICC_IIDR) implemented
> this for the CPU interface register. The fact we don't implement it
> shows up when running Xen with -d guest_error which is definitely
> wrong because the guest is perfectly entitled to read it.
>
> Lightly re-factor this region of registers and also add a comment to
> the function in case anyway was under the illusion we only return
> bytes from a function called readb.

This bit of the commit message hasn't been updated since v1 :-)

-- PMM

