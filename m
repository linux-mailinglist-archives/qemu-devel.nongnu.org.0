Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFB04A681A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:39:51 +0100 (CET)
Received: from localhost ([::1]:54660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1oU-0003G2-41
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:39:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nExye-0006Fh-1S
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:34:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nExyb-0002Tx-Vl
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:34:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643740441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7KlLi9vW4cHA9QtkuWbaU1QUlCwsjMFp+TmQ4dtcyb0=;
 b=RVewGYWPLv/syi8/klx8SYxydqF1vDfJAByewCXSb5ApH+27dsKnaRrly6x4Q3d+sQBD8d
 aLrxxfaGKj0y+18FMJNySDeoFwLkVDiopUcixPLZySBU2N/zmwfVvr0u+ABxT5ODEAJRyw
 Q0ZofnU+lCcOHcqJ3+MGP+hI2u+tozg=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-ZOvT7ZU8O7Kt3764_qt9aQ-1; Tue, 01 Feb 2022 13:34:00 -0500
X-MC-Unique: ZOvT7ZU8O7Kt3764_qt9aQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 j25-20020ab02519000000b0030fb16c943fso8046225uan.16
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:34:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7KlLi9vW4cHA9QtkuWbaU1QUlCwsjMFp+TmQ4dtcyb0=;
 b=B391TsDA+lBS/9Dq3N1mv3E+RJPuiwuhOMHB+zeugLDwMusgy+Oa639jH0H7uiuwFB
 IDMK5XwYZGgiABk1oHFe99ZPub6F5m0XIplbvFiLoDZb59eejoFq55dqVJKNs4nmKSpX
 sruWLNZkCi8VHQ1be9Czi/YSugMGu8YsZUBa2rMQJcxxcD6t6peyYeL0AuEYLj++GC3c
 T1NDBotSQvTpE9VVy+S192a/7XlJWkR8lkfAuR/xzzkJ2l/e5K8++EWrrVPCGOaU8oCW
 zSy0eqhSn3UO5QWvwuQQPbFHmOo3X6RPkLT+oblp7QuRInONf3SQolf0JK+fZ6rsdk8x
 vtRw==
X-Gm-Message-State: AOAM530SUi7t4QoVV64MT1Nh6NVjBHS4M7o4PWJtkmj1NgQOQr47aV5G
 CC2P0Me3n18yOuhz9ayQf+CeJf/RQtzobBmKXcT5pkeav+fO1J1BYkeQ8HP0j/+fhm+tHmsklLC
 wx8j2Y4ukwLaUKsvrGOp//z/uVF3Zyjk=
X-Received: by 2002:a67:a449:: with SMTP id p9mr9844290vsh.61.1643740439618;
 Tue, 01 Feb 2022 10:33:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkQ0GfYXRufqWoBs7XuZq8neRjV7SKmaqyRb7Ct5oZFtp/jcngH4Jo/jWpZIh82oYEmqnZruwJHjBBbU65RsE=
X-Received: by 2002:a67:a449:: with SMTP id p9mr9844280vsh.61.1643740439464;
 Tue, 01 Feb 2022 10:33:59 -0800 (PST)
MIME-Version: 1.0
References: <20220201041134.1237016-1-jsnow@redhat.com>
 <20220201041134.1237016-2-jsnow@redhat.com>
 <YfkurVhVj0L0Il1p@redhat.com>
In-Reply-To: <YfkurVhVj0L0Il1p@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 1 Feb 2022 13:33:48 -0500
Message-ID: <CAFn=p-bJQV+2-Wcn8NnQ0H1FuUk7TUacqjcXA-cqZBZu3q9seg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] python/aqmp: Fix negotiation with pre-"oob" QEMU
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, Feb 1, 2022 at 7:59 AM Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 01.02.2022 um 05:11 hat John Snow geschrieben:
> > QEMU versions prior to the "oob" capability *also* can't accept the
> > "enable" keyword argument at all. Fix the handshake process with older
> > QEMU versions.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> > ---
> >  python/qemu/aqmp/qmp_client.py | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/aqmp/qmp_client.py
> > index f1a845cc82..90a8737f03 100644
> > --- a/python/qemu/aqmp/qmp_client.py
> > +++ b/python/qemu/aqmp/qmp_client.py
> > @@ -292,9 +292,9 @@ async def _negotiate(self) -> None:
> >          """
> >          self.logger.debug("Negotiating capabilities ...")
> >
> > -        arguments: Dict[str, List[str]] = {'enable': []}
> > +        arguments: Dict[str, List[str]] = {}
> >          if self._greeting and 'oob' in self._greeting.QMP.capabilities:
> > -            arguments['enable'].append('oob')
> > +            arguments.setdefault('enable', []).append('oob')
> >          msg = self.make_execute_msg('qmp_capabilities', arguments=arguments)
>
> In case you have some interest in bike sheds:
>
> As long as we only ever append a single capability, it doesn't really
> make a difference and an explicit setdefault() when adding it is fine.
> But if we had more than one, maybe making arguments a defaultdict(list)
> would be nicer.
>
> Not worth respinning, of course, if you don't for another reason.
>
> Kevin
>

Nope, no reason. I just forget that there's a fancier doodad. I'll add
a patch to a less-important series to shine this up.

--js


