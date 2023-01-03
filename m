Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD40665C39D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 17:11:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCjro-0004uO-Q9; Tue, 03 Jan 2023 11:10:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pCjrn-0004tP-3F
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 11:10:19 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pCjrl-0008EL-Cq
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 11:10:18 -0500
Received: by mail-pg1-x534.google.com with SMTP id f3so20431000pgc.2
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 08:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NwCkk3ouIOfZMvEVEnyRd0LlQZ/ZREQPyuNeXFY3qco=;
 b=XMLB6+MsiZ4ZlQ950YB+vKay2oBhBJzC8W0FO7U2IrGI5u+aiD1cH4mAxzUNYRCmQe
 jxGgv+ob/UQMm/v6Gerkv/nJVCKlN+oGgzE9cMXGanajlOzfoLM9XuSYj6zEfF28t+5q
 oD4o5suQ8R+u0Pwa34XpMwPtHlfXSBAzmgeJvBhomMl0FP4uG5XWrbrLeuk4bHF7NWzf
 pbk2ceP7LI9Gq6g5orheeZhWoDxDsfunSApLi12TEDW91xQLkHjUQmt7rE6zaYIPotYS
 +eRmEgDD77vIiIzBc19iXZzFTl3uACO/jb4MJtBqU9JPwlGrwmHYDJ1lUd9vDcFN9Zot
 QlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NwCkk3ouIOfZMvEVEnyRd0LlQZ/ZREQPyuNeXFY3qco=;
 b=7q3pp/9Feqv6ocPyJ/XSJ52VfjX7+gbfQXRT3cpJ/6jNCKfrD7+71I5D+IRf0m8RcP
 WH6VjTFyDtDFXZqutuT7wWQbCik9lAK52dv03bd4WaEFDzF+hd3elDXnCN73c+KE6QVj
 UFkkBnF9TVhWK2k1Xv0XdFaIbkzx+U5FKUG6azeN60wqsVucboLX3gck1NI55gL1Nxrk
 T+Ui/EtvBUh9q7JhaJDouXAjOT7ONMrV4IwT/vt3HN3gcFbelwj2dtY1ETN3uzT2WeQL
 ZrHqXK2hZzojmEykGChLPMy6nl5SPlDT5pDyx7nW/5fb0gpLd+BQKqT/b7OvRJ/64Zch
 Dxbg==
X-Gm-Message-State: AFqh2kprcipAXQyzHKfAsN0MjYVbbDczsX2EIgjBIOBY8xGhmogYGx0k
 5T+1LSonVNkf74TeyHaTHJXIamQ20bje5rtMGlNsbQ==
X-Google-Smtp-Source: AMrXdXvvsXNrqSV5Lv1Esfnwy+3G+KRx56u21MCw4a3EJNuC3Fe87KrTgBBeqCzW6sNk3kf0qy9lhK2QoI9dy3XzGJ4=
X-Received: by 2002:a63:3d4:0:b0:492:50dc:da4d with SMTP id
 203-20020a6303d4000000b0049250dcda4dmr1941707pgd.192.1672762214776; Tue, 03
 Jan 2023 08:10:14 -0800 (PST)
MIME-Version: 1.0
References: <20221223172135.3450109-1-alex.bennee@linaro.org>
In-Reply-To: <20221223172135.3450109-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Jan 2023 16:10:03 +0000
Message-ID: <CAFEAcA_4BWu79sK6_CVYjqpYumHoRHTxRJgyQKPiS1q3O_bf6Q@mail.gmail.com>
Subject: Re: [PULL v2 0/6] testing updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
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

On Fri, 23 Dec 2022 at 17:21, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 222059a0fccf4af3be776fe35a5ea2d6a68f9a=
0b:
>
>   Merge tag 'pull-ppc-20221221' of https://gitlab.com/danielhb/qemu into =
staging (2022-12-21 18:08:09 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-231222-1
>
> for you to fetch changes up to 3b4f911921e4233df0ba78d4acd2077da0b144ef:
>
>   gitlab-ci: Disable docs and GUIs for the build-tci and build-tcg-disabl=
ed jobs (2022-12-23 15:17:13 +0000)
>
> ----------------------------------------------------------------
> testing updates:
>
>   - fix minor shell-ism that can break check-tcg
>   - turn off verbose logging on custom runners
>   - make configure echo call in CI
>   - fix unused variable in linux-test
>   - add binary compiler docker image for hexagon
>   - disable doc and gui builds for tci and disable-tcg builds
>
> ----------------------------------------------------------------

The msys2-64bit job failed with a weird 'missing terminating "'
compiler error on ui/shader/texture-blit-vert.h:

https://gitlab.com/qemu-project/qemu/-/jobs/3547023328

as did msys2-32-bit:

https://gitlab.com/qemu-project/qemu/-/jobs/3547023329

Any idea? Is this just an existing error that's been masked
by the msys2 jobs consistently timing out before they get
to it ?

thanks
-- PMM

