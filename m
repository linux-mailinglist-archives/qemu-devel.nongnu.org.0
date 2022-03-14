Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3A24D8B79
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 19:12:14 +0100 (CET)
Received: from localhost ([::1]:39784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTpAy-0007Ht-LY
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 14:12:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTp80-0005Uh-E3
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:09:10 -0400
Received: from [2607:f8b0:4864:20::112b] (port=44621
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTp7y-0004bk-Pv
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:09:07 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so173562197b3.11
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 11:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ty6Sy8sP7Ea8Gfvwa5eOkubSDB4AYxzjxgqe4xomWq8=;
 b=c+gEcYN3TKXhLXreyq35NbL5giRtWYfEoD/iDwTAL4bq0SoX7Jg05Syj+B8asm6bRJ
 eVHKZ/udtYGnh2UXEr/viQ4qeOMlORnWn0lQtvcfbSsG+Jse4ZvtIOU1U2Ng2751dKXp
 1WxLpMGUjDGGg7yV96r26rNqCOdqQl3k75CASB1AbH7h6F6tNm09Lg/SjjQgjGZGdz/e
 +R5ZlAZQPWdwDnurciFbwTJ8esGQ+uUIFIVcujiUSWDyJY98ZlSoWY9mCs2M5fjiPrl7
 ddHnSwsd+c9EivukLPlyvahumuOv7zMfMg9sCEXTnePzljOm9JU2y90bOXvnMG53zCox
 nroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ty6Sy8sP7Ea8Gfvwa5eOkubSDB4AYxzjxgqe4xomWq8=;
 b=FUBqh3ZkBQtDfoKljqCX/VncEzkVbJlfTRRCq42riBnev6dCfsFemegV4kEEwgonFo
 zBPHCNr7ijcwVAzIqMITJRBnvm0YB/wXvFVkU/p6rKP13nL7EZhRp9Yj+BrDQNLSMoef
 goizQ+T1W+8prnlJDkx/0VLoE4k7VWN5Mrol3dSzkWA0GBT1YWxEQiBTPJKb8gP9cU5p
 i+wpo48UdJ5S11EFY2cUH9lvzW57ggMVLHhmoHNCs4leMxRRoYlJriqNfxcMLCKQaovZ
 nhA8ftIs3yazg2D947ce7iOWtR7dnyRaGXJp70Jbl0zNGvm83tTS996c1LJVFfF39Mac
 824Q==
X-Gm-Message-State: AOAM530/sWWUgTePs7w/PYvknYcjJUFcrChxuPdJCeTc5+BR+Hkg4UGN
 0e+HBf6E3/x1ngFmfhrznltsX00Lt3i46YNn7pR3cg==
X-Google-Smtp-Source: ABdhPJwgDkihNGUO+dpFr/wAEj0YM3XcjsFcOSLdLQnIZB2bJrHVPFsWmLzF4NXaQOIp/y01Pghp6pm0c3ChfozeTEw=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr19693637ywh.329.1647281345601; Mon, 14
 Mar 2022 11:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220302182936.227719-1-dgilbert@redhat.com>
 <CAFEAcA9CrHEu8F7PGGTvsdyLnFJhan9V9FkHDgvapje+_E=hVA@mail.gmail.com>
 <f750a1a4-223c-9456-ab23-a616f7eb2625@gmail.com> <Yieku+cTxY0Xyp5C@work-vm>
 <CAFEAcA-Y_8KTxCPoSN3P0Cgfe6cEN74b-5U1SeKtAP7FdzFvZA@mail.gmail.com>
 <Yi92SN2Z3OZi82pS@redhat.com>
 <CAFEAcA-Chg3LQkh5PHmSyGCkmnYoPnTGMD=zm8jj-jxWeOLTxQ@mail.gmail.com>
 <Yi+BbRJ9lbJ4ku9L@work-vm>
In-Reply-To: <Yi+BbRJ9lbJ4ku9L@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Mar 2022 18:08:54 +0000
Message-ID: <CAFEAcA_z2M2_MyWXT7iUKAFzpj1vWsw0DPV7o4YHp2d-1scf9g@mail.gmail.com>
Subject: Re: [PULL 00/18] migration queue
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 quintela@redhat.com, s.reiter@proxmox.com, qemu-devel@nongnu.org,
 peterx@redhat.com, "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 hreitz@redhat.com, f.ebner@proxmox.com, jinpu.wang@ionos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Mar 2022 at 17:55, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> Peter Maydell (peter.maydell@linaro.org) wrote:
> > One thing that makes this bug investigation trickier, incidentally,
> > is that the migration-test code seems to depend on userfaultfd.
> > That means you can't run it under 'rr'.
>
> That should only be the postcopy tests; the others shouldn't use that.

tests/qtest/migration-test.c:main() exits immediately without adding
any of the test cases if ufd_version_check() fails, so no userfaultfd
means no tests run at all, currently.

-- PMM

