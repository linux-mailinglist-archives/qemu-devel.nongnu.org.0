Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4073F3BBDF0
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:59:30 +0200 (CEST)
Received: from localhost ([::1]:40074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0P8D-0005tP-AO
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0P78-0005BM-Kf
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:58:22 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:36449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0P77-0004Wp-1j
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:58:22 -0400
Received: by mail-ej1-x62c.google.com with SMTP id nd37so29170481ejc.3
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 06:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kk++fT/5Qkg48lw4OUkWNppDkQwXzgRX9G01C1LAeoA=;
 b=ryVSNqdFSuNHD1kaLB8kjFml1qfcKYSGzOsj1a11n9bEPtKBc8legyzBwcYRodakGB
 045lakw7QwOpL0WgJaQpsVfI59yCVoVT2PbZZYhGxF3Fh7MfWvYZx4cUf3oJ1At8P98G
 K5E4bjN57KlIm/B2x1dCGLV3MU+cev8YY8IjbH8ShkXTo6TXZsVDTqNbecIFgGpTYdb0
 FxahnfecrCZfDJpn21Y2a5bCh5LQ3tXRxtTpRujQvQbgLj2JpAzeV0Ga//+k7CQmXe8d
 +g7jTQlATl5YYkwOHnLPo5WrgjpmQD0Zf96Kpq9MhJXyk6LEMdjdAJaxIFNec2VqyrWh
 Y+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kk++fT/5Qkg48lw4OUkWNppDkQwXzgRX9G01C1LAeoA=;
 b=NMiwetzSuX6U70VxdsMbM5JNzZoJHloSYtf66UL1WoZdQP4duzBBkFFr7LBlbXicHT
 iw20o+AmhjsmFVaNQ3qdb0/39Bw+xD23wOqV285QB+jxXwFFb4fpqVFnrJLHS2DB9SUC
 1kUJr/I83WEB5tdtDu3WYZbWbglxw+sXnvboFHW1Xh79wE7fKdcn0U+M9TT25Qi+iFlK
 AkLUMWY2x0+8j1bB5EKR+RidBzJvDCf4PLXFDwRgs048ooBt47RpaYu+7VILFUGRQQeF
 iu80KM7QSui/tEZODZvNhO2nl0zr1kq91WV0PcaT6+6s0Y5LUqcRVZsy5kVhjeC+34Tg
 pgRA==
X-Gm-Message-State: AOAM532rQn54k8nCjUggsqEn0xmlIold4i/k8vjVOoa9yiqhqkwjGLE+
 VAJvj7/LDFnhbIt6IQBbbaQpyRraATs/jwLrEGWCrOv0S9WEAQ==
X-Google-Smtp-Source: ABdhPJzMZSSJQ47wMArISrnxA5uWX20g8LQW734dPOzTBTncZ5yOS19oJIuJsILNbukJMJImIYk8ZNf/GDROzCaQq9s=
X-Received: by 2002:a17:906:491a:: with SMTP id
 b26mr6954870ejq.85.1625493499491; 
 Mon, 05 Jul 2021 06:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625483630.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1625483630.git.qemu_oss@crudebyte.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 14:57:41 +0100
Message-ID: <CAFEAcA-uHfJrJc9JcVRZ7x9WG1sY0C+zbC=m5gzyRdVG+TL49Q@mail.gmail.com>
Subject: Re: [PULL 0/8] 9p queue 2021-07-05
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 5 Jul 2021 at 12:24, Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> The following changes since commit 711c0418c8c1ce3a24346f058b001c4c5a2f0f81:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/mips-20210702' into staging (2021-07-04 14:04:12 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/cschoenebeck/qemu.git tags/pull-9p-20210705
>
> for you to fetch changes up to 8d6cb100731c4d28535adbf2a3c2d1f29be3fef4:
>
>   9pfs: reduce latency of Twalk (2021-07-05 13:03:16 +0200)
>
> ----------------------------------------------------------------
> 9pfs: misc patches
>
> * Add link to 9p developer docs.
>
> * Fix runtime check whether client supplied relative path is the export
>   root.
>
> * Performance optimization of Twalk requests.
>
> * Code cleanup.

GPG tells me the key you signed this with has expired. Can you point
me at a keyserver I can download an updated version of the key from,
please?

thanks
-- PMM

