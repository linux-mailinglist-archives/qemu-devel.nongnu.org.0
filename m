Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DCD650A49
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:42:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DbI-00043x-P0; Mon, 19 Dec 2022 05:42:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7DbG-00043j-VI
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:42:26 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7DbF-0002gF-FP
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:42:26 -0500
Received: by mail-pl1-x62e.google.com with SMTP id d7so8590764pll.9
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 02:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RO3wevKsU+5CAKrYVtXu3kSRhTrbpM0UixYcCfvv6g4=;
 b=GWHshs+Ymxufrwfxg7e2UwxNmoIb/4EAbqM17zTOp1RauUfy3SqTqHtJ1w1cwXnu81
 ZmJYfOwldin7sn4/M7oOYXto6iloj56ONYbFBzw9rLxFnHiVTyH9uxduvXAvKJH9NNpe
 +9NiQgoZEp8yrt2BcA/2kcIQ8kbeg6FUnLMC0G0yyDvYA3vn6lGwzH8bVUMaDjBK0xTe
 yLXixS6FrsS8Htwq3/7cEQwZhpu89Q+fzT0qNi//OwU/FRjTOGo6EXSJq5KB3LNdh5NY
 tgT3rNJDcegVayY8kY/frCGV0TCUwUjdoUK39O2WoyDM6uQH2fLtsizGxXNXhvrMPUfY
 56wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RO3wevKsU+5CAKrYVtXu3kSRhTrbpM0UixYcCfvv6g4=;
 b=PRcVswdpT9+8DYdACpPau5cWIzyqmJgIQm3RJ/iCObBqIaIpd1gZgkWelGeQYQCvEw
 hVmSGn5fXrPQSFJwk82Ee2T+0egaGsLw1Lm8z6cZ7Sk5bl00e2NCfDVl1M5CMEYu3C2a
 5M2JvNksD+mXj8vPUEMVwttKs1mxQ8HBRaC5scX4VGLEwHutbrM0EqwHhrRu9DTkPZGk
 6SPpLtiPs68abCnw48CX3NuAUO0phGPavfgIxgTqLZYJojfO+GP4360OpCUz6+dROQeD
 rpCyk/bQNXIkVV6Gb0nshPcJgp0ixqDr0kXJTLpqPb9nd/2wZww+LfNsr22zITL1ZJ8T
 HKBw==
X-Gm-Message-State: ANoB5pmKxwbOOrfcCMDW5SxcdN0EywYFiSaJANYp1BbxHkI44g+2KjGw
 3XF6PCI2mKlAcfpCdmy1damppnn5HQWRDCzJkuz079ho0IlUKQ==
X-Google-Smtp-Source: AA0mqf5x5neF8lKEduw+nUDUuW2FAE4BSWOoE2oePjWevxOe1r8fwgYWj8cJBznbGXawjfb70Zhdf1dVe6aG7OkOXJs=
X-Received: by 2002:a17:903:2053:b0:189:cdc8:7261 with SMTP id
 q19-20020a170903205300b00189cdc87261mr24232940pla.168.1671446543858; Mon, 19
 Dec 2022 02:42:23 -0800 (PST)
MIME-Version: 1.0
References: <20221217090740.522093-1-kkostiuk@redhat.com>
 <CAFEAcA-c5vXMfmA+_9ZTc-Bsq-hCGHExRhE_SKX8i1_kuk1bCA@mail.gmail.com>
 <CAPMcbCo46mJ9kf9aTfGJ9gYHHOFgUULf7DdM0EijHA2rFgMU=w@mail.gmail.com>
In-Reply-To: <CAPMcbCo46mJ9kf9aTfGJ9gYHHOFgUULf7DdM0EijHA2rFgMU=w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Dec 2022 10:42:12 +0000
Message-ID: <CAFEAcA877b_BJfcCu3v+rTt94VAWQOREbKkX4BLxsBDEiy8ANA@mail.gmail.com>
Subject: Re: [PULL v2 0/6] QEMU Guest Agent misc patches
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 19 Dec 2022 at 10:34, Konstantin Kostiuk <kkostiuk@redhat.com> wrote:
>
>
>
> On Sat, Dec 17, 2022 at 11:20 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Sat, 17 Dec 2022 at 09:07, Konstantin Kostiuk <kkostiuk@redhat.com> wrote:
>> > Andrey Drobyshev via (3):
>> >       qga-win: add logging to Windows event log
>> >       qga: map GLib log levels to system levels
>> >       qga-win: choose the right libpcre version to include in MSI package
>>
>> These commits all have an author tag with an email 'qemu-devel@nongnu.org';
>> you need to fix those up and resend, please. (checkpatch catches this,
>> if you want to detect this locally.)
>>
>
> What is the proper way to fix this? Can I fix this by myself, push and resend commits
> or author should resend it?

You should fix up the commits locally and resend the pullreq.
Generally the author can't fix by resending, because the reason
the patches are attributed to the list is an unfortunate interaction
between the configuration of their mail system and the mailing list,
so any re-send would just have the same author as before.

-- PMM

