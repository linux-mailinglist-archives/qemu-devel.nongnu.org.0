Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECD7340484
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 12:23:51 +0100 (CET)
Received: from localhost ([::1]:37748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMqko-0006WK-EG
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 07:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMqj0-0005eS-To
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:22:00 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMqiz-0005gq-67
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:21:58 -0400
Received: by mail-ej1-x636.google.com with SMTP id w3so3317968ejc.4
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 04:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TBmsAe7eB1LNAmL48prbY+P6GemZK7dVs0kkS9eWE7A=;
 b=GcVVGmMIGdgVOc0oswPBptQuo/vJCiTd19MPsQjn2Mcv1T0S+hBYJoxuTgBJhwvtnL
 LrxqX2gTVKLZ8XWjZHImP1OyK8t2hdVyS97CCV5EiQZsr0pyk9hzhto3nUUm/YFYDSHD
 CpHKsCHpkuWwgm1TKw7DwGM3oCcQl65wDDiskPywEcDU/eHFtsiv9VFKo5bd6f1aWlox
 hieLEZU9RfUUZEz5KMij9/fNz5J+7fczrDRJzrC6u0yxleAP/7JaUb1u4H1l6CdP2fYj
 xtSY2QjtqXVYFqRR8BtSTkkuHoRv3w9FzsZVjFaNd+EMUk02/q1zIWtmFMywz89yy1wu
 Gufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TBmsAe7eB1LNAmL48prbY+P6GemZK7dVs0kkS9eWE7A=;
 b=DOyq0OOr2FnKKuU/9eQruBzSfh231zACBctwjzwc8cTf3SxJDAIVDUXHiuAipLTQyS
 m0wa8XKVJGQqiPvkdGMzxTal+luOBS2QqkPA2v9Gj67k4dC2tg3uVhLhsYJn1OURO+dH
 LQ75MLVid+zg/oNPArEJRk5r2PBDwNgvbi4UL4xr2BRmgL49oOFbRiEjtDCy1tkHcW5K
 4nXn1dpQzjLdphjbtYvnpzkPsFc3rfOiODMhoB/B+cmc6wQuDt9mP6Uw3rdm/WWJ43rm
 OEm8uOyILMQO55rmWasLe1Df1RY8JHRyM7TtmGmR5AZVReQcrTwkoiY15e0UhRuha5yA
 9l2Q==
X-Gm-Message-State: AOAM530QYCkDS5VDl4wrYkK8fg5XBGn23rtDys4NRCQAmNuYOAkRoM6B
 PwcS77WKfpu1jXzySkzXRTP5f5ViBl46UV3vhIGZnA==
X-Google-Smtp-Source: ABdhPJxycTeSWeIpXE604Rv7OKOhyPwdB/C0l37cZ9XFoEJPadt8TLt0mFAkArntAiJ+Yjwi+jCN60eEeH/i+uBtyoY=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr41270972ejc.250.1616066515310; 
 Thu, 18 Mar 2021 04:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210221222617.2579610-1-f4bug@amsat.org>
 <20210221222617.2579610-4-f4bug@amsat.org>
 <c395479b-d2e0-a862-3446-4afef601ca1f@suse.de>
 <8a302c84-b69c-b0c2-de45-607dd1f686a6@redhat.com>
 <e0d11b2c-7b1c-c968-feb2-675a8c98c7a4@suse.de>
 <ec296129-2c4d-fd74-d044-50c470e29609@redhat.com>
 <cd4caf9d-c32c-25fd-a27f-d352ece74ed3@redhat.com>
In-Reply-To: <cd4caf9d-c32c-25fd-a27f-d352ece74ed3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 11:21:31 +0000
Message-ID: <CAFEAcA8YybFf1=wQ7-scC2JnQEHr9nx0LBvt16dTBOXV0KuMAg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] target/arm: Restrict v7A TCG cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Mar 2021 at 11:09, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> Still, I'm not sure it makes sense. If you want to migrate a such
> machine, KVM can not virtualize it, so you'll be forced to use TCG
> right? In that case cpu_tcg is built in and you have the A15.
>
> IOW the problem is not this patch, it is that since 82bf7ae84ce we
> can not migrate A15.

Do you mean "we can't migrate a TCG A15" ? That would be a problem.
Or do you mean "we can't migrate a KVM A15" ? That's entirely
expected when we drop support for KVM A15 :-)
Or do you mean "migration from KVM to TCG doesn't work?" That's
a pre-existing thing I don't expect to work (we don't put anything
in to stop it working, but I'm pretty sure there will be a bunch
of things that mean it doesn't in practice work.)

> So we need both 1/ revert 82bf7ae84ce and 2/ be sure the kernel
> support 32-bit host... Am I missing something?

We're definitely not reverting 82bf7ae84ce if we can avoid it...

thanks
-- PMM

