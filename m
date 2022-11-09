Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316F662301D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 17:25:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnsv-0004Cv-HU; Wed, 09 Nov 2022 11:25:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1osnsn-0004C0-Im
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:24:58 -0500
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1osnsl-00026I-BA
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:24:56 -0500
Received: by mail-io1-xd31.google.com with SMTP id d123so14291615iof.7
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 08:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eIIM6ZRgBy7IxTXJcOwvRf3bru23f1elK2PJ9IIXUts=;
 b=TnIfnBJT03zR3Ifw/k7QSk0EJUzyN3La3lNQwbMaA3x5B0uMg7Omdy9AqQcKSHiscu
 JiynFO447dmxVQkYMQDV+cM5O9IRYyyJ6L23NpX6L8ljkHVBV4he+MSOeYsM/57DnJmT
 bo0QYl8QpYLXAqBMu2MGWh5PSJA02YhooYSI3d84XRfjZOHhtmVIDWnx/6IB7EYXnjyq
 AOqIVKpkcY+xC3IEetIM7VoD7vHaUy1CdqnR3Gk45K3hxJcKI2rhEMOP36zQdOMPChJA
 8vYBOp0G3FIPYMe5475LOz64aE5WTxPlt+F0qOPd28ZV3mwCZBcxp1kXKb55d78Kw9xS
 rUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eIIM6ZRgBy7IxTXJcOwvRf3bru23f1elK2PJ9IIXUts=;
 b=IIYyqq9J9uNJJ23w+wEIWJkQFyPS8I5m+TYUJhcdJ7aptGw/+EjLIjstHipNHokC5G
 XNp3hsw/DuEdWithKJM8sRGwLRkjrr2FXq4LKzi5uHZpa5IZcjc7ChQ6QE1Zx1BjIMtj
 9LNYIf892jOTMc1ZVM6D66ePoaRlqbXoG9raQ/px2gZ9Dwc+iUPovJPkJzRDqwxcCPAZ
 ns5j/ZuCV8CdPfaDXrfr03Kc2NzLJXTeEXp+FWuq7KSOgUI74Sjoxb00sP0dLdpJROCh
 Db+NioADmEZerzQ5XkfESgnnH9CPViitccs2dAXdj5KPmTnihLdMT8wk/zPTQzYPaOrG
 xUQw==
X-Gm-Message-State: ACrzQf1tQ/cotFeQK150PoDBZi+IiDBY/xP0smZuRQBJpZUoiEY4M0dM
 yQRaYKs6/emJAKKcQ1FxRUZJLQ9KVILCHXFrpuxsdA==
X-Google-Smtp-Source: AMsMyM5xCZpuYYjKWQKSO798MzgNCf/uhJsfckouFTGv6CzBe/vqoUYPZGnfFpTX/hJ3c2iPcTAoDzwHcaVtcbKmEH4=
X-Received: by 2002:a05:6602:1681:b0:6d5:ede:f95e with SMTP id
 s1-20020a056602168100b006d50edef95emr20911738iow.28.1668011094102; Wed, 09
 Nov 2022 08:24:54 -0800 (PST)
MIME-Version: 1.0
References: <20221108162324.23010-1-cfontana@suse.de>
 <20221109080452.72nqppvaqj73bakl@sirius.home.kraxel.org>
 <38bf7a34-826c-26d3-5978-21da1d37bdef@suse.de>
 <CAARzgwwgMkGiu_NTY1O3j75cJdObjLdWwpt8KqLYSJOkMwG20Q@mail.gmail.com>
 <CAFEAcA_sZ8ym0tOuDt3nuUH8UhBca3UUkO0N3OmFA6=xsdDdAw@mail.gmail.com>
In-Reply-To: <CAFEAcA_sZ8ym0tOuDt3nuUH8UhBca3UUkO0N3OmFA6=xsdDdAw@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 9 Nov 2022 21:54:43 +0530
Message-ID: <CAARzgwx9Z1wLM6r_x3q4ssdW9Dn+Op1fm1TjhpmPuM7g69mUtQ@mail.gmail.com>
Subject: Re: [PATCH] gtk: disable GTK Clipboard with a new option
 'gtk_clipboard'
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Claudio Fontana <cfontana@suse.de>, Gerd Hoffmann <kraxel@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 9, 2022 at 9:52 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 9 Nov 2022 at 16:21, Ani Sinha <ani@anisinha.ca> wrote:
> >
> > On Wed, Nov 9, 2022 at 6:09 PM Claudio Fontana <cfontana@suse.de> wrote:
> > >
> > > On 11/9/22 09:04, Gerd Hoffmann wrote:
> > >
> > >
> > > Thanks Gerd,
> > >
> > > I think at least for our packaging purposes we'd rather have it as a configure time option,
> > > so as to not put functionality in the hands of our users that can potentially lock the guest.
> > >
> > > Is someone going to queue this, where?
> >
> > Unfortunately we are on a hard code freeze at this time for the next
> > release. It might be better if you can resend the patch again to
> > remind someone to queue this up once the window opens again after the
> > release (mid december at the latest).
>
> We are in hard freeze, but that just means "no new features".
> This patch is fixing, or at least working around, a bug (i.e. that
> QEMU can hang), so it's OK to go in during freeze, assuming the
> usual code review etc.

yeah just realized it's a bugfix. I was about to respond but you beat
me by a few secs :-)

