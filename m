Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A62281D04
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 22:38:23 +0200 (CEST)
Received: from localhost ([::1]:55144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kORos-0008DH-5P
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 16:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kORo0-0007K5-2M
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 16:37:28 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:44916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kORny-0007Ch-39
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 16:37:27 -0400
Received: by mail-ej1-x629.google.com with SMTP id a3so3641607ejy.11
 for <qemu-devel@nongnu.org>; Fri, 02 Oct 2020 13:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qpnnYN2a+q6hE9qh5hkDUkqRIGYH42dajsAzWgWVais=;
 b=zGsADtw1uUrvPu2I0NdDXH8JXI6P7OVRdXQXotl5+liiSFU1/kBK9/Aw+yG6U0Ht/I
 bkmd/C2c4PyVb4ldmb1EMWUkk4RgCJ3+ahAKOynG72VvB4y0DlZwUkheV9McgSQO4kAx
 zv7joMDFJJDRijEd4JHpEVb9x/Dvb4GzF/2mYjjUGG4Plw8lIW8n82vJlT4qG+w3fQE4
 DwgBfQraf0Wdr9cGAEaZLki9Vj4U+NfdrpF19tMvRhbZcB1gNTkT1hi8lLA5bKHOk/7P
 34RRzBk2CHM0H3VO/A0fM9GBs2yGfa4yLpn8RabS4QkF5KGgE+j7uoLpV4pZE7plSurc
 idaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qpnnYN2a+q6hE9qh5hkDUkqRIGYH42dajsAzWgWVais=;
 b=OYxZuZ8qsD7f9+E9H+jshJld/lc2TsFN2UIML5pHOHts3Wp1VsqmxlnN+li8DjPBIh
 vj1PB8d971AdvOIoIBD5iHj5z37Ew+eDN2k9tOYPjZpgt8y1sFD8uu3IuXSDTq0xVq8W
 6kl3qxQFqfPghGO0+3EmeW/WHbqsaLwQ6jHyracgo4xSp1zGGJUkjTv6JVYlPls652tn
 tf4tYZY3pNtsZyodlmhFC/3Dek0sTfaTT9GAQWknJLISXSuQEgK286NyMmqOlEKmQlyd
 7Ohw9KwskduEYmJwvhI/E2V+jjGhi4USTKkwLVCOwV2uxYHN5KBY+TEBo6klf/6eTNRy
 IwKw==
X-Gm-Message-State: AOAM531hYcQIpm0Ii9xpLkDARUTnChjntEE/+ou2riq5VKoKg1qVzP9b
 aKcF1l7TmIa7CW81iPajMUB4AcPIrbTMEi+UZs8r5w==
X-Google-Smtp-Source: ABdhPJz14gw+J5R4VyXhtJgrYJmO9OLgNsfoO4Nzz7tC9Yj4Q26zc0yGtSEFQnkOjmqvVNL+P5Ahy5L3FEIY7J1SYG0=
X-Received: by 2002:a17:906:1f42:: with SMTP id
 d2mr3931594ejk.407.1601671044574; 
 Fri, 02 Oct 2020 13:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20201002165127.130369-1-richard.henderson@linaro.org>
In-Reply-To: <20201002165127.130369-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Oct 2020 21:37:13 +0100
Message-ID: <CAFEAcA_kr5M+TbLDiYVMZbSMgpZE8fN+ae27rgOVkpOj2b9-xQ@mail.gmail.com>
Subject: Re: [PULL v2 00/11] capstone + disassembler patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2 Oct 2020 at 17:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Version 2 retains a dummy capstone/all makefile target, to avoid
> the build failure that Peter saw.
>
>
> r~
>
>
> The following changes since commit dd8c1e808f1ca311e1f50bff218c3ee3198b1f02:
>
>   Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20201002' into staging (2020-10-02 14:29:49 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-cap-20201002
>
> for you to fetch changes up to 94816249a1e14f90f56a2f6e1d566e959e9bc26d:
>
>   disas/capstone: Add skipdata hook for s390x (2020-10-02 11:05:07 -0500)
>
> ----------------------------------------------------------------
> Update capstone submodule from v3.0.5 to v5 ("next").
> Convert submodule build to meson.
> Enable capstone disassembly for s390x.
> Code cleanups in disas.c
>

Meson warning on the BSDs:

Configuring sparc-bsd-user-config-target.h using configuration
Configuring sparc64-bsd-user-config-target.h using configuration
Configuring x86_64-bsd-user-config-target.h using configuration
Did not find CMake 'cmake'
Found CMake: NO
Run-time dependency capstone found: NO (tried pkgconfig and cmake)
../src/meson.build:753: WARNING: Trying to compare values of different
types (bool, str) using ==.
The result of this is undefined and will become a hard error in a
future Meson release.
Configuring config-host.h using configuration
Program scripts/hxtool found: YES
Program scripts/shaderinclude.pl found: YES
Program scripts/qapi-gen.py found: YES
Program scripts/qemu-version.sh found: YES
Run-time dependency threads found: YES
Program keycodemapdb/tools/keymap-gen found: YES
Program scripts/decodetree.py found: YES

Warning from ppc64be box (gcc compilefarm one):

Configuring sh4eb-linux-user-config-target.h using configuration
Configuring sparc-linux-user-config-target.h using configuration
Configuring sparc32plus-linux-user-config-target.h using configuration
Configuring sparc64-linux-user-config-target.h using configuration
Configuring x86_64-linux-user-config-target.h using configuration
Configuring xtensa-linux-user-config-target.h using configuration
Configuring xtensaeb-linux-user-config-target.h using configuration
Found CMake: /usr/bin/cmake (2.8.12.2)
WARNING: The version of CMake /usr/bin/cmake is 2.8.12.2 but version
>=3.4 is required
Run-time dependency capstone found: NO (tried pkgconfig and cmake)
Configuring capstone-defs.h using configuration
Configuring config-host.h using configuration

We shouldn't be looking for or using cmake at all.

thanks
-- PMM

