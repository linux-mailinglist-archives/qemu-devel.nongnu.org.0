Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DD741C141
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:04:25 +0200 (CEST)
Received: from localhost ([::1]:44122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVVVo-0002sN-Hg
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVVSa-00010n-P1
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:01:06 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:50818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVVSU-0007WI-Ev
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:01:03 -0400
Received: by mail-wm1-x333.google.com with SMTP id j27so1276809wms.0
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 02:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KnX5xF89EyI7+IfWy+Cx+R8aZTn784VMeJimk3Q3+Dw=;
 b=dRXTkvFecDBY6y96fTF53QV+AEoxa4fPtEUH6hHLSLx3lh/wzAgtKc50hm455g0uxG
 7j4Ak7MOIbuCI2uA5c4Seztoe8ae/CI4lTZpGFcPby5MEZ3CPatdrER8C9bZimNKUTMj
 xLE7o1/IMGufZeO2jBOxk8+bTwF+6XhnptwJL8JkIs3oyhd8MYhjh0JmzeMdJfmMPlA0
 0rzjFWvHo98Gkjx9Izsu9a5qRUMoj8//IBzDultEZULcm2lqfYljE2LhnAPDH2qIBgXY
 jKxPQfUeq2v1fTxKrdPZOfifMzbaW40r+Ei6lRQVS2BSGPyX1m4rgfZDJbTp5pT9jTWp
 zr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KnX5xF89EyI7+IfWy+Cx+R8aZTn784VMeJimk3Q3+Dw=;
 b=cvEZME6gSl6NV4ff084lmKEnGc2UpWTwfhpV4zaMIJxVyGH/HpKx/7M/7vtQ7W+v3p
 IkO/j9B5Li+Et3Y59pNjRHnAHPZ9e55OfcbMq7zMzEcZKuUjeCkV9eyfI9ouq8YOlKm4
 UlTIcDvgdNENmLiXChUg0JJf37kcqqByyEf/J7FF1DNoAZZQ+ZqbufAeC0UgbXIFDPAo
 Jei4+qvI08ke//GJ3KyIkg/jTeS/S0VmkLW2Ay1CRHhMST9UGjyKfrGe3Q1n+zFLeGRh
 SKIZvNfoV1CfsnXysOk3dMVbQ/icrqMHYcOk3TQYuCa0b4wol57AwxBcgbfE5F7MgXrX
 6tkQ==
X-Gm-Message-State: AOAM532cljcIBVDzn9VMkSrRKNGWfMNudauJPUCxy8GnonzGcQHZkc6l
 1osdIw8gHkKqsgRHFknpqK1y8/MpCWrTxYUBxQgGJw==
X-Google-Smtp-Source: ABdhPJwdeqwS8UEBwcjxXeTg5HiovQgYKUSDrPcZ4WEr8g4HI1wpgIYbUUjfU2jcIDulHWBhgS8ZOn9jocC017VxLhQ=
X-Received: by 2002:a1c:a54e:: with SMTP id o75mr9135123wme.32.1632906052954; 
 Wed, 29 Sep 2021 02:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210927215545.3930309-1-eblake@redhat.com>
In-Reply-To: <20210927215545.3930309-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 29 Sep 2021 09:59:59 +0100
Message-ID: <CAFEAcA9P_xzSce_3bVKO95HOdhbf1aqVJ-eiXOkJ09Hj4ow+bg@mail.gmail.com>
Subject: Re: [PULL 00/20] NBD patches through 2021-09-27
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 27 Sept 2021 at 23:02, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit 9b03a1178204598055f23f24e438fdddb5935df9:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.2-pull-request' into staging (2021-09-27 11:08:36 +0100)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-09-27
>
> for you to fetch changes up to 3cb015ad05c7c1e07e0deb356cd20e6cd765c0ea:
>
>   nbd/server: Add --selinux-label option (2021-09-27 16:16:28 -0500)
>
> ----------------------------------------------------------------
> nbd patches for 2021-09-27
>
> - Richard W.M. Jones: Add --selinux-label option to qemu-nbd
> - Vladimir Sementsov-Ogievskiy: Rework coroutines of qemu NBD client
>   to improve reconnect support
> - Eric Blake: Relax server in regards to NBD_OPT_LIST_META_CONTEXT
> - Vladimir Sementsov-Ogievskiy: Plumb up 64-bit bulk-zeroing support
>   in block layer, in preparation for future NBD spec extensions
> - Nir Soffer: Default to writeback cache in qemu-nbd
>
> ----------------------------------------------------------------

This seems to break the gitlab cross-i386-system build,
which now fails to link qemu-nbd because it is trying
to link the x86-64 libselinux.so into a 32-bit binary:

https://gitlab.com/qemu-project/qemu/-/jobs/1630661323

cc -o qemu-nbd qemu-nbd.p/qemu-nbd.c.o -Wl,--as-needed
-Wl,--no-undefined -pie -Wl,--whole-archive libblockdev.fa libblock.fa
libcrypto.fa libauthz.fa libqom.fa libio.fa -Wl,--no-whole-archive
-Wl,--warn-common -Wl,-z,relro -Wl,-z,now -m32 -m32
-fstack-protector-strong -Wl,--start-group libqemuutil.a
libblockdev.fa libblock.fa libcrypto.fa libauthz.fa libqom.fa libio.fa
@block.syms /usr/lib/libgnutls.so /usr/lib64/libselinux.so -lutil
-L/usr/lib -lgio-2.0 -lgobject-2.0 -lglib-2.0 -L/usr/lib -lgio-2.0
-lgobject-2.0 -lglib-2.0 -lm -pthread -L/usr/lib -lgmodule-2.0
-lglib-2.0 /usr/lib/libpixman-1.so /usr/lib/libzstd.so
/usr/lib/libz.so -Wl,--end-group
/usr/bin/ld: /usr/lib64/libselinux.so: error adding symbols: file in
wrong format
collect2: error: ld returned 1 exit status


-- PMM

