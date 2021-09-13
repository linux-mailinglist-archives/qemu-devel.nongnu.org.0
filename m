Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060C6409A55
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 19:06:06 +0200 (CEST)
Received: from localhost ([::1]:54320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPpPA-0004Tv-Ln
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 13:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPpLi-0002bq-Co
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 13:02:30 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:42504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPpLg-0001T9-FI
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 13:02:29 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 u19-20020a7bc053000000b002f8d045b2caso473540wmc.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 10:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ao5IZ5L3II+TXHagt8lmTWqTNINd9ncTx1uXaEi+ZK8=;
 b=J0OwZLx32FDqiACOzRqnOE3XfCMoqgYidGIH8P01jaBpYPZypgYewGRDcd7Tu+BCkl
 qMYvcgOpXw9XTZZakauNKuz2vjn1MWilLZhmQwQpjkikYTprpmwXVQKaANb0yNGzsFy4
 vLXhMrhNa97fmMqQRo9N9Ym+KWwegt0d60vVdmQucLbSJcvENRGB+Ld5PBD2XnMJBjM8
 UoqqzJYHv7wKuGOYMgIEb7nYsw921JOJhIdYXmzbQhGQYM8DsMVmtKJnSwxKB4zpq+sS
 GQWdgylFvtVCzm/C0Ch5lxZ6sDXwzDubbT6T8ZQvJpzNZCjJ/kbx6glq6wvpGrTK9r9z
 fEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ao5IZ5L3II+TXHagt8lmTWqTNINd9ncTx1uXaEi+ZK8=;
 b=tMPthsz7srITjbLYiX0sidCIngSY0+bV5wLJmmwBmUfixKV6ktTcWTqboE7xVmGy0E
 9epNyRLuAocKi5ExyCuhthf+i/2cmGis3Zk3muPGHXUMKN889qygeJkO7PczWJtOCuYe
 uPz4OJxynUjsQVUse1N4D96J7pHgvOifKHFsilGJUTs58V6jszoer4Ohj/xqz8V9hnRh
 qA7s0oplHAKKaQIAuboxhDR1Rw8WH8eBH4Xg7s/p0C/0Scd873UOwFbxNs8qQPqLZmTC
 GszaBkA3Yf8x08/OM0VSw5Fx23ducm3K9lQyTmWmqMYh0kIXya2HJXWbBV901D2oKW6z
 AgCQ==
X-Gm-Message-State: AOAM530py6vNDn2cIy1Udo39l7g56V706zAI/Jat1Qu3RVUWl1QnSw4A
 zg4SI7kpV0UUr418xD6jpRV2I+Se1IVCBqWDTrdgrg==
X-Google-Smtp-Source: ABdhPJwPtPoRoasnew03WTftaWK0s1AwZWXHdhyd4LSBmFV2YmwKq2ozeMWf9wk0JiuWZejOzqKvFc1oUxmbanjB/5A=
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr5675159wmm.133.1631552547107; 
 Mon, 13 Sep 2021 10:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210912174925.200132-1-richard.henderson@linaro.org>
 <20210913110727.GF26415@redhat.com>
 <f6e7ab0f-aebe-c9c5-d479-fa30e69fcd1c@linaro.org>
 <20210913162827.GH26415@redhat.com>
In-Reply-To: <20210913162827.GH26415@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 18:01:36 +0100
Message-ID: <CAFEAcA_cBMBuZhYxipMwtjQCV+bzb5MKHKUj3+QWG_xvCX3CYQ@mail.gmail.com>
Subject: Re: [PATCH] tcg/arm: Reduce vector alignment requirement for NEON
To: "Richard W.M. Jones" <rjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Sept 2021 at 17:28, Richard W.M. Jones <rjones@redhat.com> wrote:
> Thanks for checking that.  I did spend much of today attempting to get
> an armv7 guest installed on my RPi so I could reproduce this more
> reliably, but eventually gave up because of a variety of other
> problems (one apparently in qemu: https://bugzilla.redhat.com/1633328)

That bug looks like it's the old "if you have an old non-LPAE
guest kernel you need to tell QEMU '-machine highmem=off' now".
So you can either do that, or use an LPAE kernel...

-- PMM

