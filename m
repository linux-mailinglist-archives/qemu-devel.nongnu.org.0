Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074D260FF71
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 19:39:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo6p0-00032k-6H; Thu, 27 Oct 2022 13:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oo6ol-0002mZ-Cv
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:37:26 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oo6oj-0001ns-EX
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:37:22 -0400
Received: by mail-yb1-xb34.google.com with SMTP id m125so3047392ybb.6
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 10:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PHUFn9d3mwG+LPtBv+YyQ2sVugRZYahqtsdQhadKyZc=;
 b=J9T+jt3O3bOPobiU929uz10vGbeJijX6MvoSdGLgdfNRP6qp/AUJdiGjwa9Jbc7n6m
 czQ/nFPng9PfoxBtnxueRMdnjSpfjPCp7u/Grb07CNNPuDUtzneqwA4ZO0ODhbxaFbcT
 Ot6XIq8Afi1eSKiJTRC/rGYszqqUcUSKeoko7oStf/Aqt3TbhcmuITtWU+mTT/J/n2YE
 ox6XIkSk5OAOd+dDdflhkjWvZrkGGaTI0iP+X6523gfS8gSHLVan+LmsQtGkwGNw8dL7
 U9DsWH86zMEWmx4TtZBKC3b9f4Vi443r22N0t+u2oBZzh630pzQEyLnfDM3ejrIkk27i
 TsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PHUFn9d3mwG+LPtBv+YyQ2sVugRZYahqtsdQhadKyZc=;
 b=2x6N3AzDwHgfuWfoB+MUCzZE70clIzd1utbkdrXsnXgQcNsz9A3xOSaTlWCMnf3jvF
 OvUvS/uYH8dfKN2umRjqbHe150ZnAVJvGjCMs0jHafeSDbo9bsdUke2YuNh1kGOirLx0
 RKPA10q5N1IIkhLakVq3qKcTU7kDpNeuS3XXP5Ysiv6C6571FPEVjf19Ul4IYBDmvF9J
 0jnXcTaqhfDkFSbsDGL5dLWXWwLO7De8mnbUt5gnMMwGNwzsSikaYgsrXKnRe9quTXP+
 RJVDmbNska1M8oqDiESW1sSBIlLu/4W8iw13xLRSFNKM2zxLdW81je+j2lJOOI3rSE6Y
 PjaA==
X-Gm-Message-State: ACrzQf3+/zytnQecZzHPdQSQ6wV59WOkiACi5wbpKPpTnzEJ9wOlPGgZ
 Qz+rXn9SBAQOuOzv7lvY0Dt8dF1/capPOXUWdvY=
X-Google-Smtp-Source: AMsMyM5J8xrnbx6f/36lMaZATEq4j26oM1KDFsHGiOf9Bw3uR8aFAIOzv18m0x7q0sbYY3s1LqSSCzoqTbyqoGgoxiY=
X-Received: by 2002:a25:bfc2:0:b0:6c0:fec7:ae64 with SMTP id
 q2-20020a25bfc2000000b006c0fec7ae64mr41747011ybm.366.1666892239466; Thu, 27
 Oct 2022 10:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1666608862.git.qemu_oss@crudebyte.com>
 <4ad773a9-2173-3667-47f8-2713efffa053@redhat.com>
 <3438372.x9l1EUDYgq@silver>
In-Reply-To: <3438372.x9l1EUDYgq@silver>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 27 Oct 2022 13:37:07 -0400
Message-ID: <CAJSP0QU62wy6sN7CULhDtcXMufQvpF8CgRQDOSVw5w7JYC_p-g@mail.gmail.com>
Subject: Re: [PULL 00/23] 9p queue 2022-10-24
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, 
 Linus Heckemann <git@sphalerite.org>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 27 Oct 2022 at 12:38, Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> On Thursday, October 27, 2022 5:53:47 PM CEST Thomas Huth wrote:
> > On 24/10/2022 12.54, Christian Schoenebeck wrote:
> > > The following changes since commit 0529245488865038344d64fff7ee05864d3d17f6:
> > >
> > >    Merge tag 'pull-target-arm-20221020' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-10-20 14:36:12 -0400)
> > >
> > > are available in the Git repository at:
> > >
> > >    https://github.com/cschoenebeck/qemu.git tags/pull-9p-20221024
> > >
> > > for you to fetch changes up to 3ce77865bf813f313cf79c00fd951bfc95a50165:
> > >
> > >    tests/9p: remove unnecessary g_strdup() calls (2022-10-24 12:24:32 +0200)
> > >
> > > ----------------------------------------------------------------
> > > 9pfs: performance, Windows host prep, tests restructure
> > >
> > > * Highlight of this PR is Linus Heckemann's GHashTable patch which
> > >    brings massive general performance improvements of 9p server
> > >    somewhere between factor 6 .. 12.
> > >
> > > * Bin Meng's g_mkdir patch is a preparatory patch for upcoming
> > >    Windows host support of 9p server.
> > >
> > > * The rest of the patches in this PR are 9p test code restructuring
> > >    and refactoring changes to improve readability and to ease
> > >    maintenance of 9p test code on the long-term.
> >
> >   Hi Christian,
> >
> > I think this PR broke the FreeBSD CI jobs:
> >
> >   https://gitlab.com/qemu-project/qemu/-/jobs/3219611457#L3116
> >
> >   https://gitlab.com/qemu-project/qemu/-/jobs/3219611460#L3372
> >
> > Could you please have a look?
> >
> >   Thanks!
> >    Thomas
>
> I try, but will certainly take some days, especially as I currently don't have
> a BSD installation at hand to try the changes.

QEMU has the automation to run FreeBSD builds locally (in a VM):
$ make vm-build-freebsd

Not sure if that FreeBSD environment matches the one in Cirrus CI
though. If they are different then maybe it won't reproduce locally.

Stefan

