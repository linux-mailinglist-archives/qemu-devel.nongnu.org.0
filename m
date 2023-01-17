Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA57B66E209
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 16:25:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHnpJ-0000Rx-18; Tue, 17 Jan 2023 10:24:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHnpH-0000Rd-Rp
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:24:39 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHnpG-0003zB-8R
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:24:39 -0500
Received: by mail-pg1-x52b.google.com with SMTP id f3so22210865pgc.2
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 07:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VxGfnLZbl8s+w4O1PgvBFziNKFycArgQaGQPSdH6DeE=;
 b=Ak1juYI6rSebqVurtvU2pmcIL3+TLqprG+5VG4uE3R3Td9n5udULAjH41gVpTYRHHi
 Sha0msStGNFTmpZq0PTEa//hPu/hHVuWuhaUM3tNTyEIZ4iEBkt9IJbclySrdFGZOlB3
 9fmQkxxaGb36Ewusndo7D0EVtpaf0XbAV63myBYsC2wtR1jFdKQ2kzwoUqPZwtt+HNUI
 vm0V2HborsOB3SD0b5+vm60Dn5X6N1Ksso/ID8ptPJKUuPFIezz5GqinqsSOSJ0ABrcC
 3llgWTr54IfkcDYx0qVoftoNL/0wCJ4J3VOnNyzi01IgK+cOhWnyZTcNEwNGZR8S5nre
 H01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VxGfnLZbl8s+w4O1PgvBFziNKFycArgQaGQPSdH6DeE=;
 b=uox2Vuxj4eP/k/IKv6yYzsBEXJKhRQcskgk7HcjIFUaljMHyHUpM2i4zbywpIjDxQA
 GW2gMTBI34kKGMoqfQt4lEc2Gly/xUK1yC097q6hljU8i94GmRbZ5FqypFIY/OK4rMxV
 SRl8ds/NorLkAB7cwxc9wc1pBifXrrWDolaTI8aMav1AqPaIHpi8ZBbhSQnwCDC8kJhm
 1jnSJUaCYK3gFrd8UEi8xVpSrZFlK7FtomdA/v23Gir379HeMDLe4fDuGtAAFmQmdXrK
 NNT71qNiOAy/H6lQdvRUZl/sQA+nU2hlN7+xjJAwodixdmfk/kFKwePaNXYqdHnhNxJZ
 Z+AA==
X-Gm-Message-State: AFqh2kqx+eS6gJnpL+XQIWA5ZVdPiVrCV3GbOxKa+aR9d+ONbmh3ipHP
 x7i6Mg5olQGUpl3yCH7p+ZCPxj8XPIHrRUgj6zHkYg==
X-Google-Smtp-Source: AMrXdXvciVixNGoJOnIz0+CwGVP/WHT2ajzQd6MUPdRBPyyDDOsrPNERd8TRN8/2XQxrN4e1U7e3kWjM52E2NehfC/A=
X-Received: by 2002:a63:510f:0:b0:477:86c1:640f with SMTP id
 f15-20020a63510f000000b0047786c1640fmr276336pgb.231.1673969076664; Tue, 17
 Jan 2023 07:24:36 -0800 (PST)
MIME-Version: 1.0
References: <20230106172851.2430-1-eiakovlev@linux.microsoft.com>
 <20230106172851.2430-2-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230106172851.2430-2-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 15:24:25 +0000
Message-ID: <CAFEAcA-VkWjSO84dCmoeKaO0PEFydi7Bj2gXhBYDatGpuCuc_w@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/char/pl011: better handling of FIFO flags on LCR
 reset
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, marcandre.lureau@redhat.com, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
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

On Fri, 6 Jan 2023 at 17:28, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> Current FIFO handling code does not reset RXFE/RXFF flags when guest
> resets FIFO by writing to UARTLCR register, although internal FIFO state
> is reset to 0 read count. Actual flag update will happen only on next
> read or write to UART. As a result of that any guest that expects RXFE
> flag to be set (and RXFF to be cleared) after resetting FIFO will just
> hang.
>
> Correctly reset FIFO flags on FIFO reset. Also, clean up some FIFO
> depth handling code based on current FIFO mode.

This patch is doing multiple things at once ("also" in a
commit message is often a sign of that) and I think it
would be helpful to split it. There are three things here:
 * refactorings which aren't making any real code change
   (eg calling pl011_get_fifo_depth() instead of doing the
   "if LCR bit set then 16 else 1" inline)
 * the fix to the actual bug
 * changes to the handling of the FIFO which should in theory
   not be visible to the guest (I think it now when the FIFO
   is disabled always puts the incoming character in read_fifo[0],
   whereas previously it would allow read_pos to increment all
   the way around the FIFO even though we only keep one character
   at a time).

Type 3 in particular is tricky and could use a commit message
explaining what it's doing.

I think the actual code changes are OK, but the FIFO handling
change is a bit complicated and at first I thought it had
introduced a bug.

thanks
-- PMM

