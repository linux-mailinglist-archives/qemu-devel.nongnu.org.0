Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7103B2E3A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 13:56:37 +0200 (CEST)
Received: from localhost ([::1]:56196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwNyF-0008QS-Je
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 07:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwNwo-0006wB-Aq
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 07:55:06 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:46866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwNwm-00016P-Da
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 07:55:06 -0400
Received: by mail-ed1-x52d.google.com with SMTP id s15so8065963edt.13
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 04:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zh0ia2IijRH+gRisUtLwZks/Iu70jZU0FjEMNB7I3G4=;
 b=EPu4ykFN/OZf5f7Yu/HncyGEqbET0Rbl0IubYec6CW3ESrjH6YSWbT8d40Gh/XtPYs
 EreKfo1az0C8iYxzRG+9/lFPcs4ogC+0XuxSklEbId6CRsFTZSQ2dtiR5W+ZLWCYIEKL
 fIdHmd7Pkdmq+nXMMx6SeKjMiZ3XqTJdZRVMISmo64PEZRqtJw6s5wL2IJc/SFjB478X
 bXJ41eJNwG7zt4C31ewZJVfhsfRTm7I6khFGI3180zGsTdYHRHvCUe23ttiKcaqf3/DW
 pGCwTzHCop8gWfWdMMutpMpl6Kbq4V3Z+g8QZ4yhSRPRi2xtdCRY8u14VKcXoHUyHub+
 x+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zh0ia2IijRH+gRisUtLwZks/Iu70jZU0FjEMNB7I3G4=;
 b=kzgCEQrabkS+tyGLVJeakHzQlk5Yt92A4YeYT5+rabm3y2LTIDhZjG2RZ9ZnNllbA3
 0QNxI6ZlX3dPNDCZhLAlRYuPiZVgkZgDiuidBOMyil/ed3WXo5cpSquu/OUBnU+UJY9N
 1mLo4Emcqa0NiBmRCMD3uvnxi8Cgx0BH326VV1GW8Be+lstMfScN8hSP3aMqPZRA0lX8
 HdpqNj/rKzdChY8AFapjmvJhR3SXSfd70z/J4SmbnFQEl35DrbB4krOXBhxkywmqR/Tf
 SJtY5PiawhC6WuP0oXvMzuwD+/zTptlQ5QqibpabIbUyFhnAk5f1yJxtGBcX9EGyzXhN
 lxZw==
X-Gm-Message-State: AOAM533KHSc5+0FtRv53G+eWkQyWVUVswzuA8DfApKADGeV9felkfX3O
 HeqXJwnco19T5C1WXhg+DxFks6Mb/grewnQ+1yfPZQ==
X-Google-Smtp-Source: ABdhPJz+uVy/yWKjePq+Ibpg8JJ/muwBoKgndQmo7DSObYa7tjJuc6bxmhHry8aeP5wvqLjqXq6NdbnJRYwJZuS/g+g=
X-Received: by 2002:a50:fd0a:: with SMTP id i10mr6434359eds.251.1624535701803; 
 Thu, 24 Jun 2021 04:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210621120125.116377-1-thuth@redhat.com>
In-Reply-To: <20210621120125.116377-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Jun 2021 12:54:25 +0100
Message-ID: <CAFEAcA976wKTO+GBmEYDwk_SgtQXVeC8d+VnwVLwPVAOOyqWvw@mail.gmail.com>
Subject: Re: [PULL 0/7] Documentation, qtest and misc patches
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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

On Mon, 21 Jun 2021 at 13:01, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit 8f521741e1280f0957ac1b873292c19219e1fb9a:
>
>   Merge remote-tracking branch 'remotes/awilliam/tags/vfio-update-20210618.0' into staging (2021-06-18 16:42:25 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2021-06-21
>
> for you to fetch changes up to c32c3d68ed0629910d5a1cd72bfb57d7f89b553b:
>
>   MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG CPUs section (2021-06-21 11:45:23 +0200)
>
> ----------------------------------------------------------------
> * Documentation updates
> * Remove leading underscores from header guards
> * Display hexadecimal value with '0x' prefix
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

