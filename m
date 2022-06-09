Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B42D5544EE3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:26:07 +0200 (CEST)
Received: from localhost ([::1]:46622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJ6s-0000u4-Gx
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzIOH-0000qp-IQ
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:40:03 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:39582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzIOF-0003it-MB
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:40:01 -0400
Received: by mail-pl1-x631.google.com with SMTP id o17so20281390pla.6
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 06:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4aSPInwHSsWfJngH3aENAwvVPqutgVR9oemg1RfYZes=;
 b=QFbb66o+Q4HDVAKsEGLieEg5ZxtZ9V0Y510YR3q33/nt2HRr0maO5Cdqd50ljf1rWf
 6+tsg6Kp0fkZ5yOokqhshismmP0rrfK5zeboK9hfxPdXE5/PSFd7IYjaIaDDbHu4ZPRu
 5TuPCf9EjlFOEC1fupKGQAjoZ9KuACvW6hNv1sD8dCJkLSeAJLw+C868/h1r9FwBnSXH
 KqRpIt2QjAUeny6LFgIvJojYsIV+AATDdSh3WlnRmjeqYjBLZx6zNAS5/zw5BPfLKvTY
 tfPSKs8+kDb1dL/Cv8gr2sO+L5nm7pw/hEOAwymzGjXV0pc8uETObFZnlu82FyyJnaTl
 DNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4aSPInwHSsWfJngH3aENAwvVPqutgVR9oemg1RfYZes=;
 b=BmCS4/N85pWB9xgPveJ97fDghcf1XPN8SqIZjByP3uzDVp4dd7zGwwGbY1NJVcp/GX
 o2JKbz7/4Kie6kT9Ziu4huaAmc1a0mpbKxBYtQc3HlG8638EEwAPTqaRYQ1UwsreR8Or
 0Epqf7kPf1qK7d6Sj1MowF7oKo9vSvL1g0P9TPly/1IeOxRq2zRjJUPXLO93Kj8ViU86
 AzMt46YRQ+9G4QYaqgPqZJzURdI9TvpL9Pp0bjQMhEmkB55ThyKuGsmvGAXpW7dh1rhE
 g9vBG9dY4gA0OQdkg7djXtiZH3O6+WcoT3PWbwgtzdDCbaq3hHIt+3dQfobN2WeTZjHY
 TCZQ==
X-Gm-Message-State: AOAM533bMU4eL4cAnUqsq4Orl4/6HasbujpDF2pYI1LntQ6LvoRcjeus
 101vajHYOT6fadKW2b+AnDcHLo1tNm+SlBuKffZksA==
X-Google-Smtp-Source: ABdhPJypt58uFVPYT+8HNAMeBoxZfsyjSjpmqBVJulau9f1zfwMtKK0daMhHrjRFX+OCuf5CM/ddeZpbcsG33d/7J/g=
X-Received: by 2002:a17:90b:1e47:b0:1e6:7d04:2f4 with SMTP id
 pi7-20020a17090b1e4700b001e67d0402f4mr3465151pjb.93.1654781997210; Thu, 09
 Jun 2022 06:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220605001632.3402-1-oxr463@gmx.us>
In-Reply-To: <20220605001632.3402-1-oxr463@gmx.us>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 14:39:45 +0100
Message-ID: <CAFEAcA-QWSYHtk=KeuFhKgZ8g0ktJYK_KLZTBzL-JY_ZCvztRA@mail.gmail.com>
Subject: Re: [PATCH] docs/devel/*.txt: convert remaining files to
 restructuredText
To: oxr463@gmx.us
Cc: qemu-devel@nongnu.org, Lucas Ramage <lucas.ramage@infinite-omicron.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
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

On Sun, 5 Jun 2022 at 01:16, <oxr463@gmx.us> wrote:
>
> From: Lucas Ramage <lucas.ramage@infinite-omicron.com>
>
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/527
> Signed-off-by: Lucas Ramage <lucas.ramage@infinite-omicron.com>
> ---
>  docs/devel/{blkdebug.txt => blkdebug.rst}     |  8 +++++-
>  docs/devel/{blkverify.txt => blkverify.rst}   | 12 ++++++---
>  docs/devel/index-build.rst                    |  2 ++
>  docs/devel/index-internals.rst                |  5 ++++
>  docs/devel/{lockcnt.txt => lockcnt.rst}       | 25 ++++++++++---------
>  ...e-iothreads.txt => multiple-iothreads.rst} |  3 +++
>  docs/devel/{rcu.txt => rcu.rst}               |  0
>  docs/devel/{replay.txt => replay.rst}         | 11 +++++---
>  ...tio-migration.txt => virtio-migration.rst} |  6 ++---
>  9 files changed, 48 insertions(+), 24 deletions(-)
>  rename docs/devel/{blkdebug.txt => blkdebug.rst} (99%)
>  rename docs/devel/{blkverify.txt => blkverify.rst} (94%)
>  rename docs/devel/{lockcnt.txt => lockcnt.rst} (95%)
>  rename docs/devel/{multiple-iothreads.txt => multiple-iothreads.rst} (99%)
>  rename docs/devel/{rcu.txt => rcu.rst} (100%)
>  rename docs/devel/{replay.txt => replay.rst} (96%)
>  rename docs/devel/{virtio-migration.txt => virtio-migration.rst} (98%)

Thanks for these conversions. Unfortunately at least the version
of Sphinx I have doesn't seem to be happy with them :-(

replay.txt was converted in commit 04d0583a4f5d000 already.

On my version of Sphinx there are a number of errors reported
(since Sphinx bails out on first error you need to fix up each
one to see the next):

/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/docs/devel/blkverify.rst:70:Unexpected
indentation.

/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/docs/devel/rcu.rst:43:Block
quote ends without a blank line; unexpected unindent.

/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/docs/devel/rcu.rst:89:Inline
emphasis start-string without end-string.

/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/docs/devel/rcu.rst:103:Definition
list ends without a blank line; unexpected unindent.

/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/docs/devel/rcu.rst:112:Unexpected
indentation.

/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/docs/devel/rcu.rst:120:Inline
emphasis start-string without end-string.

/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/docs/devel/rcu.rst:129:Inline
emphasis start-string without end-string.

/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/docs/devel/rcu.rst:151:Inline
emphasis start-string without end-string.

/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/docs/devel/virtio-migration.rst:12:Unexpected
indentation.


These are caused largely by two things:

(1) An indented section in the documentation that's intended to be
an ASCII-art diagram or command line example and should be rendered
in fixed-width text needs to be preceded by a double-colon. Otherwise
it's just a normal indented paragraph (and if it has things like
multiple lines with indentation of their own then Sphinx will complain
about incorrect intendation).

(2) Text like
 typeof(*p) qatomic_rcu_read(p);
needs to be surrounded by ``...`` so that the '*' isn't interpreted as
the *emphasis* markup (and also so it ends up as fixed-width font).
That in turn means that we should mark up the other cases in rcu.rst
similarly even if they happen not to have '*' characters, for consistency.

Also, if you look at the rendered HTML for these files you'll
see it looks a bit odd where Sphinx's formatting rules don't find
the input text to be a syntax error but still aren't interpreting
it the way the original text documentation was written, as for
instance in the list of rule attributes in blkdebug.rst.

Finally, when a .txt file has a copyright/license statement in it,
we don't want that to appear in the rendered HTML documentation.
We handle this by putting it in a Sphinx comment. There's an
example of this in docs/system/replay.rst.

Since all that implies that each of these files is going to need a bit
more changes than just fixing up the section titles, I think it
would probably be preferable to split this into more than one commit.

thanks
-- PMM

