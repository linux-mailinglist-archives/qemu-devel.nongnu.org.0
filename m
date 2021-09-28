Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1354841B6A7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 20:48:49 +0200 (CEST)
Received: from localhost ([::1]:47902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVI9n-00065B-SM
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 14:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mVI7B-0003wY-Ip
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 14:46:05 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mVI77-0005Mm-Aw
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 14:46:04 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x20so30456wrg.10
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 11:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QtaWXYuk5FshlcNIgJxnqJftiu7EZnMxEY2+/Hk9cxA=;
 b=SEZKtXx6H3+SMgsTfNm0UzQnN8kfwlddKlKiFrHhdxT330Hy0MXhhyTf5Apr2sGBUJ
 7S2LP/zn+KPieqfaM1/YWAfOH+pRDxwHmb0DSWpTm8HEWcRKKP6mBYU5l/vedmHd02bo
 p0thn+8UILeiKr0PyICM/FMZSKuVYyieVVwmUEqU9IWILJ4W1jy2PszH/qRHpoAla61o
 +WNkl9oDQ/bfalNRO/jRs5jegZOMpA87S6AtGLNWmLH8vn3EjT2TKzt7VGeI//yFX7dh
 hAuNQwvbfxsrxjFPYZdhX/UJl9TY5Qt/EMnI4L4DnYJIIX6Qc3ousTJWMyc68znuRPyx
 5kmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QtaWXYuk5FshlcNIgJxnqJftiu7EZnMxEY2+/Hk9cxA=;
 b=iHCbiPH0NRjhfJEnA/qJJFqveVyAf5gC3Ysi1Vu6xe4h/ff0A4lj2rKFdObuxoGhqV
 8ajbF3fwwyqaRzZfzp4noArgR4aQCW3AGrLXu9AL8ed/tEVKmSERVd6+l2pllDrTrEY5
 I0DWEVFsPfBlmHliS5mln26SFCZbEgZ0Z17QGwA6PYpkuaUZTYNqmRfIHaKJ/rheuzjD
 mTRoulzUWMrp+xGIa6rEFaN8B4K0zm5GHK2v4QVf6rQaxjWAMCQE/5RwlqjgmRHIXOGs
 VsVSyrlCGKp4nFfiZkihtzjlGO0UFXrIbn/8Elfni66jociXKUEalIhUjoP/LKxCJMPS
 2YFw==
X-Gm-Message-State: AOAM530rn+SZs8VpBGpnXXGVBUx7T5frktbxptJ1jFet/sgUmhE2mkoM
 pQYUNeqKeOK4BehTlFjcgl0BlAeMZZovGZzx4cY17Q==
X-Google-Smtp-Source: ABdhPJzysRrDYGlV1R+Pe8mCqKQFnZrxlNwGFn6+UESlt5qq8D7tHgfT8eVCvRk64+tAkuV9hdl6r63tvQePWfg651Y=
X-Received: by 2002:a5d:574d:: with SMTP id q13mr1903893wrw.23.1632854757707; 
 Tue, 28 Sep 2021 11:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
 <20210911140016.834071-12-philipp.tomsich@vrull.eu>
 <CAKmqyKM7b9Xz0C7YN7QyARUJSAuDqxWk4VnwHfMB+5tTHGvy4w@mail.gmail.com>
 <CAAeLtUBk3ffamhKaqYsQkCW79Z6Jd+gMH_jAv_NXAVyDPdHOmw@mail.gmail.com>
 <1dcc5800-a3e6-d1b8-c2e5-0ccf2d724c30@linaro.org>
In-Reply-To: <1dcc5800-a3e6-d1b8-c2e5-0ccf2d724c30@linaro.org>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Tue, 28 Sep 2021 20:45:46 +0200
Message-ID: <CAAeLtUCiOFKN=xoJSJyuNHF2Yvc0pYb0ef3L3kB6NtGPQQ5h2w@mail.gmail.com>
Subject: Re: [PATCH v11 11/16] target/riscv: Add orc.b instruction for Zbb,
 removing gorc/gorci
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair23@gmail.com>, Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 28 Sept 2021 at 20:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/28/21 11:45 AM, Philipp Tomsich wrote:
> > The dup_const macro is returning an unsigned long long, which probably
> > should be fixed on the tcg.h-level instead of forcing a cast to target_long
> > at the call site.
>
> No, dup_const is first and primarily for vector support, and therefore must return a
> 64-bit constant.
>
> > Or should we introduce a dup_const_tl?
>
> Maybe.  I guess that could be a bit better than the cast.

I'll provide a patch that wraps dup_const in a dup_const_tl.

Philipp.

