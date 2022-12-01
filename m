Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2621563EDC0
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 11:28:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0gnt-0002Zp-Tw; Thu, 01 Dec 2022 05:28:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0gnr-0002VB-EA
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:28:27 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0gno-00037y-SH
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:28:27 -0500
Received: by mail-pg1-x52a.google.com with SMTP id 62so1266028pgb.13
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 02:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1hazWKSL745ZvpNZN8kS/JIbdGHSa80I7/5Pc5IP8CI=;
 b=CfJjgRVsNdZLrPeUlQoOg3WUqjGjD5B1gYnEMGE9XuuQpHgf1iW3Og2MFPP3R1fYKZ
 pY7rs4AlNRNJWkvp3xomsi5Gw1Z7l37MXaiu/p2v2SdxKfmouMNspZ7eDPSKx3jrbnRw
 sr8EatU2szvDa+gcLGmCXN1kyU5AC0HCn7P0YbKd8f+xlzBVY6t0iSqQRBrluw+OH0SN
 3rymySVpXp3PRR9wT76Sq+38sKVMqCFGjs6HKuUO1HDruLxxW9LZEjC4Bc61MV3xDs4/
 rnns6UDamGQts0JiI1PgQwDENifQjzD8vb4XttSq5oTlPwkyJwXpi3Twl84nZRAcQpsN
 eFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1hazWKSL745ZvpNZN8kS/JIbdGHSa80I7/5Pc5IP8CI=;
 b=1oiUsHj+fsSjCjSQEyf8g7l+LTbLoLwMdhQiHmibN27bQIUgdDra8V3NASCjx1NpZb
 QW5uwh1za4MkZ3fmg1gqGR2wmeIfu1s2unRktK7i+MtR8Tyk2OW0c+wDkhlVVUMLD/k1
 IUP28sTPUQaWKaG5fjXjnU6oTqpT62tI3knKuiB39wLb4dM7sFgYQtnPg9m6ajYLoTW9
 QbWDQVYHEnLhfSffSteyh2Tn6PMmFL1ANhEQO5uYGlSNnUDMq+6OU2QPv/7GrZYb+7Ql
 iDiGmGsLZeQo/KmLTCSh2q5rFwXsXbqgWs/JTXuVtPMqiIzaDVOKZdqcRFiqulJK1gup
 ZWyA==
X-Gm-Message-State: ANoB5pn3wsWquCMaRlOYVaEvQh0REXdIl06dwaeEIa2/T5ldLweRcw7N
 zTBDp5BSgBe1iFgKpnjzGxUfyvbRRKBQD1zlr2tUgI/DtPs=
X-Google-Smtp-Source: AA0mqf6LUAEh8IwvoEIBUcdtIuEDqxUD44eiOZpw8qjSVrRmujoC+uS+KP+PaTQdh3ijA5NHeu9b1fxfWINPEfDIEvU=
X-Received: by 2002:a62:5f81:0:b0:56b:bb06:7dd5 with SMTP id
 t123-20020a625f81000000b0056bbb067dd5mr47374249pfb.3.1669890503042; Thu, 01
 Dec 2022 02:28:23 -0800 (PST)
MIME-Version: 1.0
References: <166983457648.13115.4940680286975412418-0@git.sr.ht>
In-Reply-To: <166983457648.13115.4940680286975412418-0@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Dec 2022 10:28:12 +0000
Message-ID: <CAFEAcA8csAbbdvLoq+202CAQ0PLWdHaBTfADtqx33c=DNU-wSQ@mail.gmail.com>
Subject: Re: [PATCH qemu.git 0/1] hw/arm/virt: add 2x sp804 timer
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 30 Nov 2022 at 18:56, ~axelheider <axelheider@git.sr.ht> wrote:
>
> This patch adds timer peripherals to the arm-virt machine. The
> use case is, that this machine is quite useful for testing purposes
> when it comes to non-Linux operating system (seL4 in our case).
> However, is currently lacks a dedicates timer peripheral, so some
> scenarios cannot be tested easily with QEMU. The RTC cannot be
> used, because he resolution is too low. Since the sp804 supposed
> already exists in QEMU, adding these peripherals seems easy and
> it does not appear to break any existing use cases.

Is there a reason you can't use the CPU's built-in generic timer
device ? That is what typical guest code does on this system.
I'm a bit reluctant to add more devices to the virt board
because over time it gradually gets increasingly complicated,
and every new device model we expose to the guest is another
thing that's part of the security attack surface for guest
code trying to escape from a KVM VM.

thanks
-- PMM

