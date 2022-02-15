Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 582384B7AAA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:43:18 +0100 (CET)
Received: from localhost ([::1]:57230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK6XV-0006PU-Gd
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:43:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK6Va-0004ge-Of
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:41:18 -0500
Received: from [2a00:1450:4864:20::429] (port=38649
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK6VY-0003EK-Ny
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:41:18 -0500
Received: by mail-wr1-x429.google.com with SMTP id d27so444326wrb.5
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 14:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PcFBTJ/FJSIMzco4pkUj7WHkUKvwPRNSLBpa49AXX5A=;
 b=SjEhSkX2uZOq9UjrXLHdsYFVIYYgtuVECg81zGn9VVnu4C2/o5aKLk6NTJ6XGB48kU
 we12fekI3ggjtusdyPy0W8lmpjHgOb1f9+NUxaawhRl0BFq8NIPDHGmKKF9X4Q4Pv2Ht
 hhVBtTL+zqHDrde/WtCyDI/sS9IP5k0MJl7tLsgrBYTt/+XJlbcUTksKPcAz4l3UmK8g
 vGJbXi981Mr6ZJAt5zG4rNvul1gn0hnJgaeKWQeTALH65+oWmicst7cNh+iEZ3tqTZgp
 bkJxuZehzgZvAUXTo/VUf0mBNUdpj2zWWASuYBxMTumSo0t3u0QHCGq13BpKiMmHvFmT
 0S0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PcFBTJ/FJSIMzco4pkUj7WHkUKvwPRNSLBpa49AXX5A=;
 b=1UsfEID90rjNSRQPHnjOwMIHrntPc4Cdciyj9i9n/zDxdP3VEItCROB3vlR5xyl0hG
 WNxD6i+notn4p7HN8Zhq+kShBiemxdU2+SI+UC0VvhsONOOzfycP+SC9D36FMhWdpQne
 cy+MaEHPQbtsYtLYoDq48ptf6rrGfDiILPR3kbkvvJmBdO607mVXLNLxX+rXIInZiF8g
 mXfILGAgsdIe/9uWFzR3XlXnMUjZwj89VpeL1CQYf+pe8dYDB9zlwaSHTbGErc8xwvdo
 rOD8l6tSq4hLCvr5L6MePkkOgYvI094FUFSX7MT3PLbCdxonb6mA1PZTw4VaUPbgvW2C
 eRWQ==
X-Gm-Message-State: AOAM532QzvlEScNZn1VdY61medpI/H5vRr4M8Rq6YbJEwuzVS4NAJUOR
 GIaKRYRGoTZT3ZoAutpqL/A8tTX8/MxBdnkZZBCX2A==
X-Google-Smtp-Source: ABdhPJy36mNY4WlubP7PEmpVOFgrPRWZkC8yUj/JPvs2/x3tevAcdQ92ZIcL07qzF27m2e5SwqrL1fXNf707DKGUoUk=
X-Received: by 2002:adf:816e:0:b0:1e4:ad2b:cb24 with SMTP id
 101-20020adf816e000000b001e4ad2bcb24mr53616wrm.521.1644964865963; Tue, 15 Feb
 2022 14:41:05 -0800 (PST)
MIME-Version: 1.0
References: <20220214171545.10242-1-stefanha@redhat.com>
In-Reply-To: <20220214171545.10242-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 22:40:55 +0000
Message-ID: <CAFEAcA_R1aqTqrD7Pmo-jqkniJNpJGE=UbxBnBUvVFLMb-5Fxw@mail.gmail.com>
Subject: Re: [PULL 0/3] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs@redhat.com, Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 at 17:44, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit cc5ce8b8b6be83e5fe3b668dbd061ad97c534e3f:
>
>   Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220210' into staging (2022-02-13 20:33:28 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to 4c41c69e05fe28c0f95f8abd2ebf407e95a4f04b:
>
>   util: adjust coroutine pool size to virtio block queue (2022-02-14 17:11:25 +0000)
>
> ----------------------------------------------------------------
> Pull request
>
> This contains coroutine poll size scaling, virtiofsd rseq seccomp for new glibc
> versions, and the QEMU C virtiofsd deprecation notice.
>
> ----------------------------------------------------------------

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

