Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61553664B70
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:44:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHdn-0001JV-5L; Tue, 10 Jan 2023 11:38:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFHdk-0001IU-Dk
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:38:20 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFHdV-00054A-Jq
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:38:20 -0500
Received: by mail-pg1-x52c.google.com with SMTP id s67so8616060pgs.3
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gsMi1/vqAxQV2jZnkiUsMkhQcNTkVr+riluyNlnTS6c=;
 b=dEUbvFbzcRnxnal12apG7Nl59WcbUu6bemtpfI2dlOHdCdqpKkfQMgcf3djzGgrK5F
 ZlY/j1s29dt9PcYYnPxLqZ8V2N35MygOGpBiWCm4hMB8Al9S1YUTqRLPZWjB1YK7Obu3
 euZr1tQDvGQTD1OtsWP9RVPYu0FKDnsFqj0rHnY5riAe6n/CHcItFFKl38dXtg+dzLx+
 nrUZQx3X5vr9Ol4QUDKy40vbZCXq+lSv/VQncnM7zqwcBulJgJPEKIh6FNuQbjx2+XpG
 a41dLEOVFAfL8rzbQpF2mB+V/YMcGrzDjfl6TRLYwhlx5vxBnxAycFpeYiV3yEwCdq2n
 pEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gsMi1/vqAxQV2jZnkiUsMkhQcNTkVr+riluyNlnTS6c=;
 b=aaoEzp3Ev99et7gUWA/Um/MRasP1KCCq7hIyvgqsrkE2Y+exAG/Vv/x21kqcu9Nw6V
 q/tLy8k3L8JKFlzuoxkmut2kvGAzKaF+KqCAmOI991B6XGBUwLkHxYKOzcMRNBgHSABC
 nNObmHcoQZCEI5gbvCOJfT509yQ4/r22m4E5Ohl3MpEcPalLqPcLOMYvehc4NfwJGeyc
 tt+BKCIFnl9Ak8r860gyIyLPgGS+Jt4lP1ULW2dWlGlgw27PnHtQQf6O5mcVZ0KlSO5f
 3zp8mrLxBi/MJ71R1knlUgNz2moh1zgqdY5y+BUJzDiqVJTY3NFGTR5eVp/IEIspF2+0
 QDbg==
X-Gm-Message-State: AFqh2kquz7DA/ENt9hf0VvGK2TxiISxX8Tx/i5xk3tIyrtiYGljZG7eD
 Wp4aD81FK6QOz5Hx9ddY0xRa9d9LR/WfCl4t7AkF3A==
X-Google-Smtp-Source: AMrXdXvGCWii8oyCi8kQzvBBJEDvXoQoynP7Qz+jX+zf6aC5opErcGtKXGj2qKcwB2Qx0AMRGWtin5cBh/jBMxWmxjE=
X-Received: by 2002:aa7:999c:0:b0:582:74a2:1e4e with SMTP id
 k28-20020aa7999c000000b0058274a21e4emr2645464pfh.26.1673368683904; Tue, 10
 Jan 2023 08:38:03 -0800 (PST)
MIME-Version: 1.0
References: <87tu0yo458.fsf@pond.sub.org>
 <CAFEAcA8ugDcG_e_DWgbz7MW_cK6xuCMcps7MgqyWF=bXjT8CmA@mail.gmail.com>
 <87358inyoe.fsf@pond.sub.org>
In-Reply-To: <87358inyoe.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jan 2023 16:37:52 +0000
Message-ID: <CAFEAcA-5dbeuw9XJu-2n3hufZBt9P-tnGnZeuGCMN5MrK8GO8Q@mail.gmail.com>
Subject: Re: make vm-build-freebsd appears to require . in PATH
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 10 Jan 2023 at 16:26, Markus Armbruster <armbru@redhat.com> wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> > Does it actually require '.' on the PATH, or does it just want
> > a qemu-img binary on the PATH? (eg your distro one in /usr/bin).
> > I don't have '.' on my PATH and it works for me.
>
> Do we want to use qemu-img, qemu-system-x86_64 and so forth from PATH,
> or the one in the build tree?

There's no guarantee there is one in the build tree at all.
I usually use these like
 (cd build && ../configure)
 make -C build  vm-build-openbsd

in which case it doesn't need to build anything in the build
tree at all (neither qemu-system-x86_64 nor qemu-img).

It's nice to be able to do "test this build on *BSD" with
a known-good QEMU running the VM rather than having the
code-under-test affecting both the outer QEMU and the
build-and-make-check running inside the VM.

> The former could well be old, which feels like a potential source of
> problems.

In practice we only use it for very simple operations
("create a qcow2 image" and "resize this qcow2 file"),
so using the distro qemu-img has never been an issue for me.

I think I have in the past run into problems because the
system's qemu-system-x86_64 was super-old, but it was easy
to just build a known-good QEMU version and put that on
the PATH. (And now that system has had a host distro
upgrade, so I have gone back to using the system binary.)

thanks
-- PMM

