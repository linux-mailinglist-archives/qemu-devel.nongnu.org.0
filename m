Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 485084D9E55
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 16:05:35 +0100 (CET)
Received: from localhost ([::1]:45382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU8ju-0003AH-8G
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 11:05:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU8i9-0002Rw-LL
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 11:03:47 -0400
Received: from [2607:f8b0:4864:20::b32] (port=35397
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU8i3-0004y6-Nx
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 11:03:44 -0400
Received: by mail-yb1-xb32.google.com with SMTP id o5so8986415ybe.2
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 08:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ADTQNWD4X4lM5CkmD5nNwhaDrqDN+zQQmnPBsWNoddI=;
 b=UX2EoIf3FWsG/aMleQuay+SqXwC8KC7TWpHrfaxFQV7DI3uLNsdYGEjWEwKvO88nms
 mj80WWx3e5BOGr1OlqbVJB0t0sAB1X9cPgvAdJwgvFnrhqQsmbYZvAuEAGoSpbmP9sbG
 RJ/tIax4vh/+avwUzrfWnIQvlkBvtm2P3OaXA0Bx6ZbGroCXUYAg5mUiugJ8iBaI4tAr
 3yzxrNGi2GXCua9k0FbzpEPXvp7D36tWu1oypKyEruqqhjQe1P7uiuLnMb1lJ4KJwP2+
 q9F0fzr3XRLeqbJJQZJpbqTfHd7qOplPSbi2NlxNEQUW0c2UI/fZ8XeA6jPJki3cJ3qR
 R9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ADTQNWD4X4lM5CkmD5nNwhaDrqDN+zQQmnPBsWNoddI=;
 b=A9jJmhNnFvxFoTabNzzRL51FraVLiG/79IzCMyt94FCo3m4xnYqHZyqsNLXLsJb5dq
 FfbBxK2+tQJckADa/OuxCc7oKLN9NVCDmkCQdBPdMslk/Hf6KK5U6X2nOD5KhG3h/BAA
 7LqkIYzAtc450D/WSo3XwijhLeY9z/7X1SJKhpP9ZAxk/rMnCKlvecgOplFm/q2tCd8F
 Vk65G18jWqcNd8t2ZrIk8g7PUBtM6mAa7aFJjbdCj7+8HqLG8YkJtnYyCuCTKmZqCFOM
 e52TNI7v5WG1T7BzbK6XW38No4dxx07wnu6f4z+kEEHDRbFLjtkcQryOmCI9LVDdktsw
 l9Ug==
X-Gm-Message-State: AOAM531O2jlOc9YXU3f1bgLzMDgH+5qU3MsCD1wLHe83IRCZNlkGM0zX
 czQpof229rbCt7XNNXsBg0pVogR9f5jr6ld0nVh7cg==
X-Google-Smtp-Source: ABdhPJy/FduZUNzM9UQkWzz/ao5+YpX90acrBR8h1IOuiSXc+uFTp5JLaI6yx2yVn8zZ0XvmAx00HNxBgs62d53rVUU=
X-Received: by 2002:a25:b11c:0:b0:62c:16d9:c028 with SMTP id
 g28-20020a25b11c000000b0062c16d9c028mr23887380ybj.288.1647356617818; Tue, 15
 Mar 2022 08:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220302182936.227719-1-dgilbert@redhat.com>
 <CAFEAcA9CrHEu8F7PGGTvsdyLnFJhan9V9FkHDgvapje+_E=hVA@mail.gmail.com>
 <f750a1a4-223c-9456-ab23-a616f7eb2625@gmail.com> <Yieku+cTxY0Xyp5C@work-vm>
 <CAFEAcA-Y_8KTxCPoSN3P0Cgfe6cEN74b-5U1SeKtAP7FdzFvZA@mail.gmail.com>
 <Yi92SN2Z3OZi82pS@redhat.com>
 <CAFEAcA-Chg3LQkh5PHmSyGCkmnYoPnTGMD=zm8jj-jxWeOLTxQ@mail.gmail.com>
 <CAFEAcA-bhoyo+EfQGOuHWeEWC8-M-tGv=fXjEAJ6XX==iiO14w@mail.gmail.com>
 <CAFEAcA96Jx4XsdveTVgxkqWT-TBVm_K06sN+U+fofnxzGaVOWw@mail.gmail.com>
 <CAFEAcA-3PRgVaQ_GXg_ZDp6hNUh=_rc3PiY6_6_7wUYi-oqEow@mail.gmail.com>
In-Reply-To: <CAFEAcA-3PRgVaQ_GXg_ZDp6hNUh=_rc3PiY6_6_7wUYi-oqEow@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 15:03:26 +0000
Message-ID: <CAFEAcA_SUCgXCL3yE9e2H=ZUwn24uLvqSeTQVKuT+RUukOKrEQ@mail.gmail.com>
Subject: Re: multifd/tcp/zlib intermittent abort (was: Re: [PULL 00/18]
 migration queue)
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 s.reiter@proxmox.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, f.ebner@proxmox.com,
 Jinpu Wang <jinpu.wang@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Mar 2022 at 14:39, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 14 Mar 2022 at 19:44, Peter Maydell <peter.maydell@linaro.org> wrote:
> > On Mon, 14 Mar 2022 at 18:58, Peter Maydell <peter.maydell@linaro.org> wrote:
> > > I just hit the abort case, narrowing it down to the
> > > /i386/migration/multifd/tcp/zlib case, which can hit this without
> > > any other tests being run:
> >
> > > This test seems to fail fairly frequently. I'll try a bisect...
> >
> > On this s390 machine, this test has been intermittent since
> > it was first added in commit 7ec2c2b3c1 ("multifd: Add zlib compression
> > multifd support") in 2019.
>
> I have tried (on current master) runs of various of the other
> migration tests, and:
>  * /i386/migration/multifd/tcp/zstd completed 1170 iterations without
>    failing
>  * /i386/migration/precopy/tcp completed 4669 iterations without
>    failing
>  * /i386/migration/multifd/tcp/zlib fails usually within the first
>    10 iterations (the most I ever saw it manage was 32)
>
> So whatever this is, it seems like it might be specific to the
> zlib code somehow ?

Maybe we're running into this bug
https://bugs.launchpad.net/ubuntu/+source/zlib/+bug/1961427
("zlib: compressBound() returns an incorrect result on z15") ?

That bug report claims it doesn't affect focal, though, which
is what we're running on this box (specifically, the zlib1g
package is version 1:1.2.11.dfsg-2ubuntu1.2).

A run with DFLTCC=0 has made it past 60 iterations so far, which
suggests that that does serve as a workaround for the bug.

thanks
-- PMM

