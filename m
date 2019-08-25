Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908B89C637
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Aug 2019 23:14:59 +0200 (CEST)
Received: from localhost ([::1]:48048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1zqk-00026k-MS
	for lists+qemu-devel@lfdr.de; Sun, 25 Aug 2019 17:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55118)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1zpu-0001Zh-BE
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 17:14:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1zpt-0002uR-ES
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 17:14:06 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:41812)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1zpt-0002tg-AO
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 17:14:05 -0400
Received: by mail-ot1-x343.google.com with SMTP id o101so13377209ota.8
 for <qemu-devel@nongnu.org>; Sun, 25 Aug 2019 14:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aTIi5UmlFrMFRTckXDC4yF2EUayLCeuxRq7bNjSu0Hg=;
 b=H384J6iA4/qONLPPUAZKUHjLuGr4Sye8sGnh7tah/8/M4wf8xRvhIM/wvgu2TOn1wT
 IRlpR5bp4YjyAPaUP06xOeJEzwHpHl6SYpzMprgYx3eCGqQ4S078cbeTqoHs8/mFE/XH
 zBO8UBBXN8/jLFzrunZ4VDAyDM9gXfTxntFLt+g1gVIMX8WWEE30MTmAcmsz8lH9iCHG
 esaFKWMdPQal2xRD5BDb/zKDnUgHpd7TOnWzVykwQyBEN94EbBCuyHnd94rtjacoBKrv
 FgKXjRMgBpjxSjTAfY+IDNrPdpfMrvTnzW8tO9Qfa+zT7/mNqJHQtwwJz/DZw3vJzNp7
 lvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aTIi5UmlFrMFRTckXDC4yF2EUayLCeuxRq7bNjSu0Hg=;
 b=Grfxh2q8Iw3iBV1MQRxABYA1C4wOrgNeI5XyHJOqjmYtCLwwvEs1f3cwgQ1w+zGmxV
 tOmD7bJUh+6HLoYWpEVFsLSWqEGGYP2vGf4n010jlYklil4SPQBbXApaC8L0RBHEEHEk
 IMpMci0VWkjeCASCCvZ3X8XROlGG5Gq+P3a0/7EyH7rJasoBQTUWo3A2lx6WJcTAxbkj
 oDemP302Ila4NoMMHRVMy3gAe7AUe1ZvzcnivnoJ3roF1POisfIXFmBSM+1FurEdgKc2
 PzJJKOfjn3ZF8uBEGb4MDszNYi0hZNgSidpvEwP+2GYdDrvAh/Xl5FF+H9EBucPW6NvG
 zODw==
X-Gm-Message-State: APjAAAVXsf5A8P11H0iSzCDpPtRuI2Z0GRL5AHGTXYfy9AXm2WpcLHln
 1gzLnyGNrrkAlfEVNTp8A8l44MksWSZBRC2RVX+xMw==
X-Google-Smtp-Source: APXvYqwVCe5IXUJU/DCiB3hxWDl1fiL/HVdFvE7wGHWUG1apol/h7sc2NwrqPsRvYL9oeA3DmU3UsnnamezfyX9wx/Y=
X-Received: by 2002:a9d:5e10:: with SMTP id d16mr2107413oti.91.1566767644345; 
 Sun, 25 Aug 2019 14:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-47-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-47-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 22:13:53 +0100
Message-ID: <CAFEAcA_Ff8aWy1TL3nT0OxQ2=0CiBayDouiWDmF7h_Nf5EV3fw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH v2 46/68] target/arm: Convert T16
 load/store (register offset)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 51 ++----------------------------------------
>  target/arm/t16.decode  | 15 +++++++++++++
>  2 files changed, 17 insertions(+), 49 deletions(-)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

