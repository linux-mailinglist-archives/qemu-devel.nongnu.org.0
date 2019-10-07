Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6DECE4F2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 16:17:59 +0200 (CEST)
Received: from localhost ([::1]:45390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHTpl-00070e-U3
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 10:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38620)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iHToc-0006RM-9b
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 10:16:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iHTob-00050q-85
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 10:16:46 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:44672)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iHTob-00050c-37
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 10:16:45 -0400
Received: by mail-yb1-xb41.google.com with SMTP id t1so2826564ybo.11
 for <qemu-devel@nongnu.org>; Mon, 07 Oct 2019 07:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D2fH/cmrMzZjSVJMQHsoQKsskEG8ZY0/4HJJKdU+6YU=;
 b=wTJR7CJmffBZmM8t9IwKFp2iJ2VSe+6uBLddQk3jSo+LONqU1BvQNOTB4AyK8G5mSQ
 xLVrD6TEA/qQXhCCXCVrDEj3JomWzdZgrjz2v2TceBfc/w6zynN4oc33iuHdBRXhQ7Fo
 pCAXF62k7mIvlB+GLrGzROYsRIFCBBpuvc9I+QHT6s4Fiygq9Z4UBDOjzTKEgzHAtspO
 XnZnRJsz23DFvmOViZButicrdjioZzsvMMt6L/Kv3ANtooFzd6N90ROJnFo4N1GHdvid
 wBcfou1nYvsagSQnzuNoT0do4XjHC/yIYV0YPWGsGbiICWS6l7EOFwu5dxON4RKsuLhx
 GwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D2fH/cmrMzZjSVJMQHsoQKsskEG8ZY0/4HJJKdU+6YU=;
 b=gUHf0tyPCghxOZdz0QT6ZLZ3ooFRwSERmiNqk9Y0y2LjxVUScL7m/3mAdpqRDy1O8M
 pEzhheXb/uzSuUXrwJegkzFGjAK6sg6zKWNZ1bE0+mq2RBP9m2EAOiRv4P1W9zbjIN/o
 6XXSkTTBKXE4v4IK91SpSTT+jAYBb3g2dXYJYd/1MUxBMFrjy83pZDww0Oagnd2eq3Xt
 W7qkylQNwCL5eJVY7BYfmDisOk3ewWOq64czL4G3xc0oYOqcUD8VgtS3Jswj6iymkUX0
 NjDJVlkQtMOfjOEL4DtLqrRyOAEHIkL6keZptjf48zGtPaQb4dNQt7s3yQSy+6LPXEVL
 LLVQ==
X-Gm-Message-State: APjAAAXXnP1H1a+x0guXyoT7cEb44KYzt0Q4YN3k2iel68W2ZMEybqGf
 GWnGo6L5odWQ0BDnciw4C6DPoA==
X-Google-Smtp-Source: APXvYqx7oSmoXKWoMgSALQ6rPYuuvXNJ0DPX93CoJCw1iCpblizvw9WOYm3Z7cZLEKe6rs2+dg2U5Q==
X-Received: by 2002:a25:2582:: with SMTP id l124mr10616474ybl.42.1570457804520; 
 Mon, 07 Oct 2019 07:16:44 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id d123sm3751214ywb.11.2019.10.07.07.16.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2019 07:16:43 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 08/15] target/arm/arm-semi: Factor out
 implementation of SYS_WRITE
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190916141544.17540-1-peter.maydell@linaro.org>
 <20190916141544.17540-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c6ef2b34-b57a-8fd5-2fce-5f5e2617ac3d@linaro.org>
Date: Mon, 7 Oct 2019 10:16:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916141544.17540-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b41
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/19 7:15 AM, Peter Maydell wrote:
> Factor out the implementation of SYS_WRITE via the
> new function tables.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/arm-semi.c | 51 ++++++++++++++++++++++++++++---------------
>  1 file changed, 33 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


