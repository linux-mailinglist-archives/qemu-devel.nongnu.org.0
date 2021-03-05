Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDE732E64C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 11:27:01 +0100 (CET)
Received: from localhost ([::1]:34798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI7fg-0007YV-BB
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 05:27:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI7Y8-0007o1-UT
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 05:19:12 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:40362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI7Y7-00012e-4U
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 05:19:12 -0500
Received: by mail-ed1-x533.google.com with SMTP id t1so1810589eds.7
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 02:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4AHEdFYY4/HQBBxWmMAUbBD+zigoIWTRiQVLTcb9GqE=;
 b=QBmVvlZ02MVYRpZutmETlwcRO2xtLO4Me1PrdKqU5S2NA90KC445ECOxsVEwVuMo0+
 /erxkSivbuE9syDJdg7hs1T4yxCjQEGGRjlGKte0vpm/KzUdif4qjhtmetENLYlKZcxG
 V1uaJ+/8/60Y43kAu81Y1dPgGmdJ0DIIz7P5ijpH1jSAaU/V//bzoxfB3dbk5s2ZWf2T
 9oLMx47UnjQx/rPCwIcsQbbcl70+4epjiRVUF3NJKR5rOXgYzmt1a2s+DrYWu4617Mva
 UI37WciBWaM4LaH932skkvXWnsESeMsvoNtU+13LDw1qJapiTXTz0XGAnJTYqYXVwZxu
 MOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4AHEdFYY4/HQBBxWmMAUbBD+zigoIWTRiQVLTcb9GqE=;
 b=Msl3/JecU7CRfna0bJULPR/9Uk9kxemXQ1kcAkrlxpiNNg42tLdCtIpYIOAiSeqcA9
 lt+/pzErWVifvSnisrEtTC4p52cXSJ+6LiBxH1mG5Iwa5lpT66Zw/rZv/z7rVhUAidBX
 YqBIJJULnZli0yc/JPtT4hkGX/xBEQ3MAGciPfGbLj40M/x6NB8qhoLngtGsgtwddR6u
 4pjllqzwURr3hwE3sciBF0J5qVT2GdmtNMPqh1HnZgHUlYrkTxsdHi4h/Q2QzkmSaoRI
 FcQkXeBaUHyijUA6ubbKg1bl/r2JFaeBoE+mqXXRssBShc7MRcxTu94xlI2lU3hRIpcJ
 +6pA==
X-Gm-Message-State: AOAM5301LLAde7cGxb4ivjocuKCEK1nenbKy0mm+edK7GADJeJfIxjKq
 3pnkeGsTCun1V663WEhqEDjnHmJL98iC/mwCHwf/9g==
X-Google-Smtp-Source: ABdhPJx6U+/xlFyavJIBGqHdW3SwnAtEwLcaEH9kfUiLjpZutADqN/Q0My/k6oyHrHKff3OBEn0cFlGfMdKBSpA1TA8=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr8279701edt.251.1614939549157; 
 Fri, 05 Mar 2021 02:19:09 -0800 (PST)
MIME-Version: 1.0
References: <20210304083705.1046645-1-kraxel@redhat.com>
In-Reply-To: <20210304083705.1046645-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 10:18:53 +0000
Message-ID: <CAFEAcA9_JCzhHt29A4ADtC3u7EEyBdHMsTfjpSujrd5_yJUcSw@mail.gmail.com>
Subject: Re: [PULL 0/8] Ui 20210304 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Mar 2021 at 12:52, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit cbcf09872a936ccefef6a34298046d3b9aefc148:
>
>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-updates-240=
> 221-1' into staging (2021-02-25 19:07:58 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/ui-20210304-pull-request
>
> for you to fetch changes up to ed8f3fe6898e0f3fea2ece7c87464a06098b2300:
>
>   virtio-gpu: Do not distinguish the primary console (2021-03-04 09:35:36 +01=
> 00)
>
> ----------------------------------------------------------------
> ui/console: message surface tweaks.
> ui/cocoa: bugfixes and cleanups.
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

