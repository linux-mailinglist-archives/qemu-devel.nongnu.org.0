Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFCC40731D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 23:53:06 +0200 (CEST)
Received: from localhost ([::1]:46602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOoSI-0003cJ-2Z
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 17:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mOoR3-0002bT-5T
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 17:51:49 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:34601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mOoR1-0004xB-2O
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 17:51:48 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so1765212wmh.1
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 14:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TwJV9G/CfCLd1Qgaohwlb5dCcp0v9mFQ9D9d9HHmq7E=;
 b=a1TsEnEU/5KoP6lrqlRZ97pqb+BcegZE1y0YwRrsqtgdfRnt76XUK28mP4BJPFGlw6
 GQn5ObFjr03FnatuDr5geIMoQfueYrbPJ3Ol372Ojossx4l1RkC3m7gwW2eHMnv4jipG
 /ElrvjYoNiLuQf8f9zHF+CJ33T9aKxUlyTbo0dTMnHB4VZoai7rtDCduwKXmHf0gyR6D
 NsxIsSd45fS7MU/EBpqQ+NM0cvoEWB+cRPhy20iIfn32OiqBALID7ULVn+/sjSDMxv2j
 JOll3EG9Y9XYosYSzj9H3Oi/4n3WyR5ZDrM5q26cv1bkmB/SXAHlPSFsUZ9eNrEfnveD
 4oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TwJV9G/CfCLd1Qgaohwlb5dCcp0v9mFQ9D9d9HHmq7E=;
 b=D18FSWzX7TIKV9Bh9e1+cm94+Qde7CWgO88h97eVgM4PzaPE/SKe2Yyg/TZGpbx7J7
 YChMFDlVP8YQ7xaib+4H7mRbgjMDh3xbwtN+7sBSCGivOLokApz88N17odQVvTobAmq+
 sM3UqhSJBCX2ROCNMVSAhLDUUX4g0RMBv0ktsSJHJPw1iiNzMLzZfa6bvziS1cR6VpOV
 2aL73GasQ0IYWas7QfmL54wQUlVHK4Zere+P9KwHToZFGJ23mKECv/GIjLqeX29fZilJ
 HdI+OhEPnUtbaindBIG82gGC/gpxMfQ1uYAIqQWRrR+/5iw19F9EoyVIn3Izx8mLyIfS
 nKfA==
X-Gm-Message-State: AOAM530EOCKBpUYupDMpCFdap1hc1bZ3SdferqIfyupp1DmhmYMIMJUc
 j6o7w7oWRVaLmCZ+IUTi8Ik=
X-Google-Smtp-Source: ABdhPJwJvc/EVceHf++qRrYeYPqBYetIz/hluy/FLnMKe6XK21SFGJPbfpRuOYvIhHth8VljTMbh8g==
X-Received: by 2002:a05:600c:b56:: with SMTP id
 k22mr9829452wmr.92.1631310704884; 
 Fri, 10 Sep 2021 14:51:44 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id t17sm5721065wra.95.2021.09.10.14.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 14:51:44 -0700 (PDT)
Subject: Re: [PULL 00/42] bsd-user updates to run hello world
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210910203011.63003-1-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <60d25fe3-60d5-b8d9-471b-e4adaa0c2205@amsat.org>
Date: Fri, 10 Sep 2021 23:51:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210910203011.63003-1-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.349,
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
Cc: kevans@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 10:30 PM, imp@bsdimp.com wrote:
> From: Warner Losh <imp@bsdimp.com>
> 
> The following changes since commit a61c30b8c8c3c8619847cfaa289233cc696f5689:
> 
>   Merge remote-tracking branch 'remotes/mjt/tags/patch-fetch' into staging (2021-09-07 10:15:48 +0100)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/bsdimp/qemu.git tags/pull-bsd-user-20210910

Well done, chapeau!

> for you to fetch changes up to be04f210f954bed8663943a94ece50c2ca410231:
> 
>   bsd-user: Update mapping to handle reserved and starting conditions (2021-09-10 14:13:06 -0600)
> 
> ----------------------------------------------------------------
> This series of patches gets me to the point that I can run "Hello World" on i386
> and x86_64. This is for static binaries only, that are relatively small, but
> it's better than the 100% instant mmap failre that is the current state of all
> things bsd-user in upstream qemu. Future patch sets will refine this, add
> the missing system calls, fix bugs preventing more sophisticated programms
> from running and add a bunch of new architecture support.
> 
> There's three large themes in these patches, though the changes that
> represent them are interrelated making it hard to separate out further.
> 1. Reorganization to support multiple OS and architectures (though I've only
>    tested FreeBSD, other BSDs might not even compile yet).
> 2. Diff reduction with the bsd-user fork for several files. These diffs include
>    changes that borrowed from linux-user as well as changes to make things work
>    on FreeBSD. The records keeping when this was done, however, was poor at
>    best, so many of the specific borrowings are going unacknowledged here, apart
>    from this general ack. These diffs also include some minor code shuffling.
>    Some of the changes are done specifically to make it easier to rebase
>    the bsd-user fork's changes when these land in the tree (a number of changes
>    have been pushed there to make this more possible).
> 3. Filling in the missing pieces to make things work. There's many changes to
>    elfload to make it load things in the right places, to find the interpreter
>    better, etc. There's changes to mmap.c to make the mappings work better and
>    there's changes to main.c that were inspired, at least, by now-ancient changes
>    to linux-user's main.c.
> 
> I ran checkpatch.pl on this, and there's 350-odd errors it identifies (the vast
> majoirty come from BSD's fetish for tabs), so there will need to be a V2 to fix
> this at the very least. In addition, the change set is big (about +~4.5k/-~2.5k
> lines), so I anticipate some iteration as well just based on its sheer
> size. I've tried to keep each set small to make it easy to review in isolation,
> but I've also allowed some interrelated ones to get a little bigger than I'd
> normally like. I've not done the customary documentation of the expected
> checkpatch.pl output because it is large, and because I wanted to get review
> of the other parts rolling to get this project unstuck. Future versions of the
> patch will document the expected output.
> 
> In addition, I noticed a number of places where I could modernize to make the
> code match things like linux-user better. I've resisted the urge to do these at
> this time, since it would complicate merging the other ~30k lines of diff that
> remains after this batch. Future batches should generally be smaller once this
> one has landed since they are, by and large, either a bunch of new files to
> support armv7, aarch64, riscv64, mips, mipsel, mips64, ppc, ppc64 and ppc64le,
> or are adding system calls, which can be done individually or small groups. I've
> removed sparc and sparc64 support as they've been removed from FreeBSD and
> have been near totally busted for years.
> 
> Stacey Son did the bulk of this work originally, but since I had to move things
> around so much and/or retool that work in non-trivial ways, I've kept myself as
> author, and added his signed-off-by line. I'm unsure of the qemu standard
> practice for this, but am happy to learn if this is too far outside its current
> mainstream. For a while Sean Bruno did the merges from upstream, and he's
> credited using his signed-off-by in appropriate places, though for this patch
> set there's only a few. I've tried to ensure that others who have work in
> individual patches that I've aggregated together also are reflected in their
> signed-off-by. Given the chaotic stat of the upstream repo for its early
> history, this may be the best that can be reconstructed at this late date. Most
> of these files are 'foundational' so have existed from the earliest days when
> record keeping wasn't quite what I'd wish for in hindsight. There was only
> really one change that I could easily cherry-pick (Colin's), so I did that.
> 
> ----------------------------------------------------------------
> Colin Percival (1):
>   bsd-user: Add '-0 argv0' option to bsd-user/main.c
> 
> Warner Losh (41):
>   bsd-user: remove sparc and sparc64
>   bsd-user: add copyright header to elfload.c
>   bsd-user: Add Stacey's copyright to main.c
>   bsd-user: add license to bsdload.c
...

