Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4551C4590FB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 16:09:57 +0100 (CET)
Received: from localhost ([::1]:57488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpAx9-0006Jy-U7
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 10:09:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpAui-0003sI-Qy
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 10:07:25 -0500
Received: from [2a00:1450:4864:20::436] (port=44563
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpAua-0000zD-Ty
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 10:07:19 -0500
Received: by mail-wr1-x436.google.com with SMTP id n29so33257521wra.11
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 07:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kNNQmSDy9nV9p/o4Y7aL4lWycymJNNoHDeF77KHuCag=;
 b=OgjE4NS4LSOpkRHrG0iM+hZtAm3B95Ilstuy4j53hW9MCSDVc/K+TGgDg4qA7AUlFu
 8CyJbssPgsyajN16kiCUEj4lOTz+I7mc+RR2yC2d0ZNLfua8SkRFAKpfcdjJK0h657Nw
 V69a/x50d5pQwQnPqqYd6bh7D/ZUbC7H3RXyew8Y3riRtIoh5eVFfzy2bz4h8lyUJ467
 zGFUeWF+AV3/47P+AwSswrRQrSVugbutWu0AJYGlHuoE9DoW6c9sP0FcU0ubAW6YtEBW
 ramoS5SHqYrLakxcM21pO0dmRUj54wsiUyMQj+vaGkltWOLG+6s6N+T2QNXYPlJfD8bp
 m2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kNNQmSDy9nV9p/o4Y7aL4lWycymJNNoHDeF77KHuCag=;
 b=CroHsDMX3JnyWf1s5oKwWTWSEfpcwXXv34NsOf8V+6v0o5UXskieQSMujm9DIfg8VW
 HG6g4HPMMfNHBTB70uKNzAeXvfsnjIClNaMd8zhvemw1HUQxkQcU6rzKrQ9OH8AMBvYA
 HZ+5v4Nres6rxSSrWzfb8zmIs6vdShRc4de9Twk1QQYU+840ntoPbl6/PzHbFbNPIRkx
 u0jLKXMitul3Wxv150e7Ob9xiCBs/qfuXp2AUBB1gzfCVxBEl3k2zH3BbMm93eiYbhZ+
 EQ+ruvzgy/cLMUIfwlA3in4cEA67RPfO5U49UATtgqK+gzuvww45gSOMKjqmxp2rNNer
 hONw==
X-Gm-Message-State: AOAM533fPemWLQzfMgxSt0GnKUQmINu0JmqLJWWRsx6v7u8/NyHLcUzi
 zptCx//aE1Q6PqemtMPHuVT82vNLWOpH+VLwJOyIOg==
X-Google-Smtp-Source: ABdhPJxB33YcLQ6zTF/XqzKMpuo9maoSaDbgtSIdxzTDVS2/fK3fByuSonrRMUNkJMT5U9FBC8Xf2uVDyukYa5QyhMk=
X-Received: by 2002:adf:e984:: with SMTP id h4mr39265438wrm.149.1637593634873; 
 Mon, 22 Nov 2021 07:07:14 -0800 (PST)
MIME-Version: 1.0
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-5-richard.henderson@linaro.org>
 <CAFEAcA-cCdFSHVg6hKARipde9yLw=owNm3EZTfwbE5Bo8M0sFA@mail.gmail.com>
 <70c52554-ca05-5035-98a0-0bc9f340244a@linaro.org>
In-Reply-To: <70c52554-ca05-5035-98a0-0bc9f340244a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Nov 2021 15:07:03 +0000
Message-ID: <CAFEAcA-_gSJaS+ziy+EefRM+wNTx-Z8mN0hTCYNeHDG9oThddg@mail.gmail.com>
Subject: Re: [PATCH v5 04/17] common-user: Move syscall error detection into
 safe_syscall_base
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: qemu-devel@nongnu.org, imp@bsdimp.com, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Nov 2021 at 12:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/22/21 12:55 PM, Peter Maydell wrote:
> >> +       /*
> >> +         * The syscall calling convention isn't the same as the C one:
> >
> > Looks like the indent here is wrong ?
>
> Irritatingly, these files are a mix of tabs/spaces.

Hmm, so they are; I wonder how we let that slip in. Maybe do
a set of preparatory patches doing a mechanical tab-to-space
conversion?

-- PMM

