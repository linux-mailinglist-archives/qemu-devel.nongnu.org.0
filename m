Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CCB4044A5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 06:59:57 +0200 (CEST)
Received: from localhost ([::1]:52122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOCAG-0002LH-DE
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 00:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mOC8n-0001ft-Gt
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 00:58:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mOC8l-0000wl-Vu
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 00:58:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631163502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oNIi3w6MGopzzAqKCRfiXwFf6wJEtVDf4UlhKxrWlPM=;
 b=gE4zW+A4UfJb8ab6Wh9wo1/a4Cva4FRG6U9sdU8kiWwrjx2AEmFBcUVgdswBs98DimUkUk
 Yfulvv/FlL9XvhTSN1TZgSM14s40FUD1eLpUd8aSFPh5v+atLsUe08rE4Kz/4UHhZ8+VC+
 f+ACxEK8QYCw029TAJKMlMcbeyRPS7A=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88--aP0iCE7PWCUGG1k8QL1Nw-1; Thu, 09 Sep 2021 00:58:21 -0400
X-MC-Unique: -aP0iCE7PWCUGG1k8QL1Nw-1
Received: by mail-lj1-f199.google.com with SMTP id
 v2-20020a2e2f02000000b001dc7ee2a7b8so223521ljv.20
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 21:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oNIi3w6MGopzzAqKCRfiXwFf6wJEtVDf4UlhKxrWlPM=;
 b=nucOD5muD7TfP0nFxkHKtfj2gIlISLGfseXpowCqiwpTKNtVmK4MdEFwAfgKkvcO8H
 SIdvQYNKAKcQX3HL48jduHlDXJ9dsU95hmsRo+rXzaRR2pahMEj8OMldXxsxnk+qNGNZ
 JeWuNKDOEmcBu+VQ9MmQsdAAa8xynms42uqZpF6rt5tTF39+YFUMcQiCIXGwoN1HGyC8
 06ex2xbBD9u/qJ6p0T4dtMta2M7yXbcpiA8c2LjJMmfJTmsJ3R7ElDHi55pFx7ASgjZb
 djNuEJT3YWGRdhrhkiQBGPJwnRHMLcwA4IA71Ed8VzJGLjXlWA2eh/vYLRyxCKAJBfnE
 xpfA==
X-Gm-Message-State: AOAM531D11FQCd1XNyyazWWvfJVo/l/H4nSY25SddcqcwOwcOZvF2P52
 IfaV3hiIiuviv0hSMivh81ZT0CYX1UUEAET/h/kyb8HWvVlgGQKv3bEWqQgcU/hOCvFdfMkuRkU
 /5+5U1nsalOCaEU1aw7BximNWQfbfrxM=
X-Received: by 2002:a05:651c:88e:: with SMTP id
 d14mr724757ljq.472.1631163500224; 
 Wed, 08 Sep 2021 21:58:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAkaEJTPF8yLrEFt2J83lZbM0m4HuTBGjE26EYkoAfR1moMr3n/SQy2CvDlaLn5k8cefE7pIlJ2f4cMlFWru0=
X-Received: by 2002:a05:651c:88e:: with SMTP id
 d14mr724729ljq.472.1631163499788; 
 Wed, 08 Sep 2021 21:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ6HWG75NDzaRAoHvM6FkFoB+sQvTpmdR8+AdMkoY6TsP06ZhA@mail.gmail.com>
 <YTCPngNB+l70sl06@redhat.com>
 <CAJ6HWG6dd+timQM27-NTumvwDM2bFawRsnmrZumdzGZ8hCR3dQ@mail.gmail.com>
 <YTCeNCEmr3NsQEPR@redhat.com>
 <CAJ6HWG6D61K49gyvfLo2c5=cZpkYh96ciZjO5V=wiPdG+wB5zQ@mail.gmail.com>
 <YTCnP9J/JINhg4h8@redhat.com> <YTdHpx263WNe7nuZ@work-vm>
 <CAJ6HWG6L1LOec6yMY1oxFjbjhAv4LK6beS5FmU=g_s4h2+7ouA@mail.gmail.com>
 <YTkmjdsY1ZkBnVdS@t490s> <YTkrHUMMV0xDmHCU@redhat.com>
 <YTlr8xIFOFym2cFy@xz-m1.local>
In-Reply-To: <YTlr8xIFOFym2cFy@xz-m1.local>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 9 Sep 2021 01:58:39 -0300
Message-ID: <CAJ6HWG4GTiqvXjyLnBTEaP6fBCt76cR=imLRfM1eYi3qp9QiPg@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 8, 2021 at 11:05 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Sep 08, 2021 at 10:57:06PM +0100, Daniel P. Berrang=C3=A9 wrote:
> > We think we're probably ok with migration as we are going to rely on th=
e
> > face that we eventually pause the guest to stop page changes during the
> > final switchover. None the less I really strongly dislike the idea of
> > not honouring the kernel API contract, despite the potential performanc=
e
> > benefits it brings.
>
> Yes understandable, and it does looks tricky. But it's guest page and it'=
s just
> by nature how it works to me (sending page happening in parallel with pag=
e
> being modified).
>
> I think the MSG_ZEROCOPY doc page mentioned that and it's userspace progr=
am's
> own choice if that happens. So even if it's not by design and not suggest=
ed, it
> seems not forbidden either.
>
> We can wr-protect the page (using things like userfaultfd-wp) during send=
ing
> and unprotect them when it's done with a qio callback, that'll guarantee =
the
> buffer not changing during sending, however we gain nothing besides the "=
api
> cleaness" then..
>
> Thanks,
>
> --
> Peter Xu
>

I can't stress enough how inexperienced I am in qemu codebase, but based on
the current discussion and my humble opinion, it would make sense if someth=
ing
like an async_writev + async_flush method (or a callback instead) would be
offered by QIOChannel, and let the responsibility of "which flags to use",
"when to lock", and "how / when to flush" to the codebase using it.

I mean, it's clear how the sync requirements will be very different
depending on what
the using code will be sending with it, so It makes sense to me that
we offer the tool
and let it decide how it should be used (and possibly deal with any
consequences).

Is there anything that could go wrong with the above that I am missing?

About the callback proposed, I am not sure how that would work in an
efficient way.
Could someone help me with that?

FWIW, what I had in mind for a (theoretical) migration setup with
io_async_writev() + io_async_flush():
- For guest RAM we can decide not to rw_lock memory on zerocopy,
because there is no need,
- For headers, we can decide to not use async  (use io_writev() instead),
- flush() can happen each iteration of migration, or at each N
seconds, or at the end.

Thank you for the great discussion :)
Leonardo Bras


