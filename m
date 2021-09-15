Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB73C40C4FB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 14:14:22 +0200 (CEST)
Received: from localhost ([::1]:49050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQTnx-00041A-UW
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 08:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQTmw-0002xS-A0
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 08:13:18 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQTmu-0006dU-Ol
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 08:13:17 -0400
Received: by mail-wr1-x42b.google.com with SMTP id b6so3517497wrh.10
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 05:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+FziAHC2AoiQvCCWptbyvjbYfYngmOG4mTp0QBrF2aI=;
 b=iA7oaXrL5g9ZiKDhSSCdcBE+dfmK8z9ebbwnq+Kv3a5h30qBQzfjCNLassLaBp4yhJ
 b6hgv8RnB4PYsEMKMfmni/K9CbpkdHH/ltghj3RcwifEBAIT0og0UmzWxDR5tXf389uY
 Z3vJZ9GI/yoHtfpVzjUCy/G0H8Ywn0n5fUvlKbxnDNWC5QhQXivj9VwHeiFnXuas/WPD
 ogx1mMwrFp2HkBXLifh6E3J1lBg1Me4vxp5doSCl5iBOVk0hukABWLASNuVMU0dQ4kjO
 CwK0VzJlchP/qtisBf1aAOAr44DQTQZ7wkM1fibTd3qwmstajWFs3A5IYz9Lam4UsRLS
 Swrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+FziAHC2AoiQvCCWptbyvjbYfYngmOG4mTp0QBrF2aI=;
 b=zhlTukHFmpyYkuOq4U1ih2lKpKe9yr+0RSvdV7vkMaR5yaT4VFJ7ktOMfh3N0pnJ4d
 SDSCPO8b+IaWgfO1tE8WIo+QcjjvoCXFlOYm3Ql4HE8lStEYm3ySJ6F76MtzCdVXYq5G
 kC/tFO+Xn+6nGkv5fupy4JchKo02ehKu9Q7oxr0Py66DxM4lc2T0hm7iwPEbED0177M4
 0EcUFGUZFiLAekkxuhFrj6f4QOrY6uMPxo1/N53zQBNB/+JIpd5qiuIh9ROwd/7PDqM2
 0hQozORLt4a56vrK46VdDN+eLLY65sJ461C+aOWePgjmaOjvhw/Ltwm1iEbldmsMfBFy
 gGsg==
X-Gm-Message-State: AOAM531BTgJOP1EawAvOPdRP5WsqmxqSaTF6zQZFfHs9mK0NAsFnsoCE
 TDYEeGTQcctD6oyEYLxUnRV4MILFl1oS/J9nAyFwYg==
X-Google-Smtp-Source: ABdhPJwmf08yYVvVqAe7YhCzGNJgS7QOBAoWS44h5jP0Eac2HF65r3abePNynXl0sKobhXxSb7bGam7sc422zmQrzK4=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr4582797wrr.376.1631707994782; 
 Wed, 15 Sep 2021 05:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210913101948.12600-1-peter.maydell@linaro.org>
 <CAFEAcA86yjW8oeif4tY7WWzGfXYYV0VuqY+4RV9f_NqAApeeeg@mail.gmail.com>
 <YUGu1PbzB+pzZdjf@redhat.com>
In-Reply-To: <YUGu1PbzB+pzZdjf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Sep 2021 13:12:23 +0100
Message-ID: <CAFEAcA9CjgNrGJN2t40PJW6ZO-fP9R0senq4_G_h_8pmjH5n9Q@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: Make more custom runner jobs manual, and don't
 allow failure
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Sept 2021 at 09:29, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
> Urgh, my bad, I completely forget this behaviour when reviewing.
> When we only have
>
>   when: manual
>
> then the job has to be manually started, and it still contributes
> to pipeline status, so it /must/ triggered manually.
>
> If we want it to be manually started and not contribute to the
> pipeline status we need:
>
>  rules:
>    ...
>    when: manual
>    allow_failure: true

So there's no way to say "if it is triggered, then it must
not fail, but if it is not triggered, that's OK" ?

I guess it's not a big deal either way though.
So the fix is to add back the allow_failure tag to those jobs
which are manual. I'll send a patch...

-- PMM

