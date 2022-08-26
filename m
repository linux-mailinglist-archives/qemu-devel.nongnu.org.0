Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D765A2BA6
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:49:41 +0200 (CEST)
Received: from localhost ([::1]:45854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbaW-0001bv-49
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oRaoM-0000DQ-90
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:59:54 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:45924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oRaoA-00037f-4P
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:59:53 -0400
Received: by mail-qt1-x82c.google.com with SMTP id j17so1402411qtp.12
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 07:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=p+1BUOSnYeOb7Cp9nsiTDZElYsBSheVVTk+pUQKBupI=;
 b=TFWnDxuPu1LeV5yt/WcNa1Kij4RfznlMmcKBlucY/G1v7D223xUgutV1aubSCtEsBi
 Zi7OFvoPnyl+J44QDu2UEROO8FiOe0rc9rsl1ujtSReLk5Gh4gythNcQviaotzb36ABl
 UF8ZSwB8hkn0m1ZRr6yjcFm1w+2DBTKs//55wL/3C76j72OBr3Cy2sun5h9JQ6nvZmi7
 MfwAIeVSobBtCkTzIoqE9pU7fnL81n3889v12eIAuHmQ1zcOmMhqL0Wr3xd/t3Noc04z
 aP0nwJDklTu4Q8sezG+GWAuFamAzHk1OynnOB8qHsT8w7w21MbV1dG9spHNzXa/83XpY
 pNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=p+1BUOSnYeOb7Cp9nsiTDZElYsBSheVVTk+pUQKBupI=;
 b=SkFYTeukvG2SmiwUVN1pesZl21NLVdbiSmFLAlrE0ElCQ66IYp0IM4FcZ2Uy4wzylQ
 RfQGA+zBUc5zKFMDuKdDR0TaWeIIiPE10rhq/HCMtWJvEtGc5RbVZlgINV2LL7PFw2uy
 Zx4oR4AqFLlxLriFxk0P+UnV2qOqXpl8WNKjc3C5nHoiwTwf4/o/sSgzjRden+H++fET
 o2bcy6r6HN+s+U1yCyzXclx8r3Z8qKpwJVao9ZYax5yNcneTdSx4WNdcHhENsQ6CBUKH
 iKwflooE1EJbVJfOVQdey859eQ8DByDZCw6gD5WkF4ae1aJES//BWKe1steOpo1roOIe
 7ZpQ==
X-Gm-Message-State: ACgBeo13YcLzG2F7p3G6mi/8IeM02GE54KqT0G9GPm744sLpVXpIBcku
 it2ByKK6sJZPiRtjMbH+MVpw54QAIlcnp5SXwL0=
X-Google-Smtp-Source: AA6agR4O1WHBtoL9ojs76t2QpqvcT4eK4+K+nCyIy4kK6C8RPAJXBVMbujgb1936y5Gj4xS1ESETDl2aDs8L91W95EI=
X-Received: by 2002:ac8:5f4a:0:b0:344:5dd9:27d8 with SMTP id
 y10-20020ac85f4a000000b003445dd927d8mr31528qta.543.1661525981290; Fri, 26 Aug
 2022 07:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-28-bmeng.cn@gmail.com>
 <dbb7f0fd-22e6-a5e0-88ce-5810290170ce@redhat.com>
In-Reply-To: <dbb7f0fd-22e6-a5e0-88ce-5810290170ce@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 26 Aug 2022 22:59:30 +0800
Message-ID: <CAEUhbmVmyT7ETTJdJH=UzZyf5_PaA8QMfsc=0rjJKK+8RHeztw@mail.gmail.com>
Subject: Re: [PATCH 27/51] tests/qtest: Use send/recv for socket communication
To: Thomas Huth <thuth@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 25, 2022 at 9:04 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 24/08/2022 11.40, Bin Meng wrote:
> > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >
> > Socket communication in the libqtest and libqmp codes uses read()
> > and write() which work on any file descriptor on *nix, and sockets
> > in *nix are an example of a file descriptor.
> >
> > However sockets on Windows do not use *nix-style file descriptors,
> > so read() and write() cannot be used on sockets on Windows.
> > Switch over to use send() and recv() instead which work on both
> > Windows and *nix.
> >
> > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >   tests/qtest/libqmp.c   | 4 ++--
> >   tests/qtest/libqtest.c | 4 ++--
> >   2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/tests/qtest/libqmp.c b/tests/qtest/libqmp.c
> > index ade26c15f0..995a39c1f8 100644
> > --- a/tests/qtest/libqmp.c
> > +++ b/tests/qtest/libqmp.c
> > @@ -36,7 +36,7 @@ typedef struct {
> >
> >   static void socket_send(int fd, const char *buf, size_t size)
> >   {
> > -    size_t res = qemu_write_full(fd, buf, size);
> > +    ssize_t res = send(fd, buf, size, 0);
>
> This way we're losing the extra logic from qemu_write_full() here (i.e. the
> looping and EINTR handling) ... not sure whether that's really OK? Maybe you
> have to introduce a qemu_send_full() first?
>

I am not sure if qemu_send_full() is really needed because there is an
assert() right after the send() call.

Regards,
Bin

