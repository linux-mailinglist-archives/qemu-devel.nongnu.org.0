Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEEDB0562
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 00:10:37 +0200 (CEST)
Received: from localhost ([::1]:56712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8Aou-0003tH-OR
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 18:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37536)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i8Anx-000325-P5
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 18:09:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i8Anw-0004pO-Qr
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 18:09:37 -0400
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:41081)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i8Anw-0004ov-M3
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 18:09:36 -0400
Received: by mail-qt1-x841.google.com with SMTP id j10so27230339qtp.8
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 15:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H44oMxLzcODr7aVzZaCRWoYByX/KoH9uVtS6vEp2NHU=;
 b=hNEFIJq/SzEcKhDV296wjUqZj08KwkkdxaGWdH3pMG/FeOcAJnRek3BSJQPYCyUJfw
 VHGsP5ch5lmJbX6Utdp2hWCo+bZNgYqf3h7EvetmWjEJKP1/IC+cftFOLP5vQHiOqoBC
 Pe5nYcziuc94RulpYXJ2DrTj+r0AiY9pPq+kqd9xa2RFWvcTEfolB3fsAVA3BNdlUEgJ
 iKNSobipTIYpy3zFDr3rFH/fFWpVMO6SeEABVR8VJZGxYhA/vq2Dj7HIux5xV/z+pmm1
 YYBDxhlQTQvgdqxpMbAbCqTePHLE6d76VlfbVHuiJUQyZwfjwkQM63qMNgmwkWJLrfWq
 MsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H44oMxLzcODr7aVzZaCRWoYByX/KoH9uVtS6vEp2NHU=;
 b=BgK4Vo75kByb/ctV8X1aq6aXTymxY6ZeyYYXVcWXL54XUY+fjGP+UkT6qt4PjBr4lr
 rVUdRTNfULSsqEz2y+WEqd0rY7MVBfCMQ75XViT2QM4X69knVAkgO1RmsdCsE7ekJNjJ
 7+gpXaMHJ7SUNjRBiXx8cHU+7xbciZRXRSjmBcWWl5JipqEYWvF99DkLnqpqELBURaC/
 Mf+NXJ4GNuae8OeEXcoZFKwC1/GaAEZ2cT2jApiPg7WHq1EjaWBmhlaV+vF6EjfCfJvl
 dqe082MMd+vQv6q7IUwbeJMNu0DQz6CeCbGPZdr+NIyxk1fmK1lQfbVJdTghxCZRzkO8
 E7MA==
X-Gm-Message-State: APjAAAXnHG53bPPQEdwDTkRAWfBISa0RxyIciadDnA9Q2UZPckZXBHKd
 +Gn9HHeO4Cc3XoUtdMsY22c4iw==
X-Google-Smtp-Source: APXvYqwbCbzZzgX6EeKRtM0Sn4/zRSEB2YB/OM+RScWl6b2jvRyN32plhCJLZH6UUnnbFVWBasBlTQ==
X-Received: by 2002:ac8:30f3:: with SMTP id w48mr4847940qta.216.1568239775863; 
 Wed, 11 Sep 2019 15:09:35 -0700 (PDT)
Received: from [172.20.5.51] ([67.69.50.154])
 by smtp.gmail.com with ESMTPSA id z38sm14267000qtj.83.2019.09.11.15.09.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Sep 2019 15:09:34 -0700 (PDT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190906075750.14791-1-david@redhat.com>
 <20190906075750.14791-28-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ae84daca-d826-100e-5db5-7eef1ac9314c@linaro.org>
Date: Wed, 11 Sep 2019 18:09:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906075750.14791-28-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::841
Subject: Re: [Qemu-devel] [PATCH v2 27/28] s390x/tcg: MVO: Fault-safe
 handling
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
Cc: Florian Weimer <fweimer@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefano Brivio <sbrivio@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/6/19 3:57 AM, David Hildenbrand wrote:
> Each operand can have a maximum length of 16. Make sure to prepare all
> reads/writes before writing.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/mem_helper.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

