Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7D3D1DB8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 02:52:29 +0200 (CEST)
Received: from localhost ([::1]:32966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIMgu-00062n-QY
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 20:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47386)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIMfx-0005Tv-SY
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 20:51:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIMfv-0005l9-SQ
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 20:51:29 -0400
Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44]:45297)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIMfv-0005kP-Cq
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 20:51:27 -0400
Received: by mail-yw1-xc44.google.com with SMTP id x65so1519061ywf.12
 for <qemu-devel@nongnu.org>; Wed, 09 Oct 2019 17:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ynBfoBkoBXRx80zqs+EHh2J4aJ9l8PJLh5DgksZACP8=;
 b=jO6HC9TISuf/dOOJnquQsRGH73cn9eFNvqsMhb6B3lCYQPbxrhJn222OSdu4niGXtn
 fZUUNVmNsJBR3zgjBpKND45sZl1NvTA7HglECdppkdIUKRSICnRI/tW8d6oeCg98IlFx
 rf1e4V0QBsAH5vD+nb+p9W8qpffM0CvnH9Wc6Zm0JgczaOIgvQT/b89gxHAJ8hQpEebn
 5DzFAyPEQbDr0dpl9xpYH2i2m+9tUxDbN1xuqR6jpl4tCO1ILihwJAqvpw4WkHpq9JbZ
 o1Jzx4bmENPrtm0eIOjGxskX+E3aKjF7YttxtaRqUv3W2gkCSQDkCo2n5kbJahs9H4e2
 eDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ynBfoBkoBXRx80zqs+EHh2J4aJ9l8PJLh5DgksZACP8=;
 b=UyN75tBl/tLTEVZzNVL0Q6/YH8WRgkgHoBhjTGJBnLnrrqfskYPh4Zl8u3KkjVw9Ck
 WV7CI0DozW3Qpouis0JK804Z/5GjgGr5CGC3hknaXfCvqV5jJR75kxAyiqsHxpPsoH9p
 JHRjUdaDzyk8pNnjCM0FXMQg3zDtGVNL0djSwh3otFaL7d3l2YA/RcEXw1dkPsikQIul
 PLj63cW5thzSeHiyKKARx+8h1nX8i+BiaUYnBB6zQO8HbQ2CBxSQGqKkaT/GZy+6+ZRz
 jsaLTGI/JXofT5H7fK5ZmsALRex0KZFJ09S1lEn3ezletuXCKjhIAAW+bkZGSRNDKGlW
 QLnQ==
X-Gm-Message-State: APjAAAVyr8sJKp4bP5uoundOQDSo0DxM/1b5W1KCHcm6zzpg2uDrJgb4
 5egbeS+GQOgnt3gARCBug5o8KA==
X-Google-Smtp-Source: APXvYqw0dfnFOQs3ryR04ykV3C9OgsT2+kdlC6+DZLQk1IeMetEXfX2NVkNQqsNBFI7PpxtoFvMzVg==
X-Received: by 2002:a81:2d57:: with SMTP id t84mr5338152ywt.164.1570668685566; 
 Wed, 09 Oct 2019 17:51:25 -0700 (PDT)
Received: from [192.168.1.44] (67.216.151.25.pool.hargray.net. [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id p199sm986568ywe.1.2019.10.09.17.51.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Oct 2019 17:51:25 -0700 (PDT)
Subject: Re: [RFC PATCH 4/5] tests/arm-cpu-features: Check feature default
 values
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20191007170622.1814-1-drjones@redhat.com>
 <20191007170622.1814-5-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <80b5ee3a-bb6a-a151-d989-144d7faf535f@linaro.org>
Date: Wed, 9 Oct 2019 20:51:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007170622.1814-5-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c44
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
Cc: peter.maydell@linaro.org, bijan.mottahedeh@oracle.com, maz@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/19 1:06 PM, Andrew Jones wrote:
> If we know what the default value should be then we can test for
> that as well as the feature existence.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  tests/arm-cpu-features.c | 44 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 35 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

