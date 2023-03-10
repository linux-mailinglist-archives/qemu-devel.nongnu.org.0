Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A94B96B409C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 14:39:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pacxN-0003Tq-Jl; Fri, 10 Mar 2023 08:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pacxF-0003Q7-RS
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 08:38:43 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pacxE-0003cv-Ba
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 08:38:41 -0500
Received: by mail-pg1-x52c.google.com with SMTP id p6so3071901pga.0
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 05:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678455519;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JcYfk5BVv1XvdscoAre3udY9Wzw4SiLfZ1POfhRieVA=;
 b=mc7N2cKYbsPHRV9r5Jocn2VkKZntpfLQJQbLGD3jF18vNnDCwCW9j9i3tqvIALpNq2
 87JzVeyxF4Che1W/BiZxKpRL7rgRYtTdaYets8pBvDchcwO4w2JrdfBphaDDgMQtmxzK
 9v7zYwqbd5H0GJAfuyWbemzP40QkngxSn0MEvsNTuc0wlxxEFk/Rz/S81dpKHikJFHJf
 1miYqEmm3KLau/yrxCsKFLhe7yTq/y5TPduWedj8iE1rGXRX8WskfaykCh99sDCdpT8a
 AkjW5/J7tlSLWlfMAlMllJCiCJI1uD9Z3NVDDXUm3jnIhFuU2SGtcxpsZ5BHczO2vCbv
 qmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678455519;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JcYfk5BVv1XvdscoAre3udY9Wzw4SiLfZ1POfhRieVA=;
 b=Wr5gxYXz6IJ6HtB9U0eBrPpFDLI698uJl58It1YDd0L5ftFn3ouPnLtarYHjeoV/Ox
 55jaa7BGvWjEady9u4mqaigx19YeNRCkelaRnzr09Ieseibu5Ubk80MfkfyiqE7XaaXx
 4fgr1HUwS6dtdoYkYaHAJ4EqGfgUroZti6WdGSzL9ofx7SKIXV0fJ4Z0NVtIKqsH4/ff
 UdxaOfGAFChVWpiHKIU/t8lDaSDf9nEs73mpqU6I5c4h5lpH7Wv+og0dozc9yQl8IR55
 pitHgsZ0YTZgSbTmTcVwItUeYoM+ZI/Cs1BdPDbdv+NCgai763V0sra5T7fpox35pTmp
 i/ww==
X-Gm-Message-State: AO0yUKWi7Pk699K82yM0gpgTzuCHBTKIgSeGqnDAJZ9aMEhstj3pjIrC
 uRF35LdQQgAAImazaK1wCjeF09N23oHvZw5MhDsyRw==
X-Google-Smtp-Source: AK7set+u+7eudutke9CPCgTqQE2wN2+f4OKI17X/D/B9tfzHju+OgwOm3HeJ6tE04RzY6SDL4TUlwH7w3krkcHu5RTg=
X-Received: by 2002:a63:8c17:0:b0:503:7be0:ea51 with SMTP id
 m23-20020a638c17000000b005037be0ea51mr8966484pgd.9.1678455518776; Fri, 10 Mar
 2023 05:38:38 -0800 (PST)
MIME-Version: 1.0
References: <20230310133247.39268-1-philmd@linaro.org>
In-Reply-To: <20230310133247.39268-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Mar 2023 13:38:27 +0000
Message-ID: <CAFEAcA8hDiWBXPhKmo=AsS5wfu8wKf2YbxwF4p7xRSWrCW4xEg@mail.gmail.com>
Subject: Re: [PATCH-for-8.0] gitlab-ci: Remove job building EDK2 firmware
 binaries
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Simon Glass <sjg@chromium.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?UGF3ZcWCIFBvxYJhd3NraQ==?= <ppolawsk@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
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

On Fri, 10 Mar 2023 at 13:33, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> When we introduced this Gitlab-CI job in commit 71920809ce
> ("gitlab-ci.yml: Add jobs to build EDK2 firmware binaries"),
> the naive plan was to have reproducible binaries by downloading
> what this job would build, testing it and eventually committing
> it. With retrospective, nothing happened 3 years later and this
> job is just bitrotting:
>
>   Step 1/3 : FROM ubuntu:18.04
>   18.04: Pulling from library/ubuntu
>   mediaType in manifest should be
>   'application/vnd.docker.distribution.manifest.v2+json' not
>   'application/vnd.oci.image.manifest.v1+json'
>
> Remove this job to avoid wasting maintenance and CI ressources.

Does the same thing hold for the opensbi job ?

thanks
-- PMM

