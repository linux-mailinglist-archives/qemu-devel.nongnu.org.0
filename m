Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73F63A4FC3
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 18:32:23 +0200 (CEST)
Received: from localhost ([::1]:42884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ls6YV-0000KW-K1
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 12:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ls6Xf-000848-NH; Sat, 12 Jun 2021 12:31:27 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:40795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ls6Xe-00087S-0s; Sat, 12 Jun 2021 12:31:27 -0400
Received: by mail-ot1-f51.google.com with SMTP id
 l15-20020a05683016cfb02903fca0eacd15so6393249otr.7; 
 Sat, 12 Jun 2021 09:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h8M8vCFqQaNj9/ow9lb/UwiomhigCE+CHIJtNcQmkGs=;
 b=Z6NrkLFS/2QVtGce7zKcSRvAOLJ7Lc/0qUpJ3+uBmlhAhpemhppsSHWTh7Te4IfFJJ
 Gn4+r9TufYWrt3uxNDvCHofR8N5jS4Bi7Mri2Fn5CcQB5Er4WLAN7vkPco29O988gBb+
 RkYP0/6JKe6QBf9RSK2CICSKxrxRuwoVslGhiLtMaT/5EmXy6Wjq4kL1kmhT782CfRqQ
 qEINCnopc1+B6cUzUoar1VDG+yLXPCnUNsTk/2Hnx7uPFObo1CYsEsl3+4VbpM7nfbuG
 mwDHJqeWVEgUeErljqO97gWmjfbFVKsWhEF8n1wUirP+zQxlNTX0kqmiPd4mO1Ud1Dpi
 Zd8Q==
X-Gm-Message-State: AOAM533pq2Qo16Z2Qa16q07P1vXgeNq5cGtLSZxyMwu8iSQ8j/WNTIO9
 /dyGvhjxtwwJPrU5C820tO4tBl2/lpV587gtFYw=
X-Google-Smtp-Source: ABdhPJw24GljvUXTa896TMTPD5hU4bBnVc6oWJK04yXUBd1T3f3dXYmTbk+Lc2pjJjCMGY/PnhQKkFhkRg58ftmjUDM=
X-Received: by 2002:a9d:a09:: with SMTP id 9mr7360376otg.126.1623515484637;
 Sat, 12 Jun 2021 09:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210612150004.1489198-1-f4bug@amsat.org>
 <47090f87-9925-058e-a699-f290c80addd7@vivier.eu>
In-Reply-To: <47090f87-9925-058e-a699-f290c80addd7@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 12 Jun 2021 18:31:13 +0200
Message-ID: <CAAdtpL42f941hGKpphjCjR=sSMgGNva0gku3Gtvfh6_Cen-9pQ@mail.gmail.com>
Subject: Re: [PATCH] fuzz: Display hexadecimal value with '0x' prefix
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.51;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f51.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jun 12, 2021 at 6:16 PM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 12/06/2021 =C3=A0 17:00, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit :
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> >  tests/qtest/fuzz/generic_fuzz.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic=
_fuzz.c
> > index cea7d4058e8..1307299df52 100644
> > --- a/tests/qtest/fuzz/generic_fuzz.c
> > +++ b/tests/qtest/fuzz/generic_fuzz.c
> > @@ -841,7 +841,7 @@ static void generic_pre_fuzz(QTestState *s)
> >
> >      g_hash_table_iter_init(&iter, fuzzable_memoryregions);
> >      while (g_hash_table_iter_next(&iter, (gpointer)&mr, NULL)) {
> > -        printf("  * %s (size %lx)\n",
> > +        printf("  * %s (size 0x%lx)\n",
> >                 object_get_canonical_path_component(&(mr->parent_obj)),
> >                 (uint64_t)mr->size);
> >      }
> >
>
> What about a "0x%"PRIx64 ?

Ah, I only looked at the format. Even better: also use memory_region_size()=
.

