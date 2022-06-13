Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BCE54A0BF
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 23:02:20 +0200 (CEST)
Received: from localhost ([::1]:46376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0rCU-00012D-QO
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 17:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1o0r9M-0007Xq-GD
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:59:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1o0r9J-0005uT-HZ
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:59:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655153939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hhImuHSLOcUF4ngglwK/dujE4Zbe5kfUVsNaix5181o=;
 b=ASYt0uH3GGaeDEK68p1kPIm/Y1JCVRsI6hqsj42udwqU7OXBGRdwuCFNJPzqISsspAVAq3
 9oS495m7B+onTNzDpi5g5JDUy0VvJskNczSX6XW0UX/bVOToAFtoL61+x5kWjO5oQ3Gsr2
 x4zlVMR954Tw+vcIA/B7EzOba3Qa7QE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-b4UBxMbJPpS7lQ9Q47IfFQ-1; Mon, 13 Jun 2022 16:58:57 -0400
X-MC-Unique: b4UBxMbJPpS7lQ9Q47IfFQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 k7-20020a1709062a4700b006fe92440164so2198135eje.23
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 13:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hhImuHSLOcUF4ngglwK/dujE4Zbe5kfUVsNaix5181o=;
 b=1UHa5sEcC4Fd1gFBJNcxmlLC9vRz0SIvOkCJG+MLUCJxUN8fD1t3e391DGOCzptuew
 30SK1FsgjrwoBgpCiDc6mp9DdeYPRCzjPX4vZmNsTqJhmQOI2TQshwPHwKsPznviFSyi
 EJX/f4Nj11Rx9bDDtlbcsbHJ9S5nvlH5hBhkaKFAMBE2UnIVPXP0/l/ABttFqj6jN8qL
 zhoZ+gRTLKUsURj6sF6k+GWT87mLzBzYkur3lZSpJu1rZvFIzQ1gSLcUbMBZl9bjcIyX
 nbemUaOZjuK32hEW4q0WNny+qqlojagXlzvcqhcOXxN+TcOLheqjOL8JHlKc/4gjbn9X
 eHcQ==
X-Gm-Message-State: AJIora/zbrQ6PyR7pWwdj8veEV8/Y6x2FFzeVo2NJTz970p71EueAW/X
 eB9YHkoY1TovZucIW9T1MPps0fgNAthp0bY/j5R0/h6YffvhqTAU1giZPmfGT4fJJlJD86MDdN2
 qlpgj9UCyiwn918pokYQ3p10uf9C52HU=
X-Received: by 2002:a05:6402:11:b0:431:680c:cca1 with SMTP id
 d17-20020a056402001100b00431680ccca1mr1955554edu.420.1655153936365; 
 Mon, 13 Jun 2022 13:58:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3NT/gme+R6lrFUIN0YTOIwP45v9eMe5/po207QBPOvFcG28eYlXQeVzonT4PB+AKHZEN/PG6WwUZgQ/pLEkE=
X-Received: by 2002:a05:6402:11:b0:431:680c:cca1 with SMTP id
 d17-20020a056402001100b00431680ccca1mr1955512edu.420.1655153936008; Mon, 13
 Jun 2022 13:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220513062836.965425-1-leobras@redhat.com>
 <20220513062836.965425-4-leobras@redhat.com>
 <b2fae41c-7f47-9bf1-21b9-1b123818a262@bytedance.com>
 <YpdwcHu7I8dGDimt@xz-m1.local>
 <CAJ6HWG7vxRzEN5CRf93m_afHPn9zvMdYe=DZ4pGKKBQ8gyTY+Q@mail.gmail.com>
 <YqCK1UBLjXzo+nm7@xz-m1.local>
 <CAJ6HWG4UwU+em4pgk+uBLNZRx1jBThzYWXXp-nZg3EVLjuHVHQ@mail.gmail.com>
 <YqEFMXnMb8FlhvRe@xz-m1.local>
In-Reply-To: <YqEFMXnMb8FlhvRe@xz-m1.local>
From: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Date: Mon, 13 Jun 2022 17:58:44 -0300
Message-ID: <CAJ6HWG6gC1zb71MjTT1HbVnBHpNSbFN1hrRDoW2UBjvM3QhXXw@mail.gmail.com>
Subject: Re: [External] [PATCH v13 3/8] QIOChannelSocket: Implement io_writev
 zero copy flag & io_flush for CONFIG_LINUX
To: Peter Xu <peterx@redhat.com>
Cc: =?UTF-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, 
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 lizefan.x@bytedance.com, zhouyibo@bytedance.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hello Peter,

On Wed, Jun 8, 2022 at 5:23 PM Peter Xu <peterx@redhat.com> wrote:
[...]
> > In a previous iteration of the patchset, it was made clear that it's
> > desirable to detect when the kernel falls back to copying mechanism,
> > so the user of 'QIOChannelSocket' can switch to copying and avoid the
> > overhead. This was done by the return value of flush(), which is 1 if
> > that occurs.
>
> Two questions..
>
>   1) When that happens, will MSG_ERRQUEUE keeps working just like zerocopy
>      is functional?

I am not sure about what exactly you meant by 'like zerocopy is
funcional', but the
idea is that reading from MSG_ERRQUEUE should return a msg for each sendmsg
syscall with MSG_ZEROCOPY that previously happened. This does not depend on
the outcome (like falling back to the copying mechanism).
btw, most of those messages may be batched to reduce overhead.

At some point, zero-copy may fail, and fall back to copying, so in
those messages
an error code SO_EE_CODE_ZEROCOPY_COPIED can be seen. Having only
those messages in a flush will trigger the returning of 1 from the
flush function.

>
>      If the answer is yes, I don't see how ret=1 will ever be
>      returned.. because we'll also go into the same loop in
>      qio_channel_socket_flush() anyway.


We set ret to 1 at function entry and then for each message in the MSG_ERRQUEUE,
we test if it has error code different than SO_EE_CODE_ZEROCOPY_COPIED.
If it ever have a different error code, we set ret=0.

So, in our previous example, if we have a net device not supporting
the 'Scatter-Gather'
feature (NETIF_F_SG), every error message will be
SO_EE_CODE_ZEROCOPY_COPIED, and it will return 1.


>
>      If the answer is no, then since we'll have non-zero zero_copy_queued,
>      will the loop in qio_channel_socket_flush() go into a dead one?  How
>      could it return?

No, because it will go through all packets sent with MSG_ZEROCOPY, including the
ones that fell back to copying, so the counter should be fine. If any
code disables
zero-copy, it will both stop sending stuff wil MSG_ZEROCOPY and flushing, so it
should be fine.

>
>   2) Even if we have the correct ret=1 returned when that happens, which
>      caller is detecting that ret==1 and warn the admin?
>

No caller is using that right now.
It's supposed to be a QIOChannel interface feature, and any user/implementation
could use that information to warn if zero-copy is not being used, fall back to
copying directly (to avoid overhead of testing zero-copy) or even use
it to cancel the
sending if wanted.

It was a suggestion of Daniel on top of [PATCH v5 1/6] IIRC.

Best regards,
Leo


