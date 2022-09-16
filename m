Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E985BB043
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 17:33:02 +0200 (CEST)
Received: from localhost ([::1]:54470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZDKu-0007ST-DG
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 11:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZDFn-0002gX-Pz; Fri, 16 Sep 2022 11:27:43 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:34477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZDFl-0000MI-Of; Fri, 16 Sep 2022 11:27:42 -0400
Received: by mail-qt1-x832.google.com with SMTP id g12so15801767qts.1;
 Fri, 16 Sep 2022 08:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=peLlS5tX3NLZYK10X0e0PQ+++SXbdcwGqNp0yASG/xs=;
 b=W+Vgy/qBIImwUsZ7gv+7P4xkuIQfR5AKQhLur50zyJsDIOucGweWBeCkAS3ooaS1dA
 YJzCJKIiDJvvgSAojN7UaG82ElB5yLUNcE6oOJ+GNeNuw/8965yO8d+q+Za8h3f4bTw9
 GA2olIYyd76hNYtzw2B4CskhcN9UkuCoSJ7lK3PMGwTELNLJ7K//sGaWGQY64BjvtMNu
 CxSWAuNokxYZCk1fEaJCBpnoCX2mEQJqaWwSAtNUj705GXhgD+82ehcSB8jiqGzWCRVB
 9AkLdEa1PkAf1T3EN45mTLjzL+g24EiwurfygGLrzobRHnVkw0FpAIQ1Dy+kjHyzC6fL
 YyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=peLlS5tX3NLZYK10X0e0PQ+++SXbdcwGqNp0yASG/xs=;
 b=PexkdgX5EBnMPH8iYeykKUB5WtukzjLOgnYnor5EdM7kQz5tH1GrJtox3CPkAXPe0c
 2vaZjjWXBYXw4y0jrh0yvbx9hvSlZ8Zgl16QplSUUqWXr+vKmzCD9j8UBWy8UIL95hyG
 EHVHhbQjwEyrCjlwHvDuSTP7oPZAGd8xfkrCMLhIafBdcgcytKn/4X7KmDEypEdertLi
 6iaDvpeWbbYmjiEqP5QfzvdArNKgAWvXVdbWfRKuSbwpKg5JwS6bccIBaxA6T90qDrm5
 mVvjuTZjAfEJcQBsvDmdXkaip9i4lplXZazaS6B/cbQa8qo92Ivq1AgWthq7Ci/UvLGq
 snpQ==
X-Gm-Message-State: ACrzQf3M6w9qPPFGUaTCIelJbGjtIUaKb1p9dILK/2xBndIcYIa16hHI
 Jyg9ldLTufUzLynK15E0dHq59TtPvsd3JsuaKmY=
X-Google-Smtp-Source: AMsMyM6AFUIv3uJNAEhcHg2POTff0z3dXpFc46PxkOC7sh2i24rwVKTVUuOaRCL6xlwCaQKf8mLh4/NZEClVilo0hF8=
X-Received: by 2002:ac8:5b0d:0:b0:344:8ba5:420b with SMTP id
 m13-20020ac85b0d000000b003448ba5420bmr4964877qtw.391.1663342059361; Fri, 16
 Sep 2022 08:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220915152520.21948-1-shentey@gmail.com>
In-Reply-To: <20220915152520.21948-1-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Sep 2022 23:27:28 +0800
Message-ID: <CAEUhbmU-dgBg4bmezEEBiKBVx06Dz-Zykv9JFyna6LyboVt7Hg@mail.gmail.com>
Subject: Re: [PATCH 00/11] ppc/e500: Add support for two types of flash,
 cleanup
To: Bernhard Beschow <shentey@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x832.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Bernhard,

On Thu, Sep 15, 2022 at 11:25 PM Bernhard Beschow <shentey@gmail.com> wrote:
>
> This series adds support for -pflash and direct SD card access to the
> PPC e500 boards. The idea is to increase compatibility with "real" firmware
> images where only the bare minimum of drivers is compiled in.
>
> The series is structured as follows:
>
> Patches 1-3 perform some general cleanup which paves the way for the rest of
> the series.
>
> Patches 4-7 add -pflash handling where memory-mapped flash can be added on
> user's behalf. That is, the flash memory region is only added if the -pflash
> argument is supplied. Note that the cfi01 device model becomes stricter in
> checking the size of the emulated flash space.
>
> Patches 8-11 add a new device model - the Freescale eSDHC - to the e500
> boards which was missing so far.
>
> User documentation is also added as the new features become available.
>
> Tesing done:
> * `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -append
> "console=ttyS0 rootwait root=/dev/mtdblock0 nokaslr" -drive
> if=pflash,file=rootfs.ext2,format=raw`
> * `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -append
> "console=ttyS0 rootwait root=/dev/mmcblk0" -device sd-card,drive=mydrive -drive
> id=mydrive,if=none,file=rootfs.ext2,format=raw`

Thanks for the patches!

Did you get a chance to test the U-Boot image to work with pflash and eSDHC?

>
> The load was created using latest Buildroot with `make
> qemu_ppc_e500mc_defconfig` where the rootfs was configured to be of ext2 type.
> In both cases it was possible to log in and explore the root file system.
>

Regards,
Bin

