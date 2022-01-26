Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672CC49D1A9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 19:23:39 +0100 (CET)
Received: from localhost ([::1]:32786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCmxG-0003oy-Hb
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 13:23:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nCmeH-0007Cq-7V
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 13:04:01 -0500
Received: from [2a00:1450:4864:20::336] (port=51016
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nCmeD-0001fF-BE
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 13:03:59 -0500
Received: by mail-wm1-x336.google.com with SMTP id r126so252387wma.0
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 10:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=21tbACb1290jtk1zPwZdgD7KgkQFiOrqL1EkpKtXJPk=;
 b=Z83oa0bxNdElHZRS3ouXSWpwMboHgNeKu4ShewRPf1izAW153ZpWwQNiSK/dqgKlkI
 z5EXJIZGLMzNBhKqn5fbAZ0NvEuUYq2BGtZFkewVNMr6lr71X7p1lmkZ9f5t0y3PLZXJ
 f1bjsEX+0g54Ge7R8W6H7D5fmDuc5KiD+pEWSSfirGlvJTop6ghu6tDwCGFZprDo0Ge5
 SLc2uNwxx5T1nzALVztQ95GSe411dFaEHm8vpCdSrDQCSb0h9zn9E8AAbC5GExu8gkfg
 VbfZnzhuOYmfnIN/eAiJhetsWr6+jKi6yDz0WKlw14fkFLOoe1BpPX0Dw13biI9EbNcS
 KjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=21tbACb1290jtk1zPwZdgD7KgkQFiOrqL1EkpKtXJPk=;
 b=8CganBG8RqZxskZs6X0OLRCfr2aZv7Ug2k/tRQJ1R+60fbphBh0D48xT3/mNyin7Vx
 7+/uy9SDl+Kbw4314hHfm7JyzHHWOhlybKe1wXrAveZFMkNcrWHb7IvvnYidKsv7U8O7
 xtyAXNvthA8Dap6YW4k2Zfr5jK1foT4qvJJBFNkzLD/8f6A1Fi+uuKeFmo9HFPZUhLUg
 vxyh3nmRkKssqr5y2n/vlhAc9DX3QxnYeHLqhhcFTwWLYZ7y2IW+cyiU8SME5QEuwkQq
 9nvYEgZ9kGeC7MPRag4X+vjCM9bdKOZqT/AS02VpKFaBPM2IlrfXwSUPJ+5iA8lWbUtE
 HzXg==
X-Gm-Message-State: AOAM532LYtdR+kO9XZib1ym6pR5nKYk7lJjdJjyB4x/rXzQ5AwsDptlR
 80GeWfVf9n7XvRlZE7voJQyzwRU1MxQbZamKaf9k8g==
X-Google-Smtp-Source: ABdhPJyGxKWfBmp67mA/ZyEsygTZfShkoknuh5HyYsXHLtigmomTIwc27mK9eWWyIKFInWoUIbieGBx3OZUMrp9/yvI=
X-Received: by 2002:a1c:a90d:: with SMTP id s13mr95861wme.32.1643220235208;
 Wed, 26 Jan 2022 10:03:55 -0800 (PST)
MIME-Version: 1.0
References: <20220110214755.810343-1-venture@google.com>
 <CAFEAcA8Bki2dpyptkSibz5=t9Fvy-PN8SjD=Z0PwcssX3MprRA@mail.gmail.com>
 <CAFEAcA_OfpMLzG=eUuzw0O_V_cgb57=XADciyfiF7U1mK0FzxQ@mail.gmail.com>
 <CAFtMCFUbBhXMxtc7RN+3OhDtckB+x-HXWbWcmh8AyncnriNFxQ@mail.gmail.com>
In-Reply-To: <CAFtMCFUbBhXMxtc7RN+3OhDtckB+x-HXWbWcmh8AyncnriNFxQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 26 Jan 2022 18:03:44 +0000
Message-ID: <CAFEAcA9HckDH_7s5fpnHOBFQBi-fDfnhcrJ0Y9-=uDtj0bwuoQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Adds designware i2c module and adds it to virt arm
To: Chris Rauer <crauer@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: mst@redhat.com, Patrick Venture <venture@google.com>, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, ani@anisinha.ca,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 Jan 2022 at 17:12, Chris Rauer <crauer@google.com> wrote:
>
>> I need to see a pretty strong justification for why we should be
>> adding new kinds of devices to the virt machine,
>
> The designware i2c controller is a very common controller on many
>  ARM SoCs.  It has device tree bindings and ACPI bindings which
> makes it ideal for this platform.

No, I mean, why do we need an i2c controller on the virt
board at all ?

> >Forgot to mention, but my prefered approach for providing
> >an i2c controller on the virt board would be to have a
> >PCI i2c controller: that way users who do need it can plug it
> >in with a -device command line option, and users who don't
> >need it never have to worry about it.

> > (We seem to have an ICH9-SMB PCI device already; I have no idea if it's suitable.)
> I didn't find that device suitable because it is part of the Intel
> Southbridge, which may have some Intel platform quirks, and
> we don't need all the things in that IO hub.

That's a pity. Is there a different PCI I2C controller we could model ?

thanks
-- PMM

