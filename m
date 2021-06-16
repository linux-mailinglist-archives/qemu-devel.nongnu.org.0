Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD633A9B2C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 14:53:41 +0200 (CEST)
Received: from localhost ([::1]:59216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltV36-00023x-Kv
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 08:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltV0i-0000bg-4u
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:51:12 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:34800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltV0g-0003YU-23
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:51:11 -0400
Received: by mail-ed1-x52a.google.com with SMTP id z12so2555257edc.1
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 05:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CKNkqwcteOp7BaZH9RP5gvh0zpuT7jSxIx//s+JCicU=;
 b=iLbvjhhVA12EU+SBlLLDYp106Vdpd8t6uoaEEA/bwWLrWgZhIZ+7aQwfzt34jrVVl1
 Db1uzueEI658YLUblb6NBYB9CT2DUybaVLdBU4cWw419BZrdSI2MGtFX7yXC49zy3b6s
 UuSFatskYq0w0/Yj53gicmVtrlJfIC2Ipjra6xalbc1mCYa857JxMIlM4HeLFsRfEPd7
 GjdSYyrEc1Qa8mNHiQeKHob4MjSq3m6kC9k7mh9yjJZDIQqwbXPr10V6MbiBYJ8XV8hu
 /xb/cEOhtEmTn0KvC0CatPsV8leP32hZuctoJTenCYqKywX+hrn9JdmVRar3vjwZgrBb
 ursQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CKNkqwcteOp7BaZH9RP5gvh0zpuT7jSxIx//s+JCicU=;
 b=unbAFFrurHzcMJ/CG/dH7Sya9mqrUuXEke9GlUpHRJbGRN/whIgN/WSB+GMj29q1IF
 Jlq5ngt0dzgNMO4e1+4hbmYy9gOEpNokmiDdlKTSKwqnrJnW0HmOUaMXx3S7VRSmgAT5
 H43RDN/Ji+qXa5+84lodS0o21EVXkBYqP8VJr9SqHuIUV8m9J3/Bm6oasl2HNHq0uQuJ
 d74wGWGBKJY4NX6pcNufqoPEIEAZ0KYBeb57IBCrdVQlDdFPqKo22ltvl5u/spUSyzU9
 LlbCJSmBufvV0BAHg7rqoc2UZRSOjmqVH9YXRAn6IpdYpZgiLxJ2WwjRQ8gyrPmy4Cp5
 jAAA==
X-Gm-Message-State: AOAM533/XF+q7c79HyyYROIHuIgUs1gp1QOP0CKI1PvzpjfJJAlDtccZ
 QYHidOhkNn/55fDWjnkoWC5lLgdNyubK+fC9VhFL7Q==
X-Google-Smtp-Source: ABdhPJw7K89lIY87+nqKWwE5why8JgKvMJsdOFPMmirFmUa7E+JNVpzODgzwgDlXtxqO7EEx2dhQwL2vmdkwkOqLAOU=
X-Received: by 2002:a05:6402:1216:: with SMTP id
 c22mr3961396edw.36.1623847865962; 
 Wed, 16 Jun 2021 05:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210615152152.2496772-1-stefanb@linux.vnet.ibm.com>
In-Reply-To: <20210615152152.2496772-1-stefanb@linux.vnet.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Jun 2021 13:50:31 +0100
Message-ID: <CAFEAcA8deRZOmbgAYU2Qr6dcV6bd+scYirwznyA9Cq2pTqYiqw@mail.gmail.com>
Subject: Re: [PULL v1 0/5] Merge tpm 2021/06/15 v1
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Jun 2021 at 16:22, Stefan Berger <stefanb@linux.vnet.ibm.com> wrote:
>
> Hello!
>
> The patches in this PR eliminate all TPM related code if CONFIG_TPM is
> not set, thus reducing code size.
>
> Regards,
>    Stefan
>
> The following changes since commit 1ea06abceec61b6f3ab33dadb0510b6e09fb61e2:
>
>   Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-pull-request' into staging (2021-06-14 15:59:13 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/stefanberger/qemu-tpm.git tags/pull-tpm-2021-06-15-1
>
> for you to fetch changes up to caff255a546d12530cf7c28e60690cd0e65851fd:
>
>   tpm: Return QMP error when TPM is disabled in build (2021-06-15 10:59:02 -0400)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

