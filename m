Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470FB2E8C1B
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 13:21:59 +0100 (CET)
Received: from localhost ([::1]:36678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kw2OU-0006qz-Ac
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 07:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw2Ki-0005Zh-AJ
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 07:18:05 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw2Ka-0005Ce-IZ
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 07:17:58 -0500
Received: by mail-wr1-x435.google.com with SMTP id c5so28131796wrp.6
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 04:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GWweoAXT7XDdbZ9Y9gppy6hElFSMQci7cFXK/YYSCJc=;
 b=bsVwAY29FNP/eJq1B6Lq3eOFYuEZVfhk3Ndaice3m2V7HL0QWpHJ8PCgFommhs5csK
 28h048zcJf28afqtdNnLKCm6kXflUqxSjcOapr+EaDIPV9pAJrXg0KQs69G6zm757cBc
 945+umsuCrVUqkOlMu9G1p32gvg28oh874/BZ/PmoW7YPfKtXffHzkC/amkxLCxWg0CM
 kCKDqzGli6rI5WE9qxbxpHyIKYK235QjS91msHahuSmNUOWTw3uY61uBh6rV3PYXdx3y
 ODEtX3S7rj/0W/hzK1iqYbxEPVhffIP21pwhC6Jq/YWf1QhhqqHj4r0AFzfjFI+QQTtM
 IQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GWweoAXT7XDdbZ9Y9gppy6hElFSMQci7cFXK/YYSCJc=;
 b=Ebn4veYEMpwrd9PWYzp4MT6fWuA6XdtPwytGF3p9iUExkwYgcvR03JcBJdftkYX1Mh
 ZWozGu+LYLN8Q18MSt4DwGsRirdsyCFFumz/5SIMyF9ragxmGcJBHedYy1xThKIzOij5
 BxvO0zW/crMH+iZf9fyIE+yfTMZHE9xztJkaEA/6Fe6/2DRw5HbZY4RKCknoRtCc5jGW
 mQ2+HM3gaPk79kxnmzw8mKNcF5pbBRRe3zi1BzFIzLN9cOd0nlwbTxq/0fh61wQhyPA/
 oaS1JgEJRWGUUocGvF1JpbtjwcsLX4lX5+elRkN+/v2BsV6Qv3lmaSAHgAS4V8KAUznm
 qBBQ==
X-Gm-Message-State: AOAM531rSc9hPuDmylHvT1CnjtVNz8k4sbyfBSnEBGztLxZY14z8LJPc
 73Swmrt8GYmUbkTV0nr0owI=
X-Google-Smtp-Source: ABdhPJx/AjuNaVLIIt3BEBXsXalux3em/L5CCKLCYYtSJlbduk2fyIXq2dM6tPCgzOO98IsxvYx0jA==
X-Received: by 2002:adf:c145:: with SMTP id w5mr76832023wre.400.1609676275157; 
 Sun, 03 Jan 2021 04:17:55 -0800 (PST)
Received: from [192.168.1.34] (194.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id m11sm27251916wmi.16.2021.01.03.04.17.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 04:17:54 -0800 (PST)
Subject: Re: [PATCH 09/24] vt82c686: Convert debug printf to trace points
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609584215.git.balaton@eik.bme.hu>
 <785854022a37035f66d89e70cb6ca1bc0e0d0163.1609584216.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <790fa37c-d317-e46e-a01d-15b7b27600e1@amsat.org>
Date: Sun, 3 Jan 2021 13:17:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <785854022a37035f66d89e70cb6ca1bc0e0d0163.1609584216.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.262,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/2/21 11:43 AM, BALATON Zoltan via wrote:
> Drop DPRINTF and use trace functions instead. Two debug messages about
> unimplemented registers could be converted to qemu_log_mask() but in
> reality all registers are currently unimplemented (we just store and
> return values of writable regs but do nothing with them). As we
> already trace register access there's no need for additional debug
> messages so these are just removed and a comment is added as a reminder.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/trace-events |  6 ++++++
>  hw/isa/vt82c686.c   | 51 +++++++++++++--------------------------------
>  2 files changed, 21 insertions(+), 36 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


