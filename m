Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F66667BD1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 17:47:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG0i5-0005Mu-OM; Thu, 12 Jan 2023 11:45:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pG0hl-00051A-1G
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:45:36 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pG0hj-0000xu-AN
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:45:28 -0500
Received: by mail-pg1-x52f.google.com with SMTP id v3so13165239pgh.4
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 08:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IX4jc6ICPyfSVLMTYVAaxQVG+cqEexbaNzKWqxc4deU=;
 b=GpInqOOMRM5xZV53gtVGd83aH+taIlvRFg+vgT04hxwRNzjzU8IFJj7L9SwtpNTC97
 Eh9gGdcJ+E4tssHdv0XuKNncm57EIpN7cA0HuMXb/+hwdkL75UhEsFJhsJfmwQWMKgUT
 E07T3DHnXqI/iwyRtJGCtnOYUgfwhI1ZETVPmyTEAgQRcMdd4jjiM4WpthhNBl/YcCgp
 SWvM/XntFFNvCqG+Lgnasaos7jFSJhPlJ8IVmuV3G7RkkBbWxQGcsgohupKcStItLO7o
 g3bF0Se5OP+xjskAfPHYxSBVMMuojxtgXw8vP9muo/IsqolDRkaQP9FTlqM7SXx1QkME
 DELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IX4jc6ICPyfSVLMTYVAaxQVG+cqEexbaNzKWqxc4deU=;
 b=Y9qJbpc/c+Y2vCbmoH2vPJ4i3ATidqDwmaM8hMz4bY8i9gNtQyWGPV83NdBKHKNm/8
 L1KLRp77Q0Pe7Vcjd6PKUuWc+Uz+ptaLodHPiIrVL09cvxEhYuN0mQqr8LM8mzbKR2EK
 0KiuxEKZP9lLFSeNKemkzCzkOASYw54yIuL80jCOs1ya1E5faf8bZCxL2EaPx0mHRimR
 N5PmM8VfnWJLm66J45YAd7O6LwkvsI/KcY6OA/fvDC3HVS/w6JTYDGhldy+9KWFEAVQX
 Zh5pRemqphsU5XGzoBhJuGYEQCU67tFuvnhkKSO2l1zM0HHT9/pfaqsTCTY05TvAHeJV
 66xQ==
X-Gm-Message-State: AFqh2kqTyiTRcZhPvxExulh9JMhg49zHDM0v9vLDu5XdQGn/jUApxehy
 RXMD34xhTHN2ueT9mNGOn3zxx37V0wKfhnl+MSnJOA==
X-Google-Smtp-Source: AMrXdXvudL23d/l+c6aAhRPuSAmXDztgBwgOQnFkejiFpH8isGHVBRJji0ZXkafnvWILWGrj7HEj1LZPeMhR+lxOcHM=
X-Received: by 2002:a63:9d47:0:b0:4af:9f91:54d1 with SMTP id
 i68-20020a639d47000000b004af9f9154d1mr1211727pgd.192.1673541924653; Thu, 12
 Jan 2023 08:45:24 -0800 (PST)
MIME-Version: 1.0
References: <20230109170323.3796306-1-alex.bennee@linaro.org>
In-Reply-To: <20230109170323.3796306-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2023 16:45:13 +0000
Message-ID: <CAFEAcA8aBNcw7crRHXR2Cj2qHp-DsX+tqLLAzRAmS0hcUGMXxw@mail.gmail.com>
Subject: Re: [RFC PATCH] docs: add a proper feature overview in "About QEMU"
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, 
 John G Johnson <john.g.johnson@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
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

On Mon, 9 Jan 2023 at 17:04, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> I decide to do this because I was looking for the best place to add a
> reference to a document on semihosting and there didn't seem to be
> an obvious place to do this. To do this I took the original pre-amble
> to the about index and moved it to its own section, expanding the
> description and giving a quick high level overview of some of the key
> feature of QEMU.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

To summarise from our conversation on IRC:

(1) I like the current short summary and orientation that we
have at the top of https://www.qemu.org/docs/master/about/index.html
and would prefer not to delete it. We can add hyperlinks to cue
the user that they can go look at the top level sections
for system emulation etc for more detail.

(2) I think most of this text would be better at the start
of docs/system/index.rst and/or in a new subsection at the top
of docs/system (which would be more easily findable from
the top level if we added those hyperlinks).

(3) I don't think we should be mentioning TCI this prominently.

thanks
-- PMM

