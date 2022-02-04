Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA414AA255
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 22:33:28 +0100 (CET)
Received: from localhost ([::1]:56110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG6Ct-0002iO-HN
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 16:33:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nG63h-0001Cd-0E
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 16:23:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nG63M-0004vy-5Z
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 16:23:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644009814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5gw2AjGc3aOXEX6OLET+DW/Pd1i/GI8kjkWWpeUa1mE=;
 b=f6lRprzJrzNaKAy3Lr5ntNzZsvR51XzGSkO4H6yVpiSEF37SVk4MupXeLUhFpDn3bkYJX4
 mt1OyrkOEm5KK2WDMt1b5T0kssB5K9f0IgGRtdRP447xSqmWlJ5uirCptuchAkEqTRO1IP
 ZqkdW5pQOinmdCC1ty7ydKkhACu0ycU=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-3hPIWEmWM-iLJ3oqnqgubQ-1; Fri, 04 Feb 2022 16:23:28 -0500
X-MC-Unique: 3hPIWEmWM-iLJ3oqnqgubQ-1
Received: by mail-ua1-f69.google.com with SMTP id
 q1-20020ab02641000000b0030fcdd5c18eso4131877uao.23
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 13:23:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5gw2AjGc3aOXEX6OLET+DW/Pd1i/GI8kjkWWpeUa1mE=;
 b=PIoeOA4lGEhI64rDaWzzbuqkve9+Xhy/69hs353jBK+qosxvSvCwr9lz1Q8PeWjtnP
 MbPMJT7u9bB3XqaMLbUqR3wH3rCtGOcrW1DyXByi4d4Jk0PFQSarEdChRbvkIuOCT1Yh
 Gxs+DyiyV3wW66VFFHlIxyF775Q1bJxHRV/NwRKb1A2rmgoKTrzT3FarDT9RTE0FRix+
 9VrgNZHe5abpX6FOQOM963d41r6M3Au/JCadYy9JjmXtXz9k9dn8JQ6IQg+mW8nhY1Ng
 vVN3obTt1KNZCZfWySTTTqv/vYwKWFRmImDqsU13cdwokejw9TMIrh5oI1Xg994YBOT1
 dU1w==
X-Gm-Message-State: AOAM532eWfoM9SI8k/e3AL3/FATIPNGcXvb9c8EbaVWNVVqlMhe/3mQm
 Bdmxiw9qVT+Ah4txLWEl+mCXzKUohltp36el+QjQb+XsxjepBBOdEJiPLHpS0NjzOMEy0KPHPDp
 Q3CI1Q+6lmjNe7MH0vsv9k72FhlFyqKg=
X-Received: by 2002:a67:f70f:: with SMTP id m15mr1646691vso.61.1644009807853; 
 Fri, 04 Feb 2022 13:23:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzed1tyTbiwTNeuyrInHrS9CAYUvj3ohlMFNhKhCq3jgmVN88OP0GYhVIvidEYpEFIpzkrq/oNx2iGlem1eW8Q=
X-Received: by 2002:a67:f70f:: with SMTP id m15mr1646687vso.61.1644009807649; 
 Fri, 04 Feb 2022 13:23:27 -0800 (PST)
MIME-Version: 1.0
References: <20220201041134.1237016-1-jsnow@redhat.com>
 <20220201041134.1237016-5-jsnow@redhat.com>
 <YfkzwdbIaGF5TcVZ@redhat.com>
 <CAFn=p-YKS8UXm3+LPsbjKh-_EkQ--efTW60KfQDa8ZAOVMmHjQ@mail.gmail.com>
 <YfmN+w7zh4qx27q/@redhat.com>
 <CAFn=p-bTFrJSF+TtkzyjQhBcTKe3AeWoJJT=O+mS-LiKZVHDnQ@mail.gmail.com>
 <YfueFuHpHx6TXCMR@redhat.com>
In-Reply-To: <YfueFuHpHx6TXCMR@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 4 Feb 2022 16:23:17 -0500
Message-ID: <CAFn=p-axYaoe6KFmqXVG+ieNv93zg_XhHzd5-JJe7oP2v4wiWw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] python/aqmp: add socket bind step to legacy.py
To: Kevin Wolf <kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 3, 2022 at 4:19 AM Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 02.02.2022 um 20:08 hat John Snow geschrieben:
> > > I guess the relevant question in the context of this patch is whether
> > > sync.py will need a similar two-phase setup as legacy.py. Do you think
> > > you can do without it when you have to reintroduce this behaviour here
> > > to fix bugs?
> > >
> >
> > Hm, honestly, no. I think you'll still need the two-phase in the sync
> > version no matter what -- if you expect to be able to launch QMP and
> > QEMU from the same process, anyway. I suppose it's just a matter of
> > what you *call* it and what/where the arguments are.
> >
> > I could just call it bind(), and it does whatever it needs to (Either
> > creating a socket or, in 3.7+, instantiating more of the asyncio loop
> > machinery).
> > The signature for accept() would need to change to (perhaps)
> > optionally accepting no arguments; i.e. you can do either of the
> > following:
> >
> > (1) qmp.bind('/tmp/sock')
> >     qmp.accept()
> >
> > (2) qmp.accept('/tmp/sock')
> >
> > The risk is that the interface is just a touch more complex, the docs
> > get a bit more cluttered, there's a slight loss of clarity, the
> > accept() method would need to check to make sure you didn't give it an
> > address argument if you've already given it one, etc. Necessary
> > trade-off for the flexibility, though.
>
> Hm, how about copying the create_server() interface instead? So it
> would become:
>
> (1) qmp.create_server('/tmp/sock', start_serving=False)
>     qmp.start_serving()
>
> (2) qmp.create_server('/tmp/sock')
>
> Then you get the connection details only in a single place. (The names
> should probably be changed because we're still a QMP client even though
> we're technically the server on the socket level, but you get the idea.)

Good idea. I'll experiment.

(I'm worried that the way I initially factored the code to begin with
might make this ugly, but maybe I'm just dreading nothing. I'll have
to see.)

Thanks for taking a look!

--js


