Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B22364852
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 18:35:11 +0200 (CEST)
Received: from localhost ([::1]:34294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYWre-0003hP-8O
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 12:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYWpu-0002fn-Tg
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:33:22 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYWpq-0006bQ-3l
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:33:22 -0400
Received: by mail-ej1-x635.google.com with SMTP id n2so53876527ejy.7
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 09:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tcDDnZ7RNqn9DLrUH/i9x62tcllKSUwqYDPmltMNVJY=;
 b=bWmjVo8+vckMm+yxeePGpEGtQxjlQRMAUDp04d+bRThki5lqOYyxLCEvYVMDPDZnUT
 /VdpGvcWWa7tWg+Aoe9Ab5AoRn9rSL7cqVqHublExjoZkIdo9yoPloefIegie8nbUG/j
 /ftNe4W+UgBoksU3+ExMyhGkUmyS2mXbHEXnnxvqsI6uMZY2Gzl8Xan5Y8mfXwOL6LfC
 xktABY+VfMgMzOYPzRxtQrPjww57D2Bf6iXYqvHoCSmnTNC4Q46coPW84ISP/89AF8GP
 mHE4nEI9PHfJ7yiHN4HZii9Op6T7kIOCJblFoEGgsNDuCKBmRXqgK7YlUGNx0MUHVPCo
 k53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tcDDnZ7RNqn9DLrUH/i9x62tcllKSUwqYDPmltMNVJY=;
 b=NHQKViKyyRzSEkxRqd2YdsQ8SEBKf4rDgCUDrTK+n+8ySge8fKXIgCNObZdg1rnoko
 TE440qrO28gyy0ImKMxL3aaJ2hrDEDRsxTBXBGqSmP0HzVleEGdau+8zozV2JrOnEUHT
 dIKNppk2AJYjqEERdcW/UxkkNWnQTmuGAlc/tI4RNQIElMUszemXmiCO2Y8c+7C0fedl
 F8/wvSi+7zJebnAJVMdWz3LIBurIlNhPzP+kodK1bTQeOPtrNO08o0Dvz+7dU9DHoH71
 XdiEA2dPiVbunppg+IQOA75Z/EhkMEkkQDOk6k9aHudeZd+CJ1ZDCyzMwX+JhpDFeUxN
 yRkw==
X-Gm-Message-State: AOAM532ohjCmrJPJcO2ZMlKRMx6rouYqE07o+JB61cBcb3vCERVLpAVT
 k+jTFhnoKa/hCJQ4pc6nsbFHiKFFh528hZjKUTknVg==
X-Google-Smtp-Source: ABdhPJwAG1WqJwyiiIJyfvyV1jly+dWmQXx+yOfeC223/9rrfZzF2qUOrlI3BsNOWrk12Tr9yCt3eatqe1I5v4N4spE=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr22790763ejc.407.1618849996349; 
 Mon, 19 Apr 2021 09:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210419162732.766055-1-armbru@redhat.com>
In-Reply-To: <20210419162732.766055-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 17:32:25 +0100
Message-ID: <CAFEAcA_S7rvB73JxEAUj_aKcxNcKu4zSoFUsXiLHb=kU7=Qs1A@mail.gmail.com>
Subject: Re: [PATCH for-6.0] migration: Drop redundant query-migrate result
 @blocked
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Apr 2021 at 17:27, Markus Armbruster <armbru@redhat.com> wrote:
>
> Result @blocked is true when and only when result @blocked-reasons is
> present.  It's always non-empty when present.  @blocked is redundant;
> drop.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

"for-6.0" needs to be accompanied by a justification of why it's
important to go in the release at this point...

thanks
-- PMM

