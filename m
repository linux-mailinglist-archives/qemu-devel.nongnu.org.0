Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E20D491C4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 22:57:25 +0200 (CEST)
Received: from localhost ([::1]:51944 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcygu-0001gX-Lk
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 16:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42827)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hcyfp-0000kh-EJ
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 16:56:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hcyfn-0007S6-Fr
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 16:56:17 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:45561)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hcyfm-0007RR-0Q
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 16:56:15 -0400
Received: by mail-pl1-x642.google.com with SMTP id bi6so4633204plb.12
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 13:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SLpNLEE67qNYVOQ+wij8RqFbrS1oZmRE+Oz0gmQ39I4=;
 b=JJM60mei8hVxrcKNsJyS4EURT3z/VK6GwHl/+CfLZL1iEE4jSpondiGbwvVVnVItda
 HJ98YvLqmU40O0pSkF6t1ErR9MeWt40f3GCyRf+ckYhwgg9JDJ/mKYUNOl1sMVvx8usq
 yGYYOaKUg/3z+EQs2iOQlj9A2AaqGvIVeHiLV+aKH5RhatklL7bRh2DjQ+nBBIZ5iY2P
 5Rg0ObF89aTOmy/V3jUpVYR1SHHRDRU9NZ1YPVcuIVz1mziqtxAmGolbfaCVLYzSfFAU
 9G1dF4Wllt58K5/qXVzuUr1DeYcSxPzRg8SIhUwpDx5R1zf6PpcofPzNDYoQfHDb7jOO
 peGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SLpNLEE67qNYVOQ+wij8RqFbrS1oZmRE+Oz0gmQ39I4=;
 b=ibf+oEfK40LRg1G5VXOCMYUr4t2ZMJny996LPp0ppISERhs0IEWyGJszISPLRvVckE
 y9xYJyXkFD3ptYfyNKIDOgZ59FdxpId/RLz7POOc1zzF7tBn3q9Fgjl9bJel6/lRfL1J
 MPGc6DtrwXu7EBPN3VhtsuLhEVhm5GE/TrxBVpcaNrNAZRWB1ZmyT6Di0VjK67syTf6p
 T6JCT4yHxlzOkpPOMf3Cb7S39UMwtw7z1zmai1sdIoSV1pawismiGyyX3aWJG091a2Fm
 s3n0CV+7ltrXBv3OMS19jvkKyFXPMxEMMEIG01EJJEP0yAHNfFzt4reHD5Z3K4u64y81
 te2g==
X-Gm-Message-State: APjAAAUOOb+wmzK6W1JrDe2/t5YhLSuzarEwvgyY7tE84KOp0hAvKlee
 0Jriw369ZJ8GvKehX6owvPtOEg==
X-Google-Smtp-Source: APXvYqy8xAcrZdt90kDO1yGTsf8+Mi1gVl40iwycILKcDOuDkVSS/YQDQyOWFKQdMxuz3HvP6hqW7g==
X-Received: by 2002:a17:902:9a06:: with SMTP id
 v6mr91485531plp.71.1560804972928; 
 Mon, 17 Jun 2019 13:56:12 -0700 (PDT)
Received: from [192.168.1.11] (97-113-2-33.tukw.qwest.net. [97.113.2.33])
 by smtp.gmail.com with ESMTPSA id a3sm13336484pfi.63.2019.06.17.13.56.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 13:56:12 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190614171200.21078-1-alex.bennee@linaro.org>
 <20190614171200.21078-23-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e85afa89-089a-6d25-f504-9eebaca37895@linaro.org>
Date: Mon, 17 Jun 2019 13:56:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614171200.21078-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-devel] [PATCH v3 22/50] *-user: plugin syscalls
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
Cc: Riku Voipio <riku.voipio@iki.fi>, "Emilio G. Cota" <cota@braap.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/19 10:11 AM, Alex Bennée wrote:
> From: "Emilio G. Cota" <cota@braap.org>
> 
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>  bsd-user/syscall.c   | 9 +++++++++
>  linux-user/syscall.c | 3 +++
>  2 files changed, 12 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

