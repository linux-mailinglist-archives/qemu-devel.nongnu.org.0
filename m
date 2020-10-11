Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9684C28A961
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Oct 2020 20:34:30 +0200 (CEST)
Received: from localhost ([::1]:35408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRgAv-0008Fy-GC
	for lists+qemu-devel@lfdr.de; Sun, 11 Oct 2020 14:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRg6N-00055p-C8
 for qemu-devel@nongnu.org; Sun, 11 Oct 2020 14:29:48 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:45997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRg6E-000827-JH
 for qemu-devel@nongnu.org; Sun, 11 Oct 2020 14:29:43 -0400
Received: by mail-ed1-x52b.google.com with SMTP id dg9so12259568edb.12
 for <qemu-devel@nongnu.org>; Sun, 11 Oct 2020 11:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K6mVv5+KQmMW68pXIonTELjyW9sTJ07uMQ+vmUL594M=;
 b=ShTLdfXiYQ5SS1jcLSl7POv8n1uhFuiWDI7skDLsly2EyrEqWsAq5O9qB7lfUQB6PH
 +f9SJ6X4ZBGj89vS76MeVH5CUf/m+0uLZNknJZFeuH52D18ojx7iASBQ3el3aNsdOJAf
 cB69YgKVcgN/KrldRDjjJ2a1YpfCPyHHvxyBsDjRWIJKI6x+OH1+2ODJ+WDBUSMxojT/
 t8lUIbShO8OrfwmDVwyrRkIyVK8bauXUrtSPEXOc0wsQRmmpIo4I5YfDJn9sMJ/sKXC8
 Mfouok1zxPLONO8DmPeE/I8fkAoGdy8Uk9YRsydUOBv26vgGiTTvHNwndjbUDJH0UwTf
 hIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K6mVv5+KQmMW68pXIonTELjyW9sTJ07uMQ+vmUL594M=;
 b=lEM3+f9+gzPgXX9bTSLWYTju5AZa4wZdwIA0rCvQS1yoEk1PVd3i/gDXYcJh5AIC/P
 egGNPgMjC7SOTcn78T9VwowM6pDsbZDWBXKHZHBWhKC2BabkHoc66br8ZeoDqQ4Wykg+
 WgO+oqWKgoYrrlyiBAHycFxzv3sjaVQPRGTwpY95iAGRX/q9kPFamY9iTK/Hk+NjXKrA
 UviCf3VegLtKJ8x2b4n9uIAiia2zNN3a6kPqLaghueAjf8+SpfquesZgYNDKDejqhrHa
 d93aBZuS6PeTYtN/C+ITkHtE+WZoPTPPKkdzOwvVsPpnFqumP4ZKwtYNE3T/HMVfRLDO
 K4Jg==
X-Gm-Message-State: AOAM531yZJVdeRz9kY2TbSPbl/rEqTzdTWPaOq2Q0jQUeDu0FbImoveC
 jEVZhJ2MgWi0rVqNyYnr8WqypD4sykVOz4x91+Xxvw==
X-Google-Smtp-Source: ABdhPJywTLw2KajjbNXdsOuFKpdoEkiVUlm5IPPnrYtb0/V7Em3lYS/q4RmB71UgMA+G0B/CN7E3sccYdp1Sz5tU+7o=
X-Received: by 2002:aa7:c302:: with SMTP id l2mr10408934edq.204.1602440976995; 
 Sun, 11 Oct 2020 11:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201008191046.272549-1-dgilbert@redhat.com>
In-Reply-To: <20201008191046.272549-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 11 Oct 2020 19:29:25 +0100
Message-ID: <CAFEAcA-U2BjAne57Zn7c4_J97NAZSYzzy6r59iVeGmtgfD3APg@mail.gmail.com>
Subject: Re: [PULL 00/10] migration queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 zhengchuan@huawei.com, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Oct 2020 at 20:13, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit e64cf4d569f6461d6b9072e00d6e78d0ab8bd4a7:
>
>   Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20201008' into staging (2020-10-08 17:18:46 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/dagrh/qemu.git tags/pull-migration-20201008a
>
> for you to fetch changes up to ee02b58c82749adb486ef2ae7efdc8e05b093cfd:
>
>   migration/dirtyrate: present dirty rate only when querying the rate has completed (2020-10-08 19:57:00 +0100)
>
> ----------------------------------------------------------------
> Migration and virtiofs pull 2020-10-08
>
> v2 (from yesterdays)
>   Updated types in comparison to fix mingw build
>   rebased
>
> -
> Migration:
>   Dirtyrate measurement API cleanup
>   Postcopy recovery fixes
>
> Virtiofsd:
>   Missing qemu_init_exec_dir call
>   Support for setting the group on socket creation
>   Stop a gcc warning
>   Avoid tempdir in sandboxing

This seems to hang in 'make check' trying to run
tests/qtest/migration-test on s390x and ppc, ie
the big-endian hosts.

thanks
-- PMM

