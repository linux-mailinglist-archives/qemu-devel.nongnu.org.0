Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629D924DFC9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 20:38:33 +0200 (CEST)
Received: from localhost ([::1]:55292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9Bvs-0008Uf-AU
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 14:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1k9Buh-00082h-N6
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 14:37:19 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:43787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1k9BuX-0001sy-6L
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 14:37:19 -0400
Received: by mail-pl1-x62f.google.com with SMTP id y6so1260417plk.10
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 11:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hWPSDZbrALUsdFFYuo4XuK5muFON9NJRMBxldZ7I/Gw=;
 b=G630MZP988CIgGyNdC7jySYR5wLAHlvx9WaayLDkxaLoV0qbI8u1Fa8DtijltstU1s
 GXbuZV+WClZiQPpv3RGn4OgKXVJHSRaPc5Ya4unquRm+1Qfp5ghxm4rxtpuUwCZ71DC/
 O8ul2Uoi+TQmadiNhhmf8/yMTREki9prFmtCBTB+1Wa+4H98dowSfDmtexS/+/v7K+B6
 s4NBVvDD2hE3VULU7lEE+6ZzD8TN/il6y224x81XCNAPtlKr790oegU6xaGt6B9XO0CM
 3BuXGYt+Yhdv8+KbFyO/YQuyRd/fr9LWWYUXF/jUnlES8F5JGHjVzTE+Ff38d8FNR7Wd
 fHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hWPSDZbrALUsdFFYuo4XuK5muFON9NJRMBxldZ7I/Gw=;
 b=irw6VqLGrWqwWctO3Ff3f4Baz7XsAfDvqKc/SsMmSto3foQ+lA9o5hGja4jYy8B5pN
 s7DqBac/nBRH6Ptw9qEhiTfF/UGWdgqIp6wj/eChndWp4Uz16VpaATxtNgfPyNLsVe88
 Moc0idkezbCrq0MhZgGSCA28Jj1BqXz1TLNn5Wv1OSXfFxrI+khIhI04zkYj5lpSm+B1
 1yt5gGJdJuyeJgF6fHfF8WFLdNBOqXZRZd4jW7NDZzq3vV13VSkE9qfw9O6PmAl+fo99
 oJ2HCSqa33wPYC9uDSs+wgQtKe5CGGyo3VHW3mVd4Eko+PZEloN3PjbPpEB4jIlmf8+d
 2O9A==
X-Gm-Message-State: AOAM530aRWGXV9mgTXYv8Ro1dgl3bBhYZiGdnpRnR9ce2+0fMDYOX+UB
 Q4qwOTYXHQ6JcC9Vl/WCQrkSjq81JedRx6PNykg=
X-Google-Smtp-Source: ABdhPJxp6Rbmuu02NfKzkuqbYO8ZvpAKxn+p04zPzGaMjzfY3912Tr4IMYdfxe17RlbzthYDcHzpBKpdl5sahIiL37Y=
X-Received: by 2002:a17:902:82c1:: with SMTP id
 u1mr3395592plz.224.1598035027454; 
 Fri, 21 Aug 2020 11:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200812232439.20153-1-jcmvbkbc@gmail.com>
 <CAFEAcA_CMuZbJqEi8sv3f1tJomkSB-3kpA48T0AZL8U2WhbpUw@mail.gmail.com>
In-Reply-To: <CAFEAcA_CMuZbJqEi8sv3f1tJomkSB-3kpA48T0AZL8U2WhbpUw@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 21 Aug 2020 11:36:56 -0700
Message-ID: <CAMo8BfJ412TP4=Z7E5tNxCC2QkSdGt=f6a355M8Wn-ixk=UupQ@mail.gmail.com>
Subject: Re: [PULL 00/24] target/xtensa updates for 5.2
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x62f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Fri, Aug 21, 2020 at 9:24 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> On Thu, 13 Aug 2020 at 00:24, Max Filippov <jcmvbkbc@gmail.com> wrote:
> > please pull the following batch of updates for target/xtensa.
>
> Hi; this conflicts with the meson buildsystem merge, I'm
> afraid -- can you rebase and resend, please?

Sure.

-- 
Thanks.
-- Max

