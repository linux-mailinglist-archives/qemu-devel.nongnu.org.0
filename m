Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898BD5BBFE9
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 22:42:55 +0200 (CEST)
Received: from localhost ([::1]:40300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa17u-0006wN-Cl
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 16:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oa145-0000a5-QS
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 16:38:57 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:37857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oa144-0006Zb-9M
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 16:38:57 -0400
Received: by mail-pg1-x52d.google.com with SMTP id bh13so25069485pgb.4
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 13:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=8gGpQejw0Bbi4zcBlTBm7SvSwDwP/9j6vWBJisN2Yw8=;
 b=U6fmO3/Pe3WUAm0YTpyvsoKyQD7KlbayyGufAs3jlL9KJEdW21JSJOEQjCtqpukjNM
 0rZusLQdpJlAWDx0m1KVniY3X+YcllOaRGR4lQ7znGCGOo1d00qQQLiJP40yrCuUoYaB
 //Vvpyp/X3R4aZJiNA/+iMSE3jB1vM8UvII22xQRe8wTlabYPI7WRyS9PudA8aX8Wb3Z
 trUoSI1q0VzVjZl9bRzocE5SIcH/BfaL/GzwZi+belKp1l4BYaeolCdvnbSKrkFIQZG/
 gBgCttjTpmLGNBkSve60joDN7SZtJp4ogu3YfhIx/4rvqoda1iqhnBc0Yt8GtKhhI/vx
 rN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=8gGpQejw0Bbi4zcBlTBm7SvSwDwP/9j6vWBJisN2Yw8=;
 b=1lIeMxD9ylSRN/NSnDx/GfV8iE28TkAouxzhAGiQUr/DgDs8hZLJ20fEriwXfXVY9J
 X9RzzN1zoeAnP311GGaPNbmJgVOjdf3Pxd/JbyKf9jxmVNwQcpVeYxqBsBaI2I96NDrR
 SdFfft+Gee7KEBJb011wa/5B1jSp0zBYj7H2Fl4aS+vhklgidvBCWSIAm7me389y4bBJ
 1qj6jD6UAk6usdFfAoAjBRsRAiu+9+3SUSVNIBVeFOi8unfL06YKFbBCd/7Cbe9wnbMh
 zODml6v42kCAtjuNn2xM7yFYlN98OsNt8CoEjJNW26AOJweNz7Li2qIPSSQJfJJkjbM6
 X+OA==
X-Gm-Message-State: ACrzQf3ACGGbRFOhvSG+i5w0UijPoxwDB8GfnNqMq5J9B1/tMe5RYwXt
 Ip2562jKJwTBH6KdS/pdh08=
X-Google-Smtp-Source: AMsMyM4qje0l2zkVIfZ1PLPv/D2cyQNGYMcvJHnHGQ9zHsMDLpTdr6a9l6mHBl3yKJUMMX/ksvXdxw==
X-Received: by 2002:a05:6a00:4006:b0:53e:815a:ff71 with SMTP id
 by6-20020a056a00400600b0053e815aff71mr15043422pfb.4.1663533534430; 
 Sun, 18 Sep 2022 13:38:54 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f62-20020a623841000000b00541c68a0689sm17680021pfa.7.2022.09.18.13.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 13:38:53 -0700 (PDT)
Message-ID: <d1668b24-9c04-0e54-2a82-7174f0d46fc1@amsat.org>
Date: Sun, 18 Sep 2022 22:38:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v3 06/12] linux-user/hppa: Dump IIR on register dump
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220918194555.83535-1-deller@gmx.de>
 <20220918194555.83535-7-deller@gmx.de>
In-Reply-To: <20220918194555.83535-7-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.657,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 18/9/22 21:45, Helge Deller wrote:
> Include the IIR register (which holds the opcode of the failing
> instruction) when dumping the hppa registers.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   target/hppa/helper.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

