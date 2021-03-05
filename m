Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73CC32DFA8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 03:27:56 +0100 (CET)
Received: from localhost ([::1]:51390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI0C3-0003d1-DC
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 21:27:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lI0Al-00038e-2m; Thu, 04 Mar 2021 21:26:35 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:41452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lI0Aj-00039n-Ey; Thu, 04 Mar 2021 21:26:34 -0500
Received: by mail-yb1-xb31.google.com with SMTP id m9so311890ybk.8;
 Thu, 04 Mar 2021 18:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VgMVX3PrXp9UUmZsE7WXYPIAvoLCqMA+jxGWA30Zd5I=;
 b=E1Dmkp2L1dcB3rILcdxBORJ8OaFxTbhf6EIbP9PGp9sL6fKFT+Tew+Umygd/62U3BV
 qq/PLrmOiyUAILVrMol8YUIk/tjOez92NUyi6O2VSvJHDt8o3pAu4SRI64oqmwwC4UR3
 m03NpHf93OYSOj7RiDNNeCcQSlOyCLVzYp7y27O9A9M4whtWRwo5qRUxjpqyjWAzTO3M
 aiycjGpbfVm0YYXS4e+NAVz8sunv0ziwOco3ude4hUPSfTQ0C4Gy8ziGAd4k6nNpYJFs
 MxKFHXkuWLtZ6gdWz6ZYl+AW9cRyr/LPdEj9w5wrPrmT2lhNTnQ2U3jh1E9Krw5wwP7n
 PzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VgMVX3PrXp9UUmZsE7WXYPIAvoLCqMA+jxGWA30Zd5I=;
 b=aH2sOlAmPBFXanw1a4HxknaX9YP7G9gkt89nbQlMrttOwyWTWYbHw6mfKqqCNFqC38
 mfhVtbeckOPYV9Yxc3CGNzi5q6RunI0ttUwvM3A9baoJW003jMRfQGK8W3RwGBvIY45x
 +7BJ+MAk6jyDqdreojidHnCt/7D5t+bjWa6ZBsFFGHMLBuL8UfaKcS13+FyoYlxIHECs
 CQR7ksGRr7vk01zAWfRpPJ1weSsfHTFm0axOafiCEugckROSNonfOGPo6Ya0yPJ6V9ER
 fRqA4IXUM/VPdGOp0UVolDsZg9jnIXATVH98CAAv67ujWNboXRYjp44sGigPreLmdU2t
 QZuQ==
X-Gm-Message-State: AOAM533dfPCgNUFPyeZfNoX6B1DAP8NuX6r99Hpwp+hihmEwqyTVk6VG
 mWo22Si6116oEQB7CbMsfsChTf1xvH74Rg1meAM=
X-Google-Smtp-Source: ABdhPJyqQdqP6raOWoWbL24x2WZyRxojrdiPvoIYpQhfhOFMoG9aoZHJkUlnm29PnrR1QeRAVIJYM8XWuwX+Wbdbfn0=
X-Received: by 2002:a25:d28b:: with SMTP id
 j133mr10170490ybg.517.1614911191739; 
 Thu, 04 Mar 2021 18:26:31 -0800 (PST)
MIME-Version: 1.0
References: <20210218175648.1636219-1-f4bug@amsat.org>
In-Reply-To: <20210218175648.1636219-1-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 5 Mar 2021 10:26:20 +0800
Message-ID: <CAEUhbmVD3pzm2MAyfBqqr6DvQUcJbXMJrr5OdDURs42e6iMbXg@mail.gmail.com>
Subject: Re: [PATCH] hw/sd/sdhci: Report error when guest access protected
 registers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 19, 2021 at 1:56 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> The SDHC_SYSAD and SDHC_BLKSIZE can not be accessed while a
> transaction is in progress, see 'SD Host Controller Simplified
> Specification'
>
>   1.5) SD Command Generation
>
>   The Host Driver should not read the SDMA System Address, Block
>   Size and Block Count registers during a data transaction unless
>   the transfer is stopped because the value is changing and not
>   stable.
>
> Report guest intents as errors.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Based-on: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/sdhci.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

