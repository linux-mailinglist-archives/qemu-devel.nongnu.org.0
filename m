Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBA81443F2
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 19:03:16 +0100 (CET)
Received: from localhost ([::1]:59098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itxrv-0001yd-RP
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 13:03:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51230)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1itxqb-0001RN-LK
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 13:01:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1itxqa-0003EY-7p
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 13:01:53 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40194)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1itxqa-0003DV-2c
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 13:01:52 -0500
Received: by mail-ot1-x341.google.com with SMTP id w21so3758290otj.7
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 10:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RkTERghBA9Rdr3/Ra+omTPgt7H8TO8CfvSeZ99pl+Gc=;
 b=OZMGu3U5KGCDT8vD91DDFQnt5HeilDiauow+DeMz/tnclH0ADP/pmGMYbllDg5z5cP
 Nib6HqU2777RadLTl8IHBiy+JDkmfIO9lxwGdOZqWKITqzXkxMLxLCfSX514F+vsJtmW
 IvqwE3GpffsP5N5BJYEi8nK1g6HE4hFMnizhkIsT9Zk+O8zQ8EBzRI91QrEKe6Ae26Yj
 Va7hUz/Amusp/Lh5CJ/ep4SGEbE9B2LMJhDCNZRQPrsDLM9qvgkLzA9WjVhrhM+6L55B
 mtvC81+GN3iE8tBVf3jaPhx+d3W597yPApa9CN6ludiJPtRxop7WkkMN+tzwl8bOP5uM
 d2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RkTERghBA9Rdr3/Ra+omTPgt7H8TO8CfvSeZ99pl+Gc=;
 b=tv1Ix0l1zJ8m5jVcjT13UYVzql63z+566aafldSQTwwD3rZlFsuDy09wtMSbrMkTdG
 qJ6yfdbTiXl/kfJFhVgKzdoD7bNGV+RYK8l/0Sc+Vf4ym7Z+934kg1RrYXhIrmoFNmzT
 hzAhmMIL93DX35/nus63XOYcc7LJny42emd2It5JkayEoUI1QS3RtsRsAmj7UsHnj8LU
 aAK0wWy2iCFiBCN2txcFIQwEeQsg37OZOMQvz3MfqKw7ooFOW2JPkuaSmw8AiLZujlmR
 Oj86G33LvBNBKVwMQlkDiW/YR1W/81bbCXtfxz/4JhmtTVfxNZSjnXZs+1EqyLWzIB8B
 Nu+Q==
X-Gm-Message-State: APjAAAUGdQZBxSkOWqkJ6mIfPdLbX2tke/eY8p9DctRaqg9NJdScedj0
 Zh0H/1MFo3l8IHc2L/eA1bGXOA7aP7Phdd2lSpZ7ZId5VNw=
X-Google-Smtp-Source: APXvYqyLfCmpqxc/LjbpOS2PFNX7C11FEzJiYiyBS4vYINhIJA7rKobj7+TlmTJQNPDtLpDsNZPWrir1Z5s9aAIPhgg=
X-Received: by 2002:a05:6830:1586:: with SMTP id
 i6mr4293339otr.221.1579629710533; 
 Tue, 21 Jan 2020 10:01:50 -0800 (PST)
MIME-Version: 1.0
References: <20200116141511.16849-1-peter.maydell@linaro.org>
 <20200116141511.16849-3-peter.maydell@linaro.org>
In-Reply-To: <20200116141511.16849-3-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jan 2020 18:01:38 +0000
Message-ID: <CAFEAcA80NezC=oXMWNmbKTGWp2_xJVS1MFeOe58d3wMrH1mQug@mail.gmail.com>
Subject: Re: [PATCH 2/3] docs: Create stub system manual
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Jan 2020 at 14:15, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> We want a user-facing manual which contains system emulation
> documentation. Create an empty one which we can populate.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  Makefile              | 10 +++++++++-
>  docs/system/conf.py   | 15 +++++++++++++++
>  docs/system/index.rst | 16 ++++++++++++++++
>  3 files changed, 40 insertions(+), 1 deletion(-)
>  create mode 100644 docs/system/conf.py
>  create mode 100644 docs/system/index.rst

I think this may have crossed in the post with the
commit adding index.html.in. Anyway, here's the obvious
fixup, which I plan to squash into this patch without
doing a respin unless there's some other respin needed:

diff --git a/docs/index.html.in b/docs/index.html.in
index 94eb782cf7e..573c543c02b 100644
--- a/docs/index.html.in
+++ b/docs/index.html.in
@@ -11,6 +11,7 @@
             <li><a href="qemu-qmp-ref.html">QMP Reference Manual</a></li>
             <li><a href="qemu-ga-ref.html">Guest Agent Protocol
Reference</a></li>
             <li><a href="interop/index.html">System Emulation
Management and Interoperability Guide</a></li>
+            <li><a href="system/index.html">System Emulation User's
Guide</a></li>
             <li><a href="specs/index.html">System Emulation Guest
Hardware Specifications</a></li>
         </ul>
     </body>

thanks
-- PMM

