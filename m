Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AAC3C5CF9
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:11:56 +0200 (CEST)
Received: from localhost ([::1]:36162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vj1-0001OA-97
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2vPs-0008GX-Qp
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:52:08 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:43930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2vPo-0000qS-4N
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:52:08 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so11435305wmc.2
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=0ScwMtqb5LpVRMdQVJY1hGGZ2J3WVMROqRUlpu9kvXo=;
 b=l15CJOX4FjaKVq58vjNdDJf+8q3Wuij2qdxYpgxgkFZF2lm+oPi5+m5fCSPyz5BFQA
 Gd6qzyrIECn4HC54Vuzi7Af6CTU7JyvwgvxG1QazJcz4gYaI1yD+a5U/KxZ3oV9mFeYq
 bZu5qhK2m9McQiXHLOZNZ36D+zafb/jFMpuHAqKQNIZAPRteeyKvpv/dI4C7YSqSD49X
 a0Te4OgsiG4VuAJ29KyrPQ1P31i77p6hBKqr0Vnb614pKD/u0GuCnvLpAKRi+oZzzgJt
 0Fr1drfK+0HGLAGo9dw6uQjpeH73a0TMUa1o0nZfZab3uudToNmGCvPMJWJySpEZNY6s
 Cy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=0ScwMtqb5LpVRMdQVJY1hGGZ2J3WVMROqRUlpu9kvXo=;
 b=PjF3V6X8KXeOJf8tH3Lqia6w35AMzbXiVhvH+NDTtn9ZGNoQb3FKlO2zsGjNv/LrHH
 G6fQf3tHIVn7WvDI6ENtHWhdefxfvLJ5PeupYSl/TfEYiy9EsO1Xa8ZwFCC34PihkEI1
 IyM+rEbvZZU6KjCJJMvkE/a/9P3XwhZ65JTSVtI6U4qD+PTq8BFttoPJ/pueZo0Nia+w
 a6kSYespsJ0o582hhj8cOu3VuG6kLzaNJ3a137WP1RDOKlOridd4i6foiiC5Gb5WlAlX
 MiWBsRe7GQkAxXHRQSfedEerAc7BNipioVWZm5vejPrGXvPU3/bftc9tA13+XgnIlzjD
 7YMA==
X-Gm-Message-State: AOAM5300cAucosOLtUg0e2iNDr3cY0AlkP7KOYmo9obmxBswkVDz3At+
 spyacgwJlXBph8WD7hfGt+iumQ==
X-Google-Smtp-Source: ABdhPJy+aEGpsL1UR17gbSwhvtZ36dM5NIAEFKGyYpCE1PNoUJ8FVgqtqhvSgktU4MK0hVVI9drY4Q==
X-Received: by 2002:a05:600c:204c:: with SMTP id
 p12mr3642387wmg.167.1626094322334; 
 Mon, 12 Jul 2021 05:52:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s24sm15035663wra.33.2021.07.12.05.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:52:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AEBC91FF7E;
 Mon, 12 Jul 2021 13:52:00 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] disable modular TCG on Darwin
References: <20210712122208.456264-1-pbonzini@redhat.com>
Date: Mon, 12 Jul 2021 13:52:00 +0100
In-Reply-To: <20210712122208.456264-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 12 Jul 2021 14:22:08 +0200")
Message-ID: <87o8b7vgnj.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: qemu-devel@nongnu.org, akihiko.odaki@gmail.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Accelerator modularity does not work on Darwin:
>
> ld: illegal thread local variable reference to regular symbol _current_cp=
u for architecture x86_64
> clang: error: linker command failed with exit code 1 (use -v to see invoc=
ation)
>
> Fix by avoiding modular TCG builds.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Queued to HEAD, thanks.

--=20
Alex Benn=C3=A9e

