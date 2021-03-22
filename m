Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FD634364C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 02:33:23 +0100 (CET)
Received: from localhost ([::1]:51252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lO9Ra-0004md-ME
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 21:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lO9ON-0003ah-7G; Sun, 21 Mar 2021 21:30:03 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:35540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lO9OJ-0000wq-0H; Sun, 21 Mar 2021 21:30:02 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id m132so4863740ybf.2;
 Sun, 21 Mar 2021 18:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mc42olELJuo/r7sVJ9aO1f3nB1TYdEoPF0M73/jcbKI=;
 b=kyrgONktWNv+6SA36hMbXA9zbbY/TFhPTLghDVjOm8gYGRHAkFonT3gN9QPpYSppXI
 GAG32LdmOieqDSFAZKsdZiGfaHG6EC4aH8jVY++T7iZAG6Y+vPaYeRrKxEnXq4VaSr2Y
 509EIAiQHQUy3LNJ5fyKTN6kxZ10dfm/vrLwlDALfiKTVWiNwvH70QRmafrrIoowkAQF
 T2EAan9snG64Ka+1yDe2RYiM3viqocq5yxvZzCUH/O2tQkZ6bUe5qSbJJCON6478qs8T
 WiLECYPoYYlCBN4BC1HstLEdoDa66qYKyAZEpGryqCveFUwRk2r2pO0wKFcKN35cMmpq
 WfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mc42olELJuo/r7sVJ9aO1f3nB1TYdEoPF0M73/jcbKI=;
 b=PUaw/m2AhZ8o2RVgRsqxAr0Y1GS7U3bCi3+Kno6MqugPyuNoSJ9mY9UWD4dpI25r+J
 AsILdfnuReczPepA8LLkRsTpCl2/UFWMeaY8BOBvd3XYXJ4YP5CQ88f2dAZdo0D5IiZM
 jZgajtXMZ+tn4OU6iXduGASBV37pXGz6Hoe+vutLvGVooYrNai9VtKd8H37V5xHRrlb8
 KeuuzCvq4lTzma8u+NNPPKIkTV4DklWj3KZNeZs06EdrwLmkIwvmNX6gt7xo+LNtzZQJ
 XHnrA7CJUMU1VBQgQ6vtf0VPgRfhH9PfTEUmsIJkrgjih7WdGUV/gCSLHwKCvQ3b451O
 A+8g==
X-Gm-Message-State: AOAM532REJlMSZC3oG3HDcYQA7ehGEb2hDQ0E2dNw0Zq5j2err8CavSQ
 ShUL29RE0dbsZlL6rmdDWTFglxVog5Sx8Cltv7SWie/I
X-Google-Smtp-Source: ABdhPJzREyvlcpNfJ9gMLFL7MPFFNi7+pakuXZsmIlPsNX5bqETuNZMF/LAe4lAYI4fpauU0L034TJk7z0BjPUXECJ4=
X-Received: by 2002:a25:d28b:: with SMTP id
 j133mr19889191ybg.517.1616376596928; 
 Sun, 21 Mar 2021 18:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210306060152.7250-1-bmeng.cn@gmail.com>
 <CAEUhbmVQZpT1bXkmV==rXqaq5u+oqPd4fT5LROUCwGUhmx_XCA@mail.gmail.com>
 <CAEUhbmU3Q6pFgdOxzyoKSjAAarfaq9DBsH5JkKgpuM19EYPg+Q@mail.gmail.com>
In-Reply-To: <CAEUhbmU3Q6pFgdOxzyoKSjAAarfaq9DBsH5JkKgpuM19EYPg+Q@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 22 Mar 2021 09:29:45 +0800
Message-ID: <CAEUhbmVgXQX-Ys-jwUn-2jhBJ+HT6btJqYmPYmgNXGoEwUsX1w@mail.gmail.com>
Subject: Re: [PATCH v2] hw/block: m25p80: Support fast read for SST flashes
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 16, 2021 at 9:39 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Mar 11, 2021 at 4:18 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Sat, Mar 6, 2021 at 2:01 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > Per SST25VF016B datasheet [1], SST flash requires a dummy byte after
> > > the address bytes. Note only SPI mode is supported by SST flashes.
> > >
> > > [1] http://ww1.microchip.com/downloads/en/devicedoc/s71271_04.pdf
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > >
> > > ---
> > >
> > > Changes in v2:
> > > - rebase on qemu/master
> > >
> > >  hw/block/m25p80.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> >
> > Ping?
>
> Ping?

Ping?

