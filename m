Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C67A5F19B2
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 05:50:42 +0200 (CEST)
Received: from localhost ([::1]:54858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeTWT-0000xy-Kk
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 23:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeTUO-0006T8-Bg
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 23:48:32 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:43934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeTUM-00015E-Rr
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 23:48:31 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-333a4a5d495so61167727b3.10
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 20:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=sg7nQDWFv8QTnCDLWBHVfBzuWWmIPQGEJXnMHQdf71Q=;
 b=Gxh5kdDiUCgWwgdQOBghjQCPftYFgQD/AWeIvBkDL3SMBfVmjSkykJKFV8Hm++HCNF
 Kxkohep+cWzfKFFJhaSc/Mx75MhVFhEJh1rcR3doGPuqtP/J737dJZqjwpke7DeesW4j
 n9TRi6avAY/Cu/qqdyCTTWxrhZVYMz3pkgjHgt9I6rWZofzPWFSOV7fsBuqHCIbHE+Nd
 uEHJL2GMTo1VO47NMk65B3r33sstlB8EgeLBGBuyObK7n4AKPijiSfEYkMUeHz2TzJzV
 v2TTeCJP8476HEVKQ6Fr53CRCq8N0zaLSVvedObVDA6gBa7Gf/eJPn8UCq6GOalHfSYb
 K2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=sg7nQDWFv8QTnCDLWBHVfBzuWWmIPQGEJXnMHQdf71Q=;
 b=xOrwrXL59O7LvWxgcqQpaGZYTPyH6yCfEouctHJsvxmBl5DcrCjgFkvhtqioMJK01o
 T49qypweZGcfYDeg8AVPfbu3uH6qa7UpmGwVUxsWN9cGaTOzZ5df0XQuTNDVmziv1nws
 NEjvLdRPO385I/Wj+l/Ml0zxrgRvHuUGwn/y2aM7e9TCl6vKo3CKhB6lR7h1bBPa678T
 FQRsTCMinaqf5UFlFKYrnXxoEjDBw/Kpq/09FlIqnfrH3TzeEjU4yaj4cIG8auwhQOKh
 r1iaNq0g1plwy6IetA/6z5/NCv+cye7/QRAe0C61DbAtSWBgz2h4dlcAs6uC9RPxAwqu
 N5+Q==
X-Gm-Message-State: ACrzQf2m6Y/4H6gilKqliIIbunntaZwWHcJYgj65gjqr+9k/IGgb2upU
 aWo+I5orgPB11sPU55F0jqln2m4MFLrJFFoRpx0HPMaf
X-Google-Smtp-Source: AMsMyM75dhOFYtUqMj7JfP7ehvNHPdGAb7d1loCSAJ4iIyD+nuTO2LkhAk/8QwEUX7Dw3/Tyb5dG+QNanKIYnP3AXTY=
X-Received: by 2002:a0d:d684:0:b0:355:5627:e39b with SMTP id
 y126-20020a0dd684000000b003555627e39bmr9208488ywd.43.1664596109529; Fri, 30
 Sep 2022 20:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-27-bmeng.cn@gmail.com>
In-Reply-To: <20220927110632.1973965-27-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 1 Oct 2022 11:48:18 +0800
Message-ID: <CAEUhbmVGiifLE-ZAe0bxX8JDOcBX41Qg3=5g6Yr36uW=Ws=Srw@mail.gmail.com>
Subject: Re: [PATCH v4 26/54] fsdev/virtfs-proxy-helper: Use g_mkdir()
To: qemu-devel@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>, 
 Greg Kurz <groug@kaod.org>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112e.google.com
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

Hi Christian,

On Tue, Sep 27, 2022 at 7:07 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Use g_mkdir() to create a directory on all platforms.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - Change to use g_mkdir()
>
>  fsdev/virtfs-proxy-helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

Would you pick up this patch in your queue?

Regards,
Bin

