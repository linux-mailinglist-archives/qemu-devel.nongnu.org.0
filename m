Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8309DF144
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 17:25:29 +0200 (CEST)
Received: from localhost ([::1]:44078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMZYm-00051L-To
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 11:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57328)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iMZXJ-0004Pz-N6
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 11:23:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iMZXH-0005iL-GT
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 11:23:56 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:33557)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iMZXH-0005fE-7R
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 11:23:55 -0400
Received: by mail-pg1-x543.google.com with SMTP id i76so8030283pgc.0
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 08:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cJDzhc7twntTGDTcwpVzGFALJFOcdCwJ6VJyMYc8q5Y=;
 b=giqUMTjURyA67JeK5MPKLjC6petXCF7Qk3A0w7d5GXqHxO9F0MwMiJxlXMRyQvx6fM
 LU8VWcWdQ4GVJ4oR7HwaV/T+o6lt9d6Ei4gNwLKPEwH+EyvbOXZUtvbPzeW9IAsGfUwP
 DJXTJTx3MJVjhzJ83FPOGPDoY2VSCXSwIVTy5QTp0qpcaUGe/B2QMS2tPlULGuQhweQ/
 MaQxD5S8AFI5zQ/OVy9Qq2YICDu3JgftIONcOBYJLX3VPDOgnIpc/BQlmXjDMrK0/US8
 jUG88eVDvVKwx9qcse77jVUB3qr5XeGELxSdrKWiEmHg4KxwwpdImU/Yo/PEG7sm1V3e
 u77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cJDzhc7twntTGDTcwpVzGFALJFOcdCwJ6VJyMYc8q5Y=;
 b=pkq8Exsj+Fcc52In8z/htW9TFrbqz7XitTCNULtkOYUBBGXScPrFhI+Wyhp/CXD8jc
 mdHvKIT259pxmuNrxKdkMC8lN7pMfzwGsZMlefdZLvpuv1lcxIT9MyjzQilRsvhD6eTj
 7Nd5pc2k1GfTTBRJRS5eQk1NXtegsr19/8cgkyHKrz3mMp/u8oK/W1u6lNhNERf4iNy1
 RNHM3yDYa8LohIkd1KwGHRu8mkGWa8AozGZ9micmFuBLOY7kattop8u+OtarCndnrGxF
 2dcbq0+YqzpMGMT3zH+g1ZTwyPQvHp/d58r3Jv8HTEpQ2D6nDCa/X+f2rhgZ+5Dd6ZZw
 Ykvg==
X-Gm-Message-State: APjAAAU8rPN85zycd6Qim8laRavR5XCQFKZtW5v25nFQ1ILQkj3APXSo
 77mwDAsYzNrum4pIBw/stozrsQ==
X-Google-Smtp-Source: APXvYqzZ3c126MPb7h5NgV5VuONAnA//ozxPgZ1rGWWgMidresN9llSL4VZwc0Vqo/BlvrYXPvW8ng==
X-Received: by 2002:a63:7557:: with SMTP id f23mr13245889pgn.359.1571671432637; 
 Mon, 21 Oct 2019 08:23:52 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id x19sm23076348pgc.59.2019.10.21.08.23.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 08:23:51 -0700 (PDT)
Subject: Re: [PATCH v2 4/6] s390x/tcg: Fix VECTOR SUBTRACT COMPUTE BORROW
 INDICATION
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20191021085715.3797-1-david@redhat.com>
 <20191021085715.3797-5-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f35bd898-b587-cdfa-07cd-a94f54a4518f@linaro.org>
Date: Mon, 21 Oct 2019 08:23:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191021085715.3797-5-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: Ivan Warren <ivan@vmfacility.fr>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/19 1:57 AM, David Hildenbrand wrote:
> Looks like my idea of what a "borrow" is was wrong. The PoP says:
> 
>  "If the resulting subtraction results in a carry out of bit zero, a value
>  of one is placed in the corresponding element of the first operand;
>  otherwise, a value of zero is placed in the corresponding element"
> 
> As clarified by Richard, all we have to do is invert the result.
> 
> Fixes: 1ee2d7ba72f6 ("s390x/tcg: Implement VECTOR SUBTRACT COMPUTE BORROW INDICATION")
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/translate_vx.inc.c | 7 ++++---
>  target/s390x/vec_int_helper.c   | 2 +-
>  2 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

