Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB3D590F6C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 12:27:47 +0200 (CEST)
Received: from localhost ([::1]:49314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMRtJ-0004PE-KE
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 06:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMRpo-000296-RE
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 06:24:08 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:45769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMRpn-0005fW-6d
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 06:24:08 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-3246910dac3so5553077b3.12
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 03:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=eOQodsDfDOFaM0GnM3/lGWY5i6I/A327N6V+LgoVclc=;
 b=M8u/4dkj0Wj2oTPx4jERgDMRNw2WFc89Mn5UhArwBjL00xTV3r8DQV3brW+MzrPsAc
 bIggS3MfLdT1KmDoFnQv5cAXkjR6fynJ8Pfj/5aOW0UaDWxvmCSrHTnNge7zmL2hagKc
 qLUzA7xYh2kLwe0vNRq5ZnT0Q2lwaQFk62cNvQF2FTrLa9gzRJUweQ2XlV0Wk9FpmXmp
 mzYKUfKlaGGW4MFEL1JMq824lLh+BcZRBMK+Nu7xaL2VE6lLaWc6jzRx4wO2BF7QB98/
 nRs+x/5wyoJ2vlcOidwGKs5GP/+CgyBE7MjuTmA2+/6gO8PKtzMqs69Hxc1XqwBBCK6j
 Mvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=eOQodsDfDOFaM0GnM3/lGWY5i6I/A327N6V+LgoVclc=;
 b=0QnQMT8veQH1YzhJhy419GPvsshvDVkcAoe8HDybsQk/7VkPUOUVkM2vdwJd6AVFgt
 B6uJdC+HjMQilJlP/yzuJl9Cpn/uxuJzurM+ntXj1qNzwmIFxaj44mI1vDly7Q4TK2Se
 ntd9bh6d4n/I8i0bFp9kU1XgfcKFMtBPQ6uKQpf8EvkH9JWKnU7PWUtG7tP9g5YzuuVp
 oTGEX1AGfVGWgJdoZk3ri+0gbJh55wAqI8WtIj+buAK69TkGKIocL8en8iWcp5xqX5IO
 BZMvsRxbedG4gsK5mih3Ae9FshxBEKN16DVYqsp8EqBSnN8varZFfcAHxA5VuYl9VPzV
 frNg==
X-Gm-Message-State: ACgBeo2PVQO2ZcIsZKEMH3+uV0frvzGjctCJnITjLZZBpvppKNQni7Zo
 92WiIX41sFT/XmGyWHKdJEfD+Lunrfw7qZf/sKgRSQ==
X-Google-Smtp-Source: AA6agR7FVnxXJTQzwt3JlIGUkZXxa8Hylk1lKsrWAvsc21FLwxyY/sMfIdtIZ7F9A3eaufMDNnEDcdUcvTiiebUjKDs=
X-Received: by 2002:a81:63c6:0:b0:324:928:c672 with SMTP id
 x189-20020a8163c6000000b003240928c672mr3129489ywb.329.1660299846074; Fri, 12
 Aug 2022 03:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220810121513.1356081-1-marcandre.lureau@redhat.com>
In-Reply-To: <20220810121513.1356081-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2022 11:23:55 +0100
Message-ID: <CAFEAcA9jXnxwC4f3kfjB74TBrnftLcHkfApvL3Oe=HSASvt_kg@mail.gmail.com>
Subject: Re: [PATCH] tests/unit: fix a -Wformat-trunction warning
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
 Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Wed, 10 Aug 2022 at 13:20, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> ../tests/test-qobject-input-visitor.c: In function =E2=80=98test_visitor_=
in_list=E2=80=99:
> ../tests/test-qobject-input-visitor.c:454:49: warning: =E2=80=98%d=E2=80=
=99 directive output may be truncated writing between 1 and 10 bytes into a=
 region of size 6 [-Wformat-truncation=3D]
>   454 |         snprintf(string, sizeof(string), "string%d", i);
>       |                                                 ^~
> ../tests/test-qobject-input-visitor.c:454:42: note: directive argument in=
 the range [0, 2147483606]
>   454 |         snprintf(string, sizeof(string), "string%d", i);
>       |                                          ^~~~~~~~~~
> ../tests/test-qobject-input-visitor.c:454:9: note: =E2=80=98snprintf=E2=
=80=99 output between 8 and 17 bytes into a destination of size 12
>   454 |         snprintf(string, sizeof(string), "string%d", i);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Not trying to be clever, this is called 3 times during tests,
> let simply use g_strdup_printf().
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

This is a pretty safe fix and compiler warnings seem like they're
worth fixing for rc3. Since I need to do a target-arm pullreq
anyway I'll take this via that, unless anybody objects.

(I've fixed up the commit message typo in my tree.)

thanks
-- PMM

