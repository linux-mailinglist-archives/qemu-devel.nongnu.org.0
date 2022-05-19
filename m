Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2A852D1C9
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 13:51:53 +0200 (CEST)
Received: from localhost ([::1]:39442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nregy-00070P-H3
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 07:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nreXD-00005Q-5Q
 for qemu-devel@nongnu.org; Thu, 19 May 2022 07:41:39 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:40649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nreXB-0004Xq-LX
 for qemu-devel@nongnu.org; Thu, 19 May 2022 07:41:38 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id r1so8525048ybo.7
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 04:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Til4mGIcZaWb7VEv+hibK0b8Is6OleQT7DvKPwEE69E=;
 b=l7xtAyymJIPjhPpGXiEFhkNVhOQZcbXAGLya1Fykn4MDjBx+IruUhJSwwlQiCt0Ami
 dqJjj6IJafDj3lJRvYYd/U1ShwJ74s1Sszugolb7rZnACkagjS0pBPKQXe/Zi/zj+TXc
 7Xb5rgijT69uV6Hkq59qJQaqIy3bQnHdwUW9Zud8PJEslzNKa6NgWxDPuBRKCtFVzquA
 wEomD1KH/kEkSk3T1+yN175mLi0qsLf4yW3hG+JFUVZ3LQpM8FX/GeT79gcNTfoS7yvi
 Wlm4kx9sVei4cLuKvBIsoif6Ox6wqMbXlzYVGsVbcXCN7V7bFDbvjp50P3+CyUV33/Oz
 icvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Til4mGIcZaWb7VEv+hibK0b8Is6OleQT7DvKPwEE69E=;
 b=Zbyq/cLZlQrgKatmuC/wbFR6wMFEC7tjzpa3YJv4WgPD35JjFwhZkuZZu/J1SC55gX
 vHC72TmOn5aRS7YYGUADkfUecMkjkJZ9H/jlz2p3tiwU840isWicyEbhMHGnTSSiGzUD
 OB7ScBHgztc/qLruy7ToyL813Bgzh065jA0m/1Kf4TWOO6DBb5FhSW6+2Zn1OAnFNo4t
 g6Yb9ttBJ3LCUUo9Gkz7OrdtCIIAJQZok9oUsd8FmHBUSyJuIhwGtZVTvsIGQH1FClfz
 0AB4YpFeyfZcMUJizdw0Wtd9PB0WIOpHs1H1hem4OS3UnBebjyzNHf1uxh8e2Jt89I9P
 WSmw==
X-Gm-Message-State: AOAM533dhMSskQAr5go2OiHiZdn5wGrsJL5SWd6ZWe4j8mbqJCoD5mfw
 TWOVrR2I4L9WywQ+Y1QK9OR/GqonHyXCgqyopuqnWQ==
X-Google-Smtp-Source: ABdhPJxL6vaQfZE0G4QPyTx98/hRIsOD2UweMgRc+pPRa3pgp7n9cb3dFAb2SBUuBp+vLaR/sCcbtbvHrKC2KOf1JRU=
X-Received: by 2002:a25:257:0:b0:64e:b1fd:2d54 with SMTP id
 84-20020a250257000000b0064eb1fd2d54mr3794565ybc.193.1652960496739; Thu, 19
 May 2022 04:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220516145823.148450-1-thuth@redhat.com>
 <20220516145823.148450-4-thuth@redhat.com>
In-Reply-To: <20220516145823.148450-4-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 May 2022 12:41:25 +0100
Message-ID: <CAFEAcA8t37wT2D-tT0n0O2HP1sTtYfeS8p2Wd+4QE6jsJ0k9Hw@mail.gmail.com>
Subject: Re: [PATCH 3/3] capstone: Remove the capstone submodule
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 May 2022 at 16:22, Thomas Huth <thuth@redhat.com> wrote:
>
> Now that we allow compiling with Capstone v3.05 again, all our supported
> build hosts should provide at least this version of the disassembler
> library, so we do not need to ship this as a submodule anymore.

When this eventually goes in, please remember to update the
wiki changelog page's 'Build Information' section to let
users know.

thanks
-- PMM

