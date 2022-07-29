Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD56058558F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 21:25:52 +0200 (CEST)
Received: from localhost ([::1]:55346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHVcD-0004LS-3d
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 15:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHVam-0002mX-55
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 15:24:12 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:35458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHVak-00067t-MY
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 15:24:11 -0400
Received: by mail-pg1-x52e.google.com with SMTP id r186so4736192pgr.2
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 12:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ThELj8jUDjhYQ4dudFta10A+dLlPsgPUQNhVzvJu3KE=;
 b=sJ5bBciZhYl6Pm+ERgg6OeKB4lk7wcw2feZQKOx1L5hENv/gj9alUPWhFlQ14nzlQ8
 MftFYzBQSDoEm2Xpfk2eZ4STjNQtkX69zTY+YJpE0wF+CxkiwHn4FbEIKngvLJG7ucGv
 lmTJNxTS3ol6lurFis84SSPD9NF3SFcshIL9iLSmvb6AzJjXJhTYctQFJUEPtNjbnhtP
 OZMBBBDCl9ENDk+9es901LSCCA0ZPj6CkVTENlZzIhQNdtR7SIorJabg4xaeUn1sbGSC
 4kjzq4dZ7smuIKK8Ly1GdK9V74D0ml56L8kI47Vj6adeweO1HruixDxlHo0JaOyj3dcD
 FJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ThELj8jUDjhYQ4dudFta10A+dLlPsgPUQNhVzvJu3KE=;
 b=UXS3jRteU8b4DKQsXCRgWk5xBHlN5suTsO0+e1z/97S32huh98cxKSpBdsUv8P8ut1
 QCDIgZw3/CGmtf485LZi3b8zH6dqPZp6EoFHvIz/NcaVQyM2fIAhD+0TTkj0TNjnhDb0
 QUbdklwBnG/N2iDSXzcPI5Ht/TasP64S+P7TPBrP0sds+DpVrxmlBeY5IuF8GNpjlY3g
 7SvP4fLtroKTJ/rmp3MV1tXUG7qRpzLDKdFt9A2CNF8+tIeOqSo+1awsEKNigT8gh1lQ
 pR5C34FSJ6G8/TgA9JILLz8uL/xh/9r+HCw28ldjF2IpSgcMaJUeon6DJa8hJnrf+g7e
 k0gg==
X-Gm-Message-State: AJIora/UEHVEAlkQOWqnhFAD7NWs82hyMVrsekY7WGdmwUbjxdNQLBb2
 5o/e52zXBaexK/70kgkvJWvVuA==
X-Google-Smtp-Source: AGRyM1uOlxQIltLW4VHvOv1Ml4qVq5BMvOv00xBluer9sDm4HflYQbPKjs3I+3w1QrboocV7VU+Mkw==
X-Received: by 2002:a63:2cc6:0:b0:411:4fd6:49cb with SMTP id
 s189-20020a632cc6000000b004114fd649cbmr3979054pgs.365.1659122648864; 
 Fri, 29 Jul 2022 12:24:08 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:a427:660:88d4:8559?
 ([2602:ae:1549:801:a427:660:88d4:8559])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a1709026e0800b0016be681f008sm3897872plk.290.2022.07.29.12.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 12:24:08 -0700 (PDT)
Message-ID: <8721edcf-9f67-5428-4ca9-eba3bd94075e@linaro.org>
Date: Fri, 29 Jul 2022 12:24:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] ci: Upgrade msys2 release to 20220603
Content-Language: en-US
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
References: <20220728200422.1502-1-luoyonggang@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220728200422.1502-1-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/28/22 13:04, Yonggang Luo wrote:
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   .cirrus.yml              | 2 +-
>   .gitlab-ci.d/windows.yml | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Thanks.  Applied to master as a hot-fix.


r~

