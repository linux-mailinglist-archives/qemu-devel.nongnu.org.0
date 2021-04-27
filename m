Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1FC36C605
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 14:23:40 +0200 (CEST)
Received: from localhost ([::1]:36882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbMkd-0003xW-Hl
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 08:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbMdf-0000av-Eb
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 08:16:27 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbMdd-0002eW-DT
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 08:16:27 -0400
Received: by mail-ej1-x629.google.com with SMTP id zg3so7574143ejb.8
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 05:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iOHl+WXov6I35hiaUgGBs0hZxf5f3OFbwgK2AgpIoOY=;
 b=J0Ql2aSSUdrJGXv13R/IIFbQ/0g0HNid0CL3JRBmKeFUjv3mveZqFe9tp8hdOQbwJO
 UanxUxkmQBHIE9750Zb2R6bMLANA2q4k3dnQoDxyG+hpy3GD62iARBC8gXw7HIKWAI58
 B+GAgccIIMJ0+gG+sns5IDDtP76EQo6b4vcQlsbU3GLQ8MT8Y0oRjTuQTJQ/rBXIZYVG
 Y50x7K9jOJbv1BBVj5jj19uqQm9GrTbViyfq5fzSvGbEc2EP/dM0JqK33srJEJD60kcl
 g12/i3qV+oEmjgf7hTSVL5suY+CUxnkuDkG79vZkK+Pkzfw6xrXlAm9fHfgXl0mha8G/
 eLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iOHl+WXov6I35hiaUgGBs0hZxf5f3OFbwgK2AgpIoOY=;
 b=DzJz/2Ca+gJpqkEK/8JjOYDkaLtlG27SwU5g45mOsJ4vMfIlWh1UMntRbHr3XwczqF
 MrxBpfaL0ttPCn5Sw48VoWTsRLJLmf7m0L8iEuA/wB7CRDwUN0ZJCRDPGhfMf/2Gd/Ag
 PCkJ5XDsxJ8h7qvul4+UmBTlzH0eVtMHizT07mcgZzpxrKmSHn7kzBx9U7zdOVtXomKy
 h8fKZDPBFA3pjODRXdUNIfq1aapquqaw2xhfRD1MEJV52In4L8qGLLjtD7xeme/jBBt+
 m0sJ4FxbZkBdzoYBr4flvtNppulz1CpcClG6u/esTN7xXVKAQz23Jzk5KS/AHSNWGBct
 ndaw==
X-Gm-Message-State: AOAM530q03TgA7fZ8ciyALs8oOHcilSqv89IR/L8xFk5foCg5jg1f74+
 HHGhm7pFwZU7Kb353I1yC7W5dUQrgt/3Wt3gyXxClA==
X-Google-Smtp-Source: ABdhPJxYSTm023atibq+hCUqhA5byTdWkNoqk4bZAmLYGoq/e7Syd3Oq5Yqv/dqFk4uEIhXLxPun5dI+vtSUygReSVM=
X-Received: by 2002:a17:906:6d41:: with SMTP id
 a1mr23314144ejt.482.1619525783656; 
 Tue, 27 Apr 2021 05:16:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <CAFEAcA8a53rCGBGVr_mb0fVJPXFaCShGTJE0bh=L5Nvw6ATz6A@mail.gmail.com>
 <20210427095458.3hbckyqbmfztcmge@gator.home>
In-Reply-To: <20210427095458.3hbckyqbmfztcmge@gator.home>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Apr 2021 13:15:24 +0100
Message-ID: <CAFEAcA82VJqgD+B4gCr1M0n5oV869rBdoTzNS6xSs0f2f8iFvw@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 0/6] target/arm: Add nested virtualization
 support
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrea Bolognani <abologna@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Haibo Xu <haibo.xu@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Apr 2021 at 10:55, Andrew Jones <drjones@redhat.com> wrote:
>
> On Tue, Apr 27, 2021 at 10:42:18AM +0100, Peter Maydell wrote:
> > Why are we making the UI for "enable EL2 guest with KVM" different
> > from that for "enable EL2 guest with TCG" ? Currently an EL2
> > TCG guest is set up with "-M virt,virtualization=on", which then
> > does everything it needs to enable virtualization on all the
> > components on the board including the CPU.
> >
> > Unless there's a strong technical reason why KVM EL2 has to
> > be different, I think we should use the same switch.
>
> I agree we should use the same switch, but I think I'd prefer it be the
> CPU switch instead of the machine switch, as it's a CPU feature. There are
> some board properties too, like the maintenance interrupt, but we tend to
> call a feature a CPU feature when it shows up in the CPU manual, e.g. the
> PMU is also a CPU feature, even though it has a PPI.

This is mostly not how we've generally opted to handle this kind of thing on
the virt board where there is something that is not merely a CPU feature
but also has effects on the wider system: look at 'virtualization',
'secure' and 'mte'. Granted, the effects of 'virtualization' on the wider
system are less significant than those of 'secure' or 'mte' -- but I think
we implemented 'virtualization' on the same pattern as 'secure'.

If you want to propose changing how we handle those things, including
a backward-compatibility setup so we don't break existing command lines,
I guess we can have that discussion. But we should either *first* do that
change-of-course and *then* implement KVM EL2 to fit into that, or we should
just implement KVM EL2 to fit into the design we have today (and then do
the redesign later if we decide to do that). I don't think we should add
KVM EL2 support's command line switches using a new design that we haven't
committed to and which leaves it completely out of line with what the TCG
handling of the exact same feature is. And I don't feel strongly enough
that our current approach is wrong that I want to impose a "first do this
big rework" precondition on landing the KVM EL2 support.

thanks
-- PMM

