Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAEA5C05A8
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 19:49:54 +0200 (CEST)
Received: from localhost ([::1]:36098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob3r7-0005WC-DS
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 13:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ob3h0-0005r9-Vw
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 13:39:27 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:42855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ob3gv-00070F-BT
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 13:39:22 -0400
Received: by mail-pl1-x62c.google.com with SMTP id v1so6362450plo.9
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 10:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=gdw0xIbsRzOJX+t2ajYn9EVvLol8Cb2MnyuYt5CnBkE=;
 b=HMkMIKC/l2cKYHsxnafdSd8rtfTWAsXR1WaYmWEg5/pGTyBfJgz6g7dR2rNmtN3qHp
 O5kfw6QHOktffN7fsWO9TQCHQDJPu2ifGxJs8q3wlBzeH1bLrTn8drTZQaEJMdD0UUfN
 WbUKCZUjk/EmHJt3yq6xiRINCOK6Rnzjxu8uUkB6AvL4dANKeJpVm9Hee/CZkvjiIuJc
 IL3Cg/rZZbgkMV5pIuKERjG8FWIeHB3R2ABZPREEHc5n0q2adrwuciiJ2Uu2VkTQ/3Pl
 7KzBeGeEtIOhdOQ7cKe4NTLJ/vzMM1Pyuc86cox+uG/yjdty21GnDZ7Kye5NFeEc+eJ1
 hH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=gdw0xIbsRzOJX+t2ajYn9EVvLol8Cb2MnyuYt5CnBkE=;
 b=aB7sElhRxWGntesST6BY+jxKsw30JB3dl/xeUkNDDJbOpqtMGQimatGgqjY74y3ak8
 OQ2gtnS/ZriCEi1yc9WIrEvhLjkGwcx/K/+IX4/wx6UPMBVp6TVvZcGOzQJ8Q4LTLKxX
 vQWE5WxdJEuEAH/3P7x5FHHR3qCLlw+0Cv785PyjW+CiZJOGiBbl48UEkgZ1Hoc87AS7
 T7SvXmSetoMzDni/H5JZnNLPnATokYL3EIe4mRayi4kSsq1KAliZnAIUk2cT+9ECkQ7T
 uHhecvLWiy6B2lZUCvha8Xm/EMTdQX78yn/ENd5ABCsGAaL5aHfRB1lh/MDwiGGB6eTR
 HKMQ==
X-Gm-Message-State: ACrzQf3hlHkzH4p2/ZAxww+qEIdnZFtJp+yk6ZH0xCIqPJXCrakLHR9O
 4xSZVmfSSprT+wYuHXaTSrs=
X-Google-Smtp-Source: AMsMyM61JQsG4yvoqP22lVfi8iKFDS1anqQCIc63/0xlWpB7uyOF4zPH0qU5jPuTNP6VvWFdrocYIw==
X-Received: by 2002:a17:903:54:b0:176:cdf8:b791 with SMTP id
 l20-20020a170903005400b00176cdf8b791mr5669350pla.24.1663781959730; 
 Wed, 21 Sep 2022 10:39:19 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i8-20020aa796e8000000b0053db6f7d2f1sm2416695pfq.181.2022.09.21.10.39.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 10:39:18 -0700 (PDT)
Message-ID: <7220017d-fb8e-bb1c-df1b-261eebed2713@amsat.org>
Date: Wed, 21 Sep 2022 19:39:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v1 08/10] docs/devel: move API to end of tcg-plugins.rst
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Alexandre Iooss <erdnaxe@crans.org>
References: <20220921160801.1490125-1-alex.bennee@linaro.org>
 <20220921160801.1490125-9-alex.bennee@linaro.org>
In-Reply-To: <20220921160801.1490125-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.702,
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

On 21/9/22 18:07, Alex Bennée wrote:
> The API documentation is quite dry and doesn't flow nicely with the
> rest of the document. Move it to its own section at the bottom along
> with a little leader text to remind people to update it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/tcg-plugins.rst | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

