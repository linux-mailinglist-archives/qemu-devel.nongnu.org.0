Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A112AD61A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 13:23:50 +0100 (CET)
Received: from localhost ([::1]:58900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcSgf-0004u1-BF
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 07:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcSfu-0004TB-B9
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 07:23:02 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcSfs-00031S-C8
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 07:23:01 -0500
Received: by mail-ej1-x62b.google.com with SMTP id oq3so17270889ejb.7
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 04:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iwEb4KY++5RBzpKeZy1UKR3QfpXRsCE0QA707aQvU3E=;
 b=Zp0jaqr4Qo4yUeCXzO/l3iNHO4KluO9NH8ccRt4IuKsl2rlaJHRQBAJyCAFw8bW1g6
 Mv6p4LHuDmB6sz1iDzB5pj9hIRqv4IULkqy1YpC+z+K9Ch9bw1g97561DT8bqy0zV/gh
 /xjEQIJFTLzsi6icmZH68ahUIewTNh99qtnPtKkNax50r9cKTLSDefcGTaXbb9z8R2c5
 irLiPBAIah2g/kiYzOc7uOK7I+sY6JipJluJGZeHRH5swNpMtRpevzIzExqZ+CKnEBu0
 dpbza8pjAKX7acj+0RayXwH4nRiF4aGUhvPo9IHuAYOIptHDyw3Y6JrdCDXR08e6y+mo
 JWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iwEb4KY++5RBzpKeZy1UKR3QfpXRsCE0QA707aQvU3E=;
 b=ELziz/rbAocuShjnqIxDGHb0xWLNSUnyqF4HeEAg/t9nrNWrdfqGT4oRWgT/NFd+vY
 Tlfwra1Qm8eparC977IX1egwb3Ff9JHKW6AmTkvxrWt4peQOj2BZor35jaTeuEzsTVA6
 OIHjeksTS5JTXwtMRyYdy37QtSpg3O1gtg/Xqlf3kn4NlTcrHeVns/FjAG8BduuEZqPN
 fKnEj87E+p3CIVcd054DSLaeHBIhbo/Vab+9W7iCTZyv6ZL7+0VIuXrlbZVh+4zPXEv8
 kVNeXO7wt74KaqRMu24yCZbJQUiBimuFSG1PlohlsO2PU+OEe5CEPY0oitMbHcdeLD6/
 A07Q==
X-Gm-Message-State: AOAM532O+ynawMRIxFPDMivUdJLdZh5XtFDyVwNp73OPHYUVT3MSAE+X
 R5RrdP5liXXDKgW1mjixRIg3WTkF0MEmXKkPY0r2+w==
X-Google-Smtp-Source: ABdhPJxKD2eoUrZ3w/BinW5oNQrRSXVQeDXRkkxgdj0CFuhJi80vNKI1yAXbZNVMNXIX5/+445yK9bf24VtGq1iKr2U=
X-Received: by 2002:a17:906:3a97:: with SMTP id
 y23mr19433409ejd.250.1605010978048; 
 Tue, 10 Nov 2020 04:22:58 -0800 (PST)
MIME-Version: 1.0
References: <20201110083034.224832-1-laurent@vivier.eu>
In-Reply-To: <20201110083034.224832-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Nov 2020 12:22:46 +0000
Message-ID: <CAFEAcA8Z-8UUu-i0==2a0SZDEzdG_4-q7fZCD=wJN=xKbA6h9A@mail.gmail.com>
Subject: Re: [PULL 0/3] Linux user for 5.2 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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

On Tue, 10 Nov 2020 at 08:33, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 43afbbd9fea1b255cc81f5f4bfd0b6a88826c735:
>
>   Merge remote-tracking branch 'remotes/mdroth/tags/qga-pull-2020-11-09-tag' =
> into staging (2020-11-09 20:29:04 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-5.2-pull-request
>
> for you to fetch changes up to c3ab5df2f5c466d998917f2c707e206322063dcd:
>
>   linux-user/sparc: Don't zero high half of PC, NPC, PSR in sigreturn (2020-1=
> 1-10 07:54:22 +0100)
>
> ----------------------------------------------------------------
> Some linux-user/sparc fixes
>
> ----------------------------------------------------------------
>
> Peter Maydell (3):
>   linux-user/sparc: Fix errors in target_ucontext structures
>   linux-user/sparc: Correct set/get_context handling of fp and i7
>   linux-user/sparc: Don't zero high half of PC, NPC, PSR in sigreturn


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

