Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1626A4DC34E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 10:48:26 +0100 (CET)
Received: from localhost ([::1]:46952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUmk4-0006rz-Jt
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 05:48:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUmhv-0005AY-Km
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 05:46:11 -0400
Received: from [2607:f8b0:4864:20::112f] (port=39168
 helo=mail-yw1-x112f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUmhs-0000dV-Ch
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 05:46:11 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2e5827a76f4so51604777b3.6
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 02:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HGwsZ4JiKyr6t/aUHBUNDyNPD8d0+Cp/vVv0RDTDOIA=;
 b=zS8bugxx9QldzbTP/VW+mIka2GYsD7LRuqjsa+dKCpse1Sad+WG7xrwWeKpkvAKwqj
 RTEnURtpO606iarZiBX/vZEaXwMYAhCJ0SRQjhkzHs08kHm+vG+0ivz+gGqzcvBFs3It
 XxIC30w2Nk8Z0n3tKRXjy/tYDEuyzAWLP8C797ansMbZTYcst6JU3NEybPcahtUBv4pl
 N4qWjxgej7h9hEQ5KN//fbEZUpJg8lDWjtTIMF2rtQFphLfX7cra6NF25ERyCO1uV7WQ
 inmjyIwyCDVqDBwJ8DlaKjDncjKpEHqv3r6Z4iD9KEfb00wikyEozYdu7BP/Ky69TCPr
 gUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HGwsZ4JiKyr6t/aUHBUNDyNPD8d0+Cp/vVv0RDTDOIA=;
 b=CLhxmZyHgy/FBJOEfJtRtS5Cm4J6gQ1MUNo7SYlr/RczFF2CF87ynTUzAlSjGlZwYV
 cl9AzjF0vjrkzW0zRgLRwIuhC+La5x8T8ekHqN9+yY/dMBSk8adCacvw9/WLLklbyyFQ
 +Xbjr5DrODFnsn/frewKlWze6RUd1+WniAvs/RhDII3XnXugNLyY2cVkuu8ESeYEp1yF
 H/q917CmwwsWsxyjNeCpcVGS0XR1eBPX3dHXfm1auenUbU1SUYVrdMYGHhHVJYNiVf0h
 q/tXA4C7noo4YpXhG9j0vNeQ7oR6Dxxhmy8TQP3jEAmSwdAuA2SnqYqE014wTFpXGU5l
 tzEg==
X-Gm-Message-State: AOAM530WhBo8DFX/jQ97aXrdEKTsK9kYrnHqgtVto7Jtf3IFCT+AsNwV
 D6ncDLjEoOQ0pkMIegxmeQULXnL551vjdxNiH4Hxnw==
X-Google-Smtp-Source: ABdhPJxHJdeTgCUykTIpU2q7xfkHpoLtIxp57ktvlPCT8g5pZ+DzSPCsD881ZG9LjViAeLfonjCDuKiTFlB1ZLnrH9c=
X-Received: by 2002:a81:1151:0:b0:2e5:99ec:9933 with SMTP id
 78-20020a811151000000b002e599ec9933mr4544280ywr.64.1647510367285; Thu, 17 Mar
 2022 02:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <57412635-6b46-823b-14a4-0ee694ace5b8@oth-regensburg.de>
 <CAKmqyKOZN=hS73TfgHfMtxktZ9kkw4kBBA4-gjGAV8Q0Kw+KHw@mail.gmail.com>
 <CAAhSdy23Ag=ZqUj82aZ6BNA2SJq54rbCDjeX=1cHtbq7LR8jaQ@mail.gmail.com>
 <a840f9ac-7315-4381-4c85-719efb413b18@oth-regensburg.de>
 <CAFEAcA98VQmM_ETpNuhq31Y7xLkS_AjVRsTeCdnqzMZG-3uxBA@mail.gmail.com>
 <3783dce0-0c5b-824e-2097-bbc3367281a6@oth-regensburg.de>
 <CAKmqyKNf3qL9k83tRD+=Frdue=+WZNAJ8RxK4UivCjz0Adjbqg@mail.gmail.com>
In-Reply-To: <CAKmqyKNf3qL9k83tRD+=Frdue=+WZNAJ8RxK4UivCjz0Adjbqg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 09:45:55 +0000
Message-ID: <CAFEAcA8mqdAf58FkxDPtL_UK2feGTEUE+h--_a8pRpSsGUCHYw@mail.gmail.com>
Subject: Re: [EXT] Re: QEMU+KVM on RISC-V + Hypervisor Extension
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Anup Patel <apatel@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jiangyifei <jiangyifei@huawei.com>,
 Stefan Huber <stefan.huber@oth-regensburg.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Mar 2022 at 22:23, Alistair Francis <alistair23@gmail.com> wrote:
> Hmm... This seems like a bug. We shouldn't allow the user to specify a
> `-bios` option if using KVM. Would you mind preparing a patch to catch
> this?

You don't want to allow the possibility of a bios blob that expects
to run in S-mode, the way arm virt can run an EL1 UEFI BIOS ?

thanks
-- PMM

