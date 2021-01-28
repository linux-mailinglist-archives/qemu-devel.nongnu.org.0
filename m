Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06678307BB1
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:04:40 +0100 (CET)
Received: from localhost ([::1]:41254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Aik-0007Uf-EH
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:04:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5AeJ-00059m-53
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:00:03 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:46504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5AeG-0001PY-P9
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:00:02 -0500
Received: by mail-ed1-x536.google.com with SMTP id dj23so7392919edb.13
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 09:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c2DQUMMTaz23XsXyQ++1AimIsHVC3+5hkRsDqtniRNM=;
 b=xooC7pTa1gnoR3gIQCdcmhbmoWSLDAC+XPNnM+HZzyIlgau7h/5gTHOK1PvjxEgdnh
 YO8bdvvX8C2iBdwbvGMCXVnSrYqpXvRuJ1D8lm5dl1706d+zv5wZ1Hz27dGv56YOfwlC
 MmOcbn++vHiYJDBOOulVd2eDdxFyyntxJeMIyXD5eSMkWsZEShvngJ5emSG7fcg9YwXl
 b0HX/V2GXUp+cZ6cdnL5epZrIi7hR8xTnqEP1TLwpXBdXsZ6HGc3piOdE3Wgsl5L0vSf
 bps60/YK37ALRh5nbc/9kW06zIj1S/vKv1eMxAKAePRhEYjyb99ZHQdBhP8uG6rrXI3T
 x7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c2DQUMMTaz23XsXyQ++1AimIsHVC3+5hkRsDqtniRNM=;
 b=l+VVyHsZW4wI94VsosPoZJ/d/XKuUtJoGon0bKuSVWYlJBBPWt5HS0aFq/llwoNVDk
 6bwN4IU4HysWSPWECyefBvEspfhIp5PMVi5zVDYWWf9cIHg8xraAgXZ6pWI6jsE4qC+K
 qJv7s7f3pP4E8MwGE2mdn6pH+ciqugM7oenVHNPBguD/q/d9TaVgtp2fzPpLGmqZkPOk
 7zIk2ettKKvE7Ci1QWkvabiujxOYsyOnrUxQkotHltuUkj25kQAZ0tXAwX0sH/D3USyT
 WbNXNGQSUV2SocqKRe+XPH+A+1CDZQSXRVWqzJEIoxcabU3QPV8PewJnAzIjaP6SHTiG
 V0oQ==
X-Gm-Message-State: AOAM532MtYH3LSsXByqdehLbQP8NZbiTiAKzYVn1eH9ucB9SA3HevMy4
 RrbfJ6fcyQEZHOYE2f6iSfeNK5vWdvQBwQeKcvFHfA==
X-Google-Smtp-Source: ABdhPJxQanYkN45ceqMlEpmFzeMZhG6YDB5b6mIO+idQaz1KhokAx9hJvpmkeCxbElqeOdZAHAc6IQWZ7DPRk/+3JHI=
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr551948edb.44.1611853199481; 
 Thu, 28 Jan 2021 08:59:59 -0800 (PST)
MIME-Version: 1.0
References: <20210120224444.71840-1-agraf@csgraf.de>
In-Reply-To: <20210120224444.71840-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 16:59:47 +0000
Message-ID: <CAFEAcA_jAWPO09K_O2SceAmcbNDSaNvL3yp3D_=tsY6QeaKMZw@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] hvf: Implement Apple Silicon Support
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
>
> Now that Apple Silicon is widely available, people are obviously excited
> to try and run virtualized workloads on them, such as Linux and Windows.
>
> This patch set implements a fully functional version to get the ball
> going on that. With this applied, I can successfully run both Linux and
> Windows as guests. I am not aware of any limitations specific to
> Hypervisor.framework apart from:
>
>   - Live migration / savevm
>   - gdbstub debugging (SP register)
>

I've gone through making code review comments.

Since patch 1 is also required for Big Sur support on x86 Macs,
I'll take that via target-arm.next now (unless anybody would rather
it went in via a different route).

thanks
-- PMM

