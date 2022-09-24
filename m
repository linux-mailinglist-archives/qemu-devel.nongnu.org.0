Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2B25E8AB2
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 11:22:52 +0200 (CEST)
Received: from localhost ([::1]:48328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc1N5-0006XB-4n
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 05:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oc1LU-0004om-4M
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 05:21:12 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:42986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oc1LS-00079N-GZ
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 05:21:11 -0400
Received: by mail-qk1-x730.google.com with SMTP id d15so1467936qka.9
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 02:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=1qbkfLBeFncZQrSFj25UKKGoBWzbrN9f1+L+uPRsa4g=;
 b=TZYdjo/+/rbwH9wckr741X65RtxPCb22zZHxcMsVoku52AvS75dR5aybWUHS2d1eAy
 mjNUTeQNAVkppTeAs66JtK+wBrL3GJzxgfwQMLnehMkw07gB8AVrSd/JRARG/gcUIK03
 oN9LTFxnYHbDw20e8bIojSQnmMGW9TSCq3qWnL6AIVF2oAOMEnR3fl7/3suYI8lePk0P
 ef8P3+Vwu3eOltfIb1syl0PQAWxbNAHzc6g6OpRQcn0zMYXLkzrDZKjUoS5Zc7XVB0Kr
 CWw9XVTOUaKXjpBl2X4EIYL/+C7AnwIAJUzPc2yOJiBks6Lp4KDWQ+I4q4NNSft6wqSw
 Edcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=1qbkfLBeFncZQrSFj25UKKGoBWzbrN9f1+L+uPRsa4g=;
 b=z5hzlLZGPRq9YXiTj1VWKxyCLBm3vo23XarAmf4Lj/8VRQRZmCKptNibJJZvui7XGn
 c35x/Di38eauo1OlDMA3I3cgd8JwuZzXcXSQ1CTVdm/sLxqx41TwwU2w0IEC63AxPq0g
 /kSZnwm2+wKrDmYfz09iLgKCx4j8uq70y/upwRCTENnew4nk7NfpNzjhuJftAz9gXYl5
 EaU4VXpSGdxsqf7Y041HbSEU/Hfbi4BPcBdkK1s87eikuyKyPgXRxo4J/QuXdqPcfBNW
 jQS6jLEhrAQ+FoTomGdOOLjsIf4i8VWDXJ8s/mqOdRZmMzXJvIXl4rTFwEsNgZMi62pi
 uU1g==
X-Gm-Message-State: ACrzQf31RzxelO+C3JzDMf+mwTFZLD3f0twjUKaAHh/etsg+PguHup74
 pIEPD5HRnZDwKAJTsYCDjzLJM58BfSMZ7PjGO4w=
X-Google-Smtp-Source: AMsMyM6B74rt4CG/x58acIMUDQs+vXKHiWFuZ1GyvL/stfyp9ECdSs3fLoe7/cRtW18jfV20MeaanKkOtukXeatr2II=
X-Received: by 2002:a05:620a:1b8b:b0:6cf:4dbc:e0a9 with SMTP id
 dv11-20020a05620a1b8b00b006cf4dbce0a9mr8082519qkb.342.1664011269435; Sat, 24
 Sep 2022 02:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-7-bmeng.cn@gmail.com>
 <85f915c4-938c-8a23-a4c2-01fba0f87b63@redhat.com>
 <CAEUhbmVNNuSRgjHiewKhqOifTF2_Rzn+8uUNphay6aXRYHg=kw@mail.gmail.com>
In-Reply-To: <CAEUhbmVNNuSRgjHiewKhqOifTF2_Rzn+8uUNphay6aXRYHg=kw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 24 Sep 2022 17:20:59 +0800
Message-ID: <CAEUhbmXmKoE+cZUO-6Z=yPcWr1fknyw5PFyY+=c2-E4kCf-0AA@mail.gmail.com>
Subject: Re: [PATCH 6/7] .gitlab-ci.d/windows.yml: Unify the prerequisite
 packages
To: Thomas Huth <thuth@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x730.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi Thomas,

On Sat, Sep 10, 2022 at 8:32 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sat, Sep 10, 2022 at 12:32 AM Thomas Huth <thuth@redhat.com> wrote:
> >
> > On 08/09/2022 15.28, Bin Meng wrote:
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > At present the prerequisite packages for 64-bit and 32-bit builds
> > > are slightly different. Let's use the same packages for both.
> >
> > Not sure whether that's a good idea ... I did that on purpose to save some
> > few time during compilation (since the Windows jobs are running very long
> > already) ... did you check whether it makes a difference in the run time now?
> >
>
> Not much difference on the build time. Actually I found after we
> switched to single thread build the time did not increase too.
>
> One side note regarding the gitlab shared runner:
>
> It seems the shared runner Windows VM is quite slow. Is it possible to
> get a faster VM externally?

Any further comment for this patch?

Regards,
Bin

