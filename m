Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDE11F1624
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 12:01:44 +0200 (CEST)
Received: from localhost ([::1]:36260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiEb9-0003fo-8c
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 06:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jiEZI-0002jd-5B
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 05:59:48 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jiEZG-00056Y-UH
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 05:59:47 -0400
Received: by mail-wm1-x343.google.com with SMTP id y20so8129054wmi.2
 for <qemu-devel@nongnu.org>; Mon, 08 Jun 2020 02:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=q/AX4am+4p9ie6OugFVbW0SZFCmBFV+WzGlkO6Ds8vU=;
 b=OsKxgN7xFp0+2wzM20yjUnNpm5D9jO5R7/95akAF5P69opTpKLOlGsWeMRX0f3XQ5d
 8Pxiyx/X8kKkRHpLxBWmtYREbp20vBT3OOQ0EebJV864HE3GNZfa81QhCkGMNOukkhPn
 TI9pT/+BTPPu3EcrWa9bs6F8/LU5iq5h7P88TpF+IaAyjaCBNnRLGNiyEeDSJ78Yn9A2
 9lDIi0ORytKQnpmVWybU7uevS8+ON04tGnuOVn02usqocORHqI+MtZ6B9sSeqoxR9roE
 cyuGYn1Rp/xWupPgfBVLs3sPLSIi5bksBQJ0oFQKKxukaFm2i+r3tBmM5WUTiYCp/Yxg
 X1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=q/AX4am+4p9ie6OugFVbW0SZFCmBFV+WzGlkO6Ds8vU=;
 b=bWrsrFbsmrLN4awXWApqbJcytzh3n7ciWjtnts5iS5ZDOX8EzDfc5m6LKrNnYrHAtt
 E6dgXxa3M/G0I5d5tQ/YMwo6MhmNN1koZx64ymthfvo5X7GNjKjd45CswFDyuIBLP6Pn
 4edCYvWnRGPCPZLCUpMOcbULICIqRnAZTZHrvS021RJF4OIHrJqNSEQ5b+iikFpO4fqr
 qimPAbb0hgAKGCrCx0Oi+qY1KptAA3laAZQojM9CO2DFLCPzCUYlR8rEZfqwfcBBV5rN
 LUYX2bRm9hpwZgPDkZk3rXTX3rTsbEhyAn5ub9vfAAdC2uEyM2fnX0uXOcFtib/oXt8M
 VwHg==
X-Gm-Message-State: AOAM533QJClNDZUWVA/BUlzXn2gBlcoETfnJsjf7V6UMcIazhHjXa2/m
 Ja7BtEe91/uDYs/TrpebcpUptQ==
X-Google-Smtp-Source: ABdhPJx3TPzxZtQqcKvm8uZiLOK86jlemuDhwbZhClKKKoAsmTrq+7S7SgHJ2cq6qyzy/5BqtqQGYQ==
X-Received: by 2002:a1c:814c:: with SMTP id c73mr15376505wmd.140.1591610383034; 
 Mon, 08 Jun 2020 02:59:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s2sm21187613wmh.11.2020.06.08.02.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 02:59:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DB6D61FF7E;
 Mon,  8 Jun 2020 10:59:40 +0100 (BST)
References: <20200605093256.30351-1-philmd@redhat.com>
 <20200605093256.30351-2-philmd@redhat.com>
User-agent: mu4e 1.5.2; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v6 01/11] MAINTAINERS: Fix KVM path expansion glob
In-reply-to: <20200605093256.30351-2-philmd@redhat.com>
Date: Mon, 08 Jun 2020 10:59:40 +0100
Message-ID: <87wo4h7u9f.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> The KVM files has been moved from target-ARCH to the target/ARCH/
> folder in commit fcf5ef2a. Fix the pathname expansion.
>
> Fixes: fcf5ef2a ("Move target-* CPU file into a target/ folder")
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3e7d9cb0a5..948790b433 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -361,7 +361,7 @@ Overall KVM CPUs
>  M: Paolo Bonzini <pbonzini@redhat.com>
>  L: kvm@vger.kernel.org
>  S: Supported
> -F: */kvm.*
> +F: */*/kvm*
>  F: accel/kvm/
>  F: accel/stubs/kvm-stub.c
>  F: include/hw/kvm/


--=20
Alex Benn=C3=A9e

