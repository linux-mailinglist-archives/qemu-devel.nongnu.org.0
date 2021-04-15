Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE994360DCC
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 17:06:53 +0200 (CEST)
Received: from localhost ([::1]:53530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX3a0-0005Rf-Ss
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 11:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX3WP-0003Tk-IJ
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:03:09 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:42762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX3WM-0006g0-CB
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:03:09 -0400
Received: by mail-ed1-x536.google.com with SMTP id d21so8352515edv.9
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 08:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nxHyx7T/HxLI0z5SzewkdptKKHtzzwtIltSwsHIOcq4=;
 b=B+ku02S15JZesvnthh84L6rxPal8qk4cPV3UWuZl89IBvRf1tibG8fMZMQ9laWo627
 1qYA+GmB0MknJFdYWYIVmXFTIZhAqx5Gt1LK229CrKZ5kQl1vWuxmIe8ZstKw+9XSv64
 rEdBPQWVOS0ltiJRqmd2ZqTQxcDnWWA0/KB0qMPmRC7ujZhVknZrlEdOvIQi8V4cJyAS
 jjYkqWxdwlqrsgm+ovSB0wuVYUiWN94Pe1kpWorfyB0S7WXoNxQXZtpXrH3Udp4PIlxn
 WZ74Wbe/HBq8h+f56Qbqw84q8OlNv6qjPqWZxPPdz+pjeBL3hklxkuDPwo8xh3PfsueI
 aGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nxHyx7T/HxLI0z5SzewkdptKKHtzzwtIltSwsHIOcq4=;
 b=RK5KMGQYXTUUZYCM/DzFoqgrq1GDwuV95GCSETOoVui8T4KpHB2fGFtqdkLp1ARg04
 wGIihTd8AXgRFrkkgOyP1mc8FghqmLfIG0nRzsH4rJcM4a8ptRwaYMUQwepAqrNotGdr
 Ubo0Yc5sIdsj3Kbt4DDNLgDEw9r+1ZTsSKGKRLLA3Rcl34+rzMg6+uDbSfVJWq/Ja2eI
 h2sPUZcnxAHkLpfoY0MIe1GRgPz8z9RMVpmnokJN+qLAQ9qakZVC+40d98IBr94MRhHw
 EZTsn5wQgOnH1/WbYBEpA9w/o8y2D+ecfJMy6DWyN4nfUMg8q9rJQEE164TEws6PrU1S
 4UmQ==
X-Gm-Message-State: AOAM531PsAfty4YTq8YkpBws4hC7WycBaq0RvQHn7XQ5hR/sEceHZTuT
 nHQKvYdCMiT6iZk+CR+ul1hAM6LhaeH+QQm5qWJL2Q==
X-Google-Smtp-Source: ABdhPJwF/15OQZyPPuOgt6zcN4FWYCQoOm9ovjr63uPqBmxi1X1o5fDkIHHbjGZ7Uers/EcE7vHSUoTC4Kyxy93vDC4=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr4700020edu.100.1618498984793; 
 Thu, 15 Apr 2021 08:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210414134112.25620-1-iii@linux.ibm.com>
 <20210414134112.25620-4-iii@linux.ibm.com>
 <d3d690a0-c322-5fbb-26ae-dcbf08173b0a@redhat.com>
 <28224ba9d61d0d805a162c00903559f3b99bc722.camel@linux.ibm.com>
 <CAMo8Bf+s4OqYJLTkvyPvfnmH=FwxDSFn60TryKfgErxFyB+2yQ@mail.gmail.com>
 <cfae4bbd-3068-41f6-ec38-a27cf7381fee@linaro.org>
 <CAMo8BfJNcfAp_tJWHQziUQXxR8WykLcBGTKnHeWS=TtLYwTC=g@mail.gmail.com>
In-Reply-To: <CAMo8BfJNcfAp_tJWHQziUQXxR8WykLcBGTKnHeWS=TtLYwTC=g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Apr 2021 16:02:17 +0100
Message-ID: <CAFEAcA-k_wguyTDttUVxdxrdAjBotGRV8+drhcJ49nrWEVYFjQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] accel/tcg: Assert that tb->size != 0 after
 translation
To: Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Apr 2021 at 02:24, Max Filippov <jcmvbkbc@gmail.com> wrote:
> I see a few places where target/xtensa may do that. E.g. it does that on entry
> to an exception handler to allow for debugging its first instruction.

That should now be handled by the common code, I think (see commits
a7ba744f4082ab and ba3c35d9c402636) -- does xtensa still need to
special case this ?

thanks
-- PMM

