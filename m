Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 495C03DBD2E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 18:39:21 +0200 (CEST)
Received: from localhost ([::1]:53172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9VXb-0002FJ-Ry
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 12:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9VWe-0001Zs-Qz
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 12:38:20 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:44586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9VWd-0004c7-0r
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 12:38:20 -0400
Received: by mail-ed1-x532.google.com with SMTP id j2so13964146edp.11
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 09:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tbWJt7Y0+8B7HiP8KUkQWIpFG/bItbv2fwPm1YkanIQ=;
 b=KdJb/6msfKYbXS5mG6UIhEEm96VvWTFgaZ2jj7ME//FkVqTpS1cBUKDZpCe2kE0S3O
 WqCOUWvGfrfasLQTIv7ecq0iRm35awIdMWGEkDenrc5hoKMNqp/GR/McDYfpbcTEjUHK
 jkXGdclrrAOCThkSPoW+Azp7afrSxC6YJyUOK2bKT3yy8UxDbQQNf9GHkffzWRCV0KQO
 yoTgxjXm0e42LY95wD7bwS0WhSjLe5Nld7bX9voFa9t7YQJM0Wdi+Dd8ajkD+FYH0gzm
 xwyxw9ro9J49Hl+yYbahUcKbtqHbqhXHKPn6nx0D4fPOEDhHsqITAjd9wAVzB3Cusbeb
 o/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tbWJt7Y0+8B7HiP8KUkQWIpFG/bItbv2fwPm1YkanIQ=;
 b=o49nvZ4103gVfIjaeN0O+h2CG6ZvAEhJrgxgoL0j8sW1og3pvjX0mWxHsDBtjLArl5
 56JmghPZm8bbxaVPRy3sTEOiE44QuZUNrKU5BDNtI/Nyav2cIrBzAVGafauuNYOYASEI
 0ZywnKL+Ddn6QKyeZpn8KFdW5oKUpz1l6imlEfpCOU3XoJaPeGIf1IsQx1i9cz6EMd7C
 W4vZT54DAXQlhisj0TiclSCDuYVxd/DM+T47bHR7zjjgSz4mikxza5kBX3trBTHrkl8d
 Fay/iPCpSWGuISVFrsI4Lbk1/uS56Hue78oyDXdHTv+CpDotnaiFFokl93pEEpUw75Fn
 /Vrw==
X-Gm-Message-State: AOAM533v8TFkpxoxxjFixw/1LSUq7/6thHzJ9bWhpZHuiyD2olqGD3qK
 iSw+gEZ/fY87nl0nwRRCCj4XGS7F3YFnPQkbMsvUNg==
X-Google-Smtp-Source: ABdhPJwVZFj/v4yqH4JrOUNiAPOWpA0suMk+Ye+HD04maQdEGOnfcqH5RpEGIumWc0Y8jFhGgZuD5azPVjWC8xfofXE=
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr3943448edy.44.1627663096814; 
 Fri, 30 Jul 2021 09:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <1b6189d1-0123-efa7-23b4-42b60cefebbe@gmail.com>
In-Reply-To: <1b6189d1-0123-efa7-23b4-42b60cefebbe@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Jul 2021 17:37:33 +0100
Message-ID: <CAFEAcA-NrfcooBCkQsMbUaeQiYJ0aXMsUS_6AEq4FojfNt34cw@mail.gmail.com>
Subject: Re: Problem with trace of x86 binary on x86_64 system with PANDA
To: Nikita Gnilozub-Volobuev <nikitag594@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Jul 2021 at 17:19, Nikita Gnilozub-Volobuev
<nikitag594@gmail.com> wrote:
> I'm a student and I'm writing my term paper. Part of it is the record
> the trace of x86 ELF on x86_64 Linux. For record I use PANDA.

Hi; PANDA is based on a fork of an older version of QEMU, with
considerable alterations. You are probably best off asking your
question on a PANDA specific mailing list or forum.

thanks
-- PMM

