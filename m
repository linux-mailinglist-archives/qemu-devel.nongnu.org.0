Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2657860D1E8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:49:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onN08-0007tm-Ge; Tue, 25 Oct 2022 12:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1onN06-0007rY-Ia
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:42:02 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1onN04-00021A-Rr
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:42:02 -0400
Received: by mail-qv1-xf29.google.com with SMTP id u7so9022705qvn.13
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XDUbOF59+vQQoc09uKmhMF3pf8IxrU5OuBuslIySmHM=;
 b=Fbj2s25UMNM11aAtVIDd1KMKPjG1xtNs/OhwDkoQ6A98lK4VSgwE97Zp+PGe/EYNSI
 t1UsPoDExC/ZuF8vseA7lurjxQBbeUgd/bLS23ZYXP4g37U3EI2uPF++nWUyEyxccE9C
 HWRlvIj9Yb5cJNHogS6EdF2OWtWtN9x+0ef8ASSC+F/9ooSaf9Wrfz2qCu+cMGMorztJ
 7+Fp3QLFUi+ftnyNdXFvWkD8FjCUclPgbMxGOuThNZ29KxrLvevWS94YUYat1t0xYNU9
 hgKTLZLuHy34gfkRT+logN0/9ooy5U2UQZWxkka3FnGQTeJWhWqwuv6u6zoILnJG17TJ
 ze0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XDUbOF59+vQQoc09uKmhMF3pf8IxrU5OuBuslIySmHM=;
 b=n1mQXG1u/u8vOymjVWJ0SowhwomqaToKst3YcRIWS16nASrlL4EKZ8ugk/9BmDJMXr
 1O3Qxw9RC6MRXDyq38Ir7nqTPP2MMM9L2WzLJyEukMr0uI7TbMCqfbka/ljgKeM+ZlLn
 5tzK+EakqT7mu4mhR2wIVlL3DmqdDe8D6T0rlWsY+XvXyGpTSYxg4D+oE6DjaoMBpvlI
 DwqmZZKadcCNTiiz230l+vt9rG+7Wo5ehvV8P7B0kp3gQEE1MU0xRLbxkxuO8r5btKLJ
 gFaI6NwN5wxSJZWDq9iJX7RbtgGtkpxPHVmciKACgm6ACsPyYZh7KjEdzw0yWpGQnzt+
 cFQg==
X-Gm-Message-State: ACrzQf3qra+zLLMFpWialCeaa2lACLzierN2AZy1iqkef2mLvrHw07VQ
 zLQSEjHu+0yPpOL00ezS+qkMFSf8F5l4yWG2tLiu52xX0kc=
X-Google-Smtp-Source: AMsMyM7nSl0FwH/7eLhTHweMPqKJmyHzg2IhkoumwKZE1tn63aSpj975dqShloXEblDIFLISlwrodLTBn83P05vB/1k=
X-Received: by 2002:a0c:810f:0:b0:47b:299a:56d7 with SMTP id
 15-20020a0c810f000000b0047b299a56d7mr33133071qvc.12.1666716118668; Tue, 25
 Oct 2022 09:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221019102015.2441622-1-bmeng.cn@gmail.com>
In-Reply-To: <20221019102015.2441622-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 26 Oct 2022 00:41:47 +0800
Message-ID: <CAEUhbmUmE12maezBm9x0EJQnTQkavMa8EcoNPd8LcHTawFQzYg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] util/main-loop: Fix maximum number of wait objects
 for win32
To: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Oct 19, 2022 at 6:20 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> The maximum number of wait objects for win32 should be
> MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> Changes in v4:
> - make the out of bounds access protection explicit
>
> Changes in v3:
> - move the check of adding the same HANDLE twice to a separete patch
>
> Changes in v2:
> - fix the logic in qemu_add_wait_object() to avoid adding
>   the same HANDLE twice
>
>  util/main-loop.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>

Ping?

