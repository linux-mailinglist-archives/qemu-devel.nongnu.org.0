Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0794235F0E5
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 11:37:47 +0200 (CEST)
Received: from localhost ([::1]:55366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWbxx-00073r-NM
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 05:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWbvh-0006Vx-KF
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 05:35:25 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:35350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWbve-0007Fr-9v
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 05:35:25 -0400
Received: by mail-ed1-x52f.google.com with SMTP id x4so22904359edd.2
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 02:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=alwnIiJQ3wwTg7X2tj1ZneTRQ5ENJCZz0FW4LaGKqOk=;
 b=LlU8bWYcPtC8WGIUjIqJOyy1cBmDpbxpjpVcS4opZHo9L4ItrEiqs8AYwFrTcraTwC
 0oD4ObvDfZDX0H/8EltlsPWkEUrt3xbqR3pErDUYugC7bLxykq+CZce0j+OoMzXJt8HF
 LJOjD3mBHGATXizsMJintofaBpqHQYTrVB853VUgj22X2wst4yZlutH/L9svF9/67k7l
 Vs0nRMSh02hew2XKYV4b/+YkrOEM54+GiUt4qHmVQUyVm1CyUElq4tbEZYjjs5plGatZ
 aw89SM3hnRzVQRCVZAIMB+4ft4Te+R0KlWftNG5ZM5F4qL7iUT5F9lR96Fl9EGUUm2CW
 aTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=alwnIiJQ3wwTg7X2tj1ZneTRQ5ENJCZz0FW4LaGKqOk=;
 b=mRFpc8R5KyCfPjKmdfI5EKkWbGbr9En+TsTCY9uxATuJMfAqVkCLC1hV+cSlsCtq+i
 SmMi/FlZlIw7QFzB0tI9/aLcQVLJ7vqrUNcZTb3MlD/6kcI5+Lf1AHldpDTncqwhoVzq
 TW/23Qh9cAOKKhgPqWxXZnl9PWsIUv71wTAZ44sSnHPjO0En3oBFC7kwK5Yki0MzmF52
 Msnq1n7BjUw5TBIzaT+NylHefusDayrcA1A354v5sXAiNL1vRGi5J0T+HrrRf/ZNqehi
 sc9O9BstkJmzbSQpkuchQfF93szYoOsjenptsQL7ElQMks7Dn6w7YedxBHXoMey7Eujo
 aEMg==
X-Gm-Message-State: AOAM533M10xTi3A0qS6vSbJDxpJZp6HYlUO8kvDkZhxYHmqujenJ0aP2
 0EudQLlftpyyAK1Y4DN6x5Q6LVH/c19tLMuI3K9IeQ==
X-Google-Smtp-Source: ABdhPJw4vs9ydBTGraupgDyz54oxZKV9RNoTyDyVR06rT2ihceMw9709pq0D7riuDvbo2lya6fTHJD6g10Pnhql04G0=
X-Received: by 2002:aa7:d28d:: with SMTP id w13mr2342935edq.251.1618392920146; 
 Wed, 14 Apr 2021 02:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA8=qEFgvUqGFdWLJ+1ePPv2Ybisomrs2o77PyiAZA2sXg@mail.gmail.com>
 <CAEUhbmWsBfhub-+hMvucshCRH412fuvz5_=fAU_y7UmYJ4_=dQ@mail.gmail.com>
 <5445e140-94f1-dfcf-4652-0e47494e8c23@weilnetz.de>
 <CAEUhbmWJ3kGk4sVM3+TsHmZrDrekqSYcFebpztedU4jkw1DoWQ@mail.gmail.com>
In-Reply-To: <CAEUhbmWJ3kGk4sVM3+TsHmZrDrekqSYcFebpztedU4jkw1DoWQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Apr 2021 10:34:33 +0100
Message-ID: <CAFEAcA_XOeoXDVGgMHYXmWj2=pQXsS4__izzOrucYP+ZsbyO1Q@mail.gmail.com>
Subject: Re: any remaining for-6.0 issues?
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Apr 2021 at 09:31, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Stefan,
>
> On Tue, Apr 13, 2021 at 2:19 PM Stefan Weil <sw@weilnetz.de> wrote:
> > That patch is based on an older version of my personal QEMU sources and
> > not required for 6.0.
>
> I am confused.
>
> I see https://repo.or.cz/qemu/ar7.git/blob/HEAD:/qemu.nsi still does
> not contain the fix.
>
> Or is this qemu.nsi file not used in the latest 6.0 installer?

In any case, that is a branch, and so any issues in it are not relevant
to 6.0 unless they are also a problem for QEMU master itself.

thanks
-- PMM

