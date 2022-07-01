Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D74A56311B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 12:14:24 +0200 (CEST)
Received: from localhost ([::1]:36680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7DfL-0007Eg-6r
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 06:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7DYa-00081x-Tl
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 06:07:25 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:46650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7DYY-0001Lr-V2
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 06:07:24 -0400
Received: by mail-yb1-xb36.google.com with SMTP id l11so3128760ybu.13
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 03:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DE/gai7qmpMLI57Wp/YxIVkfikqNC7MM+owY3hRZHmI=;
 b=o9dOhXD65f+X3AfmL5Cv3raAzYAGvFE58+RS4ROgyKZqeg9F8pBazJAmhsh5sXPrUG
 OKKAgArw27x4Zu8Gxz24or6ePk+wLVzUY4SRmph57HaXyQmWPQkdAholh3EpeD9sUGNS
 XPj28qIpRb6HnmSW7sGAtLueueDi5D73RtCKVBYSDLibLOoZwXz5yZN80+OOLDuAQCHU
 03AbeBEGEiq/JtXU/fQerWJxTNCeOMdW/aeq+RvCgwJNnHvl+rEsie0ljbhm7h5ZqZVt
 SjXlwZtEjYpI+D7p5W1kHdzrx/v10Wkm0ZNaHFbJICZq0JGRsLhhhldfb5AGpnZEQaJR
 kwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DE/gai7qmpMLI57Wp/YxIVkfikqNC7MM+owY3hRZHmI=;
 b=CJv5YWJSPy504c6mujycXNDQLsy9q9XEhlsQievaMOtDooJGfNoiRrKM7idpN4vWRz
 FOMatXGdbc/fyPuwqCMNsg4QSqonwD+2ERGJUp4goUDXxTh5JYXC1WNHbBTTkrsbmbVQ
 FX2bC8b0NDV/LJfysDPt+B1eJ5YcgCe1AxmyN3R2ir6sIiztSTtxEqx4Z+McmKknP1/y
 R2p0u3H0TTd/tRPi6ut2+7LJIcuFj5oMiV5XC3mbd6lSFze/YGqyjBH0DY0Apx6y+XEU
 7XHxNxNOwlxUzB+Rl8P6GZomPB2SSeqIWlMJ+9vmCm+JnpuEyByQIrwJCFR5FYl+IHGO
 /0ig==
X-Gm-Message-State: AJIora87hwnjxz7WSK3oFZxTeznhvu4Cg7RdUppLIzWRFvfLteAFQU0S
 2OD/I8qqj2O6FeA26VRFzuKm0HrT18u1gXsAAmKxfQ==
X-Google-Smtp-Source: AGRyM1tzkdO6adL+f1ipsba8oKqpyrZ5IC0kAfEqzvbocadASNhESx3VzO9/BYMZCELoA+vuW4sDdACrBqfRCFYHQzo=
X-Received: by 2002:a5b:e87:0:b0:66d:4669:9871 with SMTP id
 z7-20020a5b0e87000000b0066d46699871mr14400319ybr.288.1656670040699; Fri, 01
 Jul 2022 03:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220606164336.245740-1-kchamart@redhat.com>
 <20220606164336.245740-4-kchamart@redhat.com>
In-Reply-To: <20220606164336.245740-4-kchamart@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 11:06:42 +0100
Message-ID: <CAFEAcA_KACXGWttdEuAYjQTSDJfZ+dwGddKA+33EENGw+8Gpew@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] docs: rSTify GettingStartedDevelopers wiki; move
 it to QEMU Git
To: Kashyap Chamarthy <kchamart@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, thuth@redhat.com, 
 eblake@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 6 Jun 2022 at 17:43, Kashyap Chamarthy <kchamart@redhat.com> wrote:
>
> Converted the wiki[1] from Markdown to rST using:
>
>     $> pandoc -f Mediawiki -t rst getting-started-developers.wiki
>         -o getting-started-developers.rst
>
> It's a 1-1 conversion (I double-checked to the best I could).  I've also
> checked that the hyperlinks work correctly post-conversion.
>
> [1] https://wiki.qemu.org/Documentation/GettingStartedDevelopers
>
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>

> +-  Its OK if your new implementation doesn't do everything (or has some

I noticed a typo here (should be "It's"), but we should fix
that separately from this automated conversion.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

