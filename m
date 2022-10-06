Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D125F688A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 15:50:43 +0200 (CEST)
Received: from localhost ([::1]:55386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogRGq-00066c-Ts
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 09:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogQm6-0001D0-7n
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:18:54 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogQm4-00025X-Lm
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:18:53 -0400
Received: by mail-pl1-x630.google.com with SMTP id x1so1696638plv.5
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 06:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eTB+vUn+2e6AI6dzJ525GBpI7RaDj6C8DPcqMmmXbDU=;
 b=wvqYy/RZX1KuglQP5iPpZhLMW3sulwlGfOr3F3otJrDdgxkH9FiQA+/oiDZzyP65JI
 EU+SoTDE3L54r82mZmxLFt4zeEjdMALm3ZZDOF2+wtzq0B1o7/r6lcdpBUK4hc6uT/a1
 EMmRXkE75g7zOoMNc9lZYYtufPG/mLELj0SeYie1eB8KBzseEtIXDQxygwQDLna7erw0
 HBBNmpjdBwu1PNE7p40nAEH/16VtuUGM9Lx0fAKFpxWddJLCHF243i9HR2iGtaR0baXQ
 +mbVFfdsFJuVYlZ2UOvEQ7OFZhpAQtF/Q930zjLqJJpJv+BO7cHQxYEMqLUwdM8xY0Ig
 KbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eTB+vUn+2e6AI6dzJ525GBpI7RaDj6C8DPcqMmmXbDU=;
 b=1zve6d7hAbfFKb0QGplkQN6NYbNgypGRjJ48mnqf/EIDbblhtTTmh2ktNkuT4NlD88
 vNBIr5+/lua2/LsB8yIntJOg5GE6jXYAIW3Atz9/JE4DIrE78BWZuGUE7bDTegkPqrmn
 3VD19l5MKbPeymUgDBWPR50uC0dzNtTdJXtQeAIK0LYTs0A1vwapEVtUoS6a0E5YtPYe
 aU8d2p/TfsU2QORkppmuJq/HoR/tZIUpRSylHEDp1uMDmhU8fmsEBx/gb/mSg5G2WvJd
 X9Zvc99ZtreAvAkflW+wCiqT9MOS33dkF/LRTnt/AJDoRZrD8Rm8pYVgsV3rKxF24tFS
 WKZQ==
X-Gm-Message-State: ACrzQf2yYax/qUDKkJq/5DrV/A/KM7ZDSE2sZwC+RAiNP0iqyIcyjhWR
 Yti3fkdP/oIEOb31Jh/cGGwsTcSYygwucMX+AEc79g==
X-Google-Smtp-Source: AMsMyM5+ciBrGotVl1VowLc21SD3xxDrOnJB07YAB4OS8fWURUUJhS/IJt+fyDWZbKhatPluHAPlgfcReXq4Q80RklI=
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr4712608pll.19.1665062331380; Thu, 06
 Oct 2022 06:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221003173810.1933849-1-venture@google.com>
In-Reply-To: <20221003173810.1933849-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 14:18:38 +0100
Message-ID: <CAFEAcA9x7oC9sQy8XNJ8-WRc3X=qBVL1nMLB==dGM=+O5Z-CAQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/net: npcm7xx_emc: set MAC in register space
To: Patrick Venture <venture@google.com>
Cc: hskinnemoen@google.com, kfting@nuvoton.com, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, jasowang@redhat.com, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 3 Oct 2022 at 18:38, Patrick Venture <venture@google.com> wrote:
>
> The MAC address set from Qemu wasn't being saved into the register space.
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
> v2: only set the registers from qemu on reset
>     once registers set, only read and write to them



Applied to target-arm.next, thanks.

-- PMM

