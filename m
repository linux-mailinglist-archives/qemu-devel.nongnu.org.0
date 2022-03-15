Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FB64DA29C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 19:46:14 +0100 (CET)
Received: from localhost ([::1]:40912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUCBR-0000TM-7I
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 14:46:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUC6z-0004Uw-LQ
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:41:37 -0400
Received: from [2607:f8b0:4864:20::b2f] (port=40791
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUC6y-0005J7-4b
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:41:37 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id z8so241810ybh.7
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 11:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8qopWmj9wwwO4W8RV0D55EJGTjGtmRDXBSWpTQP2OEg=;
 b=YhQHjQUEFFXxmKmyegYBT0MemdoW1/KYq6SwdcbueVaXR4BfoW/rgKemkHrzER8ydY
 jUv86uNGR1XojZd62LBLaDesnRq3nURotlVDGikBw/oRWFglGMpMVrK9BcredtyAy55q
 Ub18IUbULmO2qC+JjeryAaZB/0LFkj1cWJ4gpKIaysknNyU8EJIef7ZEOsje9PX18xx/
 4sRPvkjAO7TY7AArpTqcMED6gFuADQYbo9QGstL4allZ0ycI/KFPdqdhLp7e1HdJNPlw
 RrNQyrwc+8B9jJ7MO9KHKsdCebRKB2CeQEvcwSAlfkRgBfBl0xItHLDz5I1rG0lx+b7M
 6jDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8qopWmj9wwwO4W8RV0D55EJGTjGtmRDXBSWpTQP2OEg=;
 b=sFqU9CELCiq5RugWQW0c/1C7nz4L1TejAurRtB9EPr/msSAN39ovHh+c46AbpFJGmt
 KbYVT4WXNrytJ34D7pK0IBRd3+b6P89/pvOr6bKaPcaYc4PHwUrs0GXL7s0LOdurCEz3
 jbIn9ds44zQQrrzzd0MCw0C26DBfF6OXL78tG2ReYMb+MDkuhV0M+uGwYCzPV9fIqeOD
 ZyupsvZZkOFUzvF9Jo1vDHlmaUzIIijSYddMq6gIGlRLM37b8w/+4FU0JThiwoXBLosr
 lzLYxfq+alfDBpX6WBLsNuM4mBKtQri3zu3Eb5Ud101WVSoxuFT1fFn/zNMQZSLR0Pyh
 jYIA==
X-Gm-Message-State: AOAM532WDU3els3h70ZyP508reKLlIUGAETA7EH6e0TawtQAiEApF5h2
 CA5eAcKkhQ/a+FXp+n7WqBLWiOADfy2EITe4JmNj/Q==
X-Google-Smtp-Source: ABdhPJzj8A1hVIRmSnBa1NS1wRH8FKEe3jzyfjJxRKC4SasB2F4gvA1yYnfrObCC2+Gq+nG9FdXNiq28fXG4j9vUwqs=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr24252679ybp.39.1647369693793; Tue, 15
 Mar 2022 11:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220307100058.449628-1-mst@redhat.com>
 <CAFEAcA94Uu=kyinf+pLUT2cY05326EDX=TKUeiSJH_aEY-kPVg@mail.gmail.com>
 <CAFEAcA_wO6dkr6=HUYsOS7RxGErrAvsNnNqhKfM733Q=4v6cdw@mail.gmail.com>
 <20220307174713-mutt-send-email-mst@kernel.org>
 <CAFEAcA9qUMuDupNRCYeH5rzBY+J7D3XXN_92PJjhBYxF70kF=w@mail.gmail.com>
 <20220308055639-mutt-send-email-mst@kernel.org>
 <CAFEAcA-3iD3hz2ihSDOir6ByWztAjNUkAvCSbeeX7-osMQLTdg@mail.gmail.com>
 <7dd4fd1f-5575-70f9-c476-b3159cc5990c@gmail.com>
In-Reply-To: <7dd4fd1f-5575-70f9-c476-b3159cc5990c@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 18:41:22 +0000
Message-ID: <CAFEAcA-uV3bj4x65M=MqwSOZdpiUueJ6Yscs4h9=fhPToujoYQ@mail.gmail.com>
Subject: Re: [PULL v2 00/47] virtio,pc,pci: features, cleanups, fixes
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Mar 2022 at 18:35, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
> On 8/3/22 12:18, Peter Maydell wrote:
> > Using 'unsigned long' in a cast (or anything else) is often
> > the wrong thing in QEMU...
>
> $ git grep -F '(unsigned long)' | wc -l
>       273
>
> Ouch :/

Only "often", not "always" :-) We have some APIs that work on
'long', usually because they're generic APIs borrowed from the
Linux kernel like the clear_bit/set_bit functions. And sometimes
you're interfacing to a host OS API whose types are 'long'.
So it's only one of those things that I tend to have in the
back of my head during code review, rather than something I think
we could enforce automatically.

The stuff in sev.c you list does look a bit suspicious, but
it's not actually buggy because that's all KVM code so we
know 'unsigned long' and pointers are the same size.
'uintptr_t' would be better, though.

thanks
-- PMM

