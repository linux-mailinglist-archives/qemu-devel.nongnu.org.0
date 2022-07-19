Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD5D57A0F7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 16:14:16 +0200 (CEST)
Received: from localhost ([::1]:57812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDnzL-0003tg-E7
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 10:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDntG-0002qr-QP
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:08:00 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:37420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDntF-0005Yq-9i
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:07:58 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id 75so26642131ybf.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 07:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YrjZTM+lCIXdJBrRdkNgdpNu8NIdAWWTRIlLgtvOCUk=;
 b=qRu0zL7xoS+xMUPI/DeUEWC3Nh2Q0k1kwzOoTVqE4fvaqJgcWjKzIAe4ltT7LHO4bh
 W0oLdUwu/VTdhDZ3MwSnweuTXPC4o1RSk/1A9ERH+HldJPM/lQhpXXKo9LF0/ve/bYNu
 K+7WD5E86Wb2fHvnbOI49AptVGJOmO+Uf9RCqqrxGelg0TelzEivXfyWYStu2R/vJ/Qh
 wKqORl4gRPXWUOaggk6YLrh09q7KN5RtC26PmwWmRnlKeZMBR5k7jRRVRYclvsCaFtFo
 gFwROORdtLZYz7LL/9xfpws5sybweWCxdSn+SwgAfUah+J8KLNjDhSDj3Z73pHGufgvl
 pPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YrjZTM+lCIXdJBrRdkNgdpNu8NIdAWWTRIlLgtvOCUk=;
 b=K2pZhbtYZGcmOm9Gjw+2EM+MP80hr/jM6bBQh0v7bgvm1zIvFg5cVIMQzgSbBcVo6l
 MZ3zb2pliphaJpac5jyxfJXYUw2dr0S+Fy6fJP20tca776tG3oH2/1Oq2joav2AJNXJm
 DGx3d+LrUKU7zdD1cBTkH8WNUsomqk/VkK/DIBhOWKF3lEVenyMOH6HPSV40MQWX//nY
 R0/AsC+FtJX1l0kuxTgE/LN5CBxaUeku6VC50XzfGgUYYOBdFmqB6/61AMwhIj7zE++r
 ZvGsGFh+2xzZ/xyQ8xDt5I2C1/iGALaeQthp05SclUthz2e+5e4DvJG0rvbIWXSQF3jV
 GmfQ==
X-Gm-Message-State: AJIora/gygmnjREP6ybfT+6+YvqrYu34dkb/FeTvWiSzC8bwncrrTMis
 iEAcLcGNIdkLXeyX1z7LePtcewN8VGCgpeSSFh7f8A==
X-Google-Smtp-Source: AGRyM1vnPKX60Us9fqB5prswYSCdBUPhrguab0PPPL3BTSlpJVBu6gBcnERRAPIvb1ia+z+Z8mbuo6DwcZAik/fvlOI=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr32657800ybr.39.1658239675930; Tue, 19
 Jul 2022 07:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220719115922.306265-1-anton.drap@auriga.com>
In-Reply-To: <20220719115922.306265-1-anton.drap@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jul 2022 15:07:45 +0100
Message-ID: <CAFEAcA_KoJWADwr3X9p6iOLx4221dDv9mcymyJj+gdXzt132aw@mail.gmail.com>
Subject: Re: [PATCH v2] Loading new machines and devices from external modules
To: Drap Anton <drapas86@gmail.com>
Cc: qemu-devel@nongnu.org, anton.drap@auriga.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 19 Jul 2022 at 14:57, Drap Anton <drapas86@gmail.com> wrote:
>
> From: "Drap, Anton" <anton.drap@auriga.com>
>
> There is no mechanism to load external machines and classes from modules
> at the moment. This patch is to add two parameters `add_machine` and
> `add_modinfo` for it.
> `add_machine` is to add machines from external modules.
> `add_modinfo` is to add devices from external modules, needed for a new
> machine, for example.
> Main aim is to have possibility to develop independent models and be able
> to use it with mainline QEMU.

This is deliberate, as a policy decision. We don't really
want to encourage people to develop device and machine
models externally -- we'd rather they contributed them
upstream. Code to support out-of-tree devices and boards
is pure burden for upstream, with no benefit to us.

thanks
-- PMM

