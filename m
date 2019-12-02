Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBE610EEE8
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 19:08:02 +0100 (CET)
Received: from localhost ([::1]:42726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibq77-00055j-5z
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 13:08:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58030)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ibq60-00046r-CM
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 13:06:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ibq5z-0001D9-Bm
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 13:06:52 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:43664)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ibq5z-0001Cm-6M
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 13:06:51 -0500
Received: by mail-ot1-x342.google.com with SMTP id p8so274783oth.10
 for <qemu-devel@nongnu.org>; Mon, 02 Dec 2019 10:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F65E2ZvVQvZg6ukj5sksAtp+NBuwOuNR4qhlZjfRqBE=;
 b=znXt7UH6VAyP3o4nGqCEVels6KwRivCn2reviSsXQ7JK1LwYLcHFWfP1+4VIj3PBwd
 HJZkr9t2MKl9gKx6wAbyMDlhlydAWJMe7meSdkYfAO7FZ2ILnIoBrgtYhbY3ssKgcXLp
 2WFSxZ/GmM2z159cQ3wID0TQ8WIqZumLn3xRWFMdLM7S2YlIM0mmgP57gZSESm/Naubs
 7AB8IVLCrEMuIsRvx5/VJR/SIHx9qWX7HmcSDWTMRlkphrKItVjcZQMj8Qy1qM9OS+eG
 e/M3tPBTb3ko0N0ssCGDDVzQBl9MswrHUomv4WPtMgs4OExYLf9vuMS3Yz5ZFHKYllOR
 JErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F65E2ZvVQvZg6ukj5sksAtp+NBuwOuNR4qhlZjfRqBE=;
 b=B8JsJ2PCtASMfihGu009gqkhP2004c9603bjpaDgXQAKzyWV499Rh2xHXmG3Zs+aHC
 iGx/eNEMmZJBs0QqH+Tj9pSDnkcgXC/ZEJNvv/T8jwL+nCiZ8AH95AEnW7K0sLPoddIB
 B5+Et75iYbr/gnsfhuy2Uvysr/srVjfjL9Tv+8wzrujSXqqdgBjzGLjS4tFXX11whEx5
 Z9SwZxq8GgnJ1sZYVwO4EWYJBmLwUCUpDsTHUpYLBH1x98N1WVlWEnG2qsj3He/lCzKJ
 NRgLyqu2SLQJprT7WLE2GbRWmEuZxcMo/xgc+noq8sRufSjVEgcZg+FXi/PlzHnyZeV9
 fy5A==
X-Gm-Message-State: APjAAAXGS3QWgnV6aV0jU0tN+qG/CAgvGlJt4QiiOKWlUINKE6MkCqdw
 LUALBwG7cTkSWepQKMv8mN2hNehlR8g3PVLjO5o4FQ==
X-Google-Smtp-Source: APXvYqz/qTzdZG4Cea+hicDimhC8oVNzXrbe4JCsOGmoL/J+JRmI4ZcGIRSnXBhWk8DkPzrai0Kbv3LX1S66nL0TtwU=
X-Received: by 2002:a9d:6357:: with SMTP id y23mr249592otk.91.1575310010134;
 Mon, 02 Dec 2019 10:06:50 -0800 (PST)
MIME-Version: 1.0
References: <20191129140217.17797-1-pbonzini@redhat.com>
In-Reply-To: <20191129140217.17797-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Dec 2019 18:06:39 +0000
Message-ID: <CAFEAcA9RsC-5Bxm33hQjNJ-wzEGCFDgUAUooZggRFmo2WdEsyQ@mail.gmail.com>
Subject: Re: [PATCH for-5.0 0/8] docs: integrate doc comments with Sphinx build
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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

On Fri, 29 Nov 2019 at 14:02, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> This merges my series and Peter's into one.  Both the memory API and bitwise
> operation APIs are covered.
>
> Paolo Bonzini (4):
>   docs: import Linux kernel-doc script and extension
>   docs: tweak kernel-doc for QEMU coding standards
>   memory.h: Silence kernel-doc complaints
>   docs: add memory API reference
>
> Peter Maydell (4):
>   docs/conf.py: Enable use of kerneldoc sphinx extension
>   Makefile: disable Sphinx nitpicking
>   bitops.h: Silence kernel-doc complaints
>   docs: Create bitops.rst as example of kernel-docs

Thanks for folding those two series together; I've left
review comments on the parts I didn't write.

Do you have a URL of a rendered version of the docs
somewhere handy to save me applying the series locally ?

thanks
-- PMM

