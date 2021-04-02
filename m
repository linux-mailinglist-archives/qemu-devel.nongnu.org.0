Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16803526A8
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 08:44:23 +0200 (CEST)
Received: from localhost ([::1]:37262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSDXa-0000SB-9M
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 02:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sedat.dilek@gmail.com>)
 id 1lSDW6-0008Rg-IQ
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 02:42:50 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:33756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sedat.dilek@gmail.com>)
 id 1lSDW2-00036n-SI
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 02:42:50 -0400
Received: by mail-io1-xd36.google.com with SMTP id n198so2283199iod.0
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 23:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=yj6+vSRZLkkm8CHfCAHYPtQtKWMqvTFnQ6YMhgNKBnc=;
 b=qiWYH2oiUzVi6Ex79pPXPik+XUkqKcMptn6lKyCdQ4wWCJM0GnNPshmRPPcepCqNIV
 KJsBYAdAY9MSRQ4CTfQkneOFzz1VJsSD3/tBljlj/FhfzWQuPl30qRz9uKAtyOqMzMEx
 hHk3GOHDKTZpIqqzUEnS2McEvzxfr62M8OJq3U07xz6djly/pR9cutjbG9sPTuF2zncJ
 3eni8RIBZwp7KcrPwzIclWXS6x5U4o7uiS5ZK5oEkAwf0rWmULB86Xiz0QqB80WoGNpx
 7x3uAyU6KPrqOnIG2z96sU0c0V7KeV+3djxtfZvdibuF6bhJTmNhXT82h9ajmBGzcMH5
 dENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=yj6+vSRZLkkm8CHfCAHYPtQtKWMqvTFnQ6YMhgNKBnc=;
 b=ZWB5XBH2EQw8YkxX1zfqHuK0tGcgbxCgA/m58kbdFz2gW36LK9fuNOCAOtmBcOF5p9
 J4iP1fqQD6wgkL5frj9frgn4XTYzuSetVlEZYj/EURFxeLrovpbPOvJ2XZeo3Cd5v6jZ
 67idYqwrqMo5mp31cFB+iydrljSbf7Hcs3qi6WgASi8PC52PQswQNN52K+QZ4YZSuBpJ
 5aOwsCxt+5+ZNKQ1cjLIsbqyZI+RaU6Gxn9sZMwz7GUHfWvDHDKIAKbUuT6q30G+0Vs+
 an9RC5fc4N9F0wQS39+Ov87kuH1wx+zE5ovi7G3fWQa/Nq5Ki54G5jUFopb+5x0TJWFE
 zrHQ==
X-Gm-Message-State: AOAM531ijzHxbl+Y10C5/2IVfQlHzHdM2i2Q3E/i/8oVT4LJVO66UoWc
 ogLa8CFrP+4zargpLmnR5O8Xrbmnf6PEj2QYaVE=
X-Google-Smtp-Source: ABdhPJz9e8u23bdl9W6P7q5ULqjRON5XoB6/o7v2BH97tDP2SNEtZQUtlKLox/z8j+wgSbu43gbCKyvpHGWIpyBE2ng=
X-Received: by 2002:a5e:8610:: with SMTP id z16mr9600257ioj.57.1617345764402; 
 Thu, 01 Apr 2021 23:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210211194258.4137998-1-nathan@kernel.org>
 <161428829728.2305454.15456455443457551559.b4-ty@chromium.org>
In-Reply-To: <161428829728.2305454.15456455443457551559.b4-ty@chromium.org>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Fri, 2 Apr 2021 08:42:07 +0200
Message-ID: <CA+icZUWdeWSy52bU4cjHau1hn5NiFAozaHgDb=geaaCYOET9+w@mail.gmail.com>
Subject: Re: [PATCH] qemu_fw_cfg: Make fw_cfg_rev_attr a proper kobj_attribute
To: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=sedat.dilek@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Reply-To: sedat.dilek@gmail.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gabriel Somlo <somlo@cmu.edu>,
 Nick Desaulniers <ndesaulniers@google.com>, qemu-devel@nongnu.org,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
 Sami Tolvanen <samitolvanen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 25, 2021 at 10:25 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, 11 Feb 2021 12:42:58 -0700, Nathan Chancellor wrote:
> > fw_cfg_showrev() is called by an indirect call in kobj_attr_show(),
> > which violates clang's CFI checking because fw_cfg_showrev()'s second
> > parameter is 'struct attribute', whereas the ->show() member of 'struct
> > kobj_structure' expects the second parameter to be of type 'struct
> > kobj_attribute'.
> >
> > $ cat /sys/firmware/qemu_fw_cfg/rev
> > 3
> >
> > [...]
>
> Applied to kspp/cfi/cleanups, thanks!
>
> [1/1] qemu_fw_cfg: Make fw_cfg_rev_attr a proper kobj_attribute
>       https://git.kernel.org/kees/c/f5c4679d6c49
>

I have queued this up in my custom patchset
(for-5.12/kspp-cfi-cleanups-20210225).

What is the plan to get this upstream?

Feel free to add my:

Tested-by: Sedat Dilek <sedat.dilek@gmail.com>

- Sedat -

