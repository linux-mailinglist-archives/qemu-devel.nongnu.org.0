Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCA46F419B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:29:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptnFZ-0003cy-84; Tue, 02 May 2023 06:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptnFW-0003TW-Hl
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:28:46 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptnFV-0007on-1O
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:28:46 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50bcae898b2so2567077a12.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 03:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683023323; x=1685615323;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CFjddmb+gaqnAxWy5AwbZY9dBYy3RIaTgKxcylDUI9k=;
 b=L24OCmZzWlfQ4KCTU4UDYMoTbEDgFLeIghhuzCxqNn/YTeb+quuzaMozdXLU8GR87b
 AXLGpQ+pxYah64vTSJP0ZQRth+XpvM2NJ/Noj0X1SwtH0mwpCivHZO9IuibZPft1Yuks
 z1CV3wV3sBi9rDsbPjow7u7htkAYF18LkvrfLJ9PmcrWVe4Zu40IFl64QG5YGHSe3Ude
 jyPfTDvGXYYE7IUbAlUm1y/b5C9kFqzYbawqo+BhG17FugfkCZDWdwR9Hqz80myyWdoM
 G3TdCCxgAPTji8htUhHwQrDohiilvr63P5s3ARVOzoWd+3pqbVX0CEnVd/mE++WssS9W
 d4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683023323; x=1685615323;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CFjddmb+gaqnAxWy5AwbZY9dBYy3RIaTgKxcylDUI9k=;
 b=hdMiNuEsHV+sT32KmlgGQ5f5Y7XcYrn1Yrsxcb58sJtPd6qplrZRCWCF7WgVUokwan
 ezSUI7yDr/h5cggCpTzhmZ7UBpwOK7BYsPmWo6hRVmcOBL6vpx3ln38p9WlssjBK7+t1
 IqDILS0tnuBULQuSVF6e2tT9wYKlBIuSfgP9fnnpiQ9iEJaCvALDoSYpvGj91lQ9cfb4
 llv4xe3pXbsI5fdnlw10EXdCQx5Gd8eC9HUxgphpLbRVdNfbr+UR3vxjIpYpuZJJQbV6
 8OJYWlzdTKI6b2/kCoUWFeunPD3Y2g19iQmjEbJiVcu438lfMYM3xD0nS/floO/Euy9t
 QyDg==
X-Gm-Message-State: AC+VfDyAh5fMfd6XuFSzzoFEfOEr7ohVCEGHsEuijqm7qshKgZb1tGsn
 jXzWwf3svhcP7S2pOFS2z7wtH0BHQap/Q2lxkr+h4w==
X-Google-Smtp-Source: ACHHUZ5PrBdqpzlbjjlotGPpz/mRCvRpyKkyyVPgL1wxTIyGVpr68Xy2UsP9y7mDeeoNyzcmd2nQNaYdqSok7bivpfA=
X-Received: by 2002:a05:6402:513:b0:50b:c2b6:90eb with SMTP id
 m19-20020a056402051300b0050bc2b690ebmr5857900edv.12.1683023323498; Tue, 02
 May 2023 03:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230424152833.1334136-1-peter.maydell@linaro.org>
In-Reply-To: <20230424152833.1334136-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 11:28:32 +0100
Message-ID: <CAFEAcA83W9CjNZ_6xBMTWbHGhTJNRo7RQ0+4uCnY1owMxc37jw@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/allwinner-a10-pic: Don't use set_bit()/clear_bit()
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 24 Apr 2023 at 16:28, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The Allwinner PIC model uses set_bit() and clear_bit() to update the
> values in its irq_pending[] array when an interrupt arrives.  However
> it is using these functions wrongly: they work on an array of type
> 'long', and it is passing an array of type 'uint32_t'.  Because the
> code manually figures out the right array element, this works on
> little-endian hosts and on 32-bit big-endian hosts, where bits 0..31
> in a 'long' are in the same place as they are in a 'uint32_t'.
> However it breaks on 64-bit big-endian hosts.
>
> Remove the use of set_bit() and clear_bit() in favour of using
> deposit32() on the array element.  This fixes a bug where on
> big-endian 64-bit hosts the guest kernel would hang early on in
> bootup.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>



Applied to target-arm.next, thanks.

-- PMM

