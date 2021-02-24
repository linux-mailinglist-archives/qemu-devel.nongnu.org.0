Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BF1324415
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 19:52:32 +0100 (CET)
Received: from localhost ([::1]:51486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzGx-0003vE-DR
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 13:52:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sedat.dilek@gmail.com>)
 id 1lEyb4-0006eM-2b
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:09:14 -0500
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:41670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sedat.dilek@gmail.com>)
 id 1lEyb2-0005CY-GF
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:09:13 -0500
Received: by mail-il1-x131.google.com with SMTP id c10so2527734ilo.8
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=dKCWFwCtere4GZoadEUWnq7pobLJDcHFCquipMb1ruk=;
 b=hqke137REPFIk08X26O9Qf6S+JDQmGikbvjBbxcfEot4DctxH36v/1Z0sUISy5h2Nx
 3yUSceQyhSUXD1D7HmWMC4SbfTDFC98ZtgBdyo8N/CEM148DdmxO+n0yvPcEF9s4ky2E
 2KtG48ooopFe/gzIzAYS8EVjSdc3gnkI9piiA0iLkRGI+u+/fkxcFYxJ2uFsATFFoJ2k
 56R1JJnJGBTGNOyay/sPvXzGIDii9vZe3SXMIru02NOewoZc1kTF+VUg/Y9dLSuLe5wp
 RbRZH3n0RJGhAvAWTVooLr05i1lD6pZE02ZRyhqC6+AaghfThafHISJnaH7imAEHE4x3
 11nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=dKCWFwCtere4GZoadEUWnq7pobLJDcHFCquipMb1ruk=;
 b=CBW9cuKLhUNYIsWtkKYqseV3miIZ+xi6qz/gQilQrZJuG0IvZST5jH5EhX2j6gChn4
 QP0j/jrdSaKg4I+TjisLn/O4jU+Yka4EK666Hw5HhozkG+jKzLMq5x6k7jrr4cs18Pa0
 BrUvhLHmC4648HBS0gckHT5Ag358bRhpA1u5RKtNwWN9mTi5Su7Cr1OmygUuj0wv9Zur
 T+3Vq1k1/qyZchU6AGwcgSufSzrfMP4nCVH6HR9XeRLoF2Mqilw9kkJ6zi2vqjxK0ENe
 EPsVYkDP1378+eG+M3PIFEtkpz3HA/M8ddJdB1I+EtDG0BxGMTd/IHH/EjZPfVE+vhro
 kUxQ==
X-Gm-Message-State: AOAM532nNHDF1DuFpnPtdxcCfUHj3QM1LMAG68pJ8euV9tC0t5mx+6UZ
 DrHdl03k9xGPw0T9EW4IYJoI5jvgLiemv7qOTFk=
X-Google-Smtp-Source: ABdhPJz3GIBdgA4zHbgVmxKw9YsFP/tLTYz2tkBhM/AiHwcN92PZFP+mitQPKNwLrlEkglorYH8lYc6zOj657BmjvVA=
X-Received: by 2002:a05:6e02:13a6:: with SMTP id
 h6mr14196474ilo.10.1614190150784; 
 Wed, 24 Feb 2021 10:09:10 -0800 (PST)
MIME-Version: 1.0
References: <20210211194258.4137998-1-nathan@kernel.org>
 <CABCJKueyXp5EQnmZ7a6HR87oKwDBDukprnJWT620McSYFd1SMg@mail.gmail.com>
In-Reply-To: <CABCJKueyXp5EQnmZ7a6HR87oKwDBDukprnJWT620McSYFd1SMg@mail.gmail.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 24 Feb 2021 19:08:59 +0100
Message-ID: <CA+icZUW=GTV0L884wdohaOdFmg4E4wdtSEOgF+KEGPcKzYOoow@mail.gmail.com>
Subject: Re: [PATCH] qemu_fw_cfg: Make fw_cfg_rev_attr a proper kobj_attribute
To: Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=sedat.dilek@gmail.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 24 Feb 2021 13:51:18 -0500
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
Reply-To: sedat.dilek@gmail.com
Cc: Kees Cook <keescook@chromium.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gabriel Somlo <somlo@cmu.edu>, Nick Desaulniers <ndesaulniers@google.com>,
 qemu-devel@nongnu.org, LKML <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 9:41 PM 'Sami Tolvanen' via Clang Built Linux
<clang-built-linux@googlegroups.com> wrote:
>
> Hi Nathan,
>
> On Thu, Feb 11, 2021 at 11:43 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > fw_cfg_showrev() is called by an indirect call in kobj_attr_show(),
> > which violates clang's CFI checking because fw_cfg_showrev()'s second
> > parameter is 'struct attribute', whereas the ->show() member of 'struct
> > kobj_structure' expects the second parameter to be of type 'struct
> > kobj_attribute'.
> >
> > $ cat /sys/firmware/qemu_fw_cfg/rev
> > 3
> >
> > $ dmesg | grep "CFI failure"
> > [   26.016832] CFI failure (target: fw_cfg_showrev+0x0/0x8):
> >
> > Fix this by converting fw_cfg_rev_attr to 'struct kobj_attribute' where
> > this would have been caught automatically by the incompatible pointer
> > types compiler warning. Update fw_cfg_showrev() accordingly.
> >
> > Fixes: 75f3e8e47f38 ("firmware: introduce sysfs driver for QEMU's fw_cfg device")
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1299
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>
> Looks good to me. Thank you for sending the patch!
>
> Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
>

Environment: Linux v5.11-10201-gc03c21ba6f4e plus Clang-CFI as of
24-Feb-2021 on top built with LLVM v13-git.

Tested-by: Sedat Dilek <sedat.dilek@gmail.com>

- Sedat -

