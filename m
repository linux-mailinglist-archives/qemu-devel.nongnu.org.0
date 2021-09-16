Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A1740DD90
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:06:48 +0200 (CEST)
Received: from localhost ([::1]:42768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQsyN-0001Vi-ME
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQsuC-0007C1-Jy
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:02:28 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:51792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQsuA-0003pO-Bx
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:02:27 -0400
Received: by mail-wm1-x336.google.com with SMTP id y132so5067337wmc.1
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8cipEwVhSe5gBmVCeKcVfsBxPG31tVILm5WEFR5HvOI=;
 b=CSUvgj7iue8fFbHmQzWs8FV/brS31uN3OCtKfnzP1PZ1grDRoqG8wtKL10YISvHmOi
 JzSEodi9LRGDfwm/yLPEZvVECnuCplPnD91Qc9Sg12Wx8JHtPkUIv9b9zvGslwgufDTP
 RlpOCG6jGM3mREGBiCxJMcxmog9p/V0kjyqXquQyY4/AMOrWhNLaN/uxns8qJM+QFf1Z
 iTs4loQSkRk05yNjLLs9iuN+bkpPDZv4YUFtYL2PpYYswRhJQXoTdl5/9PYbhBODu9hq
 MRG/6DCcX/zuZm0ADYtbXUGOBhCQ4WW0l9L6TVcS+AFtWfuNkU7jEspC8s+42Gbp+FOZ
 j40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8cipEwVhSe5gBmVCeKcVfsBxPG31tVILm5WEFR5HvOI=;
 b=Ghh4Uq16gnXJIwjMC979EhQrbM5UR24K6+RZIIV/988GRqKbNIOIWBVXuwBKLnLkDJ
 q2sl/s+XOYVK61M/NIterJZS4FxSSIh3HbNzUF3dRcAukSkyn7BC3jzTYR9Xv/zhKo3d
 l9boEt7Gs2PVQchWZRuhl9FODaZi6q+8+9jVIDH1xRH5l+LPyzGJfhww0pJl6IlDxXE+
 vJwMs1nrWJCamqRhCIgJ45JSL8XGeC5f1pmpSrIUQsrF2quwh9oTo1gXyPTjSW0pPA3s
 oT9j1Pc0hUxLt2eKOwsffVrdGuB6UUqQimh+ecfNDa2hYcwzV/2XfQIJxUzPd/PNjdmW
 z8NQ==
X-Gm-Message-State: AOAM532S1bxSKd0XCJ1heV3HzuNmAGTUS6SV1CpOT/sk+2h7ESHBvJM5
 ijVMenrtkMP3nia4nqepeFFc1+0Ag3NdmJBiXF4VOA==
X-Google-Smtp-Source: ABdhPJwxhB8C7AuB5BNTy1c1NaRJrIM2QMln9GRYUrIhfYYrQp8bn6Fo3amoF0MIqtUGBw03uRqpUFWAGo4Klt9PHqw=
X-Received: by 2002:a05:600c:4848:: with SMTP id
 j8mr10369928wmo.21.1631804543906; 
 Thu, 16 Sep 2021 08:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210916135241.150566-1-dgilbert@redhat.com>
In-Reply-To: <20210916135241.150566-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 16:01:32 +0100
Message-ID: <CAFEAcA-k=jKqBcEzxd+ALPYz_UVT1_AG3PnsuX2N77_UTSE=nA@mail.gmail.com>
Subject: Re: [PULL 0/2] virtiofs queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Sergio Lopez <slp@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Sept 2021 at 14:58, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit 57b6f58c1d0df757c9311496c32d502925056894:
>
>   Merge remote-tracking branch 'remotes/hreitz/tags/pull-block-2021-09-15' into staging (2021-09-15 18:55:59 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20210916
>
> for you to fetch changes up to 046d91c83caac29e2ba26c63fd7d685a57463f6d:
>
>   virtiofsd: Reverse req_list before processing it (2021-09-16 14:50:48 +0100)
>

gpg says your key has expired; what keyserver can I download an
updated key from?

thanks
-- PMM

