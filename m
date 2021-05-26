Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F874391A19
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 16:25:58 +0200 (CEST)
Received: from localhost ([::1]:53472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lluTt-000076-IF
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 10:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lluSS-0007gL-Tx
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:24:28 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:54247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lluSR-0005s8-Gt
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:24:28 -0400
Received: by mail-wm1-x32b.google.com with SMTP id h3so834636wmq.3
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 07:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gxV+wNSv76IIrYezgZ8axrStWkmqE2ixMLSmNdEmIEM=;
 b=USX6EptetuJ8VmkOHsENUgSRJ3STeOeLg5JWP7wuG+bGfkUQ7cGEescVljTEnhc+65
 NkGCrYiAKCkga9fs2X1YXbAzqe1OkfX7w2K+92Xr2tJCz/L9m7XqLTWCg66n3/QUFe5B
 FguQRCGI+YMHoDiH9DUVM3bBSPQQlKf3PrcEw7cGFQoUg7TLoJpU6+mT+W3hRaZ3o2vH
 fBT44VJdYYuqRZ9bA5FMifp/W5fr9oLyCFWE2TGjWePd+OeAtRGNtTz+Hat4jWA1G9WR
 wAkV9v7uTXOazNT3BrxqJYRRsFEqY5vuou5T4wUcqKTDazP3B+EzN3AzGUQdh8f901fN
 AjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gxV+wNSv76IIrYezgZ8axrStWkmqE2ixMLSmNdEmIEM=;
 b=J/d5o/Lz9b05bguJHRzzvqzqZStFChX3BehsafO+2I2DRRinfQSjSsH9jjDfIEIs4o
 VxKw3Qc/bL84a4gPOX+yDDe5xMiHmhJmJIOqngar+N/HrJGo/l2ENRr3fnDxgLxoftAk
 rxtrtlgcmtB2SytTfezAgs6YWbafij1TftrzPmFQHBEOGJRUbWDmhlLN8QVR/QniZSLX
 m4SaMKVmE24qWz5KVwxrQmiCGFJ5nyAeKyHoTdzHdAae3yjL6+HOe2XxCmPMlNzIlylw
 1nnm1Rp82cjXXCLUoxMWkEGoDqFdP9c65973f30/Beubxmn6OxYBnI32dCiq4N9MWDMA
 IeNg==
X-Gm-Message-State: AOAM53025RVCaewwtU3EwweOo4zCCMLGVKg5G7MhJjCqCAHzIWoN96rD
 MaO8W/IvpoKrVvlmLRgTIpVd3vm/J5rKeg==
X-Google-Smtp-Source: ABdhPJwh/Wl5KslT4s08+ANLkqyd4DJ109lQuPzWeLr/yJ7qhhjnqePKwEtDoo1Fcf/VIasdlX/+iA==
X-Received: by 2002:a1c:7703:: with SMTP id t3mr3691365wmi.99.1622039065705;
 Wed, 26 May 2021 07:24:25 -0700 (PDT)
Received: from [192.168.1.36] (64.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.64])
 by smtp.gmail.com with ESMTPSA id h13sm15587119wml.26.2021.05.26.07.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 07:24:25 -0700 (PDT)
Subject: Re: [Bug 1878641] Re: Abort() in mch_update_pciexbar
To: Bug 1878641 <1878641@bugs.launchpad.net>, qemu-devel@nongnu.org
References: <158947155555.22318.7487906636720013107.malonedeb@wampee.canonical.com>
 <162202718856.30597.9572245697107520055.malone@gac.canonical.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a51e76a6-0080-a924-e7ed-68951c7c5dcd@amsat.org>
Date: Wed, 26 May 2021 16:24:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <162202718856.30597.9572245697107520055.malone@gac.canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 1:06 PM, Thomas Huth wrote:
> Confirmed, this is not fixed yet. Philippe, what happened to your patch?

I was waiting someone suggest me how to propagate error from
PCIConfigWriteFunc. Probably not very important.

