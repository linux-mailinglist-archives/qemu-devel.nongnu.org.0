Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8F8341980
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:08:04 +0100 (CET)
Received: from localhost ([::1]:33018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNC31-0004bk-Me
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNC1q-00049c-CN
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:06:50 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:34752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNC1o-0004XW-U1
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:06:50 -0400
Received: by mail-ed1-x532.google.com with SMTP id y6so10079905eds.1
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 03:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3MxlMexY7hj1/d1Z5EzOl5WOwSRwYy6cLFLFoMig/AI=;
 b=YMZ7b8Hf3gpcTpNvbgEZMk1AWh/10puGLBbugHPTWXVVJd4bbhikcxw96qWt0/vUVo
 rE/Be0WszBPTg3bu6wGVeg4E7QRW2CjV+Bp8pHMc7qgRSvUeMo09IMALk4+gYmvd2dIC
 bX6/ofZGqey0/rkGfMmbPjg7d7QntrnOkBCwjq8MmV49iPSlbGyG9T6SJvIH3j3jmlGN
 cwU6EhPta1tv5l9wp4ZWwPcTpkZmdUJ6Vv9rl15prt/fik3Jlc2ZEB2lmTfEW1n1KtxA
 yYXdmcyJCWTBzpTOcIkS6q/lYIWf0pYRffJxTYrz35zn74C8L0tQMD9Va0YW8GO6Apq+
 Ie/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3MxlMexY7hj1/d1Z5EzOl5WOwSRwYy6cLFLFoMig/AI=;
 b=gEvlru6DoBx8794+LsERsQBiDXpJg4XtI+KcPeiZ0dYUMzHs7UFG/HtIv1UO+DSlk1
 Lz/GOiyaUBLTI87K8PFKpTFve+sgOdEDRV5/Bu9KaTxKwWIrBSep823reuB/HnGIQoEU
 ZypdY1E24T0qLKWVgvY4raR4V233gv0323qS+Bw2oryhaX5Z324QCqjaKuYnncdzS+qf
 UAMKxUs0yjjRhR9rxGzQl3cc9rorRF748JawfQgaiPuqutRkgmiPdO80KR4aR31JUTRz
 ezeDBjU9F+mn08Mv2TBMiQrsYh+eucJUvHyMfDhBXbp4DCJa7PsOGTFUbuWLi/mccYGJ
 zkIg==
X-Gm-Message-State: AOAM532OmiVvPWi1gNeasprh0ZOegfvsmdihgMlR3dPx4NjuZuLOyxha
 YmmgJNyeLPLCK+PoOd/u8p/ldNg4j3x39+hwFQlNBuls5mMzcc7t
X-Google-Smtp-Source: ABdhPJwpZPuZGiZcUQSA7ZVOBsC0CZP+5Kr41Id5WJf8lxjs9bTwnqFdBIJrlzlBHZv5W/+x4O+sw/pI1iWOAAnFH7o=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr8383228edu.100.1616148407395; 
 Fri, 19 Mar 2021 03:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210318163757.1345341-1-armbru@redhat.com>
In-Reply-To: <20210318163757.1345341-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Mar 2021 10:06:22 +0000
Message-ID: <CAFEAcA8irrVpnE+vT4e5EW_gh28Qfn45EXS90nFkgYoVEPpXrA@mail.gmail.com>
Subject: Re: [PULL v2 00/11] QAPI patches patches for 2021-03-16
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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

On Thu, 18 Mar 2021 at 16:38, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 1db136a29ce8594b693938ab8e788d8bcef54770:
>
>   Merge remote-tracking branch 'remotes/cleber-gitlab/tags/python-next-pull-request' into staging (2021-03-18 14:07:31 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-03-16-v2
>
> for you to fetch changes up to 6dbe64a7eeaf01cb2de939edb7226aff411b2816:
>
>   qapi: New -compat deprecated-input=crash (2021-03-18 16:58:29 +0100)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2021-03-16
>
> ----------------------------------------------------------------
> Markus Armbruster (10):
>       qemu-options: New -compat to set policy for deprecated interfaces
>       qapi: Implement deprecated-output=hide for QMP command results
>       qapi: Implement deprecated-output=hide for QMP events
>       qapi: Implement deprecated-output=hide for QMP event data
>       monitor: Drop query-qmp-schema 'gen': false hack
>       qapi: Implement deprecated-output=hide for QMP introspection
>       test-util-sockets: Add stub for monitor_set_cur()
>       qapi: Implement deprecated-input=reject for QMP commands
>       qapi: Implement deprecated-input=reject for QMP command arguments
>       qapi: New -compat deprecated-input=crash
>
> Paolo Bonzini (1):
>       qemuutil: remove qemu_set_fd_handler duplicate symbol

CONFLICT (content): Merge conflict in monitor/qmp-cmds-control.c

thanks
-- PMM

