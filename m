Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0202AFFB3
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 07:35:26 +0100 (CET)
Received: from localhost ([::1]:34716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd6Cb-0002r9-UU
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 01:35:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kd6Aj-0002Nn-VI
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 01:33:29 -0500
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:36618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kd6Ai-0007pQ-4d
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 01:33:29 -0500
Received: by mail-yb1-xb42.google.com with SMTP id l14so192120ybq.3
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 22:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CwTad+ug/WbwbBN9HdNnNqe5FWGBwV+ksp70aTHF578=;
 b=pBTIiPmULCASCSQCcUxCVEADChIaDuSSoopiwMmHiLF0mAJdYd3F6Ji72/uCn6xbxy
 7RuLGbLqPs0kMOmQ7IygWxBEANV1Ui0uN0ITwkCAt/jz340XD9IfQnM3iqJaSs6IoyGe
 HmLazxGq1fe6PzO/zFAzsHeLJDgzE9h1RWebHCVd8QRerBZmXqaYDLNeGs2m4nTtmarE
 WWrXXfvmTZhBAdVyDgdzEfiYc3dLmuaGKOE8VzvRFL9l2t4XyHzhHDK2JOmUIQGWlZC2
 16nTf+0agPOViPw1xpi3yHSGVPwJGz8yz/XCjFdWvVXgJDV23RRha8xLbcqqtNZXKi41
 jhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CwTad+ug/WbwbBN9HdNnNqe5FWGBwV+ksp70aTHF578=;
 b=AfK5eNk5iZe54KBEyEIlrvsxDg4YtQB/t62imXw46uOPvBeWVgLDK5XN82ch0EuqJk
 5rxfkwPdSu8P7OdDZRTpwEJniPi/Ib7qfW5GQCRWiCgmQW4dWH1PZGsXXZhrav3Yqi8v
 r/FUT47cZ7AS3bWXjmypXVxVKUCxCzhVfjCsm++f/xRjyYLIMZl9pC8vgGRvoGdRUEbH
 HtGBiECD0IccWVe36QzCf/7c8v5jLHQbCiEF1BnMwM/5qF4vmlCSL8ZMrNhTzIKYBEk/
 DbAJWOMa1I3tSd/mAearF5Kn1Uf4WJo/3xv25gCh5+VHboEVKCyLz8hEVgfX0NQOoaCB
 CAyg==
X-Gm-Message-State: AOAM531thd41Xvj5Uot6wdrLoJ6+SUm9j6GxJTkG8ZDGjTN+x542omMC
 Q/a1xjbqmmjX3ZM11uZAbT3QyGCnXlOCjaVnlxM=
X-Google-Smtp-Source: ABdhPJyqG09uvOzm3fw4C2vOw+leyQkBFEMXlaAhQTX/67pjKAiiy3zMbXDoSTMQzJnOtukUpQVUVqUWClsFwDSasDw=
X-Received: by 2002:a25:bacd:: with SMTP id a13mr41856877ybk.387.1605162807056; 
 Wed, 11 Nov 2020 22:33:27 -0800 (PST)
MIME-Version: 1.0
References: <1603361762-43062-1-git-send-email-bmeng.cn@gmail.com>
 <CAEUhbmVs0SdqA_KFK4xiuCqHcKFke5sNBBrwjLTXbyCbew-nxg@mail.gmail.com>
In-Reply-To: <CAEUhbmVs0SdqA_KFK4xiuCqHcKFke5sNBBrwjLTXbyCbew-nxg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 12 Nov 2020 14:33:15 +0800
Message-ID: <CAEUhbmV9pNg0d6hE_copdMQyb2=3HyrSo--q26MeJT_c_yAM-w@mail.gmail.com>
Subject: Re: [PATCH] target/i386: seg_helper: Correct segement selector
 nullification in the RET/IRET helper
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b42;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 2, 2020 at 4:20 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Oct 22, 2020 at 6:16 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Per the SDM, when returning to outer privilege level, for segment
> > registers (ES, FS, GS, and DS) if the check fails, the segment
> > selector becomes null, but QEMU clears the base/limit/flags as well
> > as nullifying the segment selector, which should be a spec violation.
> >
> > Real hardware seems to be compliant with the spec, at least on one
> > Coffee Lake board I tested.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  target/i386/seg_helper.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
>
> Ping?

Ping?

