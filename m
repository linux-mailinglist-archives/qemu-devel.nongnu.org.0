Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BA92EA418
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 04:51:51 +0100 (CET)
Received: from localhost ([::1]:48722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwdNt-0000bY-U4
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 22:51:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kwdLj-0007sq-1c; Mon, 04 Jan 2021 22:49:35 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:39401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kwdLh-0005Dd-Di; Mon, 04 Jan 2021 22:49:34 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id k4so28023665ybp.6;
 Mon, 04 Jan 2021 19:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X10teU+ZImVJGs8krJijWxIK09TxxjBbUPrO2EUvPCQ=;
 b=rO9uiEqBa+GqlYGx6SK/H3LXcae1yL+UXwWILrSguqM0SLj/7MFRIUqErDh1Mk7iUr
 jL127GylIfgYBVjEApJnBidt6VcUn/0InWsSqFH8am28uq8n0uPGwAvsc9FYVAYGN+Qj
 cifaOAhl6bCNicpNtLgJBYAZiAo2pmSwC2zuA1R5JrTRIfiI8ujVi1M/FtDFB6gw73pc
 7jDv/5TJgqrTIRUWjg85/CvXacPqVC5oBB63BWK0Gu7IS1qaQpdXLGr0vEIHRZYSySKW
 83EfXEn9B6EQxBn3K+pEPxn2REImxj+5gEA0wDSNl1uXWXD+3MyXSEnsZfTGZvwBmjN8
 OrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X10teU+ZImVJGs8krJijWxIK09TxxjBbUPrO2EUvPCQ=;
 b=SWKmI+Y21E/wUzPPgsE4v3jNCCTzCwS4alj4swQWpc4Gn7OadesEI1c8S6K1C41y58
 kyo96mBxH7+39nPr+AKrAwSuL+UB5nLeGwWxI+Os8Mxdcz+BCp7VoXtDcFzq/JdxKF/p
 i5Ro4clFWDQTxH0GLIGKdzmAh8AvgE7y0fflzACU6a2n8PQC2n4i2Ilk62mL1E8R8l3X
 duX1AO2F5wlrULtnVHSFZ7wM3DY55JtcJMWPwA0WnF1rcbmcZb/kT84QUd2XjEuwSX7N
 sabEFuDGjeaAQzKOhwKH38Ej8/M3AnHXyIrjO+QpqsAtGelfxreUiVOyzVNlogL+bIiK
 FMDQ==
X-Gm-Message-State: AOAM530JEFCs+wKZaXETfwreFO6Fha/7Pty33IGDj1uKPB1ZBA1E5r08
 ea5G5NVWrjKkO+s9gnLKvXpN7WjXCjCmnzxwY4Y=
X-Google-Smtp-Source: ABdhPJzovdOVx+QOstYsX8jvzjwGobcQ2sK2VOibBhbi0Ff7k29kUe3ZT/DGUtxaw+WfkH0Ft+ZfiJhje4R0mMrXQGQ=
X-Received: by 2002:a25:690b:: with SMTP id
 e11mr106496641ybc.314.1609818572119; 
 Mon, 04 Jan 2021 19:49:32 -0800 (PST)
MIME-Version: 1.0
References: <1608619520-62782-1-git-send-email-bmeng.cn@gmail.com>
 <CAEUhbmUNHqL-y2G1qt7hnYwXV-7a_Q7DeEpLztbpa9n4rs7oEg@mail.gmail.com>
In-Reply-To: <CAEUhbmUNHqL-y2G1qt7hnYwXV-7a_Q7DeEpLztbpa9n4rs7oEg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 5 Jan 2021 11:49:20 +0800
Message-ID: <CAEUhbmVNXbFiPRDgjCJPkLxbYR7Qo8sNAvhffkwA1P6ZTDybng@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] hw/block: m25p80: Don't write to flash if write is
 disabled
To: Alistair Francis <alistair.francis@wdc.com>, 
 Francisco Iglesias <frasse.iglesias@gmail.com>, Kevin Wolf <kwolf@redhat.com>, 
 Max Reitz <mreitz@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 5, 2021 at 11:46 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hello,
>
> On Tue, Dec 22, 2020 at 2:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > When write is disabled, the write to flash should be avoided
> > in flash_write8().
> >
> > Fixes: 82a2499011a7 ("m25p80: Initial implementation of SPI flash device")
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > ---
> >
> > (no changes since v2)
> >
> > Changes in v2:
> > - new patch: honor write enable flag in flash write
> >
> >  hw/block/m25p80.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
>
> Who is going to pick up this series? Is it Alistair, or Peter?
>

Oops, I replied to the wrong thread. There is a v5 series that should
be applied.

Regards,
Bin

