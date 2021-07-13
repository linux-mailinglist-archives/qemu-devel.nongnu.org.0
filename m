Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A34C83C755F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:57:20 +0200 (CEST)
Received: from localhost ([::1]:41818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Lih-0004nr-Dh
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3LdO-0002zG-Cw
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:51:50 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:38598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3LdL-0003Ym-PU
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:51:50 -0400
Received: by mail-ed1-x52b.google.com with SMTP id ee25so15871484edb.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2NVHE56LDPtNY9OUJi0xSP0Nn07s7106h6efouZK/7A=;
 b=e7XM5M2eV6ArjLJL8yjoT9PBRmaVBz4bUUv2K5+DuNl4z3iPT6ydGg+qoi+wlYBfX+
 WB677xyghLg17jDyOQ7swd1UqGrHwOYRDsaEevsibYZ8VaNwUlewxEPQqN3KlDGjTV7x
 xJw3EJQBwyuUwzgR6OkjxJoai4+9wT1nPV3NSZ4kXuNglpomFE8J98DaEwH1weRmMRzZ
 mTtJEPeZGBwKwz5E2n8DUb+8uD+9XgWR+TCnOZJYeVUgjfyhpaXcHcZoElZZilVr79tM
 lxiKsGjBn4P3yPyRkjUS6RSZ4phUAYgvbLXmEQlj/9RZG/mtFp/2hBHxPQ9UF++mFHFW
 vXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2NVHE56LDPtNY9OUJi0xSP0Nn07s7106h6efouZK/7A=;
 b=G2bmv+SAQEgA7W9DW+l23zbCAll6jU4WEJnnCU5OBRePWVVGvgAvMdOHiSwLz6CJ1r
 g5ZDuMkvEc62eJwjO69FrBiBqhr7yu5ck3kmKZ4pyxy6pyVDQo6vGuWQZrHG10Je1EE5
 6bWb2XdkbTmyEfkJyoSk8zsaHUjfiItHpHDpaFJNtuCZc8HOVC9j4xoVy5t97yaxi984
 axn9SJY3CdSd3CYMHJvoROtXzhAWrHeQ5FGopHJvw82kmYVoXLulCqXLoJbvbbLHknmX
 58ZSOhewPzlNKEHtUzU+ynOmaVN2tTpVrhWGv8hB5GsNAMtjfC2G489poWGylh6XsnDg
 ShZw==
X-Gm-Message-State: AOAM533KD+g8wyI00RwDunxDv7MnkcpN/d1l02uhg39T7ymYejNNrkRo
 rcFJWu4XWDSf1YImDpMaN9hwun2eue5fOkVnqDyRWQ==
X-Google-Smtp-Source: ABdhPJyJlZ+LNql3zkF1evXAV96M5hegrNhxYiPwv3kax8lH0vzz2owFZ4/LYF/+fTLqib6wQK1jYlJNSuzsskIW9hs=
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr6905715eds.204.1626195106103; 
 Tue, 13 Jul 2021 09:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210712210554.1951-1-alex.bennee@linaro.org>
In-Reply-To: <20210712210554.1951-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 17:51:06 +0100
Message-ID: <CAFEAcA-snDfCsv3m5x=t6wFz6+6CWsB5XxEabepM-YsfKMEhdA@mail.gmail.com>
Subject: Re: [PULL v4 00/42] testing, build and plugin updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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

On Mon, 12 Jul 2021 at 22:05, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit bd38ae26cea0d1d6a97f930248df149204c210=
a2:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210710=
' into staging (2021-07-12 11:02:39 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-and-plugins-12072=
1-4
>
> for you to fetch changes up to 312ad3f702789db630c8e43aaad718a1459b2018:
>
>   MAINTAINERS: Added myself as a reviewer for TCG Plugins (2021-07-12 20:=
13:24 +0100)
>
> ----------------------------------------------------------------
> Testing and plugin updates:
>
>   - custom runner playbooks for configuring GitLab runners
>   - integrate Cirrus jobs into GitLab via cirrus-run
>   - clean-up docker package lists
>   - bump NetBSD to 9.2
>   - bump OpenBSD to 6.9
>   - make test-mmap more hexagon friendly
>   - fixup handling of hostaddr for plugins
>   - disallow some incompatible plugin configurations
>   - enable plugins by default for most TCG builds
>   - honour main build -Wall settings for plugins
>   - new execlog plugin
>   - new cache modelling plugin
>   - fix io_uring build regression
>   - disable modular TCG on Darwin

Fails to build, OSX, when trying to link qemu-system-alpha-unsigned:

Undefined symbols for architecture x86_64:
  "_qemu_plugin_hwaddr_to_raddr", referenced from:
     -exported_symbol[s_list] command line option
  "_qemu_plugin_ram_addr_from_host", referenced from:
     -exported_symbol[s_list] command line option
  "_qemu_plugin_register_vcpu_mem_haddr_cb", referenced from:
     -exported_symbol[s_list] command line option
ld: symbol(s) not found for architecture x86_64
clang: error: linker command failed with exit code 1 (use -v to see invocat=
ion)


Fails to build, NetBSD and OpenBSD VMs:

Run-time dependency zlib found: YES 1.2.10
Run-time dependency liburing found: NO (tried pkgconfig)
Run-time dependency libxml-2.0 found: YES 2.9.12
Run-time dependency libnfs found: NO (tried pkgconfig)
Run-time dependency appleframeworks found: NO (tried framework)
Run-time dependency libseccomp found: NO (tried pkgconfig)
Has header "cap-ng.h" : NO
Run-time dependency xkbcommon found: YES 1.1.0
Library rt found: YES

../src/meson.build:458:2: ERROR: C shared or static library 'dl' not found

A full log can be found at
/home/qemu/qemu-test.sxOhBV/build/meson-logs/meson-log.txt

ERROR: meson setup failed


Also, the Gitlab CI pipeline page has some odd "manual action"
items in the pipeline and some of the jobs hit the 1 hour timeout,
eg: https://gitlab.com/qemu-project/qemu/-/jobs/1420815244


thanks
-- PMM

