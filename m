Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DBA3310C9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:30:34 +0100 (CET)
Received: from localhost ([::1]:59432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGu1-00012b-CB
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:30:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJGaF-0006l9-FQ
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:10:07 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:38349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJGaC-0001Cq-Rm
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:10:07 -0500
Received: by mail-ej1-x62f.google.com with SMTP id mj10so20644237ejb.5
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 06:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vNvSGk8EVK3vr+Ydoj43lPkA7HTODyhMN2FCY7p6m6c=;
 b=Cimm6VuEF0D7YEjFAGzSk+9o1Nn8fZG0LAmGhiN1eG65Ng6Dbv6eJwP+0M2LMLNXAu
 UVUt62xvRr9DNU8G5oAY2/5u2B6jc+SXRz1xwIirlgH1YX9FLFoxYh9d7ptliDHy3UtK
 1NkVnI2+LixZ73uv1gxzoirQpIMcrRIlixljvS4i/2oyZeIcJYd1c28u7Zt+WawO8I0X
 iRHXTLcRO1OLkyfzOLgEIO9nhPJza+0GyUhDAsfqVI3ipbm+mENXk9AEgtCvuGmSt+Ih
 uSkxbYXTv8pq+Uo3ezIG3wRx7RHRSEOYFMR6KNJ39UdKT5LTKCEQArPrxcCJRQV4/MXR
 pI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vNvSGk8EVK3vr+Ydoj43lPkA7HTODyhMN2FCY7p6m6c=;
 b=bmicbK+TlZPoH5d/476880MIJ6tA3JkYGvvvy69xTTLIkxmBR/X2kqfYWrwULmbTB7
 +SgPn2DMZjeby+nl3TYRcVoUbAHLxknIa1EqZCmrilZlO4x+Y5WEi4jFSIrqHP+kjZCZ
 5GDxaY05Gb8PgHxl22QiY9FbJFxVdwgHFcnTOFoU7Af20mHCaZlwgeAquRM7IGB1oqWI
 0pdkZf7gL0wTwM1JIM9Ncz9NcSgJ9uz6m0B+sEXAtBxFKI7C4Zi0cLpQvVnARU1tAnX3
 6PkHdtVZgU2CnCY5UcpK+iR9uUYbq5ADrAGyoZ0L9zz4VhT6yvEtLmGpJiO4RkDLbypv
 tHFQ==
X-Gm-Message-State: AOAM530MF7z1vbRJtN3g/X6FB4rLR+qxTlobzDoiT49qvKYxV+vfnwlC
 Ddb3dwmtvjC8AWef2LOdVEkl0d226f7CTjQg+d9TkQ==
X-Google-Smtp-Source: ABdhPJym9Lfq3iA6TeOgU4QmnJ2JylMxjGWokPkrH9TcmfPhMVBp84yp65clTDrepJreYnWfM3NSf5Q1rOz0buLAtYI=
X-Received: by 2002:a17:906:b14d:: with SMTP id
 bt13mr15045150ejb.407.1615212603264; 
 Mon, 08 Mar 2021 06:10:03 -0800 (PST)
MIME-Version: 1.0
References: <20210308140713.17901-1-akihiko.odaki@gmail.com>
In-Reply-To: <20210308140713.17901-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 14:09:46 +0000
Message-ID: <CAFEAcA8v901QLw-VZatMbx8GR0_Mgxi3bGWmfO6jmywWbbttWQ@mail.gmail.com>
Subject: Re: [PATCH] ui/gtk: Remove NULL checks in gd_switch
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Mar 2021 at 14:07, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> c821a58ee7 ("ui/console: Pass placeholder surface to display")
> eliminated the possibility that NULL is passed as surface to
> dpy_gfx_switch and removed some NULL checks from gd_switch, but the
> removal was not thoroughly. Remaining NULL checks were confusing for
> Coverity and probably also for humans. This change removes those NULL
> checks.
>
> Reported-by: Coverity (CID 1448421)
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

