Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE0F4B3D36
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 21:04:51 +0100 (CET)
Received: from localhost ([::1]:48230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJL74-0000uf-4G
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 15:04:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJL5w-0007uE-Nj; Sun, 13 Feb 2022 15:03:40 -0500
Received: from [2a00:1450:4864:20::433] (port=38835
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJL5u-0003dW-7Q; Sun, 13 Feb 2022 15:03:40 -0500
Received: by mail-wr1-x433.google.com with SMTP id d27so19936469wrb.5;
 Sun, 13 Feb 2022 12:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TZRQLjy2Lm3BBRaO4FxSUkCFITjZ7Pz+oEOUkactk8A=;
 b=qTEcbx+lxCpta/H7MyR4/l3YlogL964H+o9KMNA14Ze64Dh447fk1pGDWJIzxIv3AS
 YspV2Yjm5XofntBYY/ZR7Lb+pGQ6tHrFqn7u2NE7dAZhVHcwmkUB/OtylqgUL4Y082ib
 /+waaszVr0pbCdUjBbR+v5156+qGzlL7Tq3q5y7LpVjSCS9kRVxyRwKaj8ZqkdkZbNQX
 S0Rw26MM2dxHN5EetfLadaFNKcRZNOC+2kJXlzXLcNagQNPRmQyqM43Y6D99yun0Dee7
 rqjoi2UbFE2VHsPM0G4LOGXpR6d6QInXN9zgorQzfmfvgYzF9q1GFnWeQe0YjhNhm7CU
 zlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TZRQLjy2Lm3BBRaO4FxSUkCFITjZ7Pz+oEOUkactk8A=;
 b=HJS+1b4hNjlOO04Hu6/bcsCICoq4WO8zVqyXf3FskSldyEAyiqcqdQBlqrr4gy2Mo/
 JdmoiqICQ115Yurg8FeNe6Z3sX1aDuHNsCKo1UTbn0d+E/lfKxAfKtdZDV5IZd+GRUX4
 b80XUysgaYOSRx3hZ9H5YZTvnGLAhjVFG3vJ08beIlQj4Eu13Ij1q+ADdURBAJ5xNFKB
 xp1MftU6Kg5lYgcp/JtRzyB/05P3QHuVz6g3iBV09QIT0lCrRLsW8sYKw3B1eeKt4v7X
 N2iQ1S3RqR51FFSDFHdzBM0hDc8VdyOxmesprfq7SjOL+QzV2F3BYi6PgQiRsit00vcu
 7Luw==
X-Gm-Message-State: AOAM531YvIVTntEII6rBVcgQaukKr6kl+rb62QZ4kiWRM4HhaCC2FLqf
 1Y3yC+hozbHPYjjyGgMy4u8=
X-Google-Smtp-Source: ABdhPJwhXcJPBn9Fu3VHYhwdMsp0zv/cUBIQAB8tln57SXOlZ1UpykYeiOviMtHQWStULeUCYIDYwQ==
X-Received: by 2002:a5d:4b8d:: with SMTP id b13mr8672535wrt.571.1644782615379; 
 Sun, 13 Feb 2022 12:03:35 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id g10sm2080967wri.91.2022.02.13.12.03.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 12:03:34 -0800 (PST)
Message-ID: <5b34cd72-2562-e6b9-0cf5-27c381b00439@amsat.org>
Date: Sun, 13 Feb 2022 21:03:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: bdrv_is_allocated
Content-Language: en-US
To: =?UTF-8?B?5rKI5qKm5aej?= <shen.mengjiao3@icloud.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>, qemu-block@nongnu.org
References: <78D1B049-D41D-4C60-885A-373B49D99A8B@icloud.com>
In-Reply-To: <78D1B049-D41D-4C60-885A-373B49D99A8B@icloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.785, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 13/2/22 15:24, 沈梦姣 wrote:
> Hi,
> I’m trying to understand this function, but seems no note in the header file, could anyone help explain this function? It will be great if there is an example. Thanks in advance!
> 
> thanks

Cc'ing qemu-block@ list.

