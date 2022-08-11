Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1472B590567
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:09:15 +0200 (CEST)
Received: from localhost ([::1]:57978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBgI-0000Bs-6x
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBdH-0003ux-EI
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:06:08 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:46698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBdF-0007pB-8b
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:06:07 -0400
Received: by mail-yb1-xb32.google.com with SMTP id b144so2565323yba.13
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=l8I+rv9KW9V7+L2YxC8TYNDDcSHITy9UoN26xEK7bMU=;
 b=aG5z4MZv9ri+QOBjJZUNzcSoV7Y+wviUAFhcPqhZ6XDBGLaq/0sdeTfBrURaqcdLOa
 2lZiMsDcAtiPPrvQsX7s5sEFcODJi8at27hUydRIo5rFyqUESkQLpveaZsaZ8Wd+yvvP
 lertWkVbry6zlfLB6JIcT8mToGaULY2RQgH3p19jyzxYXUdGQHW7CtMLFnIBZL6UY0sr
 VPTEt2VrszXMjcfH70rt74EGJYn80hUo3f7xAFVlOBl+CBTIkkocODtcW6PcuyB4bLF9
 Ow/ritPUkS5xyuZm3xl2o/P7AWrp5080qdClSCMWADS0+A7dvgQogrxQqA0Qpy7FaXdS
 t3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=l8I+rv9KW9V7+L2YxC8TYNDDcSHITy9UoN26xEK7bMU=;
 b=E1m7TdJgsJWdJcuzZiiBvqfc4SZ1xipxJNc6LVtS1PO/2IeC3fcbGmX0QJnUzuA6G+
 YRgFoYj2ziK6LS7w9ZclZWabDcWUo7B7mqbnR96A9kM0mKvixkGdEFNwZainXK7kXagm
 kaYWsynUwzdE3RHyKveCzKuHgjlQLNT1rRpABo6NjYILUWcBHut7V8Y5erWxBzDHZdR6
 kD/zxMjJLVYk+wxHmXxoy/5yvlgN2jmKWe+yw9FWuiDWq019NlZjI8JcRSzNzwCmHWgt
 8dVQchFbK5fuyLtiQVu3/dNq8AEZ/tWGHXx9KpExNfNsCjSQZe1ppHYUbH4N50/k4y2B
 aTqQ==
X-Gm-Message-State: ACgBeo1rl8V63zzGAjOBP6RCPZo1tCTJUm25BmmnpJYwK834a/XBlZZ9
 YhTbhO9Izs3kuBIzV5iMGLf7XntvtVhzh+lwmO0ocw==
X-Google-Smtp-Source: AA6agR5G4UUZ95W0mvp7Los6YPgAu7Z0mpBGpgbS5tBbni9LwHwQjBEY83AqrfVf7psYrMBeyZoiNOUe8FRyu7YKc0k=
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr275739ybq.140.1660237563543; Thu, 11 Aug
 2022 10:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220811151413.3350684-1-alex.bennee@linaro.org>
In-Reply-To: <20220811151413.3350684-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Aug 2022 18:05:52 +0100
Message-ID: <CAFEAcA-aOZXGMv6Eb4z13+AyUUcOj6G9j+3JDWSkgbAyCpk2+Q@mail.gmail.com>
Subject: Re: [PATCH for 7.1 v1 0/8] memory leaks and speed tweaks
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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

On Thu, 11 Aug 2022 at 16:24, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Hi,
>
> I've been collecting a number of small fixes since the tree was
> frozen. I've been mostly focusing on improving the reliability of the
> avocado tests and seeing if there are any low hanging fruit for
> improving the performance.

> Alex Benn=C3=A9e (8):
>   linux-user: un-parent OBJECT(cpu) when closing thread
>   cpu: cache CPUClass in CPUState for hot code paths
>   hw/core/cpu-sysemu: used cached class in cpu_asidx_from_attrs
>   cputlb: used cached CPUClass in our hot-paths
>   ssi: cache SSIPeripheralClass to avoid GET_CLASS()
>   tests/avocado: add timeout to the aspeed tests
>   tests/avocado: apply a band aid to aspeed-evb login
>   accel/tcg: remove trace_vcpu_dstate TB checking

Changes to tests/ is fine, and fixes for memory leaks
also if they've been well tested, but stuff like the
caching of class objects is really not 7.1 material
at this point in the release cycle, I think.

thanks
-- PMM

