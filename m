Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F8D38F295
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:52:28 +0200 (CEST)
Received: from localhost ([::1]:54350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEkd-0003ZD-Qr
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llEjM-00020A-AF
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:51:08 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llEjI-0002jP-Dn
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:51:08 -0400
Received: by mail-wm1-x32e.google.com with SMTP id o127so15315852wmo.4
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 10:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=KaAf5q6qQc2MGtrge+1dTCK0iLZA90L9b3oNtf/7tvk=;
 b=cSVmxrWJnxWNYKPiMkGc8LbXfAjd0YU/OC++OLVy/cdJxhJO6G8xFxurjgAB7GVcj5
 paWe16E6vrfED7umpJNg957BefJzXfK5s+5EE5exCsnfzcHkVq4erNUfqlh/tz0CnkXD
 LsZG7rJ+6ILRzDKy9RslKv6MavBNrhbg94dmYdCXXcDJJ9gHFxX/Vbxv/ft2uscaqzkA
 xqBszqFHhFnfdjmSD3cIbse3s+ScCxlxCr1D50yvx5mzi/m21wNA6uEy42kOF7I0xR8h
 Q0Zxfn9PUFziT7cLgbGZIikBrDZUthm5RIKYVM8SjAXFGHrU3KKi/dv40FGcfV7dumQb
 ungg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=KaAf5q6qQc2MGtrge+1dTCK0iLZA90L9b3oNtf/7tvk=;
 b=r5+h3tREk02JMVKyEh/YeU0K4crhwsS7zbi5hswH+hj1eAi4LDzxqHsvtsOSyE4PE9
 w1ZZbTFtqYcK4UjgETgfjUo+ZjPR2tlq0UuaE5ABWUyVTfc/8tMUJU02kfp7bF8PNthB
 ucxS8ZAYFn9Dm3jyA5azFOVPmPg3d0NGaeqUtjaeONipGw2dwCLvfxEGEtORiIoNqo34
 kaAjTU2t0YxYnrr4B9QACUbxojQoxBaoi2lt+QA1L13HT8k2lPFjoIxLsHqOleLvImCZ
 s6NszXAI5Awxcgd1XVFWtsQRQW++ZmPpQMpB1JH8wiu+RGYgpmiHD5nNOpvp36LFLeSc
 UrtQ==
X-Gm-Message-State: AOAM531inIHoyHb3UaEsBVbIzLFD3xNxafJ7frLcnP0vzx8TXtbqJB/9
 GZQQGCyHVetwejBrG8I+VUo4Hg==
X-Google-Smtp-Source: ABdhPJytqlAtG52ezExH/kBYfeNe4QxFM48KHXWPEoTn/ugRokHvy+KXF1Q67jma0zjJxcFzj+/TQw==
X-Received: by 2002:a7b:ce8d:: with SMTP id q13mr214958wmj.109.1621878661997; 
 Mon, 24 May 2021 10:51:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q20sm576838wmq.2.2021.05.24.10.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 10:51:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7245F1FF7E;
 Mon, 24 May 2021 18:51:00 +0100 (BST)
References: <20210520174303.12310-1-alex.bennee@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH  v1 0/8] various misc fixes (gitlab, gdbstub, plugins)
Date: Mon, 24 May 2021 18:50:07 +0100
In-reply-to: <20210520174303.12310-1-alex.bennee@linaro.org>
Message-ID: <87a6ok3trv.fsf@linaro.org>
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi,
>
> My various maintenance trees each had a few fixes that are fairly
> uncontroversial and ready to go, including a recently baked fix for
> hexagon-user tests. I thought I'd better collect them together and get
> ready for a fairly quick merge so they don't get held up behind other
> stuff that's still cooking.

Ping? Anyone before I submit the PR tomorrow?

>
> The following need review:
>
>  - gdbstub: tidy away reverse debugging check into function
>  - gdbstub: Replace GdbCmdContext with plain g_array()
>  - gitlab: explicitly reference the upstream registry
>  - tests/tcg: add a multiarch signals test to stress test signal delivery
>
> Alex Benn=C3=A9e (5):
>   tests/tcg: add a multiarch signals test to stress test signal delivery
>   gitlab: explicitly reference the upstream registry
>   gitlab: add special rule for the hexagon container
>   hmp-commands: expand type of icount to "l" in replay commands
>   gdbstub: tidy away reverse debugging check into function
>
> Mahmoud Mandour (1):
>   plugins/syscall: Added a table-like summary output
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   gdbstub: Constify GdbCmdParseEntry
>   gdbstub: Replace GdbCmdContext with plain g_array()
>
>  gdbstub.c                           | 343 ++++++++++++++--------------
>  tests/plugin/syscall.c              |  98 +++++++-
>  tests/tcg/multiarch/signals.c       | 149 ++++++++++++
>  .gitlab-ci.d/containers.yml         |  30 ++-
>  .gitlab-ci.yml                      |   2 +
>  hmp-commands.hx                     |   4 +-
>  tests/tcg/alpha/Makefile.target     |   7 +
>  tests/tcg/multiarch/Makefile.target |   2 +
>  tests/tcg/sparc64/Makefile.target   |   7 +
>  9 files changed, 459 insertions(+), 183 deletions(-)
>  create mode 100644 tests/tcg/multiarch/signals.c


--=20
Alex Benn=C3=A9e

