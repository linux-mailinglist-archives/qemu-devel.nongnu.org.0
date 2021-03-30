Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC70234F4F9
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 01:18:42 +0200 (CEST)
Received: from localhost ([::1]:34760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRNdB-0002qK-G0
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 19:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lRNbo-0002Mw-Ie; Tue, 30 Mar 2021 19:17:16 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lRNbn-0006IX-69; Tue, 30 Mar 2021 19:17:16 -0400
Received: by mail-ed1-x535.google.com with SMTP id x21so20077884eds.4;
 Tue, 30 Mar 2021 16:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pUBWqkcP7IHEE01xwOuTuYcXuRJ2acuvsgBOGTUA+gA=;
 b=n+3qa6GH7tQKNWeN62n26Jq2i8Mly79sTOZ6dxVgmx7alZhLQSXAIZBuTAGLl7Jgd9
 gSmYjIgkjDkF6NWQ2xpT4n6GpUc1ivkvYBhqUrTjmqEpmpN3+0csakbNF7yLD6t1XXom
 6R86BKXHvaJWMWXrkBzjm1ESFh0hI2aDp7MYStECt9LcEzPTHdDuJKdt1rwjoTt4VxOc
 7HHrINqX4SzRXKQ0PHYPCVYYDbQ20c7jlnyOpj0wI/Y82cGen6GIBHsSJf0pf0ZdEbpB
 1ynT3IDrvFk2eWQELQzB/UIK1K8giHUWJi4tmTA3W4+HuV94QGCX9Od2wSKsJ131x/gB
 LVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pUBWqkcP7IHEE01xwOuTuYcXuRJ2acuvsgBOGTUA+gA=;
 b=hHyoB4+AlMvowNW8Xs/MZSPXp82iwKbmnBxqoqOU/0a8TscyastVrq/V8cEchsJxoG
 ttd410I54iHIIydXLc/wso0Lu50Ck3imGkObs1S0GnGP4uuSTvcqvSwfI190EVHjFjPi
 PtjYqdQP2osLfH0B1vI9LTd5+ukco0imRsZDPwB0sCjy3LLCZUgwOoHGFGykJygPNycZ
 3kP/bAzi3Mzv9Y0WgUx+hKevUlvZkMUEJdoKk+7tLdSECYMxJbJX1luGt0kyYV49aWU5
 0ANuUbTAfyTCdd2avoZXl2qyzjK3ErpVdJ/BirXpiB4NNxtKMCVzEpeyDanvb2DGeK0e
 XadQ==
X-Gm-Message-State: AOAM530hs97pmplvYopfFDFUN6x8GLlCBXRiGMslrdntH4sofAauQAWS
 vmb227VkxNfoqJAiE+Yfrba2+l0rmOYSZdsSD6c=
X-Google-Smtp-Source: ABdhPJzgvOuRc9Tue3PiDP836GTm9r8MYMgq2OdfWj3jmSoYylgamTh8MsVZhPZz+ztxnNqWkJhhWv/TKNHStW5qy1g=
X-Received: by 2002:a05:6402:48c:: with SMTP id
 k12mr242163edv.237.1617146232815; 
 Tue, 30 Mar 2021 16:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210330073036.24575-1-jcmvbkbc@gmail.com>
 <874d23cb-4d14-a5a6-4e57-0d8add130c36@linaro.org>
In-Reply-To: <874d23cb-4d14-a5a6-4e57-0d8add130c36@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 30 Mar 2021 16:17:01 -0700
Message-ID: <CAMo8BfJushZbW9YPb1QFn1oQupUu8NE+aG+PRjiSF4EGT0rc0w@mail.gmail.com>
Subject: Re: [PATCH] target/xtensa: fix core import to meson.build
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 30, 2021 at 1:32 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 3/30/21 1:30 AM, Max Filippov wrote:
> > -grep -q core-${NAME}.o "$BASE"/Makefile.objs || \
> > -    echo "obj-y += core-${NAME}.o" >> "$BASE"/Makefile.objs
> > +grep -q core-${NAME}.c "$BASE"/meson.build || \
> > +    echo "xtensa_ss.add(files('core-${NAME}.c'))" >> "$BASE"/meson.build
>
> We should be able to do this directly in meson.build, without having to modify
> the source file at all.

Are there examples that I could follow?

-- 
Thanks.
-- Max

