Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481F85BB000
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 17:15:13 +0200 (CEST)
Received: from localhost ([::1]:41002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZD3f-0000se-Tw
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 11:15:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oZD0q-0006VK-6Y
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 11:12:16 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:35725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oZD0o-0005ek-C0
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 11:12:15 -0400
Received: by mail-ed1-x52a.google.com with SMTP id 29so31921426edv.2
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 08:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=+Lc78ZLLiCtja8D0Jwcn1uTkg8zHbyZZHJT77uqx4kA=;
 b=zjWPHgjyt1cOabMuUAmIpukGodCd47ipYKnRRPQYCXn+UWG4a+3N9+aVrhpUe/xO49
 YqPage27IIKPbXlwZCTUpb3r0dCDt5oVs47JEtUh3TtGx+rnyibl70+DJdLOUF88aXoO
 yrgTY8xKZwcUFUbYbdhIIgr7H4m4/Nx5hJzHFPtLdjjQjNi3hwl6SFDdG4KRDjOxLCz8
 vb6iG+gaGRdCscGa8sGAQM9XABJOScFlfgQczB7hk4vqJsmIYFopF26ec1rNt14ruLnw
 hevJOQwHhGYtpEad2jOVocqhcgcxr45TPXwTxE06HOrBsepxb293n1cXf5XGXj5P8Cgo
 hPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=+Lc78ZLLiCtja8D0Jwcn1uTkg8zHbyZZHJT77uqx4kA=;
 b=o/NkAA2qV/XqnQ6ohOX6MmHqNko513/05StKJ+dAIiIoBxbXU7aDyMEEIwv/apBU8S
 ButQkeYnR4a+V6ZoHZmNc0hKunO42lqPM9A7BP+UKJ2eUCqj+NXiBqUhozbcWvIdGPsx
 uu4XgsFhrQqHkHKXo/AeLLtHUlYHKn7/mg5r5ArVALqO9xdS87ZP4WAgMERIiNb5jqDa
 fXYxqsLy0PZvXCmOptsAaPYChGw+j9U03tbnPtvWywxJkBKMdPIxnhAeOrmEA2GI89Xz
 I1cmnUT0nBD4gZRN2jbaEh8QWN72sQ3vJ6D3S3C1/c24zaHU6iTKucuS8VK3jZoAdvCC
 rpZg==
X-Gm-Message-State: ACrzQf0yT8e8P2IIjH1iwPE9m8RlpQli/CZG+q5lBLJAG2k7GFBGdHy9
 gLeHsm5eOyzXKYTkQkw0vgLxiH0KAVqfxZrcMFOybg==
X-Google-Smtp-Source: AMsMyM48trRJKoirfSQ11Bhk1zyf8B9lhdRKq5FgszZodXAb05xo9hhefoOjv4TNm9vECnddECjJIeHPxZZy/BtKJbI=
X-Received: by 2002:aa7:c0cb:0:b0:453:84c8:b61e with SMTP id
 j11-20020aa7c0cb000000b0045384c8b61emr737430edp.301.1663341131836; Fri, 16
 Sep 2022 08:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAFn=p-ZkKLQtYAwzkQb7srFf_fF8ij+g5wkZiRofx4U+kSZ7Rw@mail.gmail.com>
 <CAFEAcA8Zy3RpTZM-gJk6ZZaUEf6huTuuK3C4-uSo6pYz8KCrMQ@mail.gmail.com>
 <YyNDCDH71oytYujr@work-vm>
In-Reply-To: <YyNDCDH71oytYujr@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Sep 2022 16:12:00 +0100
Message-ID: <CAFEAcA9=hY57=7mXrcs3MHZuGR0HdXwQh-thW8zW=hMmxck2Ng@mail.gmail.com>
Subject: Re: Maximum QMP reply size
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Sept 2022 at 16:21, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > On Tue, 6 Sept 2022 at 20:41, John Snow <jsnow@redhat.com> wrote:
> > > Hi, I suspect I have asked this before, but I didn't write it down in
> > > a comment, so I forget my justification...
> > >
> > > In the QMP lib, we need to set a buffering limit for how big a QMP
> > > message can be -- In practice, I found that the largest possible
> > > response was the QAPI schema reply, and I set the code to this:
> > >
> > >     # Maximum allowable size of read buffer
> > >     _limit = (64 * 1024)
> > >
> > > However, I didn't document if this was a reasonable limit or just a
> > > "worksforme" one. I assume that there's no hard limit for the protocol
> > > or the implementation thereof in QEMU. Is there any kind of value here
> > > that would be more sensible than another?
> > >
> > > I'm worried that if replies get bigger in the future (possibly in some
> > > degenerate case I am presently unaware of) that the library default
> > > will become nonsensical.
> >
> > There are some QMP commands which return lists of things
> > where we put no inherent limit on how many things there
> > are in the list, like qom-list-types. We'd have to be getting
> > a bit enthusiastic about defining types for that to get
> > up towards 64K's worth of response, but it's not inherently
> > impossible. I think using human-monitor-command to send
> > an 'xp' HMP command is also a way to get back an arbitrarily
> > large string (just ask for a lot of memory to be dumped).
>
> We could put size limits on xp; most Humans will only dump a few kB
> maximum like that, any larger and you can dump to file.

Sure, we could, but why? It's not clear to me why a consumer
of QMP needs to impose a maximum message size limit on it:
I thought it was just JSON. Fixed buffer sizes are very 1980s :-)

If this is a common requirement then should we define something
in the protocol where the client says "I can support messages
up to this big" and then the server has to split things up?

-- PMM

