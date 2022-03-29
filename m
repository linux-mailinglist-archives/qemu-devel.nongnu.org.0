Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E554EAAC1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 11:51:50 +0200 (CEST)
Received: from localhost ([::1]:43924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ8Vw-0001A8-3H
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 05:51:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZ8TF-00004q-51
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 05:49:01 -0400
Received: from [2607:f8b0:4864:20::b33] (port=46944
 helo=mail-yb1-xb33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZ8TC-0001lP-8n
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 05:48:59 -0400
Received: by mail-yb1-xb33.google.com with SMTP id e81so1540633ybf.13
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 02:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=djz4RYcGCYH5I8EGOpM4zzmLUMV4UcvScC5mP7r0Zdw=;
 b=nlZyHd+AuTwmf4aEoSou/XikL9NMkHH4gDGaGOA5OshZ45BSd+5HEjXbMBI0a8bhgy
 sR5EDl3tYluoe2pb2vdMdrdCCznmRJW1+mAfDlnnDblmeqAB0c5Exw3+suS5cLODCAhA
 pblUBPWxmcaMkKdaRXgqBvNvhDAeTQXm3eAiF5+AcP/5fIHkuCwgXcPi2PDTq5ZbtUkx
 r6fnoSGxsV3RFyN/qnCSWKiGHQt9BFsEoQszdG/lWYv4Bh98FRYZnYLKPEE2zTd6metf
 vUJNnydJvYAn5L6zCwEqMQmludgiWfI1IJIScCQtNfeKQArhLr3UYfmAoUbU58q1AlOV
 RMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=djz4RYcGCYH5I8EGOpM4zzmLUMV4UcvScC5mP7r0Zdw=;
 b=q9cDiYLbAePvc7sDJXhxzbyLGfmw43a/D+eEkmvw6Qk4XbRHZubS4qoThWLBZsO2yz
 zF5sqIOzI40sgHhgm08zDIZ1tpbNi2kEl8f3S+BhA3Bo4H2LLlIt/0wd6XtcHc53X/ju
 Vfywd33EAeozO84nSLqB4hQEQ9/CFjY4Vl/ZKRVOrMKAmBVlYM82CtzuhWzxee1+wKQo
 e4bMsguC8NSrhpLgVxbOHP+nDsKx/2fWeoEWTuVyjiLPpvkWxRZZ5zxWOhVWYk//tsEr
 bVeBYbKfuODrZALu3VpdWonh2rpnU0DBsj0vlCtfXun0I96InVyaaUU8jmjoLMAw+yM3
 igng==
X-Gm-Message-State: AOAM532qa56Dr0cWXpk+SF+PdZPIuvvXNf1EBxmvgpWK0oLb5ZI//irr
 u1fB4h3pHzm1nNOouiuskXpP76zBwEIvJHWv44ojaw==
X-Google-Smtp-Source: ABdhPJy9glpgtLUOarKCr5bi6HjAkKqQ4RpsFvRZHyTfeZrbFtuVtoycsq3DqtRThOgbMqMQMaAUUv1JfXkXB2WvVhw=
X-Received: by 2002:a05:6902:701:b0:638:9404:baff with SMTP id
 k1-20020a056902070100b006389404baffmr24684167ybt.479.1648547334635; Tue, 29
 Mar 2022 02:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220328165415.2102-1-kshitij.suri@nutanix.com>
 <20220328165415.2102-2-kshitij.suri@nutanix.com> <87bkxp5kfo.fsf@pond.sub.org>
 <0705b49a-d4f6-f670-e26e-84d637c8071e@nutanix.com>
 <87a6d9429w.fsf_-_@pond.sub.org>
In-Reply-To: <87a6d9429w.fsf_-_@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Mar 2022 09:48:40 +0000
Message-ID: <CAFEAcA8Lb0FFybmQCZdqD=o-Md=ZTGpTNtunkmd3moLzK7p=Zg@mail.gmail.com>
Subject: Re: On patch series version tags, and also cover letters (was: [PATCH
 v2 2/2] Added parameter to take screenshot with screendump as PNG)
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
Cc: soham.ghosh@nutanix.com, berrange@redhat.com, prerna.saxena@nutanix.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com,
 Kshitij Suri <kshitij.suri@nutanix.com>, philippe.mathieu.daude@gmail.com,
 kraxel@redhat.com, thuth@redhat.com, prachatos.mitra@nutanix.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Mar 2022 at 09:03, Markus Armbruster <armbru@redhat.com> wrote:
> A cover letter (git format-patch --cover-letter) lets you write an
> introduction to the whole series.  Simple series may not need an
> introduction, but complex ones do.  I always use one except when the
> "series" is a single patch.

Note that a multi-patch series always needs a cover letter,
even if its contents are quite brief. Some of the automatic
tooling gets confused by multi-patch series with no cover letter.
Conversely, single patches shouldn't have a cover letter, although
getting that one wrong doesn't really have much ill effect.

thanks
-- PMM

