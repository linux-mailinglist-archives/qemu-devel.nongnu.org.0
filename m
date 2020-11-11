Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7172AF978
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 21:07:34 +0100 (CET)
Received: from localhost ([::1]:46646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcwOw-00079z-Uv
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 15:07:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcwLu-0005Gm-6g
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 15:04:25 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:36412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcwLk-0000Vf-20
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 15:04:16 -0500
Received: by mail-ed1-x542.google.com with SMTP id o20so3648150eds.3
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 12:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GQ8VoJzhmbPzY7eNDT8rB/PjtpsOpetR66M5nP7kTMo=;
 b=bQgjGcmJHa8s51Ijab38yjtaf8MjV+kPx45Tews8ooemIBbL80r/LSaQBjsGjulvhD
 35/LRBO8SVla4Lo/fCeDwFC1i1DrMRhP1FAM2s7GEp8E2rIs7M+6K6f94kJ6oG/svMHM
 5sdkU6MNb7/mnhIFNFzJFLBPw1if0MneooDhiSkWN4yU5d4zsAUvoCkxALTJt+hgnLoG
 DtsImmR9WMgr+0k/CstkgiSlJBXK/wT1dDQIJxmALDWIvpydDOPenzV8AOIOuA7x6BYk
 c4ggTMExnQ+qa65QGBVtl+xCjCrlsiL/Ii+Fxc85tnhB5asrKnfmyhmVRvLhSptIG4FV
 N1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GQ8VoJzhmbPzY7eNDT8rB/PjtpsOpetR66M5nP7kTMo=;
 b=amDlku+4Ek67k2UlG/0soqId4sYuzlqRj9BDbh41r5FBCllzeCe+Mb56pR83U3ErtP
 vjLoYk7vJQD/J0lMZw5CU2zzVYHfqtTt2XBPfidM7JZqzSpXpHnBusyYaX1B6UaKcMNf
 aPwJ0sBMc1d5Crld18mM+m2mYrUlGlB4SK1Wds+fZfycLtTG8w2dispDFNtdDdNYQfPH
 g62Bg3lVJq9FTqDiyprf+BFPrdp3E7j4T0KxkwUpYnC0fdIVNUffoB/W3zeSjA7OlDD/
 PcRP02XdO8X6oRSo9JzFGcP7oo0hJqThgE+MeP6LSiSd/FDEovAwg4aVJbkD9omCQDdz
 EzyA==
X-Gm-Message-State: AOAM531JdLmrNjsTHJ3DIJo7kOTVwH1p1vWKjSokABJ7ij2XylLILJqB
 8xt7mw1237t+gNbEVVgNog4QlU9wulgrAvTgbplF6weqSFA=
X-Google-Smtp-Source: ABdhPJy8xmeKoeNmKB4V6AR8Nw7+Bua60T/LmME/rSvCW2bJ6oeibo6M9o9pw0MKWF5O0iD5e9neFmDE/boFmyxTEFc=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr1357880edb.100.1605125050167; 
 Wed, 11 Nov 2020 12:04:10 -0800 (PST)
MIME-Version: 1.0
References: <20201111183823.283752-1-ehabkost@redhat.com>
 <20201111183823.283752-7-ehabkost@redhat.com>
In-Reply-To: <20201111183823.283752-7-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Nov 2020 20:03:58 +0000
Message-ID: <CAFEAcA9-3wFuT_LOE5HOP00mwoK9Unu4w3cm9fhH_YnU4T740w@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] virt: Register "its" as class property
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: John Snow <jsnow@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Nov 2020 at 18:38, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> Class properties make QOM introspection simpler and easier, as
> they don't require an object to be instantiated.
>
> Note: "its" is currently registered conditionally, but this makes
> the feature be registered unconditionally.  The only side effect
> is that it will be now possible to set its=on on virt-2.7 and
> older.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

