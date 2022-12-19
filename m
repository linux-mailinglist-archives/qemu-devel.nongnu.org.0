Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DAB650AC2
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 12:33:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ENR-0000m2-AT; Mon, 19 Dec 2022 06:32:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7END-0000jm-1Z
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 06:31:59 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7ENB-0003Jx-CE
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 06:31:58 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 k88-20020a17090a4ce100b00219d0b857bcso8595595pjh.1
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 03:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JtjuNh6nKBflgY+0VEFnvFd2WgV3W4Moz9ha2TIy82M=;
 b=MWxyj/I9d8JRnM8irFymdflJlpePyrfZEUtDft3JMcpzUAJ3dHe5FZW2+JmqBJ6LQ5
 ZlXbETcyPrLgNaK/+lvAjJ9pXBE/Edfdv0JM1YQoAPFHTB7hjAEK8eiOPITZ6aTp6Jfq
 dHSeJtBgUR3bg8CLGw3Aanend9wAq3V+WOqgmWGanWcnDYd6fCfmiK3jdvWzxYysPro6
 6q0bkTsaHWDyf1/+zgzBI9DzldCi3F4NFCY4vNEOU/VW4+6zcyD6Po8ySRLe4pm8LMFL
 NyuNswd8GO3WGq2HG4FK4v0muIJul48tmd7B2vJ7MYLDb2XYfOAsvPof4jXgcXPLa09Y
 7SKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JtjuNh6nKBflgY+0VEFnvFd2WgV3W4Moz9ha2TIy82M=;
 b=PF5mlY3WwKpFok+804+KtvJLtV1lEZPWUAAMnNbIDhNxUaogk4nvmxgZP9UvY9j18S
 wAEfRqrjjlwNu4EpZD9gxsgV6G/OHuDHDKTJJmGmYERZ2XAu+8HdiKrXuYNftdntJmLr
 YkaKI+XmSN1Z3azqc4zBjxsV25HxXPrEOJMvxIUO53bYJzgrgwAe8rEH4hEXJUl5JB1T
 WGKI/tGUN0Zknc6McXF0Q9uRWOLGoXcNP6P2roBGm3CPCO0OwknvuAnd6BbBpDDguzL5
 yGM+ktMhOhXLpTKdiJNMq6ejSTq2CKDCIX28sUjdgmzMhUCnPVPo3LdCcNeDTsTGxjnI
 kTIQ==
X-Gm-Message-State: AFqh2kq9edEf2YADKlasjv2KY0R99uknFul3T4kW8jRSEibT2UVH+c2I
 vCw2+kAV9lBMoqlrBt7uuAHSZ9Ed6YrxVXAdV0DljQ==
X-Google-Smtp-Source: AMrXdXsTG8nBurpBrsTV+3aSjDlPAF+dPfWL04SfeyH73uLv7uqw/ehs8QIFYl0g0cUPnPlJL7REmTYYTYOFINTso3E=
X-Received: by 2002:a17:90b:146:b0:219:94b2:2004 with SMTP id
 em6-20020a17090b014600b0021994b22004mr1715671pjb.215.1671449515419; Mon, 19
 Dec 2022 03:31:55 -0800 (PST)
MIME-Version: 1.0
References: <Y5zB+5t5K0AEj6Rn@p100>
 <31003f9a-5392-67ee-9ef2-01794c09510c@redhat.com>
 <75b841f6-1eab-9d5f-2ad7-89440931ac18@gmx.de>
In-Reply-To: <75b841f6-1eab-9d5f-2ad7-89440931ac18@gmx.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Dec 2022 11:31:44 +0000
Message-ID: <CAFEAcA8q8aqWvd7dwuH79yzq6Kyg-EVo9YzsWJ_mav4bLLH7eQ@mail.gmail.com>
Subject: Re: [PATCH] meson: Clean up some dependencies regarding qemu-system
To: Helge Deller <deller@gmx.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org, 
 Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 19 Dec 2022 at 11:22, Helge Deller <deller@gmx.de> wrote:
>
> Hi Paolo,
>
> On 12/17/22 14:28, Paolo Bonzini wrote:
> > These are wrong.  qemu-bridge-helper, virtiofsd, qemu-storage-daemon
> > and qemu-keymap *are* tools; if they fail to build due to any
> > dependencies, or due to other compilation issues, you need to add
> > tests to meson.build and check for the cause of the issues.
>
> No doubt, those are *tools*.
> But aren't those only required when you run system- and/or user-emulation?
>
> Looking at the packaging of qemu in debian:
>
> qemu-system-common debian package consists of thse *tools*:
>    qemu-bridge-helper, vhost-user-gpu, virtfs-proxy-helper, virtiofsd
>
> qemu-utils debian package consists of the *utilities*:
>    qemu-img, qemu-io, qemu-nbd
>
> IMHO this categorization makes sense.

Possibly, but it's not the categorization we use upstream,
which splits our binaries into three groups:
 * system-emulation binaries (qemu-system-arm, etc)
 * usermode-emulation binaries (qemu-arm, etc)
 * tools (everything else)

(I think the guest-agent may be a fourth group.)

thanks
-- PMM

