Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E4E4C2C4B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 13:59:02 +0100 (CET)
Received: from localhost ([::1]:55960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNDi1-0004fq-N9
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 07:59:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNDcy-0005ko-CE
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:53:48 -0500
Received: from [2607:f8b0:4864:20::b2f] (port=35669
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNDcw-0001ob-3R
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:53:47 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id bt13so3619249ybb.2
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 04:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GRBDVTzcuYqNGgw6Uwjpe8bJtuUyK1gPxnqjvDUw3sY=;
 b=mMrfglo5n+wTbPRSovXb4CuODGjWbQqENjwShu1rj4DQrWgRUEHFY/gxXNpdvCZaHB
 a1HMJQr2Exp7S3qkg3s3gR6+NVALnzdDhueHrnfV6U+TrDr7AkgNcrwjKiJqLq7U6XSE
 2n/d08WXuGExO8kGVJIhrxabgko3TkjbrWs5y0ESxpqyhWTF8Z6bOVrDTLgzuLeLviyb
 rPzAOuycbaWWlTyWj703HKbsSelB+Tm7EzllMQc36mazMfNgjTfbsoSOc7qfL9tkjCRx
 NsdGd5E1alKq0RWb32cgC1EpxmGsuKRmwelzI47FDHqNSxgzYPbg1ZjxTpqx/tJ8dZLZ
 wdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GRBDVTzcuYqNGgw6Uwjpe8bJtuUyK1gPxnqjvDUw3sY=;
 b=ph++xyKfdW7z0nU4M2JC+SMYk2BGJpJvwSIJkOp3js3CRjoMs6n8an0HiFM0B9WpDE
 qQnY1wvjaJNLScP8r9aIGdbCg4TRmDwaZVMyRoA+wQVf2KITh5xkpEcLCWNnF0V+EgKx
 uT1uIwQ1efsf00jCriRyWULvYOjXRgSHmhEdYvepDqYFvhVJQ+4DdOmIQgYqwr0+ISDw
 ThBDDqPqX0+xcLB+fUyItZPZK+rxJytkHI/wZMmqZ9RBwjVBqPt7RIbYUVf7v5MAmFca
 HP0DMoBd6jPSdWu5f/yLQK3+AkWxwWzr7LupqaPDv1ylOCP3kRFEcwgcUZfAVAgZsEsw
 fE+Q==
X-Gm-Message-State: AOAM530X4yP5XdtuZg77SXDxht8tiznPNJ/+lC6sNx2JwkmCxjtj4Cwe
 C7WG7MehkPiiCCRDVHg6kbMife7OumgQ/xs2fZkMcA==
X-Google-Smtp-Source: ABdhPJzSbdZNrPR6oefMAKAEMiILHM9FCzkK5Z2IeEfDhOl9KuqVD8IOjjXQzEp9vQmzNcmPhdlgxatAachlPLJRwVQ=
X-Received: by 2002:a25:69c4:0:b0:624:4ee4:a142 with SMTP id
 e187-20020a2569c4000000b006244ee4a142mr2290233ybc.85.1645707224336; Thu, 24
 Feb 2022 04:53:44 -0800 (PST)
MIME-Version: 1.0
References: <20220213035753.34577-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220213035753.34577-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Feb 2022 12:53:33 +0000
Message-ID: <CAFEAcA9eXpxC7R_qcDsBh4C9Aur5417kTzAhs4c7p2YRCFQUKQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Support PSCI 1.1 and SMCCC 1.0
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 13 Feb 2022 at 03:58, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> Support the latest PSCI on TCG and HVF. A 64-bit function called from
> AArch32 now returns NOT_SUPPORTED, which is necessary to adhere to SMC
> Calling Convention 1.0. It is still not compliant with SMCCC 1.3 since
> they do not implement mandatory functions.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

(I noticed while reviewing this that we report KVM's PSCI via
the DTB as only 0.2 even if KVM's actually implementing better
than that; I'll write a patch to clean that up.)

-- PMM

