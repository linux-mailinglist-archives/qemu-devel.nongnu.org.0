Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2135D336A02
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 03:04:21 +0100 (CET)
Received: from localhost ([::1]:53412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKAgV-0007Ii-N5
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 21:04:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKAfB-0006qy-H3
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 21:02:57 -0500
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:37184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKAfA-0002Au-0z
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 21:02:57 -0500
Received: by mail-yb1-xb33.google.com with SMTP id p193so20070582yba.4
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 18:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EWBZhP5d96JqY3kkccxDo6r8RLswPCNwDRU9B1FLpYc=;
 b=twn5EzCJxYy9iwxrIfYKLYF0UmNUsTZxIENaiJiuk46ei96mQxg9fHJMZL4dRoXlMo
 SYjJtqDjk79kW16MYy0a/GhcQdWtWgsH9SF3kgTIVdZkSakz4kwsbACOyxkMhy93XdEK
 iKCNcD12Jvd0SoHmmWrSjEpMC5H/L3W7RhTkYWzViKldZS2XyOw53Cu/+AGU+6DDA4Ze
 4X5GcuZlgYul9GaEc+3m6BQrxiHeB/feuMlqSO3aHyzTpGwmQkpzr9Tx5CeGlbv85+AC
 FDNQsj4OziyVWkOa2oX4Xt9Y9o4GGm5M5mcgHXwBiWlhckY3OYacJ2bDhgro/uLkVdja
 sbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EWBZhP5d96JqY3kkccxDo6r8RLswPCNwDRU9B1FLpYc=;
 b=TNih4HWwQbr1Qsue1IEXGSNNMcGKt3+HyGn6YA5Gf+YSwm30EgosrVJ/2NIQPHXJIE
 7DkjShIYhvsRAfg1SI2Db7vNlPIZc76zLZJuzyHkRg3jJ/mWyxChzCj/fXbWRuYkKduI
 jX0ozPZ/O5tTGuGEjCB7Rmb4dXrGb88sn5iG10Q55fFha3yeWcusDecncRWBzKEFWNzN
 JB2rVLhDrjkD2AaNqk5tCL9VU3txu/71OrDfiW0jvUYIIQIZiliMT+dfDiDgPa/e7CrT
 4WJ5hMNotqH/yarhxBrF81eyi9TPHpf9bfF5OXZRI6wwsU92CsheW8B7URRe5oByywhK
 a4bg==
X-Gm-Message-State: AOAM533GTUVepsPj0VRJvD+R8SaeSvzsxoLy7sTrwAcdv21U3Nr7ubio
 5uyAev7tGOI+D5Pd5zFPnnYbXkeoB2Gjmmk6MpQ=
X-Google-Smtp-Source: ABdhPJwvK4LeUDRdumswXPMJFJERAEiVczJqUSIPxGhtLXS1nb+J9LJbSdK/SJU3PC9SxSoDDYJF8MdJ0tnJxUNkAgM=
X-Received: by 2002:a25:d28b:: with SMTP id j133mr7878059ybg.517.1615428174999; 
 Wed, 10 Mar 2021 18:02:54 -0800 (PST)
MIME-Version: 1.0
References: <20201004180443.2035359-1-f4bug@amsat.org>
 <20201004180443.2035359-19-f4bug@amsat.org>
 <CAEUhbmVEmpU1kLMXrS9ZRiw607E49+tYgb_12-zfkPnWEfxR4Q@mail.gmail.com>
In-Reply-To: <CAEUhbmVEmpU1kLMXrS9ZRiw607E49+tYgb_12-zfkPnWEfxR4Q@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 11 Mar 2021 10:02:43 +0800
Message-ID: <CAEUhbmUz4Je1UFObjcC2JSrYac35qch3NEsNXn+pO3vbMcOc-Q@mail.gmail.com>
Subject: Re: [RFC PATCH 18/21] contrib/gitdm: Add Wind River to the domain map
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Thu, Oct 8, 2020 at 7:13 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Philippe,
>
> On Mon, Oct 5, 2020 at 2:05 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> >
> > There is a number of contributors from this domain,
> > add its own entry to the gitdm domain map.
> >
> > Cc: Bill Paul <wpaul@windriver.com>
> > Cc: Bin Meng <bin.meng@windriver.com>
> > Cc: Bin Meng <bmeng.cn@gmail.com>
> > Cc: Jason Wessel <jason.wessel@windriver.com>
> > Cc: Jim Somerville <Jim.Somerville@windriver.com>
> > Cc: Tiejun Chen <tiejun.chen@windriver.com>
> > Cc: Vlad Lungu <vlad.lungu@windriver.com>
> > Cc: Yiting Wang <yiting.wang@windriver.com>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> > One Reviewed-by/Ack-by from someone from this domain
> > should be sufficient to get this patch merged.
> >
> > Ben, can you confirm your bmeng.cn@gmail.com address?
> > Should it be considered 'individual contribution' instead?
>
> Yes, I think so. Thanks for the patch.
>
> Otherwise,
>
> Acked-by: Bin Meng <bin.meng@windriver.com>

I see this patch was not applied. Anything else needed to move on?

Regards,
Bin

