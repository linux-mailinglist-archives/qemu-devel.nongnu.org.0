Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 812AE3F9692
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 10:59:31 +0200 (CEST)
Received: from localhost ([::1]:60432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJXhy-0002kI-KI
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 04:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJXh5-0001sL-Ge
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 04:58:36 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:40595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJXh3-0005A2-Uu
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 04:58:35 -0400
Received: by mail-ed1-x529.google.com with SMTP id d6so8886835edt.7
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 01:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6cuKneKC0Vu4KQCam5NfpdSavPUg5ZqIlZ4ojR40kXU=;
 b=NjSTCnmXyLavO4jDs/RxNxcxhrkI0DnfJR/Skjhw49FFRg5vfEJ50jSjdl4eAuL48i
 UajteFEp3V50DWNajJ0TraH1xu+MLfgf0yik21YD2cuqWLIh5B8Z/MlWo+POsMN8ydGN
 Y4svZ6nDUVjEZXf4fenMry05LBTuGSGijlsIhw5e1wSZRfHdpZkGx4qtUnLuL5suSBsE
 0gBwrFWW2RTIZVB+Xd0G0cOZkB1QK22+vknyu9BX73DOfTKk3jK7PMV7p1R9CiUaZ1Yq
 AE57hkmwdVY0gSz+zC+TPJo+N7ahBnzFLE13yBldApwnmv0byOHpD/SctKg4a6TFxHHG
 zUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6cuKneKC0Vu4KQCam5NfpdSavPUg5ZqIlZ4ojR40kXU=;
 b=A5KfGtnyS9WDhjcKtGzL9CE7bf7CLrZ7NEgFShkGJaktOFXtJeABR7gLR2uRYsRtcT
 SrVF4deUcypBgxDwxj+mNGGIvkZCEPR9jDMgvSFuzYXHiTroJoxonfywAFfYmHYv7ayV
 QAc1Bn3GpW0VbZSDAZKdp4ZobsZLyIMrWkHAw/jIBecmHWa+pGRmY+g2GAXLXlINcqZX
 FiMbwhTc37eYpiYRU7RkwNpifg9g9LTXCKhfoRCdj3XzUHPlVsoPgBvhLs1rm8z7EqLd
 6I83QHsYCZRH7deGiEPKqRRrm4ctmgOrfHnBaSxrJGirAVaDkT7uZUqvjm+lu+m5s+AZ
 gcMw==
X-Gm-Message-State: AOAM531M/Brweqv5m8HcsgnqHdN0qW57CcCSmxq5XvOLj7wq/jL8Tdmt
 D07rOTCJueoWLtZjbXR5CiKX5uvBFHwbpW3u0LoXTQ==
X-Google-Smtp-Source: ABdhPJxtUPOTc/I7/u+3Fire2VqaotxMYC2u7K06hJ2qjRUkEoeBWOaWM7ZVt6WLTD2elzBh+K42u8hNAEfDSYeeyfU=
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr8699486edw.44.1630054712577;
 Fri, 27 Aug 2021 01:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210823160647.34028-1-drjones@redhat.com>
 <TYCPR01MB6160D6A837EBECCBC1F70847E9C89@TYCPR01MB6160.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB6160D6A837EBECCBC1F70847E9C89@TYCPR01MB6160.jpnprd01.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Aug 2021 09:57:45 +0100
Message-ID: <CAFEAcA8WFYAddXZ+BScb6+jJNnmKM+zV0kdHgySgZOV_+8BaQg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] target/arm/cpu: Introduce sve_vq_supported bitmap
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: "philmd@redhat.com" <philmd@redhat.com>, Andrew Jones <drjones@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Aug 2021 at 09:30, ishii.shuuichir@fujitsu.com
<ishii.shuuichir@fujitsu.com> wrote:
>
>
> Thank you, Andrew, for creating the patches.
> And thank you all for your comments.
>
> I have applied the suggested v2 patch series by andrew locally,

FYI, Andrew's patches are now upstream so you'll be able to base your
next revision of your patches directly on upstream master when you're
ready to send it out.

-- PMM

