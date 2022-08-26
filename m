Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47955A27EB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 14:41:01 +0200 (CEST)
Received: from localhost ([::1]:47028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRYdw-0003K0-I9
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 08:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oRYbi-0001rm-OF
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 08:38:42 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:36715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oRYbh-0004aa-0N
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 08:38:42 -0400
Received: by mail-qt1-x831.google.com with SMTP id h21so1106419qta.3
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 05:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=psHh2UMcpTwxuh1Mg5pEoyy7vl9g9lmcMNdz/Ob0jOg=;
 b=VgaDNUrwsrwd/3WQRFASR2SyPMU7yV0oZEZ6A2AVS+nh7LpQswoYwkK14mNcnRYNA2
 Xoi5NDgc327zbxV0m/IHWLq69bgQHpkjuTwx3206yqvw1qXsLMzEZVjTk2d1ACnnkwqQ
 SNXliIPBXqAVbJCASffH4W38S4H4vPELkVC9wT7a50wG7Q7Xr6JNyKMVWqdf2yOsnqjX
 z6Zlxf2uSbfiSoNsPlVJHF25fnGnCi1neWRrnYbgJiNfy9Kr2hnmjY3Mbsm281wAEPKP
 cyxa6Qrfjro+ExPf7E5RXCoDud1wwujQT+GxEz6oRIPHjFrsaRp6jtCCStFZpJoyfFjO
 jZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=psHh2UMcpTwxuh1Mg5pEoyy7vl9g9lmcMNdz/Ob0jOg=;
 b=JrsG2p9XKv8A3ZUzOlmRl/qrDO33aTGc4PR41cPFhg0OvDa0VTKq7NWr6Bl7P4Du1G
 bTpQEXr66rS0AfjBW8wQOY5ln+9rWlSJc7rZkqTUO8Ke7eJp7FyiKdfdbiHOquYOWnah
 mdPKFi+rcuvVTHGQblZFLm3qqKfrhqgU65TJy9Fvi/FHL8FXn8XisJqS/iJZYC2xhkst
 b7l1BHleP/BBBhvOqXxca5zku8ccVN+L7xhLvt7qLN4OP7pX2Njp4gHnsHjDItMdmC7c
 qkMHdhSsodSPJ5ZPXtc78MGAEwaL1L2anN9QcbkO0Cqla/glsFVc6yEPgy3YZBdhUI/F
 y2fw==
X-Gm-Message-State: ACgBeo1/pSn5mrmjUkS4ms5yv3DOH5PnPLtTnkrMY/qHghhSgE3mW7d8
 1h4ibEW93/y5wulqqU8NnwGGnXBIWRU78m0azic=
X-Google-Smtp-Source: AA6agR499f9BOqvl/IxNe2K6zMmFkNrtpuk4hEeaugAIrN3bdJ3NQxDMwmRYT0SJBtI+53uyptlgP7sq+dg+ktbbKj4=
X-Received: by 2002:ac8:5b0d:0:b0:344:8ba5:420b with SMTP id
 m13-20020ac85b0d000000b003448ba5420bmr7845426qtw.391.1661517518407; Fri, 26
 Aug 2022 05:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <1709102.QJTYiT9k8f@silver>
 <CAEUhbmUWScohEG7aV9UfU1ARj5y6wmam+uqJ4zyFMHnyfwzr=Q@mail.gmail.com>
 <17308910.sOD9EhOjFm@silver>
In-Reply-To: <17308910.sOD9EhOjFm@silver>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 26 Aug 2022 20:38:27 +0800
Message-ID: <CAEUhbmWL95M5HAp6XHgRzPo4Zmcb24T1Pnd4P+S+ba7L4g8MJA@mail.gmail.com>
Subject: Re: [PATCH 09/51] fsdev/virtfs-proxy-helper: Use
 g_mkdir_with_parents()
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Greg Kurz <groug@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x831.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Fri, Aug 26, 2022 at 7:16 PM Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> On Freitag, 26. August 2022 12:30:20 CEST Bin Meng wrote:
> > On Fri, Aug 26, 2022 at 6:09 PM Christian Schoenebeck
> >
> > <qemu_oss@crudebyte.com> wrote:
> > > On Mittwoch, 24. August 2022 11:39:47 CEST Bin Meng wrote:
> > > > From: Bin Meng <bin.meng@windriver.com>
> > > >
> > > > Use the same g_mkdir_with_parents() call to create a directory on
> > > > all platforms.
> > >
> > > The same would be g_mkdir(), not g_mkdir_with_parents(), so please use
> > > that
> > > instead.
> >
> > No, g_mkdir() is a deprecated API.
>
> Where did you got that from? AFAICS g_mkdir() does not seem to be deprecated:
> https://gitlab.gnome.org/GNOME/glib/-/blob/main/glib/gstdio.c#L1201
> https://gitlab.gnome.org/GNOME/glib/-/blob/main/glib/gstdio.h#L131
>
> > Search result (https://docs.gtk.org/glib/?q=mkdir) shows only
> > g_mkdir_with_parents().
>
> Yeah, but that does not say that it was deprecated.
>

Umm, correct. However I don't remember where I got the statement that
it was deprecated.

Maybe I was misled by the doc. Do you know why does the doc not
document g_mkdir()?

Regards,
Bin

