Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A53634D96F
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 23:08:23 +0200 (CEST)
Received: from localhost ([::1]:41688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQz7V-0000v0-UY
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 17:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lQz4f-00005T-9J
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 17:05:25 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:39817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lQz4c-0001Yl-ET
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 17:05:25 -0400
Received: by mail-ed1-x534.google.com with SMTP id bf3so15748803edb.6
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 14:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vkjCKrgwLWR6YRViltSxKNkGUgKZ6V1+usGQPPX6UAk=;
 b=J+FjDZNVuyNeoGIh0BgmYg+9FKnJFvb1nUmVwlF8fFDrfcpUoNkxGbZsadUQR5wOJJ
 /5FzpVKpOXmTMhPHWocxBZCM5iwBRcbv8YlKcRGZphuI3Ki8CafxVNUzVd1Ku7LbzErh
 2EBjtzBbnRgV3jdRuIAzX6ea2uie8Yh7hbZoPj5L7Cr/feFyqME1GSuPF3drekCuCOJL
 eQ9VYD+BAvbJSYwea336/Rj66yblDypXIvYGLAu3KuxdPGVTJcjHlhWS0qE4Mr4r4AK/
 5I4qO02nVZUYpGwXtGSNbzDAP/8wgMHDrgz2S8S3LBrg39H1gHVnALFWEaPARkEjhHWJ
 9ZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vkjCKrgwLWR6YRViltSxKNkGUgKZ6V1+usGQPPX6UAk=;
 b=XRAUM0ooimnq3ko5jKtHbT+a/S3ziVmJ+jopaEZgMKNuuR9DiCYGUo3fhgv7EjCdws
 pi2SxfAxRHKAKULDzGgz2UsJZMz2mWvvtnx3By6xLwB3lcMctYg7oemXolFzFVc158tO
 TevOHddvn5hcd4Ij9ks6cj4u3+IQnG5wsrcQ5Fl5tyMNerC45b0PWpwdIhTgrikSC571
 PJhjW0PmKtL/zXspcLa2uKpf34c2/7pXQN/GmuMCqMDjTFzzfNqHriVInxUZ0wPd2uAs
 s33tzVAHoCFl0dr2Knmp8EDZ2xxr/aHE0XCngtIU3Q8B9steS3Yo/J9SL5a0mRgixWd3
 hHOQ==
X-Gm-Message-State: AOAM531t3GomuBbBOWipzYYom8KbEJwr2vZMH6bU2E+iBxqNUSB96N+l
 mFiWtzDcskGIuKL/phI9a2tXDDQ61HN5e6ZWOdQMAw==
X-Google-Smtp-Source: ABdhPJxWjlrXjKHYkXMTs4XpJ+f/xtieAnQoXdwW6BNAAmu8OMqoYLrEodUE+ZVuF0Y/SKj8I5tzLX5FbB8F8yNI9x0=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr29774552edt.251.1617051920867; 
 Mon, 29 Mar 2021 14:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAJoBWHx5DM=zhj10j1ai5T_LO9ScAhFzUezuhGu6a73vn=4_Rg@mail.gmail.com>
In-Reply-To: <CAJoBWHx5DM=zhj10j1ai5T_LO9ScAhFzUezuhGu6a73vn=4_Rg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Mar 2021 21:04:50 +0000
Message-ID: <CAFEAcA8KCJTwsb2YYoU3d_PbO=KW_ytSJXHLZZTkukVX6YzCPQ@mail.gmail.com>
Subject: Re: AUTIA authentication sometimes fails
To: Derrick McKee <derrick.mckee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: "open list:ARM" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 29 Mar 2021 at 21:07, Derrick McKee <derrick.mckee@gmail.com> wrote:
>
> Hi,
>
> I am running across a scenario where a PAC signed code pointer (using
> pacia) sometimes does not successfully authenticate despite the signed
> pointer and the salt used to sign the pointer are correctly given to a
> autia instruction.  Only one particular pointer fails, while others
> are correctly authenticated.  Unfortunately, I can't provide a simple
> use case, because the behavior is part of a running kernel, and all
> the pointers involved are kernel space pointers.  An example of what I
> am seeing (not guaranteeing correct assembly, just a gist):
>
> mov x9, 0xffff800009200000
> mov x10, 0x20001
> pacia x9, x10  // x9 contains 0xff90800009200000
> ...
> mov x9, 0xff90800009200000
> mov x10 0x20001
> autia x9, x10  // x9 contains invalid pointer
>
> However, this same code with different pointer values correctly
> authenticate.  Is there something specific about the kernel and PAC
> authentication that I am missing?  Thanks.

cc'ing Richard, but I suspect you'll need to provide more detail...

thanks
-- PMM

