Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0836433976D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 20:29:30 +0100 (CET)
Received: from localhost ([::1]:47440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKnTU-0000dj-W4
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 14:29:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKmy2-0007fF-Vo
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:57:00 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:36933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKmxs-0004ie-FS
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:56:56 -0500
Received: by mail-ej1-x633.google.com with SMTP id bm21so55291926ejb.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bpha2JVkn8ZG8wzc9Sw4T/4lgCTCqh0xVR5yJelZ+Xc=;
 b=QofulE+66kjerqgYja+9iGfwvt0UBev5FQWAD8x0qnfQumssaIDxqPCs2Ro4bkFdD8
 lNLBw8WHiqCDYSeoXZx3jJk4m1ggWyOlsjZf1sKIG7W1YJX3FZGzfpfv1dkcPAiQOmDH
 XktsTJPaapZNovMhsZJw6YRUN399p4lvkOKBxrhL/BVQNfFXuqIUp7t8/Oe0PRuNTxWO
 IWI1/6n9aF9BynG1DUmZUVLGMNmt9Nb0dZ5aR+rzG2DxKxiw4SshincYO0oYX+WlreSR
 QeHxDde85umlz+y5LB/8TSF9p3hOg+SpUuyZYveNIT4RKaIFXO2zGlnvQ/pTATwj8r1P
 PXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bpha2JVkn8ZG8wzc9Sw4T/4lgCTCqh0xVR5yJelZ+Xc=;
 b=qbyQfJbU9fCfHZQnrX4ULUCKk99Ppplcfimac05fgYgU0BmUVJQT+3UoLgM/dgE1xz
 uVaF3whO+sabw7I5dvgpm06CGWxOMJbaBtD6XI+YhHunIOt/YmvEko5mhGit/XyWWkEh
 HUzWGJDBSSfwwBi6eIVcagchtt9TNc0HLvztgU6uWLOwZO4PNz34yHaIhHKCEmOtUbMa
 77bxsy1je0q9IbDTqyTggpfENew9RUHFK+7IIxaMTEHFNv8BCZqQqSyX5l/yg7rT6um5
 TlatTiGjsVaFhk4ktmD+9zIBSwQGFiv6mwvbmHpjXEzwWtXS7p8jsMu8YXlqtBe2wMPL
 1XKA==
X-Gm-Message-State: AOAM532T4nQx/H1bsjyYUvBH4RSs4swp5pXCK9c8HpC8IXMg928ZPAJ/
 TJnrpteHCmVS5gnch3CZB1pDJSJ0GWmsaOqKwpbOfA==
X-Google-Smtp-Source: ABdhPJzf79Xpbu/bPF47Y+cnEfUA/EGkiFXwip3OfGQPzwysVpNn1K2PK0z6+CJGHBddmrKRpovzZKMtiT/1lQrJzkc=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr10374478ejc.250.1615575406029; 
 Fri, 12 Mar 2021 10:56:46 -0800 (PST)
MIME-Version: 1.0
References: <20210311144811.313451-1-kwolf@redhat.com>
In-Reply-To: <20210311144811.313451-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Mar 2021 18:56:27 +0000
Message-ID: <CAFEAcA-RkqptbD6Cie_iMr9RgXT-B0mCVcyTwh6NV41EfX+N1g@mail.gmail.com>
Subject: Re: [PULL 00/38] Block layer patches and object-add QAPIfication
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Mar 2021 at 14:48, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit d689ecad073e0289afa8ca863e45879d719e5c21:
>
>   Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request' into staging (2021-03-10 20:11:33 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to 4756658df7d5104b36ee2f40f30f2d0f10225a53:
>
>   qom: Add user_creatable_parse_str() (2021-03-11 13:13:49 +0100)
>
> ----------------------------------------------------------------
> Block layer patches and object-add QAPIfication
>
> - QAPIfy object-add and --object for tools
> - Add vhost-user-blk-test
> - stream: Fail gracefully if permission is denied
> - storage-daemon: Fix crash on quit when job is still running
> - curl: Fix use after free
> - Fix image creation option defaults that exist in both the format and
>   the protocol layer (e.g. 'cluster_size' in qcow2 and rbd; the qcow2
>   default was incorrectly applied to the rbd layer)
>

This generates new warnings in 'make check':
MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
G_TEST_SRCDIR=/home/petmay01/linaro/qemu-for-merges/tests G_TEST
_BUILDDIR=/home/petmay01/linaro/qemu-for-merges/build/all/tests
tests/test-char --tap -k
warning: The alias 'tty' is deprecated, use 'serial' instead
PASS 1 test-char /char/null
PASS 2 test-char /char/invalid
PASS 3 test-char /char/ringbuf
PASS 4 test-char /char/mux
[etc]

thanks
-- PMM

