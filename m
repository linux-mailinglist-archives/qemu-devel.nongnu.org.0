Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA4E39B73F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 12:39:34 +0200 (CEST)
Received: from localhost ([::1]:57576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp7Ej-0005Uq-6N
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 06:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lp7Dg-0003W5-KL
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 06:38:28 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:44639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lp7De-0006nB-S6
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 06:38:28 -0400
Received: by mail-ed1-x531.google.com with SMTP id u24so10534787edy.11
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 03:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WHabWmBv9dnLp6Yt1BExMubpT3qsWaBX05kEMFtoeic=;
 b=q9Yh4AjPbo5xxo9E+YUMstI+cMBMpSfcbfkxzttJo8uIrDEQINnJD3siYjOqiSN2Je
 uZzOpfEbcTLamvP7VR/NjqmBOW7zoh4fXca2Xg0BVKBblAW3ijMMu55gdV9QDY7lkY+C
 cXe3HXnTw8Wn5jQE5wG6QO2EOUrGPnUC684A3RjRS1gjWFlwoKZ3Qf7nlPiihVJnT4VT
 FcbyLVlg9mjZRYza9pDGQ2jk23u3dH/tvdz5Wz8EtTTV0ODuAEdPERIvTWGqW43+vt34
 nBj57KtPmutG9h9kHqXx4WKe4aUpJiRiNCbMGUkhN1MjbahgdiTzrg9sWgTtHo5Ec/dq
 l16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WHabWmBv9dnLp6Yt1BExMubpT3qsWaBX05kEMFtoeic=;
 b=bLG2MKHkld2yVM0mgyFSensNPX28c+gMVzoPON1APQtm811kGhxmbu+OQUxhTrcuf4
 MuAWYfLfUk4/IR6JVsaynylCZSlZWsOOmIu9Da3hsz/U4ShvdHkMv46ppchZnACTkzAL
 EHV633PvjWudnnS3s/At9CDmPxJUgYfCRr15z3FeBSUyJn6ASWrmO/bALQkOm8yNbVAI
 1h2PTdXDyNWcUuzUGvxhkpGAUqtw9HpgwTOJW6CHqjMwEFGek8b+GBJ+QPoHuvPYWDaJ
 aQJYRyycgAmNNGzP6QEvYiTSukfqpA4hmMDy9EHNwktsAt9y13eJhNlkEtcO014Kq4fP
 +TXg==
X-Gm-Message-State: AOAM531HVC1eBqmXui7AILhX7NYselvfs4Axw/bd94trPbVRXT/H7DB4
 R6UGUyrEL3easKlvrGbfFzdFl177Qy8OjAwxSs9zWw==
X-Google-Smtp-Source: ABdhPJzhWEGZXKalN5hrF6tMknJqDFwRExPGJk8fcI85sZhMDv/4FQ5vapM7XwYBnHci07Ppw0km3BIs8w+sgGivx4Y=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr3876988edd.251.1622803105229; 
 Fri, 04 Jun 2021 03:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210604073617.69622-1-jasowang@redhat.com>
In-Reply-To: <20210604073617.69622-1-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jun 2021 11:37:51 +0100
Message-ID: <CAFEAcA_GAdd6vFc9mxDuJY3WKb9L5XH9m40T4Z2anQHQqrewKA@mail.gmail.com>
Subject: Re: [PULL 0/7] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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

On Fri, 4 Jun 2021 at 08:36, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit 92f8c6fef13b31ba222c4d20ad8afd2b79c4c28e:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210525' into staging (2021-05-25 16:17:06 +0100)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to 90322e646e87c1440661cb3ddbc0cc94309d8a4f:
>
>   MAINTAINERS: Added eBPF maintainers information. (2021-06-04 15:25:46 +0800)
>
> ----------------------------------------------------------------
>
> ----------------------------------------------------------------
> Andrew Melnychenko (7):
>       net/tap: Added TUNSETSTEERINGEBPF code.
>       net: Added SetSteeringEBPF method for NetClientState.
>       ebpf: Added eBPF RSS program.
>       ebpf: Added eBPF RSS loader.
>       virtio-net: Added eBPF RSS to virtio-net.
>       docs: Added eBPF documentation.
>       MAINTAINERS: Added eBPF maintainers information.


Checkpatch reports a lot of hardcoded tabs -- can you fix those,
please, or are they deliberate?

thanks
-- PMM

