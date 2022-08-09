Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6152558DC4A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 18:41:29 +0200 (CEST)
Received: from localhost ([::1]:52280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLSIJ-0004lw-T4
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 12:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oLSFh-0000r1-67; Tue, 09 Aug 2022 12:38:46 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:44684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oLSFf-0005pM-MJ; Tue, 09 Aug 2022 12:38:44 -0400
Received: by mail-qv1-xf33.google.com with SMTP id mk9so8931948qvb.11;
 Tue, 09 Aug 2022 09:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=KyfI0XlL9vs9vciGO2HKqWVIQpcxBsdkBEj6EEUyFvI=;
 b=EyI1RnyB1pm657Ei/atz4KxeXkzPJxCd4P7VrgftpQ0orR39V9ouc/eTnrOTTT+74R
 sD9b6mxvuhLER0y96e8mkWTvyVLcAN6MvSIBVGmofTuUJ05Lwj+3XSoURKQNZweS5NMG
 XLMcaBkOdeJUmynprT4snQqq6wuv95vhvECcDJmWfUjiQlmm4G3JavY/MDa5UYnSryvo
 jnOsNFh6Va3ZPsEZcbtblNsQbwRLp4/EmelH4kaYgSYicx0qRt9kOFe1BjxiAMGX58A1
 MewZOGUAsm3TyA2793x1nQZGjCb/pRyWsP/Ya6ROFlib9MqlpFXADcTFiZM/Bw4J0eex
 47eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=KyfI0XlL9vs9vciGO2HKqWVIQpcxBsdkBEj6EEUyFvI=;
 b=hW7l+Rp+mpzrStd+/oEtM3WJGlNQ1eFWPunqS5ksCBL6ep37CBP5j0gg8P93le9P66
 f8iXP8a2GAIbByz7OywG37Ec7DOel95iNNw672+q4bbwddY0YSw4tUizLMdMD1iNZgKL
 Ho6eUqpvfWZ6fNB4cqPsJu6bOdHiaQEVf5zZZp5MxsPnfDOJtl1ERESlmsmAHr7n37KV
 I5KejkRc7sT/dcmjXBlU5w4tcauTz9bJz0+KUiW7Ipq6NsfJrWJpR0ckQzDTyZ00PCC1
 6BEUPVkVYzoScRqtOYYKro9aWbppS/CCGy7r/eYYMapr6pQGMxpadje9Z4JS8xvNu9YF
 kMSg==
X-Gm-Message-State: ACgBeo2eaX6Mn7VHYYOmE8sq1qzzBr/s8hrYvkfrW0pqo7tG4BthT+zS
 36D+kAeUUKq4qvoRqX+4daKSHiwAK9v2lA/8nxY=
X-Google-Smtp-Source: AA6agR7EYcJzcEbodGEGdaE5pelAsDuFQETRfYT6T5ouSflJG5aVOhwjGHyWWLBftGadk6kNBpLnhtzs3AvZcgN83J4=
X-Received: by 2002:a05:6214:226e:b0:474:9a8b:3853 with SMTP id
 gs14-20020a056214226e00b004749a8b3853mr20450147qvb.85.1660063121160; Tue, 09
 Aug 2022 09:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220805145617.952881-1-bmeng.cn@gmail.com>
 <20220805145617.952881-2-bmeng.cn@gmail.com>
 <ba123d50-002a-3b33-a2f6-e530df5a4265@weilnetz.de>
In-Reply-To: <ba123d50-002a-3b33-a2f6-e530df5a4265@weilnetz.de>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Aug 2022 00:38:30 +0800
Message-ID: <CAEUhbmVX4tZMJTH2RkRK5NM4+oTtKCm-bs0S7WyrRfUvxUVwjw@mail.gmail.com>
Subject: Re: [PATCH 2/2] util/aio-win32: Correct the event array size in
 aio_poll()
To: Stefan Weil <sw@weilnetz.de>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, Aug 5, 2022 at 11:09 PM Stefan Weil <sw@weilnetz.de> wrote:
>
> Am 05.08.22 um 16:56 schrieb Bin Meng:
>
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > WaitForMultipleObjects() can only wait for MAXIMUM_WAIT_OBJECTS
> > object handles. Correct the event array size in aio_poll() and
> > add a assert() to ensure it does not cause out of bound access.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >   util/aio-win32.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/util/aio-win32.c b/util/aio-win32.c
> > index 44003d645e..8cf5779567 100644
> > --- a/util/aio-win32.c
> > +++ b/util/aio-win32.c
> > @@ -326,7 +326,7 @@ void aio_dispatch(AioContext *ctx)
> >   bool aio_poll(AioContext *ctx, bool blocking)
> >   {
> >       AioHandler *node;
> > -    HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];
> > +    HANDLE events[MAXIMUM_WAIT_OBJECTS];
> >       bool progress, have_select_revents, first;
> >       int count;
> >       int timeout;
> > @@ -369,6 +369,7 @@ bool aio_poll(AioContext *ctx, bool blocking)
> >       QLIST_FOREACH_RCU(node, &ctx->aio_handlers, node) {
> >           if (!node->deleted && node->io_notify
> >               && aio_node_check(ctx, node->is_external)) {
> > +            assert(count < MAXIMUM_WAIT_OBJECTS);
>
>
> Would using g_assert for new code be better? Currently the rest of that
> file (and most QEMU code) uses assert.

Yeah, I noticed that but didn't do that because I feel it's better to
be consistent, at least in this single file.

Changing to g_assert() could be a future patch, if necessary.

>
> count could also be changed from int to unsigned (which matches better
> to the unsigned DWORD).
>

changed in v2.

> Reviewed-by: Stefan Weil <sw@weilnetz.de>

Thanks!

Regards,
Bin

