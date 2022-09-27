Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753B65EC539
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:59:05 +0200 (CEST)
Received: from localhost ([::1]:36430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odB72-0002V5-JT
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od9Ct-0003RA-1x
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:56:59 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:45579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od9Cr-00072N-4x
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:56:58 -0400
Received: by mail-ej1-x636.google.com with SMTP id dv25so20101236ejb.12
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=fN9CNSSp9QD4DhPtMwCnClQHPB7aKH5qbOBL+jucZP0=;
 b=CLVkfux/8C7pJ1rPYedPBO3QIFOOPtrJVljnKjDRWoMYuNOTwi480lQzeJMK5SA8MJ
 f2aYizK0SprUvmnxbNbmLCrDHZK7tfgOrPZtORt0WfNT9lHqbbgjB8O1teXLCeu93yo0
 n4VYAhO6qqvtbqXBiAJz9JGzLITJBm5PO9ttdjbiFk8y8wzLoW5euc5GL9fQ7n7ltAZ4
 7vF53Z/88TZHTT8djapfSXmZoOlcIVccLNR98sNPOjGc+gU69f8Myx/jdzXJxgIArQTz
 +p3KhW+mVYtPrTtDKIFTS0B7I90q5M6dgzCBZM4LjbGAE2VlyJDxilTGv4vGKaqO8xa8
 I5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=fN9CNSSp9QD4DhPtMwCnClQHPB7aKH5qbOBL+jucZP0=;
 b=gfnoSTXfpnsDxdK6TDymfy5wohv+e1RuhiQGl5WR1Gdc/QJzdMhac8vD7DaXaI8uWq
 VSM4kL5Q4oN+PNMdnmwkR5JBWlq6uE7JA03NK5CFBsPswt7VqtJqe9GwIpluQEUViHX9
 bukNKTa06MKaI0C6oxM565PfqB0xBUu8c4Odx4jXifhqU/UxKyh9wRxnyjU+VvSJWL4b
 oJrz/kOtHPa1WEa2K6stibvT8gS+SFB4wRSXK3wsuJiK48tDS5ZyZnwNrR5zwqELPFUy
 0o72qyvOh2Q4MLdpmLiUqvKRXrOclP8v9I9hUk7lN154GV9GEDmqR+uEN8gV/IZNsXUx
 pTOg==
X-Gm-Message-State: ACrzQf2A+BcSbnaUbWdWJnmCt6oicW1jVFnZgHixvFqNKJe+897OuHvB
 4rRFuJ2uwKi3SzjNEnItQ17YACdvlhjxD4YKRL2q9Q==
X-Google-Smtp-Source: AMsMyM6NCwb2p0gKge7s4z8QGiYAKXJlAD3NSpjZrvudrF0fe025boWWvknizqdgaZL3/jZ1nxCCYK/6DVAGqvhy7RM=
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr21919178ejc.619.1664279811942; Tue, 27
 Sep 2022 04:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-5-jean-philippe@linaro.org>
In-Reply-To: <20220927100347.176606-5-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 12:56:40 +0100
Message-ID: <CAFEAcA-5BDiv6sXJ_kpzCwpu20PJRQzOpS08bAswyJiFMSiT4w@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] hw/arm/virt: Fix devicetree warning about the
 gpio-key node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Sept 2022 at 11:12, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
> The node name of the gpio-key devicetree node should be "key-poweroff":
>
>   gpio-keys: 'poweroff' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
>   From schema: linux/Documentation/devicetree/bindings/input/gpio-keys.yaml
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

This restriction only went into the DT documentation in July
(kernel commit 5eb5652250).

Please don't retrospectively make perfectly valid working DTs
non-valid. I don't see any reason to change QEMU here.

More generally, the set of things you might want the
validator to warn about for a fresh new human-written DTB
doesn't necessarily correspond to the set of things you want
to enforce for a pre-existing code-generated DTB. For the
former it makes much more sense to impose "coding style"
and "naming convention" type rules.

thanks
-- PMM

