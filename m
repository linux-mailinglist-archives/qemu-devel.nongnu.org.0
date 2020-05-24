Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985961DFF29
	for <lists+qemu-devel@lfdr.de>; Sun, 24 May 2020 15:41:39 +0200 (CEST)
Received: from localhost ([::1]:60492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jcqsk-0001Z6-5B
	for lists+qemu-devel@lfdr.de; Sun, 24 May 2020 09:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jcqs2-0000yk-Qg
 for qemu-devel@nongnu.org; Sun, 24 May 2020 09:40:54 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:39418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jcqs1-00080N-Tr
 for qemu-devel@nongnu.org; Sun, 24 May 2020 09:40:54 -0400
Received: by mail-ot1-x336.google.com with SMTP id d7so11977244ote.6
 for <qemu-devel@nongnu.org>; Sun, 24 May 2020 06:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kiPK2qmDv3F+OA9Mn5nH21zVPtkpK5TkFrKWMdMlwr8=;
 b=TWQvaisvFK1NTxyt8lqXjhQJYUWnwBwucRdhsVOZVS0ttUjGE1hN8AkdKY/yuHXoev
 woqoRQGScwTUELIkjJheKcVTaSAHtViquvmIgtMXMrxB2L+CzTkQAWfSqInhk/5in4Cy
 Fik90djhQhldoaYVQb2UXiKCjH/zBHKT78r5umPGIbEi1iDOTHrg6+0Q5/8Kkg3ppDli
 rZahfJB5RuSZwL69qeT4mnc3Vzdigs+H1qqOLhdo+MuPsgz4Ea7txrG+h2mtkRMNK9Pq
 rwis0hQsjIh7/xK5eX5p9aWpVbEXMK8JaodL6oiv5oLCo7GFPkiV2TI0J4GXygMSgrNZ
 daqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kiPK2qmDv3F+OA9Mn5nH21zVPtkpK5TkFrKWMdMlwr8=;
 b=WiQuhCjxkqKFx2rkXqbzCB/PNAS9xzTMM4zwUVXpjJhC31OSZozUHDAT1NgmRHYJ7Y
 KZrC0eVlIGZCMJaYYCeRSG40KGXb2aO5aYTGNHvqKxRI8w/4WjbnEQa9/nFfGco2ergL
 wJ7EHq/5o2ubo9C3r+HbOJJqe1iI8VWoLiFyek0dOobqREx7exkymDpKEWDwuAKHZXNm
 S/o3VKp1t9ItO2NNzWTl5kBbh4P7HQXsFAUIWLK14C8w1iRI3DnoPCbBi25a2vbgQL62
 6rKFoOfSpJgV1EGtyzQEzU+MTzTqC4os1YDtVm0CdMR+aYegLYP8kEyiHucsMLz66icR
 KJGA==
X-Gm-Message-State: AOAM530zmZsZtIp/RCwUwjW2s1sj84KM9P7SbFB5dfLlMS9FhuOTzcGF
 8naRAGnwpGDMLKReRhWbTTCz8YF4DvCGF6AIqwWCAQ==
X-Google-Smtp-Source: ABdhPJzlUIz/vqoZnQqDSM8+JLJ4vRVPXDsZ9M7Oejbm5MFRmbM56cE8/LSrUfGWcny4M+eARcfdGSOWnISlQxECA3M=
X-Received: by 2002:a9d:3623:: with SMTP id w32mr17520707otb.91.1590327652737; 
 Sun, 24 May 2020 06:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <159029353528.907.11982786579949073896.malonedeb@chaenomeles.canonical.com>
 <ced59c5e-01e9-9da6-5191-9d34ffa976b0@redhat.com>
In-Reply-To: <ced59c5e-01e9-9da6-5191-9d34ffa976b0@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 24 May 2020 14:40:41 +0100
Message-ID: <CAFEAcA83E33xNjhXvbZr9oe7TO9kMa0nArroCA_mY3zy+0bq2g@mail.gmail.com>
Subject: Re: [Bug 1880355] [NEW] Length restrictions for fw_cfg_dma_transfer?
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x336.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Bug 1880355 <1880355@bugs.launchpad.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 24 May 2020 at 11:30, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> It looks to me a normal behavior for a DMA device. DMA devices have a
> different address space view than the CPUs.
> Also note the fw_cfg is a generic device, not restricted to the x86 arch.

In an ideal world all our DMA devices would use some kind of common
framework or design pattern so they didn't hog all the CPU
and/or spend minutes with the BQL held if the guest requests
an enormous-sized DMA. In practice many of them just have
a simple "loop until the DMA transfer is complete" implementation...

thanks
-- PMM

