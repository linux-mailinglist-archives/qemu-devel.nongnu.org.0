Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1F461DA67
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 13:41:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orISq-0000QL-2z; Sat, 05 Nov 2022 08:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1orISn-0000Pr-NL
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 08:39:53 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1orISm-00089B-8G
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 08:39:53 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-367b8adf788so66083147b3.2
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 05:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wlGKTBxaOStH9MRHU78lBL3gvDguNAM2VpN/wRUaDyU=;
 b=GSqYf3sRbgjfCTdiIAtYlzVolOHNwxtEbJRcD8BVXz2aBDhTzgCvvYfu80Q7MrM5cn
 xbvwUid+UwNhIjGUc+h/ZHX8t72mIwBvKMKKqxsu4EaSTl4xBu0jEw5juFsn5bE0Eq5V
 ZVTqYaQzgS/x239WGOJ8Uvguk7AOFQcdugbadDrcZFW1jJEie7c6gTDbV0zGi7E8VKID
 5HTjg3wqu/szxUElh5KrERZgwtRSMi3MUHBD/n+wrXykye7yvMl47NvJS3tW4O3PuOxq
 6CkOBGFLnJmkCJoxOKmqEJtSI+UL04IysRMCwgxaynMg/2A1Zkl2vvVqXk6H5h+mDjPw
 y5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wlGKTBxaOStH9MRHU78lBL3gvDguNAM2VpN/wRUaDyU=;
 b=qa2WKyTC0i2zWNBmZMCz/Gtsd2YsEVrb0arwsKztzWwrqjg2i6ZuUIPbj1IAyQTva1
 u7UA2UeOkm3BLd8XDJGIeoyzIb7wdgzyFgW3wFVJ4jYKJqrJWdG5Hdllr+M0Q4OlmhqX
 Nfahg38GfeByn5uKUIlWFE2f1XGgL954R9XJQasosxdDk1nfA3D6MVs7/yMJnXaGaBkn
 JYnkpkflULcpg3E2CCquA1nDlzfPyJD4qcyZvOJ3ATvzhlShWT2wodHpKOIq3brU4oXa
 HAP21BVrpnevkJ6fbBE/r7K7nsG9RFIZTADgMxsFnS19362M9AuJXRJkgRlI2JxJGY4n
 cJYw==
X-Gm-Message-State: ACrzQf0Yzqzifaxy7MGRVMm98e4gUxQTp8VxWIKsNWjCrz+c4EaHMqdZ
 223RHLZgtgwCsSCs7+NxziT11Q/T49J1d6Rsoz4=
X-Google-Smtp-Source: AMsMyM44t4TKMCfqT6MzLThOnV6s1CyMOolO1L5TTTAgoGWkbT6D91l02Jd2LgZPdJg1OHjf2uyJWPwui/lKYXYd278=
X-Received: by 2002:a81:75c1:0:b0:369:b7df:f02 with SMTP id
 q184-20020a8175c1000000b00369b7df0f02mr433929ywc.239.1667651991056; Sat, 05
 Nov 2022 05:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221105032736.3789274-1-gaosong@loongson.cn>
In-Reply-To: <20221105032736.3789274-1-gaosong@loongson.cn>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sat, 5 Nov 2022 08:39:39 -0400
Message-ID: <CAJSP0QXYByLhFQs1ifgDN1YV2rHQGRCUdyQ58BjHhPmnZ7J10A@mail.gmail.com>
Subject: Re: [PULL v3 0/7] loongarch-to-apply queue
To: Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112d.google.com
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

On Fri, 4 Nov 2022 at 23:28, Song Gao <gaosong@loongson.cn> wrote:
>
> The following changes since commit ece5f8374d0416a339f0c0a9399faa2c42d4ad6f:
>
>   Merge tag 'linux-user-for-7.2-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-11-03 10:55:05 -0400)
>
> are available in the Git repository at:
>
>   https://gitlab.com/gaosong/qemu.git tags/pull-loongarch-20221105
>
> for you to fetch changes up to 6a284614d485f36af6467ce0925df0042aca7a1f:
>
>   target/loongarch: Fix raise_mmu_exception() set wrong exception_index (2022-11-05 10:52:19 +0800)
>
> ----------------------------------------------------------------
> pull-loongarch-20221105
>
> V3:
> - According to Richard's latest comments, drop patch 8, 9.

v2 has already been merged.

I was going to revert the commits manually but couldn't find Richard's
comments on qemu-devel.

Please send a new pull request with more information about why these
commits should be reverted. You can use git-revert(1) and state the
reasoning in the commit description.

Thanks,
Stefan

