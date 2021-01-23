Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548F1301576
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 14:47:20 +0100 (CET)
Received: from localhost ([::1]:43024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3JG3-0004s9-DN
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 08:47:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l3JEH-0004Kx-E2
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 08:45:31 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l3JED-0000SK-JQ
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 08:45:29 -0500
Received: by mail-ej1-x636.google.com with SMTP id kg20so11188496ejc.4
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 05:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RAGupTpcDO2/Qh9IBBJ3nywDSs2rY1EL8E/ebu7bWYw=;
 b=ukveVTE++S5Nx8I5yxoX1Tatw9OUlC3zYt5EYuiwfkU+QFXxfF1L6DAF4y0KtKEtO2
 1R3EvY6WWrhezyGsAfTm+u566vtJCfCUx5r6IKua1Q5Rr46nWEZ72gG1Pe6w2NgZYhZp
 E+g6r1FzvL8Xy1iItNw1jUQ+vBbLsGj5PVhWZKILaF29vcciG3jkmo1mhUdkj3p2B7dd
 cDe27nBel8zaGw1GyGPrnyzdmPjBJZx14rVenRfiFyAUvZsNKxf17rf7RboFxlJXe+/R
 NM1IigdNlEKUaYRNyxpfVfygStRGCvJkAe4FZibMJzLK+xSvADsosANgLMlkZ2upjkA9
 pzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RAGupTpcDO2/Qh9IBBJ3nywDSs2rY1EL8E/ebu7bWYw=;
 b=PFazdGyvVXkpiquHY4o19yKs7Uh/Y4YIe3EBVoVXmF4uMSj8ppLjlfwfbMODigh2o8
 IC12RZ4M0DoR+E11RMXFLO7iWYyQ/KyUIUj085r99M5EUoZxwQ+H76/e8q9AqZYjKAOH
 vOp2WUB8jHb31x/8DHQ8FUruzcNUzMWvSIiyQQIxIJe4q+qPCI5KsQKfwzIsDIC7SJRj
 g01QEcNqtGvEtmBThd8y62VBEVcyHWTQLD6ZvkYeiMPhW7VeOVgJeSzCp3lx1v9C8RCw
 +k4SfxnjdmObEVhBxgKNh54+2AyARuTLBpjXoA+1jqA/AcdwgxbAUtjme0LMlxhvumhI
 ONqg==
X-Gm-Message-State: AOAM531jDBgpWkAfHJu9u+3vEeddq1x1yhZ7nmlEIexD4DvvBrSbc4Ny
 39btZ+PdWHBKzsQawpoQI1EMliUFFtkLiLH3WpVeCg==
X-Google-Smtp-Source: ABdhPJyebs5zFyue/RhU8dYu8GbvY3zfNXrbtl9wo1FcMzrzXhfG6/ZT9//A+AZ394DHrwEvXsr9mBGVSiJIEf3G4rI=
X-Received: by 2002:a17:906:4bc2:: with SMTP id x2mr1083084ejv.4.1611409523860; 
 Sat, 23 Jan 2021 05:45:23 -0800 (PST)
MIME-Version: 1.0
References: <20210122201113.63788-1-j@getutm.app>
 <20210122201113.63788-6-j@getutm.app>
 <CAFEAcA8V1nv1VV6t8UN25JoA7bw96xSBamaw6VnfBavOQjj44A@mail.gmail.com>
 <CAFEAcA8hA7_isLsAtyS8oSwcfL9nRjdSehL+qLj5C2MycbzLoA@mail.gmail.com>
 <CA+E+eSAhNNBxY06a5iQj9ANpgmYZk0Kf6LYQPduCLwNmr1UQvA@mail.gmail.com>
In-Reply-To: <CA+E+eSAhNNBxY06a5iQj9ANpgmYZk0Kf6LYQPduCLwNmr1UQvA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 23 Jan 2021 13:45:12 +0000
Message-ID: <CAFEAcA8KZqxjDd0H7faF=YtkyY-XFB2WoP31qv_2ecFij_rLqQ@mail.gmail.com>
Subject: Re: [PATCH v7 05/11] osdep: build with non-working system() function
To: Joelle van Dyne <j@getutm.app>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 23 Jan 2021 at 03:18, Joelle van Dyne <j@getutm.app> wrote:
On Fri, Jan 22, 2021 at 3:17 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>> Can we do the "does system() exist?" check in meson.build ?

>> config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system'))

> Unfortunately, this doesn't work for iOS, which defines system() but
> throws a compile time error if you try to call it.

That's odd -- as far as I can tell the meson implementation
of has_function() does what I expected it to do, ie
"try to compile and link a little program that uses the
function, and see if it successfully links":
https://github.com/mesonbuild/meson/blob/39ede12aa5b27376341df85bc9ec254913f044bd/mesonbuild/compilers/mixins/clike.py#L791
There's some initial cleverness there too, so I guess some
part of that must be what's tripping us up.

In any case, I think we should be doing new checks in
meson.build, not configure.  Paolo, what's the right
way to do a meson "really compile this program and
check it built" test?

thanks
-- PMM

