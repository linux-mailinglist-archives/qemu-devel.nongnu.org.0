Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E7C5AF627
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 22:34:23 +0200 (CEST)
Received: from localhost ([::1]:45336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVfH3-0008Dp-Q7
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 16:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oVfCt-0005fk-A1
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 16:30:03 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:45988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oVfCr-0006S5-F2
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 16:30:02 -0400
Received: by mail-yb1-xb32.google.com with SMTP id d189so15883866ybh.12
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 13:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=LpQM9p6EEh2L31vvMTxIQIubJoHhJFgeCIjjphDUCuk=;
 b=pxosDIHlxVNq4HjWvQojF59j3tpagF6/W+INB5rYwSXzAFQ+Z3UP0cD7yrXJEoJ6B4
 AGoc1fyN89rT5xj4Tl+GMJ6eowPAxoDL3lu9+rDN+b1lTkwFt5el+Jz/HJfe3jqT66fn
 Wfy+TMVBRXA0qNciKcdfLY2gZQtcQ0W6S2mCzimU7FdpaOULux0QebKPJgDxAa+/YnTH
 djelZGKXijoKZt4EAuO8EUQCUCTH8Rz9X1K39HPzL4fqI6jlabOKLz3pXswHkvEa6Wxo
 S1tKhjUlplxDJQpfS4pj896MFRXG6aWGoe56MIDL/Whfj7lO73oEajfo5kL98DzyStgu
 totg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=LpQM9p6EEh2L31vvMTxIQIubJoHhJFgeCIjjphDUCuk=;
 b=S8UEpe6uEOxmMLlBcvy8A9LRpRTBQFvmOkQev9LN01XjPPoKfxuGJaKcV82CeYbsjh
 n2atTZ8JTjOGy7UCAVMupZl35wrdUtPIVbJU0dfyso3jmUbDqyxKzccgXyOheZOiPzW5
 Cg73+GSwbEFyUtwhRFV9gge+atL9+CcAUu7X0QuZ1EFte6lggruINEAWXvwJ6p0sBRNf
 G/8Og95hA0APQfdfFZ0sa9vf13vEkdMtq81tI79M95VAu7dEL1N5kivN/SHwCGM6DaND
 /NRQ+KyniWVZDq9UUASXAxFYwyojyiP2bf4MtqcXz5jEl8bq1J3vo+KMjmEEK0docPui
 sAng==
X-Gm-Message-State: ACgBeo05119VBkVctribykdv5GfDMkvGNHkNjBdbjTd3YCt/p/SPwBzs
 gxcD5L6IF5ZptRyrlzx2RVCADFN9DabGzsVlkfbRDw==
X-Google-Smtp-Source: AA6agR5G/h9OITqWIxhH3KIXfjFjpfm5RFQv/8Rfqra/yJ6xSNyunEt/R5myTi/J8L82Y+H+TIythtJ4igreTylP0U8=
X-Received: by 2002:a05:6902:1245:b0:699:fc86:d9f5 with SMTP id
 t5-20020a056902124500b00699fc86d9f5mr383214ybu.288.1662496200252; Tue, 06 Sep
 2022 13:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAFn=p-ZkKLQtYAwzkQb7srFf_fF8ij+g5wkZiRofx4U+kSZ7Rw@mail.gmail.com>
In-Reply-To: <CAFn=p-ZkKLQtYAwzkQb7srFf_fF8ij+g5wkZiRofx4U+kSZ7Rw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Sep 2022 21:29:49 +0100
Message-ID: <CAFEAcA8Zy3RpTZM-gJk6ZZaUEf6huTuuK3C4-uSo6pYz8KCrMQ@mail.gmail.com>
Subject: Re: Maximum QMP reply size
To: John Snow <jsnow@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 6 Sept 2022 at 20:41, John Snow <jsnow@redhat.com> wrote:
> Hi, I suspect I have asked this before, but I didn't write it down in
> a comment, so I forget my justification...
>
> In the QMP lib, we need to set a buffering limit for how big a QMP
> message can be -- In practice, I found that the largest possible
> response was the QAPI schema reply, and I set the code to this:
>
>     # Maximum allowable size of read buffer
>     _limit = (64 * 1024)
>
> However, I didn't document if this was a reasonable limit or just a
> "worksforme" one. I assume that there's no hard limit for the protocol
> or the implementation thereof in QEMU. Is there any kind of value here
> that would be more sensible than another?
>
> I'm worried that if replies get bigger in the future (possibly in some
> degenerate case I am presently unaware of) that the library default
> will become nonsensical.

There are some QMP commands which return lists of things
where we put no inherent limit on how many things there
are in the list, like qom-list-types. We'd have to be getting
a bit enthusiastic about defining types for that to get
up towards 64K's worth of response, but it's not inherently
impossible. I think using human-monitor-command to send
an 'xp' HMP command is also a way to get back an arbitrarily
large string (just ask for a lot of memory to be dumped).

-- PMM

