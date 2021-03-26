Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E088E34ACCC
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 17:47:18 +0100 (CET)
Received: from localhost ([::1]:45112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPpcD-0003WM-Ds
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 12:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPpZx-0002P7-VA
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 12:44:58 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:37830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPpZw-0000ZN-Bw
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 12:44:57 -0400
Received: by mail-ed1-x533.google.com with SMTP id x21so7048395eds.4
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 09:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZKANrps5WGDd3bBxM481B4jbnlyd7LTh13LndxW24HM=;
 b=evfdLbgYzM6qOU4D/jxoO0DojDo/Wnld7TozQTqqn0luAsbBdn+WI67uA6nI2vPffq
 GlOfzsD6J/mUqYCXwgG1jRvKfNG2yKVeFAXH+bdoM7A1RZmKi/7xC8UDIGXuUXRh6yO2
 xz+TkjFdkOkrhNHMcCxNUzhpLMrjq8fA0YWM1mBlXiL8sc86CLaKYtZjZYcHogTCOryn
 6Emasp0BKVmOLCbY4INeY//7cPmrOFsneX68e/9khhx8sXOxsEZTRfSLsiJms4RFHq9z
 t335Uu5KiV0nFeTltfA41JB2CP1I9APlUbeZHnA+hl1ETU1/1tWp7Yay/D565M7BcEhq
 8txQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZKANrps5WGDd3bBxM481B4jbnlyd7LTh13LndxW24HM=;
 b=alsKZlVsiXDHFGxugLy9OLqyy8U/QoJrAfMcf4W9w2/0xvjfzdT6+CF1o2s6VtRgul
 2GeJGk+5CGg3nbdJ0MBAWgAAVeITOOfYHIWL0odxqeP0MoL49jraNGAXLGN87SZLZ5d5
 HftFHPCHGrY61bN9ZWWEHP7gsmaYTxVawY9dssW9o/dLUeZ5+Eg5JiHwDehLd8qzwwx3
 izx4NMNciEOpgXJ9ZVttrWVYpfwtoWu5yaeiarrlaWnY498hSQQw3Z31hHrtLPz1uiMb
 hFD3vNMeiwwcoFNNtWaZV7pzf4dOuZnEyN354Q69i2sHdXe2+ZdY+X9gD2UvUxKjKX7h
 rtkQ==
X-Gm-Message-State: AOAM530ZleiN2bCK+2Fc9LqfBmC0rjO5ZIfgTZL+XLgif+sMI6UjihN4
 y1MZjJ4Hn6BNcrepVGhnH+k2YztviZmwOrpuNocJHA==
X-Google-Smtp-Source: ABdhPJzl7QqvxsxDBWw9p1Mbde3F6QsCLUxuNrgVtG+H5haDh5lRbBWbJh1L6MCI2hAj6w7zgbX4pKFp5RViEoNVj1Q=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr15910572edt.251.1616777094292; 
 Fri, 26 Mar 2021 09:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-3-jsnow@redhat.com>
 <877dlvs1gp.fsf@dusky.pond.sub.org>
 <ed5134b3-bff9-947e-f370-239e5c31a512@redhat.com>
 <871rc277mm.fsf@dusky.pond.sub.org>
 <33866c5d-1eab-739c-f2e8-a35f4a0b0f55@redhat.com>
In-Reply-To: <33866c5d-1eab-739c-f2e8-a35f4a0b0f55@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Mar 2021 16:44:25 +0000
Message-ID: <CAFEAcA8f-d7fPzrisUVkjkvpD0CCdQFBso3GiFmAPJ6gj-P_mg@mail.gmail.com>
Subject: Re: [PATCH v4 02/19] flake8: Enforce shorter line length for comments
 and docstrings
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Mar 2021 at 16:33, John Snow <jsnow@redhat.com> wrote:
> Being less terse about it: Mostly, I don't like how it enforces this
> column width even for indented structures. Generally, we claim that 72
> columns is "comfortable to read" and I agree.
>
>                                     However, when we start in a margin, I
>                                     am not convinced that this is
>                                     actually more readable than the
>                                     alternative. We aren't using our full
>                                     72 characters here.

I agree, and I don't see any strong reason to hold our Python
code to a different standard to the rest of our codebase as
regards line length and comment standards.

thanks
-- PMM

