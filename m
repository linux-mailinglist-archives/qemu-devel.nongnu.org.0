Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314F357062D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:50:22 +0200 (CEST)
Received: from localhost ([::1]:49028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAujt-00073Y-A9
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAuG0-0002J8-SR
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 10:19:35 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:44700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAuFy-00084o-EB
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 10:19:28 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id h62so6315158ybb.11
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 07:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=94zEkQVpmPImz8YM5dgoRcD9iZfDpttWtVy+G/12u6U=;
 b=BKX9ZUvfVpcCf+VQ3CufNV5Hx4MuR6pJuEFhhvLSrNnh8ydPX37gyr3FbdEwO8yyFW
 S+cjUlCEriph5L27qU+iD6FqgPl8a6jECGQGpWFxYGvsMyAzBvHnKplV0u4olTf9vp/8
 /QRoC99gwicKlLB7aeR4bo8jjLOIxo27mJ0DC4FXJJhXlZuFyZtuYNAi1yjRMprlDU7e
 Djy3hHaLcoMkJxxbaUic3kjKCHcwO7VbT6BdU5njCrfTdiIFLUhPzHPRge4v/8+dAlJ+
 GVjn9IZmSzMhJI2kJftrDYMocGrWpqQVZkk6q3C+MzeQ1qxd34KlSXFRmgfxL/dOKt+F
 FQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=94zEkQVpmPImz8YM5dgoRcD9iZfDpttWtVy+G/12u6U=;
 b=njTUR7wNaZq+pAkQuftJLf5EpJk5UIM71vMSv/vsWAnPHIQGPvl8l6eWN4mdta6Fg+
 FKwjJTfIxfqQVfGziZVLltus/dv7EDYux4ecS9LAogFFYaIzcR37M7UJ1WDR4J2GXCBA
 APlNixOAytyRXOcFQzxszIdrMZmZ2bNsG6FxEr3n/2s81H0i42VRl9MgRAHg92PK2dfe
 uiXx28D/vLr8oq1R4nknIJTHkGxehv9MliatyscqrI46rV/Wf8z56YyqonpYGbv42ib4
 3CpxYzAf21XCJFZHYikL+dogwT/ez2BOajfxZr7n4BVCCHsx8vH79c1VLWvN2GsC2daF
 SBXA==
X-Gm-Message-State: AJIora+tVvsmmbTnS9IY8SyzLpegRrX/hmfKTImOuaXswx2KXo0yt5d1
 AQBn5YcH+bpyiHWAOkNRZ9olJrJPqrmcqq0ZuRcEgg==
X-Google-Smtp-Source: AGRyM1uZjtI4HKTOfzqI+WTMz5z6M08ImnMu4lM5SvBwOkERmdbbm/W31r7DayRq0u83h1+MC1ic0brTTO/bd9G82mc=
X-Received: by 2002:a25:d7d6:0:b0:66e:47b3:35be with SMTP id
 o205-20020a25d7d6000000b0066e47b335bemr17580016ybg.140.1657549165520; Mon, 11
 Jul 2022 07:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220707163720.1421716-1-berrange@redhat.com>
 <20220707163720.1421716-3-berrange@redhat.com>
In-Reply-To: <20220707163720.1421716-3-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jul 2022 15:18:46 +0100
Message-ID: <CAFEAcA92Jc02fMDXsb1H5_mWp4ToitwDU8whxU4FSCjD3idO8Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] misc: fix mixups of bool constants with int
 variables
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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

On Thu, 7 Jul 2022 at 17:37, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  block/vhdx-log.c       | 2 +-
>  hw/xtensa/sim.c        | 4 ++--
>  nbd/client.c           | 8 +++++---
>  target/i386/cpu-dump.c | 3 ++-
>  ui/spice-display.c     | 4 ++--
>  5 files changed, 12 insertions(+), 9 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

