Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2152663DA8F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 17:27:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Ptv-0001e9-8a; Wed, 30 Nov 2022 11:25:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dvdugo333@gmail.com>)
 id 1p0Pjw-0007as-Mv
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 11:15:17 -0500
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dvdugo333@gmail.com>)
 id 1p0Pju-0004s0-5d
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 11:15:16 -0500
Received: by mail-qt1-x833.google.com with SMTP id h24so11446871qta.9
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 08:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kb8vw3Qf3+JupKN+KlQCtqU8XIZM4Y9Y2nkQN3YGAg8=;
 b=kxxfLbL0iFR4c6mvOX0VA3YuQGiu4/ZobdmMxDrlBAe1ClLR0iSW2Uvf0ZxKvng4Z9
 EgANrZ9b0gOoT6VAZZdB/D0bvCJ7BKr7jyoUXVm0szcjZOwcST/DOBzBDArjrwf0CKvA
 YKYDE8NEyI1y8iSOgPC7lEyC9AM+Wr3ndUFlR+1L1wAV3VxYSA8wetlrB4Skk0mJx0s6
 MI+qzPEWvmayyME5H38Uw177GlX6nFNH1kn+Ad0L8BScCDz74pMnfWE8EymeIz5O6N2X
 5JOmzrh4wD196gukExOvWdIw6msU9OqLXJWjvRmed+nIUMWAMxIGWGtgTzuV06/a63lC
 SjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Kb8vw3Qf3+JupKN+KlQCtqU8XIZM4Y9Y2nkQN3YGAg8=;
 b=or19YfiF20BcKIryqfAF6hXzgaqHV1cIcdbAYd5w+61g8O3o/7kYeIOiHW1QFUmF0R
 uqZiozNtPN5XAymtc7Wj8+487SgAPVXxZcY8Hm2FrxZR5Fsf1CJ9kcYZIbaRiuOgbB3n
 kJ6EM/JJ/tM24XX6Jrn7WlFJcZ2ZqLSvR9DJ2XLuySgnISkXxqTKNS1bUJHfJlUwNFzg
 SgQ/0OoS5B4W01wfuTFY4p5gFBt2pJLjDv6h9APluV1/l87eZWXKiVrEq93fZ1G1L7Rv
 8cBkaGA9DBy6Xgi/rMXH0LTm/8hywtBVY9S2KEU1++vhCr1NIrGSgvFPlPPI3rXwKSoK
 p8TQ==
X-Gm-Message-State: ANoB5pl6GAM+8LkQ+rPMhT1A9DDzYBmSkRiF8fgpG/1ZrhIfmcVujt1M
 cYM/M3G2H6uCaQwET0yrCzqRPDBJYy+0/g==
X-Google-Smtp-Source: AA0mqf5PP6x+87hKN/fxKtuHP4TOSNlGaaXsLsYeiFZzbHyl3b2KYxnTdYKClkbE5w4M2gxCO374ww==
X-Received: by 2002:a05:622a:4110:b0:39c:d681:643 with SMTP id
 cc16-20020a05622a411000b0039cd6810643mr58019246qtb.583.1669824912531; 
 Wed, 30 Nov 2022 08:15:12 -0800 (PST)
Received: from [192.168.94.20] ([134.74.251.204])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a05620a454100b006e702033b15sm1482839qkp.66.2022.11.30.08.15.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 08:15:12 -0800 (PST)
Message-ID: <bb8202b2-a4a2-8325-8ac7-92ccf7f41162@gmail.com>
Date: Wed, 30 Nov 2022 11:15:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: qemu-devel@nongnu.org
From: DUO Labs <dvdugo333@gmail.com>
Subject: Exposing Mac Host Internal Microphone to Guests
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=dvdugo333@gmail.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Nov 2022 11:25:32 -0500
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

Is there any documentation on creating a new microphone/camera that can be exposed to the guest? I'm thinking of writing one to support MacOS hosts, but I don't know where to start. I see that there's something called QOM, but I'm not sure how to use it.

