Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0779533274E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 14:37:53 +0100 (CET)
Received: from localhost ([::1]:38384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJcYa-0006zH-3W
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 08:37:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJcS2-00072P-8i
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:31:06 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:35255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJcRz-0004pl-LU
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:31:05 -0500
Received: by mail-ej1-x633.google.com with SMTP id dx17so27659721ejb.2
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 05:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uh6c7+CuRro54PmfG9+edXZYQI4DvJM5hX/S9b/HXRQ=;
 b=tWUn+Unx8EQfoiSrfLpp6oNksmtsQ9Ks9979vyAZaxC4f4+nZFh/0fwiQ9Wq/W5K/7
 7snh+XHRUtT0aHYKwkSxoJqj22OeBkbgLofLEL/j+iehUVCXnn/wIP4JlokBH0IzIU6t
 P3wZ9B62XknWwriCPsIApRdHxOLVPeuVbmMaz2NQP2ZEARY2SM8DFhJ+iP4kZaejaq6q
 xKMhxSnqQW1GhZje6hFOzFMkVXzTs0cI4rjeRuzPmM6G8dcXGuXXhTWJ+xihqS/xuKKd
 KRV+CsoOEMvn4XkXLMoB+NpZFGE2zBMSGxH/mo/MnhjPUQLWnuu+kgitEp8aAQb5P4gv
 Ow8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uh6c7+CuRro54PmfG9+edXZYQI4DvJM5hX/S9b/HXRQ=;
 b=ueqeZc6pjcAG2if9oGvOK46pHxCvUK59jD1UcJut5vhyccEQgUxbGgp5MP7FHf9DER
 YX9bkntvlIPeqZYi5bLs5xyxyYf9D+jDt64GAAb8hKq+GEgwgBIfjt4JFmJRnlrWvz6W
 d0Kmw4w/S11eu0APadqcX/703mT4YEgbue/3O3zwsR3yqxwpMsAc/5glCmjTE4fLrOL4
 V20kKFGGt+thEZ8QuLMH7So0+ymwNA8ZSF9+8xJtzjhRrN7GyYvE0rJIgaWjffy6PwMX
 UFYrUNI9nIlsRACO+NcCNdnnSborUvcJRD4/4lqqfn3OiERnEvXb/YixkRykZ4mNXybB
 DLrw==
X-Gm-Message-State: AOAM5313n5e8akQPCrCy6eFQu2soa5UzfO+q7ZGK1REXwWQrmjv6qVR0
 2LvnMf8Zr+kUZLDVU1eD12bvve8taIkUxXyHQatN3A==
X-Google-Smtp-Source: ABdhPJw23STRnbaB6W0AKZirdcx0rj9PYAuyjERiplaroMNjwl24ObhC6mB79aSl/jY8BOF/uzBy2pS8r/mcwafhnXU=
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr20188623ejj.4.1615296661722; 
 Tue, 09 Mar 2021 05:31:01 -0800 (PST)
MIME-Version: 1.0
References: <20210309111510.79495-1-mjt@msgid.tls.msk.ru>
In-Reply-To: <20210309111510.79495-1-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Mar 2021 13:30:44 +0000
Message-ID: <CAFEAcA_0KRbyMu_PUhfxeVR5H+34duhTKCarW_JmCynU7i1p6g@mail.gmail.com>
Subject: Re: [PATCH V2 trivial] Various spelling fixes
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 at 11:23, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> An assorted set of spelling fixes in various places.
>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> ---
> V1: https://lists.nongnu.org/archive/html/qemu-devel/2020-12/msg05959.html
> Changes: incorporated suggestions by Stefan Weil and added his R-b.
>
> Please note: this also patches one file in disas/


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

