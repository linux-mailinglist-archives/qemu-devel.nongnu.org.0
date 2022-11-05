Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4014C61DC4C
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:09:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMfE-0002U8-GW; Sat, 05 Nov 2022 13:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orMf7-0002Sc-UN
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:08:53 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orMf4-0006LP-V0
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:08:52 -0400
Received: by mail-wr1-x432.google.com with SMTP id g12so10834104wrs.10
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iV50sM5mQ6g4Xmijr0JbVJ/U5dzPukuNgGJ3lIbjN4w=;
 b=CMp6fFnntPsQxwGBJ+WmO0dBulyPtb+++DmHOgi3NjHJ3wP72CXo2ezXrl0If3IDFH
 ahGq4jnQyCNbTM5aQzjbEh70+uBHbyfCpqfdrTOe/Iad7eZskLJuQ+LNiXPzb7i5lUFU
 8jvG0QT2EDHxSfneacDyPjWpFMiAHeq9QTBM6+4aNZRLiphiLAKsj60z4o60E1m0dZ5S
 1IwqAVycI7xMbYyHKFhdDVWCAAaxYvroLuL/FjFurDa5JaL78mowW/QBFa/1+lnwaSUB
 0qvGaGp/4X6p25CI8VdA1FXJ85y4IxGhmR+dGtYvI2o4HPtHX+/iXmh1N4JvJoaReS77
 5giQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iV50sM5mQ6g4Xmijr0JbVJ/U5dzPukuNgGJ3lIbjN4w=;
 b=r/HxmSQlqC64M2Gxw5lT6filfnvNgoFvglkuMbSdHjwDkRnbiiDitrbClSAIUPKbyh
 7BLmkbmItbbTIOc4vQEW0OMOxpjj4PsNV04uANjqTLt5vHrpwUzzmjhm2VFk8I8oaZre
 YtaF3t/az00ob52xivr8NDB57JhoWMsDJoLnKkzmBlpx3FUOLONBQ1FJj60sz11TzW6t
 SxfCDafUWUhV0iGWi53wihI5F7lCv4WqOlqignkLuFvZqVA4yMsK0Mym6x/rCr4hIvnp
 Q6Aq/tSLQ7HF+OHE0ZfOZQf81gfpFQUs6wayQtCgqJnuLJmgjs/Q1LQP7gler6VX+Hzn
 /9+Q==
X-Gm-Message-State: ACrzQf2YIJ30hHWMj47nZw9qmv+t4adsb7FEbftUKGzECHkVAw5HRo0k
 3RBvzd0LBZCbrS10Thw73JwtAw==
X-Google-Smtp-Source: AMsMyM7JJMo2fCwHk1u4BL/8zd1yQaqywQtT2RHn0HlF0jJOIIRdbbJbBzWRQHCNuiUm/raT2ricuw==
X-Received: by 2002:a05:6000:1a85:b0:230:f238:a48c with SMTP id
 f5-20020a0560001a8500b00230f238a48cmr25423147wry.92.1667668129450; 
 Sat, 05 Nov 2022 10:08:49 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s7-20020adfeb07000000b0022a3a887ceasm2543108wrn.49.2022.11.05.10.08.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Nov 2022 10:08:48 -0700 (PDT)
Message-ID: <a6cfd976-6951-a645-a130-124205497069@linaro.org>
Date: Sat, 5 Nov 2022 18:08:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v3 26/30] qapi transaction: Elide redundant has_FOO in
 generated C
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: jsnow@redhat.com, eblake@redhat.com, michael.roth@amd.com,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
References: <20221104160712.3005652-1-armbru@redhat.com>
 <20221104160712.3005652-27-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221104160712.3005652-27-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/11/22 17:07, Markus Armbruster wrote:
> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> They are also a nuisance to work with.  Recent commit "qapi: Start to
> elide redundant has_FOO in generated C" provided the means to elide
> them step by step.  This is the step for qapi/transaction.json.
> 
> Said commit explains the transformation in more detail.  The invariant
> violations mentioned there do not occur here.
> 
> In qmp_transaction(), we can't just drop parameter @has_props, since
> it's used to track whether @props needs to be freed.  Replace it by a
> local variable.
> 
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Hanna Reitz <hreitz@redhat.com>
> Cc: qemu-block@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   blockdev.c             | 4 ++--
>   scripts/qapi/schema.py | 1 -
>   2 files changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


