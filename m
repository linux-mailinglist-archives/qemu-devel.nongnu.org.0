Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50C918EBC1
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Mar 2020 20:06:56 +0100 (CET)
Received: from localhost ([::1]:49054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jG5vz-00023f-6x
	for lists+qemu-devel@lfdr.de; Sun, 22 Mar 2020 15:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60762)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jG5vG-0001dy-FJ
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 15:06:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jG5vE-0001i8-VQ
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 15:06:09 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:40218)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jG5vE-0001hk-Mq
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 15:06:08 -0400
Received: by mail-oi1-x244.google.com with SMTP id y71so12487950oia.7
 for <qemu-devel@nongnu.org>; Sun, 22 Mar 2020 12:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YGGWRLXTps296CBDtR66YrGGNfWn436sID+1Gr0Aah4=;
 b=ST2eUwOok8wOKB+iZHG9PSzc5gexDTRA30HXjcBJmCP5aEZLdocIuEtmK29LvXmM9M
 cTFXjjQv8dE8uTIaTZXB1lPETITLjrm+zPSQhDebr/4btkgAGgKli0/h1Fj+nggIDkV0
 nXYFJnBWYDra3h05hoUEivlCNF6axUaLOi+Cs8KhQPvKDcqzpWbHkeWT3819oiHIkq5y
 70Y4fRmFwlDjhHO+LPp5m9OV4VydWaqVqaSygQigd1jBkQPaC4/0E2rdqVQ0xuYmRjnF
 sbHIrOn74qpRjsm+XfjIrFWpoAn5VW2pOnN0HaYz5kn4C8fDJeOMKJtlG9rE5pu2k9ms
 0JaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YGGWRLXTps296CBDtR66YrGGNfWn436sID+1Gr0Aah4=;
 b=SD0VDO/VjBrg5fWzFZQoJvJPBNcerrK+Es68I/psaUmDWU15YetNzdO/Hxr7YeWxVu
 qcVxnZtVA6JGh0nsmSdHrZg1uGNM0g8YggWE1dQiKjRis5pRr0eXuIpEAyYFRYhlvPP0
 L4F0OwMtFzgbZPo3eZojNne4mZ8uN39euJofR9SgMn6YLqEgspjTAJCcAJ7FEV2Bqhpr
 L+7c53z+4mZPIjN2FSNWtMe+ykm54Maf+JPI/FQfCu19lRIkyDaSNjWeuzY/rfsfoZSP
 Gsfvs0Jr/X64tDwnStWIQKcFNLO/vZdE5wuSqhyHFtl9Bf4APhxVmVH3GApavID9aduI
 U8TA==
X-Gm-Message-State: ANhLgQ0BIZg/guZovuwBYWEbhIySS6BocKscCjdo9oyTbsvvh/ftZM5e
 VcMJMmhBL67o3O20qzUeNLdXecF/qZ8t8klfBvSa/U/EgPg=
X-Google-Smtp-Source: ADFU+vsq+WXrJBcSPVJqzQe48FElPm5o+AiZtoMjEk8LxPR7ejT9a5eDPfwZnnwhoSPSHnYzCxWdaWZnKNQ10l9wTKg=
X-Received: by 2002:a54:4614:: with SMTP id p20mr129215oip.48.1584903967345;
 Sun, 22 Mar 2020 12:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200316112006.19107-1-peter.maydell@linaro.org>
In-Reply-To: <20200316112006.19107-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 22 Mar 2020 19:05:55 +0000
Message-ID: <CAFEAcA_wZncDdTbtfu=+p4mwukXxfNmfwV1gnwSHjb9YWYwUCw@mail.gmail.com>
Subject: Re: [PATCH] Update copyright date for user-facing copyright strings
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: John Arbuckle <programmingkidx@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Mar 2020 at 11:20, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Update the copyright date to 2020 for the copyright strings which are
> user-facing and represent overall copyright info for all of QEMU.
>
> Reported-by: John Arbuckle <programmingkidx@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/qemu-common.h | 2 +-
>  docs/conf.py          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master.

-- PMM

