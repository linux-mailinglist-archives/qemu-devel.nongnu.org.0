Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EED52AF972
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 21:05:15 +0100 (CET)
Received: from localhost ([::1]:41624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcwMj-0004oa-Tt
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 15:05:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcwHs-0003Vy-FN
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 15:00:12 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:44665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcwHq-0008Uj-5F
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 15:00:12 -0500
Received: by mail-ed1-x542.google.com with SMTP id l5so3585221edq.11
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 12:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gll1FbtCZJkJd07k3kyGI8i9SK2+czGymUSF5VtbCY8=;
 b=DkRDkEAc5DIa5kg6jtROxHcQTGkAYg2FEs4zJFhgw+0TZJVvdVIeSa752xxt4A/K6i
 XAQ7UYfP3pD3ZZ85nC34kxXQhHTJNleUqy5cY56+vNRSKk3kB0TKR6swr8OBsG4KVY32
 8iDCMnJljiQerIQA7fcrY6e5oRPHbj3uLyeoF4XKnHlohinELZglSlWJOPPHObCJXjUn
 i/qtbuyx588LRipBEAajBquPS3d7cZ5H3kOyDTU/l2CZVXF2RniTS6N4lfuYBmbWgDWm
 pLXbfQhnR9gP1Orq6DSh+TCSyoTtFYS4tPcUvUEt/dkE3f1KG9KAiJCwIBlGATl6gorT
 6RTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gll1FbtCZJkJd07k3kyGI8i9SK2+czGymUSF5VtbCY8=;
 b=eORvnojMetQz3N7SXWwd1hzJRx9gedJc76ykDJidtaG9SpvfzygQu5WPJYCVXatEqh
 fRJtY/QhZznaC+aX0d8m3z5Fw2fVPtQy3Lrsb+/sSCjP4Ss+nbF8BnnXBHzNrg+113DX
 bwCrJAddI8r5M5SQ3FmToGe/bC3JKuphs0kQ0+jaZfzQxZhCrXu2eLTxRy40Vkknkj0i
 JuCFRTApK4xRs9lkiJMD4k/47x99UH5UM62fHLLKWa4N854SBSFYTMpQlR/3wC7CILfn
 7ZzbqBS4qSflvBrk501kfYshuDpuTcjCcRb8QdAlaQP2NIRA1itp9vjeO+HIbVk+PYNK
 /iKA==
X-Gm-Message-State: AOAM531EZdt0E63dYOYVISPcJl/UK7n/7I8dqutt0p0SPedsnI9RmZcL
 tVusCyp6OKyMCb0pMBUrY8iwFq+iO3sDiiCRSouf+A==
X-Google-Smtp-Source: ABdhPJx/J22gQ0GLJQzeoj1U/kj4J04RX0hfZM0ikQjUaCqKzyc7VyJDSxKcctXTQvcf420lPRqMSbJ95efL0FMDHSk=
X-Received: by 2002:a50:fa92:: with SMTP id w18mr1281042edr.44.1605124806997; 
 Wed, 11 Nov 2020 12:00:06 -0800 (PST)
MIME-Version: 1.0
References: <20201111183823.283752-1-ehabkost@redhat.com>
 <20201111183823.283752-4-ehabkost@redhat.com>
In-Reply-To: <20201111183823.283752-4-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Nov 2020 19:59:55 +0000
Message-ID: <CAFEAcA_n2Ek_JKgPsMN_A_m3_3R_5X6hLY_FzRNc-czcCXcsxA@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] tmp421: Register properties as class properties
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Nov 2020 at 18:43, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> Class properties make QOM introspection simpler and easier, as
> they don't require an object to be instantiated.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

