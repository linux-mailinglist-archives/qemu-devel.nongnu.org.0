Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 703216DDE4F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 16:43:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmFCZ-0003JA-82; Tue, 11 Apr 2023 10:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmFCP-0003Hu-Rr
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:42:21 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmFCJ-0004T6-Uj
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:42:17 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50489c9f455so2258303a12.2
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 07:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681224134; x=1683816134;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9tYSZk5Fru65LRrfi4OzRnhB9ZIK2giLFVk4/qJWImA=;
 b=T+jx+WTwC0g+vBbHREBhA2xOIiJV86ufATNu650Y6l6b+rx8vtHkJhw9CJ9EdUG4pQ
 THGoVlE2mDqkCZYBLvqz161+oQxMjSkESZqVYdUUtL8CuRYyeCTWSHttTQ30kh4mFmn6
 qZSEJJ3mkWemH9xpYviiTHSt9+D6tlKSPycapUL4+yCg/I5ty9kqy/xK/+XQYWitj9NV
 +HV3t/WmxHNUpsRLJzUpP5LQj7ylkbGHBqmW+sFiySUz670gZmz0cJWzHzC9f14+nc7E
 m+ekZxDD70P7kx2Cut7MDxCpo/ijrsDfG6qZuDIHzgpZnqbO2G8Lmqbdzm3khHma5kQI
 bCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681224134; x=1683816134;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9tYSZk5Fru65LRrfi4OzRnhB9ZIK2giLFVk4/qJWImA=;
 b=8OgNpK1pmQ2tCYDlJGngOLHcPlnb4aIC5X/T2eP2UxKmVobbzYVMcu/krGUY4941PT
 35jn+G0AH6fWwIcRc2ZQTyOp71EwYQl7fqH4yBFjdPfAHqf9yWXDR0tfwSG6lGxWpfGQ
 7c+MFxevEz/T64YzLO/x0Nixfeqgcsit8lxDfT94ZgdeTDSWjaddtVSJwUEmFu/Cr6Tg
 9YOQ2k90qV9fc9K9C0pfjJHuMXtqzHTOOI9rQPUeMayAEJ2EbdFpwWdobjyrwIHH/qw0
 zI0an/UIoiuBs4HCgf7dMFr3v4UPgY6Ma1ZnL5qm4yVnKS0qqTExS00mm0/UJ5pMIzFO
 m0Ng==
X-Gm-Message-State: AAQBX9elAC8iKpCPBJIY1lzTKYWo6lfHS2XXSOvxFqgUZwFJLueBsG+n
 AasKPsk448do+k+BWpltrZ3f3BAsfhsQ6+zscbrBdQ==
X-Google-Smtp-Source: AKy350YzGJ8pgn67PmNpUk3zu304rvFvrN7yIz8E+p6w9O6GCoQebsWp7MKRziyJUsvy9AQ1o7l7V8XOKYmldgVnGuo=
X-Received: by 2002:a50:9fe1:0:b0:504:87d8:ac39 with SMTP id
 c88-20020a509fe1000000b0050487d8ac39mr1365390edf.6.1681224134171; Tue, 11 Apr
 2023 07:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230405070244.23464-1-akihiko.odaki@daynix.com>
In-Reply-To: <20230405070244.23464-1-akihiko.odaki@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 15:42:03 +0100
Message-ID: <CAFEAcA_Ge0HX28qs+08h+k4GBWhNd6367grCdXgPupB46O+aHA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Check if debug is already initialized
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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

On Wed, 5 Apr 2023 at 08:02, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> When virtualizing SMP system, kvm_arm_init_debug() will be called
> multiple times. Check if the debug feature is already initialized when the
> function is called; otherwise it will overwrite pointers to memory
> allocated with the previous call and leak it.
>
> Fixes: e4482ab7e3 ("target-arm: kvm - add support for HW assisted debug")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  target/arm/kvm64.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)

I think I agree with Philippe that the better fix is to call
kvm_arm_init_debug() from kvm_arch_init() -- if we avoid
calling this for each vcpu then we don't have to carefully arrange
to ignore all but the first call. We never actually care about
the CPUState we're passed in, so we could instead pass in the
KVMState directly, which kvm_arch_init() has.

thanks
-- PMM

