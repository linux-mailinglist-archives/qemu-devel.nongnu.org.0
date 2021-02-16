Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61BD31C936
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 12:01:08 +0100 (CET)
Received: from localhost ([::1]:40990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBy6N-00039w-Oe
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 06:01:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBy35-0000Zu-BX
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 05:57:44 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:41424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBy31-0002Ho-Ld
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 05:57:42 -0500
Received: by mail-oi1-f179.google.com with SMTP id v193so10782793oie.8
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 02:57:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h/SESJ/whqJD8aih3tVb2AGCXB83iDL0hH7mrMijKeM=;
 b=BqUk+dD5kCqN0VNZMVcmJlLfBlvHABO4azcFD7Q8kvKD+ZHFFhl+BCzt3gADeowIgT
 sJQT1ppELwfbvcZWOlC88DyZn+uHZ1DQ8qRVBnYbcUEx1JnJ1HDonRlHPm8wAokn/TKK
 hEy/hJ7F6tZREn1q+1Su7SS3dYeBF6cpIU5/CEY5Kt5pu/+aB6V0LYCTVJ1u2E7IcKX1
 4IMG+hCjW6DmIH1owLHT1MtPCy7SzWEKkWoyUCmhRaYvEAhL7rMLLXeTJ8qc1nuC7cEq
 7skOWXNpoUevcz7wxK+RByuf8uKXiXHipmPXtLKMXrD1QgWHp+uOBmwvDlak5+UXu8GW
 yuxA==
X-Gm-Message-State: AOAM530aZo/87xRC5SkHQmuGP3fV8AsI+t1kgMg4/TUUFffwuvRIJWe6
 4HBwebtDm3ty9gcKGuWXMR4BkJ9mDG+UOPrMavI=
X-Google-Smtp-Source: ABdhPJynFKseBmiyEByJX5NhzNlAdZomWvgokRbuJEXLQLpmogAjFF5XKAlaVf6h8aCbsXV4o/PJnuC/27+NtPSRQeE=
X-Received: by 2002:aca:1a0a:: with SMTP id a10mr2171005oia.46.1613473058645; 
 Tue, 16 Feb 2021 02:57:38 -0800 (PST)
MIME-Version: 1.0
References: <20210216102522.6279-1-alex.bennee@linaro.org>
 <a0db0e73-debc-a712-570b-cc38278884f2@redhat.com>
In-Reply-To: <a0db0e73-debc-a712-570b-cc38278884f2@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 16 Feb 2021 11:57:27 +0100
Message-ID: <CAAdtpL6_ECRTQ7QNxWGJEphDx6uGGpUkXoMwevMeTn0MSPv8vA@mail.gmail.com>
Subject: Re: [PATCH v2] meson.build: expose TCG cross compiler information in
 summary
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.179;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f179.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 16, 2021 at 11:49 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 16/02/21 11:25, Alex Benn=C3=A9e wrote:
> > Blink and you miss the cross TCG compiler stuff so lets display it
> > with the rest of the compiler information.
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >
> > ---
> > v2
> >    - use target_dirs/fs.exists() instead of find
>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>
> Using $(wildcard) could be better than TARGET_DIRS in
> tests/Makefile.include, too, something like this:
>
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index d34254fb29..7203243b08 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -41,7 +41,7 @@ SYSEMU_TARGET_LIST :=3D $(subst -softmmu.mak,,$(notdir =
\
>   SPEED =3D quick
>
>   # Build up our target list from the filtered list of ninja targets
> -TARGETS=3D$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa,
> $(ninja-targets)))
> +TARGETS=3D$(patsubst tests/tcg/config-%.mak, %, $(wildcard
> tests/tcg/config-target.mak))
>
>   # Per guest TCG tests
>   BUILD_TCG_TARGET_RULES=3D$(patsubst %,build-tcg-tests-%, $(TARGETS))
> @@ -49,7 +49,7 @@ CLEAN_TCG_TARGET_RULES=3D$(patsubst %,clean-tcg-tests-%=
,
> $(TARGETS))
>   RUN_TCG_TARGET_RULES=3D$(patsubst %,run-tcg-tests-%, $(TARGETS))
>
>   # Probe for the Docker Builds needed for each build
> -$(foreach PROBE_TARGET,$(TARGET_DIRS),                                 \
> +$(foreach PROBE_TARGET,$(TARGETS),                             \
>         $(eval -include $(SRC_PATH)/tests/tcg/Makefile.prereqs))
>
>   $(BUILD_TCG_TARGET_RULES): build-tcg-tests-%: $(if
> $(CONFIG_PLUGIN),test-plugins)
>
>
> I'll test it and send it out.

Doesn't work with your diff:

make: *** No rule to make target 'run-tcg-tests-r5900o32el-linux-user'.  St=
op.

