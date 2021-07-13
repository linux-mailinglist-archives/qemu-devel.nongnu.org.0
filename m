Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F6C3C781C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 22:39:56 +0200 (CEST)
Received: from localhost ([::1]:55718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3PC7-00074t-Qs
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 16:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3PAs-0005Te-OQ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 16:38:38 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3PAr-0003ij-6e
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 16:38:38 -0400
Received: by mail-ej1-x62b.google.com with SMTP id gb6so43850490ejc.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 13:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YsPTmUwT3FM8HcluG32jCkjHJgc2Pn76wC0DtRPolos=;
 b=yZwvmhfwOumGLXhS9g5aEhCeY/OLaYYgDTPhw/XbGn3e25iPazFbLtabJbgujID8qq
 caxiGww78HLUvyGUKd9UKGRhYVdyJAopWjg82T/wLt8PxYk0Hj7wxmICf3806sQTNWw+
 R4hcO/1VoEgT2FsyuKTIGODpS3bIwx+tUTn/WcdZCpV04z+6iNCTPlHvGGYgkZnldg8l
 Ok5DGOtC7M/iOW/ZSWByUF9IQvs4pACFvANeM3p6t6VHJ9kwqFqeNtzgoV5Mt3eDvMf1
 dfGNrmQ8CnhrliDtQP8HDDVK3hVJVF5lbhZuCCBstH+2f06Qn9DWemGnrKL13KKjzyvS
 dSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YsPTmUwT3FM8HcluG32jCkjHJgc2Pn76wC0DtRPolos=;
 b=ttQE9YM2KNj5fiJz+/AUFkSDNUR3k14pw12LS3R/oD9jjc5hlfAaCs1rYvYZvU01Sh
 3TpTbHlXOvadewtn/q/o19VOfK6tRzVZRV5+Es9n7yy40QWqb4x3G/a3bRclAtRkXBmO
 gH9+5qjMRh77XPG4jejzNDAzBqEIdMv1syUmYh+hosoWleedgVMLkIOAxz+7if4g95IZ
 Fs3VXnPESf4qy1eODWv0pSIrbfRNJ3aX8rB3/OLJZBNziEpcP2UWrpECKrmJdy90/6gB
 abfeMmJ5O5H0Tr2mnJRJhemvlRKdoOnMNa8WrBCAyoeXUfKbruRvEQKn5E9/OXR37Plw
 SWMw==
X-Gm-Message-State: AOAM530SUZZcpuDO9RX2qHjnfRmh4Wn1RAI9DMNMmPgWXN/7DI2KplRr
 0MbXrvz3ddrGX50dT6f0pRE6bWGwenNX8z+GTnP9nyIvIsw3tW+R
X-Google-Smtp-Source: ABdhPJzhm4HI2tHLY43opTZNOZtmmk++XDEr/ECTWlxjiZLajSOIYMy4vfGBAUnIqeyFnUhRfY9AEyAlsGxnc0kfGPs=
X-Received: by 2002:a17:906:f9c5:: with SMTP id
 lj5mr7957781ejb.482.1626208715820; 
 Tue, 13 Jul 2021 13:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA-9cLv8OJnMqRRaXBvCcPp7Qh-xjVjMWMvuKXsT8sZTTA@mail.gmail.com>
In-Reply-To: <CAFEAcA-9cLv8OJnMqRRaXBvCcPp7Qh-xjVjMWMvuKXsT8sZTTA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 21:37:56 +0100
Message-ID: <CAFEAcA8doj_gQRqZwnk2Z6t3B4jrgtksEFOabf8dmRbMMS-+gg@mail.gmail.com>
Subject: Re: migration test, random hang, x86-64 host
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Jul 2021 at 20:41, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Random hang in 'make check' for x86-64 host, clang build,
> qemu-system-i386 target. I think I've seen this occasionally
> in the past.
>
> This is with commit 708f50199b59 plus a merge of the
> ppc pullreq c785a40179b

...which is now upstream as commit c6502434928ae.

-- PMM

