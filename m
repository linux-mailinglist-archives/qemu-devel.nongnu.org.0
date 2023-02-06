Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320DE68C319
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 17:23:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP4Ft-0007Ob-Gx; Mon, 06 Feb 2023 11:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP4Fr-0007OQ-0f
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 11:22:07 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP4Fp-0007jR-H4
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 11:22:06 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso11157800wmp.3
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 08:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1xpV1IAy/zyeF789T2mMfVs8rafYbqXqeStHyu0TRDk=;
 b=kLKy9TZ820cwQz0t04fVPMecrJAyo6TILt4GOT+dDfoLgdr5zAjH35JQBLeVyxwGl8
 We4GV27BQQEJ2b6hm545/rCdGRA3TlUMpbpmYs5gwIoVMxfcoumsCQmemb+gHpLzPmOe
 SPoaX1nRu2P2jp9xaaXJNQTe21/Gm63GTRbvSIuHQ66oaciZTh8gM8CNDmnw/RkcVdjY
 LmYac3zscQew8gS4YyJ47mn67lR6GwFbMAfcuBrSzrmBfGT/gOmin0w4NI8h+AQrjmvQ
 ZZjG6y/6bZu7pWsJ6MStPcT0XY/v4FqguKRHkKkpRAHhkuyKCsOLpItHcHzfydu0f+dC
 EXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1xpV1IAy/zyeF789T2mMfVs8rafYbqXqeStHyu0TRDk=;
 b=pYPK9z6fNGVo4fvMwgTzCaDqXSOBhEH+IgB60mIBZWR3sgA/dPLnrHfGpHbq/BdxR1
 R6q0IVNmof20afvjej5wiJVgeeLZ4ge64UwtGT+oc+i0a/AxoE6+w0n6lAq5+mg9EKgo
 0AHC7aPG7QDI+XT9aOT2kXo4g4loH/rAGl9WPOe3MEsz2csFrLPEemPuxbvn6gDzG1pp
 gAe/3Ri4iRFtdqwTxnhdMVocAxwwpEZm6JoJYUWJBs++1rn+UJmw2YEAWQt9hUKmqnFt
 Rdjunyvhp2Nzr+EywPYmX40Ofrz40jn63PRlXthY1bv1tefBB7nvvoAToNvCxvX0Vdj5
 IfUw==
X-Gm-Message-State: AO0yUKWsKBiCkSwMsB9ISHfGtsM1F2Iiot5PIPcQn8J8Ebjz9XEWHjzx
 TTeYay6lcyZhxHrCLrHdoGABUA==
X-Google-Smtp-Source: AK7set8tbEJ4GfqsDhK6TG7VeXBF1/VYmgDSmWi2lgXmTEZJ8lmfmIOfJUKHGB0Subc9UbN/teLJAw==
X-Received: by 2002:a05:600c:44c4:b0:3e0:14a:697a with SMTP id
 f4-20020a05600c44c400b003e0014a697amr302113wmo.6.1675700523691; 
 Mon, 06 Feb 2023 08:22:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k10-20020a7bc30a000000b003dfee43863fsm9392996wmj.26.2023.02.06.08.22.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 08:22:03 -0800 (PST)
Message-ID: <35205d94-c19a-f41c-899c-89214296075c@linaro.org>
Date: Mon, 6 Feb 2023 17:22:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: hw/misc/mos6522: What is VIA_TIMER_FREQ value?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Hi Mark & Laurent,

In commit d811d61fbc6 Mark defined VIA_TIMER_FREQ as 4700000 / 6
(783333.33) and in commit 6dca62a0000 Laurent defined it as 783360.

What is the correct value?

Could we define it once in include/hw/misc/mac_via.h or
even include/hw/misc/mos6522.h?

Thanks,

Phil.

