Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531125840C1
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 16:12:35 +0200 (CEST)
Received: from localhost ([::1]:46608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH4Fe-00035g-B1
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 10:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH3oS-0002fo-Fl
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:44:31 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:36819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH3oN-00052g-LF
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:44:26 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-31e7ca45091so19908007b3.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 06:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PphJY1T/gyzvy1mB/CBzklEkVbGsRPvYLm6OwRq+C8A=;
 b=Gf3CCvkgEd2Sn0X1c+fi0sE8CmO4RrPIzW1WwxdZmd17moYeO0yYrL2m5pqXeXbERN
 TF8xmqoX2/GjTezwgGVsAw0UTIdCK/dckOD/NqnvUOyjc65mz8QV28MElO5nh8GZTv3l
 K3XwMyI2hh/DbuMp7wDB8FA7nGuHHY+rnh5HY8gcGU2G/cDOeMLAe0cI75qKDeIrUaGL
 R7vENBPjNXwqrWPHLZMV/9A1l67Pd2HzqMXZ+rLpTsqzGRdxmTwY3EDc1r1ovGmjD7xS
 gV2Gpwa+AYOVpeFB1GjI3i0rEM8WpG3zsFW2b4gzZgt79savlVpKJz1GyESBycSOUhTP
 /jaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PphJY1T/gyzvy1mB/CBzklEkVbGsRPvYLm6OwRq+C8A=;
 b=D6rajlm5GNNcXE4cfb2jY2bIECeOIlUW9rZS8uro8N95iTMYhrobPcV3bKn5zuxPiT
 ZemDZQ+YevEsjuWgwuHPaXfbLA1DGSbx1jf8CfpkDaQZOLqVu1V3vVhKSibeX39Ige4K
 pu90vIEf1fUVynmfyExYYvAscBaoTBEO6VARYwM1BA/eItr+JWGtNvaF6+k8EzuLbm7X
 CxZIiqxDi7cf4CNfBmpU52XHMwIYeejgk2JsFxSzduMA5UAVkaaYa/nWEmkvhJb752GU
 9RXEFn3x9AoTTrpK1jAoMzvdP+ro2Ryr2xSk/0mbGxDkry+OvBuppSqNGCzefGhmiWLv
 ws5A==
X-Gm-Message-State: AJIora9z2W7y0rhPgrkpt2sg9FAvL0iM7bI1X1w4xXSNGtenLElts1Xf
 x2smc+vQYY5K//Hs1M6M/luF7Q2uYevlDdU0UP5ffw==
X-Google-Smtp-Source: AGRyM1vYp+n90hiOsqV54BDz4RQ1uABQk/5RTEVhEHi4Olz4LaathgGG18f4pJpY57SWUhXLAlI0+uSssZ212IW+ZbQ=
X-Received: by 2002:a0d:cc0d:0:b0:31f:8a70:38e0 with SMTP id
 o13-20020a0dcc0d000000b0031f8a7038e0mr5914274ywd.347.1659015862201; Thu, 28
 Jul 2022 06:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-6-wuhaotsh@google.com>
 <87ilnuda33.fsf@pond.sub.org> <YuGMFRDj3tLOIJK7@redhat.com>
 <CAFEAcA-_TkDW4tPxvmwEt-Rr6VAr_7aWNX2++CE+1G5cBPtiBg@mail.gmail.com>
 <YuKPVi9UjmZVqw5a@redhat.com>
In-Reply-To: <YuKPVi9UjmZVqw5a@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2022 14:43:42 +0100
Message-ID: <CAFEAcA_90z+z+=TmVBjX9DfJwSB6aLJTrdXerEqNepOHDvfO5Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] blockdev: Add a new IF type IF_OTHER
To: Kevin Wolf <kwolf@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 richard.henderson@linaro.org, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com, 
 f4bug@amsat.org, bin.meng@windriver.com, qemu-block@nongnu.org, 
 thuth@redhat.com, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, 28 Jul 2022 at 14:30, Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 28.07.2022 um 11:46 hat Peter Maydell geschrieben:
> > On Wed, 27 Jul 2022 at 20:03, Kevin Wolf <kwolf@redhat.com> wrote:
> > > If the existing types aren't good enough (I don't have an opinion on
> > > whether IF_PFLASH is a good match), let's add a new one. But a specific
> > > new one, not just "other".
> >
> > I think the common thread is "this isn't what anybody actually thinks
> > of as being a 'disk', but we would like to back it with a block device
> > anyway". That can cover a fair range of possibilities...
>
> How confident are we that no board will ever have two devices of this
> kind?
>
> As long as every board has at most one, if=other is a bad user interface
> in terms of descriptiveness, but still more or less workable as long as
> you know what it means for the specific board you use.

Extremely non-confident, but that holds for all these things,
unless we add new IF_* for every possible new thing:
 IF_PFLASH
 IF_EEPROM
 IF_EFUSE
 IF_BBRAM
 ...
?

thanks
-- PMM

