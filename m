Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132C4528BBE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:15:55 +0200 (CEST)
Received: from localhost ([::1]:40408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqeK2-0000lQ-5Y
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqdyL-00070o-Vb
 for qemu-devel@nongnu.org; Mon, 16 May 2022 12:53:30 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:35260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqdyK-0004iN-AP
 for qemu-devel@nongnu.org; Mon, 16 May 2022 12:53:29 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2ff155c239bso15369217b3.2
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 09:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3YmQkZc5I53jMRkXjf6ongRF7t/N122T42StJqkotCg=;
 b=ijRbmFgFAK4/lxOFx1TFeO5n8HNBGAp7WjK16MrNTkQ3KObqvNEfDE856Zqfz6fQpm
 T+GGQlYfdNNDNqd4Jq+X9HILYv4KZTdwUyIJsPgUoZ2mvH60W2/+Q5xYWjQHh4hHsSqn
 vZCz/ZhPGPlNPaLWm7ZNA4WeUnTKy1GE6JU+bJZyz76d2WfOn/ZqKt/PoDjNo6rsZ/71
 i1YckQDiw1+cA+UUHZbKXSqmsvNJEEN+mp3Nswp8INwTqb0EwFDeMTtgwiqsBHkV526C
 3rlDqzfdHg17e0ildoJH62Cae9O9RluhCXujgTs0I8byWi2EJR8csKpW/82zTD+H+VI4
 wSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3YmQkZc5I53jMRkXjf6ongRF7t/N122T42StJqkotCg=;
 b=SP6Na9d93BZyuWAeHtzSyYjDs+X9W0mZ/dDPF5o8j1VbH3ZooxWSHaz7oUMC98BTFn
 eTBerM4bfVNb1G7e2oa5Bzb5aoPaI3GuJib0Tc6zf9T7PdT/DRejYDiDW0t8wt0FQIzw
 Fwe53BJRJ1lGw/SsvSoAVmSUKy91tu7HEeS+axxt7FUICYtBlsm1ZCrdWszHNyAl88Ck
 YvpYkCClA+A7y8rhCbWw8oZOf5RSVrUIjk01rcuSWdg+bZOwXEOxYth4QVE8EwSFJ/A8
 btNA2EHGX/xA2Ot6JEbVGpGBbf/y3ce/qbzvI95uHwOtCZxY3DdXXfWeUfbg95db2B14
 Fvww==
X-Gm-Message-State: AOAM531iu4xhH6RYqwG3SON+Ib0QBelJW4rmV4OnC11zW3KXpH53iYTL
 8c8ae1v6gD2KAKXDhqAXTUcYD8YPpSHPIMwZxK/pDw==
X-Google-Smtp-Source: ABdhPJwyDmtPyDlPnu3mmzjSfvXCaxv5LOoLhtJjN8zMGrQn9iDHXWeHn7XiE56g846IOBWg2ddL/8pzZR+Ux/98CtM=
X-Received: by 2002:a81:1dcf:0:b0:2fa:d094:14ff with SMTP id
 d198-20020a811dcf000000b002fad09414ffmr20975984ywd.10.1652720007280; Mon, 16
 May 2022 09:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220516145823.148450-1-thuth@redhat.com>
 <20220516145823.148450-3-thuth@redhat.com>
 <CAFEAcA-RBUX5iXV__1AMrex21DJK7hx8mygksJa6xynJRCEW4g@mail.gmail.com>
 <02b0c561-c93c-2ac8-7579-6c456c37771c@linaro.org>
In-Reply-To: <02b0c561-c93c-2ac8-7579-6c456c37771c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 17:53:16 +0100
Message-ID: <CAFEAcA_Fqm7VL-ZoEuzmoQUDHqbOxKCG9s53GVy8hzDuET82yA@mail.gmail.com>
Subject: Re: [PATCH 2/3] capstone: Allow version 3.0.5 again
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, 
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, 16 May 2022 at 17:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/16/22 08:46, Peter Maydell wrote:
> > On Mon, 16 May 2022 at 16:43, Thomas Huth <thuth@redhat.com> wrote:
> >>
> >> According to
> >>
> >>   https://lore.kernel.org/qemu-devel/20200921174118.39352-1-richard.henderson@linaro.org/
> >>
> >> there was an issue with Capstone 3 from Ubuntu 18. Now that we removed
> >> support for Ubuntu 18.04, that issue should hopefully not bite us
> >> anymore. Compiling with version 3.0.5 seems to work fine on other
> >> systems, so let's allow that version again.
> >
> > Commit bcf368626cb33c4d says the reason for requiring capstone
> >> =4.0 was "We're about to use a portion of the 4.0 API", not
> > "Ubuntu's specific capstone 3 is broken"...
>
> Looks like the patch to which this referred was never merged -- CS_ARCH_RISCV.
>
> I still have a branch with riscv support sitting in it, from Sep 2020. Sadly, I never
> posted that patch, nor said why I withheld it in the end. Perhaps the actual riscv support
> in capstone was poor at the time.
>
> The 4.0 requirement patch itself was kept for Ubuntu 18's issue:
>
> https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg07542.html

Is that this one?
https://lore.kernel.org/qemu-devel/87wo0no0wz.fsf@linaro.org/

Did we find out why Ubuntu's capstone in particular fell over ?

thanks
-- PMM

