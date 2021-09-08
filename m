Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D63C40401E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 22:15:19 +0200 (CEST)
Received: from localhost ([::1]:35990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO3yY-0000B1-2Z
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 16:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mO3wo-0007oL-Vh
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 16:13:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mO3wl-0003yR-7H
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 16:13:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631132005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5JlskpEZ0K7yeynb61sJ7U/uMnxO3kZSuBh7FP0/+6Q=;
 b=IfnoIrbx4tb1QnGlj8QItc7VJx8vsuuoLHNWrXWkHj7lqipm5Shw7Vul0f6AsmZAQ4rBZG
 5Kv692QEkeSKYoKKatocge0YpQWDvHNGXz351eW11PqkbenTX4S4vUUaq3Hg2PFd8XIrE7
 dzcuIGDNDuknAzYwPIA4BzRrlJc5X0Q=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-RK2OkcT5NwGcFmFY0qmiLA-1; Wed, 08 Sep 2021 16:13:24 -0400
X-MC-Unique: RK2OkcT5NwGcFmFY0qmiLA-1
Received: by mail-lj1-f200.google.com with SMTP id
 192-20020a2e05c90000b02901b91e6a0ebaso1475480ljf.13
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 13:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5JlskpEZ0K7yeynb61sJ7U/uMnxO3kZSuBh7FP0/+6Q=;
 b=8J3f/P9zNtj34LNl7Mdw5T/ZNjEeVqdZpZu6UlxO3zwRE3fO61AV8xygsegtWZCzok
 bZxJO64YxRjLBcGzs11lxWfDicaK78LgmPuMAKxFTBM0TUhmjIkHpy1oyMyqkOqjY24G
 EjLf+1llgtsmP5nc+cwKlTRfauX6Qua7AreUm7VXySM/tACVWgWPLAckLL2+/9DvrKjI
 XH5N++ZNZV11NFcslVsoupiY8poVmtSc1dGMlAMsRRwhOklnrs2tQHQGSaLpzrddQGje
 LOzuygFptPPdE4HO+rGWiEUD9UFry+8vZMWx6S0j9Sfwoe4gtvSTs370oTgk59H9jWc7
 9Uag==
X-Gm-Message-State: AOAM531i1XdkIP8vCIWdT7ZKi1gJqRa3czIKCtheYlDs+lQdh/w4iG9T
 OaAuo3xEQ4JU2gysuzdYy3UAoF0EVd4AcjxprkZq7b18lBMpoTmJSxE6UN+Sq7R6mP7yObegSzc
 8XMOFNGL0uX+JeJWhs2Yk1lk1aQPHvHE=
X-Received: by 2002:a05:651c:88e:: with SMTP id
 d14mr79460ljq.472.1631132002817; 
 Wed, 08 Sep 2021 13:13:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7sVUa2DAGWZWsYH5EpDlf4JP/3ESNeytdgnt7gTBX0fShb1sqZHg5JLxpS7w7i6265ZEbIl+I0xCWQhsE66g=
X-Received: by 2002:a05:651c:88e:: with SMTP id
 d14mr79407ljq.472.1631132001690; 
 Wed, 08 Sep 2021 13:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-3-leobras@redhat.com>
 <YS4nPfEBCy9IC3rd@redhat.com> <YS6QmOrN4qr055vR@t490s>
 <CAJ6HWG72311UK9Nvh+JDw-zo1Days0u8N_QHbeGGdfKR+hALCA@mail.gmail.com>
 <YTeXBCAUOpy0HagV@t490s>
In-Reply-To: <YTeXBCAUOpy0HagV@t490s>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 8 Sep 2021 17:13:40 -0300
Message-ID: <CAJ6HWG7xWNJZG7=QDkeL6wNiBdTBo3YeHLtu1iTACeC9+4_rHQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Sep 7, 2021 at 1:44 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Thu, Sep 02, 2021 at 03:59:25AM -0300, Leonardo Bras Soares Passos wrote:
> > I also suggested something like that, but I thought it could be good if we could
> > fall back to io_writev() if we didn't have the zerocopy feature (or
> > the async feature).
> >
> > What do you think?
>
> That fallback looks safe and ok, I'm just not sure whether it'll be of great
> help.  E.g. if we provide an QIO api that allows both sync write and zero-copy
> write (then we do the fallback when necessary), it means the buffer implication
> applies too to this api, so it's easier to me to just detect the zero copy
> capability and use one alternative.  Thanks,
>
> --
> Peter Xu
>

I was thinking this way (async method with fallback) we would allow code using
the QIO api to just try to use the io_async_writev() whenever the code
seems fit, and
let the QIO channel layer to decide when it can be used
(implementation provides,
features available), and just fallback to io_writev() when it can't be used.

Best regards,
Leo


