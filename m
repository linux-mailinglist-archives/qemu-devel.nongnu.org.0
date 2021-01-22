Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7831830074B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 16:30:23 +0100 (CET)
Received: from localhost ([::1]:57282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2yOE-00042l-JE
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 10:30:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2yNR-0003e5-89
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 10:29:33 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:40947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2yNP-0000M4-Jp
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 10:29:32 -0500
Received: by mail-ed1-x533.google.com with SMTP id h16so6992697edt.7
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 07:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S7gKiVmOFzs/jygF+V2HADDsHdc0eWJrlwfmL+s50P8=;
 b=eNPU6P+OM6V76o0kB0YR/nfQB+zbyTB2Su+i2AZUa9yo8nQ+cje50i4/cmMmc/bzGm
 BW1Ug0uSCjwrtqzBITJlGFH/8k4kTOY8dQ2/+hOBQGesyKiKZVhKycV5xg1hf4F2ifsh
 0RVPbdbF3yH+MkBYuM2vNvoA0yP9KjTCRT8tU2/GIskOmczVwl1GfcaQIapLBrMibKla
 YEd4Xlz5dpPPjxB7bVbK6s/wGAnVC13pqhXtQOkFVWdD+XS/uu6YPFMsh+4255LOlE/9
 U9xn8o3oH4UsC5XbIhdeBPnemTM7expMr0ebSzmZ5xfAosf9+gPyU2guMCsE4lHqwhfL
 4ydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S7gKiVmOFzs/jygF+V2HADDsHdc0eWJrlwfmL+s50P8=;
 b=JCZUkuhJNn6jk1I5lwAG94/7rzT4tOzobOjMZ+xQevvXwxzww39PIavv3hXpXinh8A
 PtwQslK7LDqHkX8sDsJZKQE366IyOtLWMMBtB1l11JL0c7K4YNMrQKCu10ZdP9nbhaGd
 SQHposXuSjIPCL+NFGtIgX30AzoxkjzaN/dkYupVvTMr9OLQW+RumrHhW0qzx8u3bOZC
 aKmuyvqy1hVh77Gc6L6HInULAf0/miIIGhwarpgWd0bmIMXUslhYjaDx0v2MQS7OQ+rh
 8Y3PsWrGCRnGsfxNr3DC+0SlM1SzTC0xRKFzA2p8a8YCFWGTJk1Ux8eBmP2jVa/1SmhX
 c8RA==
X-Gm-Message-State: AOAM532VMSlYhVTpRP8DGbzSYZrnvHVXeoaAf3ekEpkIGM2aPWB8ldSd
 cUEuNlTW2GxC9sjKkUSgqwRD9j2UGlfPEOkWIpazNA==
X-Google-Smtp-Source: ABdhPJxpBIDDOlX4Xey5GiJLP7WglX0vx0BD30D95B+bQn91KtGgIOGO/jRhQQSMYV46nvo/B2ZiE5aBM6l30Zxa6qI=
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr3576980edb.44.1611329370097; 
 Fri, 22 Jan 2021 07:29:30 -0800 (PST)
MIME-Version: 1.0
References: <20210118162537.779542-1-pbonzini@redhat.com>
 <CAFEAcA_En1xo10n3121r3ZRANkhiH0dRRwT5QwMZ1wRTeLyFWA@mail.gmail.com>
 <20210122151914.GE477672@toto>
In-Reply-To: <20210122151914.GE477672@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 15:29:18 +0000
Message-ID: <CAFEAcA93_YjNwZvxHirek+q7iN9-ToRNF=FGJXSuwtnS4gbXrg@mail.gmail.com>
Subject: Re: [PATCH] arm: rename xlnx-zcu102.canbusN properties
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Vikram Garhwal <fnu.vikram@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Jan 2021 at 15:19, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> On Fri, Jan 22, 2021 at 01:21:53PM +0000, Peter Maydell wrote:
> > Just noticed this wasn't cc'd to the Xilinx folks. Would one
> > of you like to review it?
>
> Looks good to me but we need to also update the test cases in
> tests/qtest/xlnx-can-test.c.

...looks like the patch does that, did it miss something?

> > >  hw/arm/xlnx-zcu102.c        |  4 ++--
> > >  tests/qtest/xlnx-can-test.c | 30 +++++++++++++++---------------

thanks
-- PMM

