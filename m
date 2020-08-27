Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F4725470B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 16:36:57 +0200 (CEST)
Received: from localhost ([::1]:33884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBJ1N-00014g-0u
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 10:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kBJ0M-0008Iu-43
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 10:35:54 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:34204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kBJ0K-0005Jc-Iw
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 10:35:53 -0400
Received: by mail-pf1-x42c.google.com with SMTP id m71so3664066pfd.1
 for <qemu-devel@nongnu.org>; Thu, 27 Aug 2020 07:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IFIyZt8QUf2ImM9QwGk49iM0ryxQBhqE0wOtAPAlTKM=;
 b=Y5ZBtFTWjH8JQQv8BVooXLeky6ZHRA4aphsUvfYsFTlUE77VfcG2weFq+S8Y0tnhJj
 fngvb0cjB/9z3LkBazXimgzfpiQ70holbsLFOKqlfgvbErd7VyW3cWSHQvANdfq54TjA
 vEOLZ5zjySmfXjuE5MnLs1zIr2R37BSrLMRnUbfNHmCzed5ftI2tn0ik6CD5AC6lzr6c
 9cfwi1zdYbOPujoe4DWOjU2Aq6xLtiQ2c9qxyu4BFaV9TtTO+MUAqPlIDF6H3KTpoHt9
 MgMVofwa9RaGiVz7/iPgIGqtNEb/qtweeZVCNJK6Ig9frMy0Ag0qOfgBsigqQBiD779V
 V9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IFIyZt8QUf2ImM9QwGk49iM0ryxQBhqE0wOtAPAlTKM=;
 b=ZUUNt9TIboVUCAT3CZx4MRhzd0WMo9hyHxNo7VP137jUygclGSsw8IXeLxIMg0L3JR
 rdwUyw2GMpdVp2Tv52YUhSfDqiJ+w0BxUxTGLX8n3M9zo91IWFFKf+h/Jae2Eo5AATxO
 wd1CWPAmeoDG6Qy8vGT5gJtGIXhCUqfnd6DAWurukFPYAG1Y0qd8+xfy8l6OJkqQggsR
 P6Ar5dyVoc/lVHcGsVE07jbz3ktuxuA3MXcQ+2z00vrPNMCzvIYtwTbXuQaeTI63YoKB
 PwHpIlj3zeq46dw5JmhM4sLXO8BAtIxO7hVf9aJT6MGXX1V7uvT1QQdkxLupMpGQVBu9
 Yb7w==
X-Gm-Message-State: AOAM531Cxyj+t8bx/ccq3AR579mXYCbx063mA+tb0zfA4OhzJqazoaU8
 LQaOqfPeAGyMdO/Gd8e8z1e4ERf2gFvoyuxdeuA=
X-Google-Smtp-Source: ABdhPJz9yWtuUMGJT0ftaz8lyqUmI0Xzg57VpnJrDUJrawsqjm2DrlZYj9090lr9JLIZeG6pON/Mkebu2uqle6GX53M=
X-Received: by 2002:a17:902:aa97:: with SMTP id
 d23mr16832990plr.146.1598538950969; 
 Thu, 27 Aug 2020 07:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA-dDW27t7VcV5D=01ckBOD5oerr1XK0an7BemORdyQHHA@mail.gmail.com>
 <CAFEAcA-SmcO2ENZyXpPxxkqwybXP8=m5DXpeqkKw9PdaGnbm0g@mail.gmail.com>
 <CABgObfbO7pB_7RKH4zrFwNfCppmtEfAhcaqF7rnAVbNR0BVXDQ@mail.gmail.com>
In-Reply-To: <CABgObfbO7pB_7RKH4zrFwNfCppmtEfAhcaqF7rnAVbNR0BVXDQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 27 Aug 2020 15:35:38 +0100
Message-ID: <CAJSP0QWF2ZLAhRKx6P8sz0ucToQv5zVrK6uW6AziJdx6qTWZ3g@mail.gmail.com>
Subject: Re: odd meson failure: Unknown variable "exe_name"
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=stefanha@gmail.com; helo=mail-pf1-x42c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Aug 23, 2020 at 9:34 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> It's a rebase issue from the introduction of fuzzing binaries. I will send a fix.

I have sent a fix.

Stefan

