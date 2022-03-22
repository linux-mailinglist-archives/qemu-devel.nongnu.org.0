Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2720F4E3BB9
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 10:26:37 +0100 (CET)
Received: from localhost ([::1]:51918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWamh-0003wE-JC
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 05:26:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWaks-0003A6-7w
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:24:42 -0400
Received: from [2607:f8b0:4864:20::b31] (port=42999
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWakq-00081U-72
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:24:41 -0400
Received: by mail-yb1-xb31.google.com with SMTP id u103so32513525ybi.9
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 02:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZcqxckEWhwHmvJUdK5B/LreH6kQIXSIPVCJ9FPYsDbo=;
 b=LUwYkt4uaOgJgGYgfHfj2Bx44diUPjdFsZXo1qCeeAogXoX0rO8CwVnFHHM4pGTUuJ
 TneM1HUHyMMlnpCnmF8m+eIRRDIuLxlPU9yOyQf0VK+ajlptGHMEEsbrEGPY5H+Fu8xx
 +BF6N+A/OmcPGucgm+jGc9gyk0b/yynIY7bBqVbKJXb0wwbfPwgSR2TA/Uwp7EfvAfam
 /IZOYRDeinm2fKzLDOtbIPgrImeBSX/2wrNHbfduPSYbC9bab9rwvqkN1YSMCaPc0lFZ
 4GGAmIRpv6aVi0Hfpf9jRVFRLFNvye0SZShKDh3mVI8PWAm+rbr3UyEOqlLtb9pzg/YT
 qjUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZcqxckEWhwHmvJUdK5B/LreH6kQIXSIPVCJ9FPYsDbo=;
 b=0NXjVCv72nhtSxdOS/mDo4NAFLS9i5PJLQzpKtAUKPqPc2fFGEctm0maEwJNpkxVLm
 iUYEhEuwVpiugl6g0Nnogm+22U/mqy+ffsa+E0DlHMxsHfkwFOqONh5D5rRlM5rWRprz
 TVsq5brS664z6HV4GEFXigou8btRBpj7zMLdErmtCqyyleSTu9K3LBPO8lc8ynAVKSEi
 PK97ekV6IB482cCaZlOEYNJ3vD817wQJK4Lh/P8rPslQ+mIwrVwiGX2Eg/cfu7Yb3b4E
 VMfBOrEgtwBiZNDRAVjKI49L7QLpcR0zwwu/TRbcUNyBSBs0vFTP5yTv8Hq/FQdpYV1u
 dwmw==
X-Gm-Message-State: AOAM530YLE7SGbPXepwjVsH9PVc9BO53pJ0NwaqcHVExPv8kU+CQDIiW
 AI0OdBqHxN6O6KRY4HJ/BnBBUCaPG3zlDN5KQ1E5xA==
X-Google-Smtp-Source: ABdhPJw0pfjr7gI5t0zFWvgYGzRdKXnPtopU4Wkm84a6UbQpvKRJcsSIIUAucCyxhQ7PeoqpehJJB5K59Y7nj0syIDM=
X-Received: by 2002:a25:cdc8:0:b0:633:8aa6:6a3 with SMTP id
 d191-20020a25cdc8000000b006338aa606a3mr25545874ybf.288.1647941079159; Tue, 22
 Mar 2022 02:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220322075400.8627-1-philippe.mathieu.daude@gmail.com>
 <7230eb78-0d9c-b636-f412-328b874280b3@redhat.com>
 <7cf7c9a4-1575-c23c-9a6a-b8574656f5f0@gmail.com>
In-Reply-To: <7cf7c9a4-1575-c23c-9a6a-b8574656f5f0@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Mar 2022 09:24:26 +0000
Message-ID: <CAFEAcA_SdP27xF3Mnw9Fe89CEXisFrzd4zMs5-F9SyXU_KURvA@mail.gmail.com>
Subject: Re: [PATCH-for-7.0 v2] qemu/main-loop: Disable block backend global
 state assertion on Cocoa
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Mar 2022 at 09:20, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> On 22/3/22 09:32, Paolo Bonzini wrote:
> > For now, it fixes the regression and makes the Cocoa build much more
> > similar to the others.  There is an easy way to fix the -runas
> > regression, by moving the code up to the call of -sharedApplication in
> > cocoa_display_init.
>
> That worked for me, I'll respin and wait to see if Akihiko is happy with
> the change and Peter won't object to the patchset past hard-freeze.

Cocoa UI is currently completely broken, so we should have some
fix to it. I'm happy to go with whatever you all think is a
reasonable approach.

-- PMM

