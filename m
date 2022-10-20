Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C0F6060A5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 14:54:18 +0200 (CEST)
Received: from localhost ([::1]:60284 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olV3w-0007H1-0t
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:54:16 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olUeg-0008CM-Ur
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olTSR-0001Il-6W
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:11:40 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:55932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olTSO-0006MQ-OD
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:11:26 -0400
Received: by mail-pj1-x1036.google.com with SMTP id pb15so2554199pjb.5
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VCZWsqsu6fjEvhahnftVcpOUSipC948bVV6H7O0gHoc=;
 b=D2fYt5Vlrk1nKlyl0sBsGKpQk+49JxIwk9xF6BX+j83yPqdg6LdAY3RWtqpzKdX8Sf
 Q5Np+oNuH1flN1iaJoRbK4mKo44yW6L37TfTPYeiVPJFCnGnW6jY/wZPWBQ5u8QGw1lv
 o944yHkS0enidUovgcJOn4lWaD/3FUP/lW0fQPHtp4PVfbvulh4HsdnjYnrLUzOvT00G
 C1US0ByE89xhT9pyA/+8i7Ul2BUYxUBTLMMlEhi01e/BPiOFk5Bow8YEBtO/e9ApOZcp
 OZJojKm9pZRcnHVeSaOELKYdJhAE9NkU6XE3i2OCdYB5+BUImkdtjmovy0qvnBdqCMx9
 KWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VCZWsqsu6fjEvhahnftVcpOUSipC948bVV6H7O0gHoc=;
 b=nZFKdPOCLouMk2r9UVA91xwwK9Nb7s+wf6t1Shh2oYGuIGBIcdQUFvB46d0/eUJ9D1
 4oFSix6IRsZm1tmEdwSGCRpw+E4NQ/Hzite+wFApPM/UrC25LBKGjLfbvk8QLwXVyDbh
 fcTKZR/kc06p4ac2FtKgryobRRRSe3KVZPvhCGQxXRoj7OvSd2GimeI9kBXXnk95ef9m
 hoEAxNBbnTXZG7vDAj6LwvjZJvlGwk6vc0rBgKSPIpaFTjp8xgqstV77wS6St/1f/iq0
 eSZrKIA1L+EEGMeRyRfP38TpRXRXunfi9aEecOs8pM+FE1Aln2IO2U9vyxkdubio3GBt
 6ZvQ==
X-Gm-Message-State: ACrzQf3WO3W5VPI0Uh9bAjzlGonEp6va+/Zyn1Kmagg1nohTfBggJ9wz
 QQy5MlPOAtVVQWG8khAypj7JLr8QWZ1I4hdEntSsbw==
X-Google-Smtp-Source: AMsMyM5aWEIcGu5fzD9EfXSjSbMtdio4Kcz+XAJYs+RTZL31gNts781g+sH1rLlClRIZArLXs0gO603/BWoqGByNCOM=
X-Received: by 2002:a17:90a:fe92:b0:20a:daaf:75ea with SMTP id
 co18-20020a17090afe9200b0020adaaf75eamr49910015pjb.221.1666264283189; Thu, 20
 Oct 2022 04:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20221013082854.878546-1-gaosong@loongson.cn>
In-Reply-To: <20221013082854.878546-1-gaosong@loongson.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Oct 2022 12:11:11 +0100
Message-ID: <CAFEAcA892O19UEBgx528G4WyGdHY2G-u4=RYKha-vGHmfdrFVQ@mail.gmail.com>
Subject: Re: [RISU PATCH v2 0/5] Add LoongArch architectures support
To: Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, 
 alex.bennee@linaro.org, maobibo@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 13 Oct 2022 at 09:28, Song Gao <gaosong@loongson.cn> wrote:
>
> hi,
>
> This series adds LoongArch architectures support, we had tested two
> mode:
> 1. LoongArch host server +  LoongArch host client;
> 2. LoongArch host server  + qemu client.
>
> You can find all LoongArch instructions at [1].
> This series not contains all LoongArch instructions,
> such as pcadd, syscalls, rdtime and jumps.
>
> [1]:
> https://github.com/loongson/LoongArch-Documentation/releases/download/2022.08.12/LoongArch-Vol1-v1.02-EN.pdf
>
> V2:
>
> - rewrite write_mov_ri();
> - get_risuop return a RisuOp;
> - test again with 1 million instructions.

Thanks; I've applied this to risu git. It looks like you didn't
fix the get_risuop return type, so I made that trivial change
when I applied the patches.

thanks
-- PMM

