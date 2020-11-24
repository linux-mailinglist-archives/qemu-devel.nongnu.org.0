Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA84A2C1DFA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 07:11:14 +0100 (CET)
Received: from localhost ([::1]:42466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khRXl-0000It-8z
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 01:11:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1khRWF-0008IA-OA
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 01:09:39 -0500
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:43606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1khRWE-0003Qf-4Q
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 01:09:39 -0500
Received: by mail-yb1-xb42.google.com with SMTP id r127so14476291yba.10
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 22:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JXiS3lAMU4XWqyp1x9Emjshm/HGDzNML+g5kxlJ+egw=;
 b=Sm5lu3fEcLeHijwpHicwoKSu8aJxYvE5Rr93ilQ4LfeSb9oJcgVmKeNR8p9bfSN/Aw
 nybdeS8sbMD1LXDioU1snsGnhXVICnkvAInfg+QmzVlK5ldL9lCwmvz+Bgu4yHPJ3aZh
 ZL7wmm7Sb/cF86QO+ODmp2b2wZeK6dsMocbAc3QA4YzPsY0rMfPrb3anrjZN7IoDKS0k
 BmvT+kKnL2Y+yRnfPvfn3xM//S6a7ReRg4qICHkLIY20Fc202Rijqatmhfje/EJi+mnK
 7cxIi7OLilD+3SOvZ4qH9CrFl5yL5hvhY3bM3qTo/tQSJ291jFjNd/DRPbE+goznqwL5
 95Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JXiS3lAMU4XWqyp1x9Emjshm/HGDzNML+g5kxlJ+egw=;
 b=MN4gp6PJ+BYTI/I9DN/SfIBVlvrwcyRCVVJ5myjb/PIenPkguGOLd5+3JjeYt19RsF
 hSkQMerIrlFufz3BtRqvGpYtg3flgRs1sa9m6rmPP6mayE7D50Kqd2YDFUCCGdy9xBvF
 625ZIpEScMzLad4wRGgRofn/131lPL0hNS2mpDO+I+B0zpXD3ESGueEdmIb9lfeghXLB
 y5mRa9TJYzBJDfL/BUiIGXqmdRWkl7Bl9UuIl7fc0mCHJrIwi16cdWFhWZbvVV/u/wZ8
 I06P4kz6cMIlqCjmIhVy9VdBrPNT0TcSAxQ5XLIprxmTM4Anzx7kuj1qDC7zJk3qxnEt
 x+PA==
X-Gm-Message-State: AOAM5310ZSHERGz0zGxsORwLKD3rGELF5UiWJ3VUDzaWTwg0Q5Qu9SJX
 TqzbUw+TtH0q1bORIADJMtUTlGiLUrFJIML/LMY=
X-Google-Smtp-Source: ABdhPJxu82EwHXBbGswBaC+SjPR542rEb7Wdhea7WAwXI+qP6520IO3tldT7XWC4J3bRQkUfyc2CUz/YctdQidfblvA=
X-Received: by 2002:a25:a525:: with SMTP id h34mr5828306ybi.152.1606198176778; 
 Mon, 23 Nov 2020 22:09:36 -0800 (PST)
MIME-Version: 1.0
References: <1605261378-77971-1-git-send-email-bmeng.cn@gmail.com>
 <4e7e41c4-ce96-05c7-f2cf-27f926639d49@redhat.com>
 <CAEUhbmWDXFExcYGy6SZzz9t+TwHRD3LCuPAvg_S9_5tHRHF6-A@mail.gmail.com>
 <a29cdbe7-12f0-839e-4296-7bf4b846bcef@redhat.com>
 <CAEUhbmWPi=4u8y0U0Py7rxyFVkD5gqkDQsze39XjPaXsADnJtg@mail.gmail.com>
 <17dc8a7c-d72d-09b0-51df-ff907c1dcce2@redhat.com>
In-Reply-To: <17dc8a7c-d72d-09b0-51df-ff907c1dcce2@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 24 Nov 2020 14:09:24 +0800
Message-ID: <CAEUhbmV+YVRnwExU1g6Dr8pUSXo13-O5kSchTvomJ54CG2nuug@mail.gmail.com>
Subject: Re: [PATCH v2] target/i386: seg_helper: Correct segement selector
 nullification in the RET/IRET helper
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b42;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb42.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

On Tue, Nov 17, 2020 at 7:06 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 17/11/20 11:08, Bin Meng wrote:
> >> I see.  Is there any chance you could write a testcase for
> >> kvm-unit-tests?  Or just explain how to write such a test, and then I
> >> can write it myself; it's not clear to me how the guest can observe the
> >> base and limit of a non-present segment.
> >
> > I am not familiar with kvm-unit-test. The original issue cannot be
> > reproduced with a KVM enabled QEMU as the codes-in-flaw is in the
> > emulation path.
>
> kvm-unit-tests, despite the name, is a set generic tests for CPU
> behavior; it works with other accelerators that QEMU supports including
> the emulation path.  You can find it at
> https://gitlab.com/kvm-unit-tests/kvm-unit-tests.

I see. Thanks for the info.

> If you explain in enough detail how VxWorks triggers the bug, I can take
> care of writing the test.

I will try to create a test case using the kvm-unit-tests framework.

Regards,
Bin

