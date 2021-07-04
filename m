Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E043BAE0F
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 19:29:41 +0200 (CEST)
Received: from localhost ([::1]:33406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m05w4-000157-PK
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 13:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m05v9-0000PL-BX
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 13:28:43 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:42686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m05v7-0003jP-Ka
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 13:28:43 -0400
Received: by mail-ed1-x52d.google.com with SMTP id n25so20562175edw.9
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 10:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QORqXDEUgskqjd7aG8I+DocvBEk4A5kM1YnhA6OUc5k=;
 b=J0SkVuZCwo4QjRGFXBhWz7/cf6HmlomV7SeO3JMsJZBq/1CCXKiNkhGamDpGAy+l8A
 /7gU8dWJdKZnIvtKllwdhsAh79Rdqbkgu2+RYxZgS0lHxdvULEYUacmWGmQw1DONWR07
 U0rFshiEjkebCfp5qOZnY9vFpLi5fht5PCRwYsEp6Nn65wAPjHG3XpCvnh4SprY6kSxC
 Kxk1Jsuk6Yi2DSuqKixSSJU8BSAqVMRHdinMGSNXFojV83R9TR2M8/5oA9udjiSqfxNI
 b/wmmUPNTRaWNRYC4XFAzibUxY2JDQE1N6ez3Brp80aS1pkbcVv51no7sfcC03WeicYJ
 fYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QORqXDEUgskqjd7aG8I+DocvBEk4A5kM1YnhA6OUc5k=;
 b=Q0LCqYy076Cx0RnEAbbkvN6nQYWfRYMOiSoLpAqI7PtPVf1WKHTaqKy72x2XwEKkuh
 U8xLb/wpvP30YbHpPlA22TiAHPn3CyobtwyMjRmJiA1+hMG9kaPAW/9Vi48usDn9Qgsl
 mGA31I0EaaqmmJ7X6eaiRTY9I7LILbAbVUN/soBZBLsHNMqpsnuC0deHzPt+TFewwyxo
 lT/PKxPREi1xMBYqWT6JxYFYflnX6mxv5oLlLTZCzQPfF7Jo4Bh8V6OvIN5YzmQA0CgF
 5JOVOZoCTyMr3z0VW0kx0q9MO+fsQ8EcDFlRgHfEb6LM10+4WaBPm1tG3RWROn+O1qfV
 CmTQ==
X-Gm-Message-State: AOAM530T6ZB4jvEhdnMDfyu1+LI/AwZa3KOWUpABD525HcISO8zH5139
 KUfr/saD8SdDa5/NUG0BMkKU6Bgh5z9+4C7iopaRMQ==
X-Google-Smtp-Source: ABdhPJxVDvCr/WFnR0uJsKUe5f9jJ5cxjJvhqkymf8whmu4drL0tn5GvU9tyY6xb/O75+ukGMDbONuuRslhq693OzO0=
X-Received: by 2002:a05:6402:848:: with SMTP id
 b8mr11478735edz.44.1625419720223; 
 Sun, 04 Jul 2021 10:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210704105646.13524-1-marcel.apfelbaum@gmail.com>
In-Reply-To: <20210704105646.13524-1-marcel.apfelbaum@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 4 Jul 2021 18:28:02 +0100
Message-ID: <CAFEAcA-H1P76MBE6bdUtkWg4dGVmA0=f_EtZTVkdAFggd1318g@mail.gmail.com>
Subject: Re: [Qemu-devel] [PULL 0/3] PVRDMA queue
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, vv474172261@gmail.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 4 Jul 2021 at 11:56, Marcel Apfelbaum
<marcel.apfelbaum@gmail.com> wrote:
>
> The following changes since commit 9c2647f75004c4f7d64c9c0ec55f8c6f0739a8b1:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-07-02 11:46:32 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/marcel-apf/qemu tags/pvrdma-04-07-2021
>
> for you to fetch changes up to f6287078c2e41cd8de424682cc86c2afccbf3797:
>
>   pvrdma: Fix the ring init error flow (CVE-2021-3608) (2021-07-04 11:14:02 +0300)
>
> ----------------------------------------------------------------
> PVRDMA queue
>
> Several CVE fixes for the PVRDMA device.
>
> ----------------------------------------------------------------
> Marcel Apfelbaum (3):
>   hw/rdma: Fix possible mremap overflow in the pvrdma device
>     (CVE-2021-3582)
>   pvrdma: Ensure correct input on ring init (CVE-2021-3607)
>   pvrdma: Fix the ring init error flow (CVE-2021-3608)

This fails to compile on 32-bit hosts:

In file included from ../hw/rdma/vmw/../rdma_backend_defs.h:23,
from ../hw/rdma/vmw/../rdma_rm_defs.h:19,
from ../hw/rdma/vmw/../rdma_backend.h:22,
from ../hw/rdma/vmw/pvrdma_cmd.c:21:
../hw/rdma/vmw/pvrdma_cmd.c: In function 'pvrdma_map_to_pdir':
../hw/rdma/vmw/../rdma_utils.h:25:18: error: format '%lu' expects
argument of type 'long unsigned int', but argument 4 has type 'size_t'
{aka 'unsigned int'} [-Werror=format=]
error_report("%s: " fmt, "rdma", ## __VA_ARGS__)
^~~~~~
../hw/rdma/vmw/pvrdma_cmd.c:43:9: note: in expansion of macro
'rdma_error_report'
rdma_error_report("Invalid nchunks/length (%u, %lu)", nchunks, length);
^~~~~~~~~~~~~~~~~

You can see this in the gitlab CI jobs, eg:

https://gitlab.com/qemu-project/qemu/-/jobs/1398130500

thanks
-- PMM

