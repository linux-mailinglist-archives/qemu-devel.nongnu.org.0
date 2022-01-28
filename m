Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7EB49FADD
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 14:35:39 +0100 (CET)
Received: from localhost ([::1]:34250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDRPd-0006np-J7
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 08:35:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDPvh-0001t6-BG
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 07:00:39 -0500
Received: from [2a00:1450:4864:20::336] (port=55945
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDPvb-0004en-UZ
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 07:00:36 -0500
Received: by mail-wm1-x336.google.com with SMTP id r7so4191012wmq.5
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 04:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zF2xvE4zUzql2cOe4k44/OTTj9pMNWUIAEQSd92Wz0U=;
 b=R8YESWaABhM9wcCgSSZHKPMe37IA4+2E+8K16OzGwzj8z/jGEOdlX7XpYcx06/VbjU
 T3NzfFhEly78WOJrhSTpy+E5E1WNTcro6JLQ0XwPFFXPkH5Sx/B+yCyXloBCOYMhbAea
 +I6rGfJKX7kl/ahNxadEUIjf/Di0hCcYIPizAobI6Sa9Fek9aQm2IK8kdNB5X9V99SnJ
 LvkQQl9V8M8LkoCxnBncQXTwKeuMEh7joZboywMyQQeIgIEd96jkItahxWEh84VCWNwD
 ib0BsMSv8r0OY2IRREM17yr8LKlnsu5byHZoxVdBpcffXM47zKMTcVuxtGtKpzg0WWrF
 rmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zF2xvE4zUzql2cOe4k44/OTTj9pMNWUIAEQSd92Wz0U=;
 b=TeeiKi5Ht7Vu1D3GapzftRMBD8IgMUW/a42j/BTe8KGuGRdxOLelz0aFkq8uVDzr1C
 Am2HT9T4MiBQlbLjDF/jOWHIzmLBrjOK97Kv3xb+2rASJRenpEShYyNClGDMJ/cuETPt
 JZwcGCkLB4bQK2y2qscb+VQ+ISDI43MD59YJtbIJdvRh+0fkEDSOZzh1U9MoWhhW4aWf
 deQ7LBmIzg4Dp/uOmVOGKSxagZ1cDLxblTkQSqYrgGhPdryDbCFgoZ8VCxtLWeKGrzk1
 IkSwlNGZXacFYyCIRkipfhvYkobD0wkM/x8089ucCKUh6jA2GfUuUiMOjqaKCuKqOmAh
 rATQ==
X-Gm-Message-State: AOAM530MlpXd/AU1j3gkALaqJmKiW9T6uzG/p02OCjEDwHAymlEgfmfc
 l9gILbjqifjUVReRoFyhSsh4fljkhjuKlUEL1wMx1tBz1OI=
X-Google-Smtp-Source: ABdhPJwjkaxshD+8/KRxn6C23l/k2yCyyXmGJviiWRUasnojeEfmOgdTMWAcbXhWcyxj/ZOMz08XwMx56TPatZIx9QM=
X-Received: by 2002:a05:600c:1443:: with SMTP id
 h3mr15981842wmi.37.1643371229661; 
 Fri, 28 Jan 2022 04:00:29 -0800 (PST)
MIME-Version: 1.0
References: <20211209194532.1502920-1-peter.maydell@linaro.org>
In-Reply-To: <20211209194532.1502920-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jan 2022 12:00:18 +0000
Message-ID: <CAFEAcA-mOKhqxG--0nLk7gCAGn3f0tqtyhisr3Kk-hFwn8ESaw@mail.gmail.com>
Subject: Re: [PATCH v2 for-7.0] scripts: Explain the difference between
 linux-headers and standard-headers
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 9 Dec 2021 at 19:45, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> If you don't know it, it's hard to figure out the difference between
> the linux-headers folder and the include/standard-headers folder.
> So let's add a short explanation to clarify the difference.
>
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1 of this was from Thomas; I suggested some expanded wording
> and since that made the patch pretty much entirely my text
> Thomas suggested I send this under my name.

Applied to target-arm.next with the minor tweaks MST suggested applied.

thanks
-- PMM

