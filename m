Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C650D5AC492
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 15:52:05 +0200 (CEST)
Received: from localhost ([::1]:46272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUq2Z-0001jM-CF
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 09:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUpwt-0004pu-0B; Sun, 04 Sep 2022 09:46:07 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUpwo-00081o-5u; Sun, 04 Sep 2022 09:46:06 -0400
Received: by mail-wr1-x42e.google.com with SMTP id c11so3902672wrp.11;
 Sun, 04 Sep 2022 06:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=hN/KJj69FWROpNQY/y4aKIdAqxOWWCQYvowgpYYmBvo=;
 b=ondc5bJrQ4Fo99EWTQJ98AlkvL+jxmysXl/XrKqiZdEjxBPgT7Jt7CFueWH9GFqzMQ
 TcDij1ppAcf60bFxOT9u6DXgYCgPLx7pNm7Q+M7IFsJzY3YzvAe3ov3GVnFC6WYtflZX
 J+G0DcvNZRBKBM0vgz462OPrGDbr+8MVu8Q3qlkl8bHqpIbQfQJqeQZaQ0MikOclZzay
 bILU9TIfml4+Tqtlk1yQcZVaH/9crM+l7Uq1srNm1OtllFHhRccWP5EKFdnIhEKNhhC4
 hLtkQqLtOsiedwXdmGEiJYMonXNkP7tpHFiHgZFI77qff7fOZBUEXq590saMvUA0Vl9y
 WGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=hN/KJj69FWROpNQY/y4aKIdAqxOWWCQYvowgpYYmBvo=;
 b=dM7jt8AnbwaBlEho/05uExkgD9Hz1KAStNgmVovC7ab9Yzzd38wCvYD3CW/d1LFPNT
 MUQt3vHsnMe5YeZJghe5K318ZBDdiY7o5nVAM6MhECkwVrRHUd5bEWtdhAQXi2LpJdEA
 TNkk0+Yy4OM3EijTW74cgjQzitt837lAFBEHkGfQl0wv3jKJxLfKMJ8CWLPYeKgicSJj
 KT3PqB5mvEW+l0ctx/KFMOr1/B1FIYkae+mXQWA/05xtDRapPXyFqJV5AwhGni9ieV13
 riqX32+xRwbqWj8SyVzcmidy860kBTdT6chGAcyXQ1B6jAGbZX6BBIRyvATjdkTUAqcT
 diWA==
X-Gm-Message-State: ACgBeo3JsXdQVk7n+H3ZJNa+Dr0OQzWT/JDZvSgH59sBGqYTNeOsyVEb
 9ZbSh1z5N9Igv9HfH7lQiZvpwTEa1/k=
X-Google-Smtp-Source: AA6agR7kSZperH7ybcHSBVku8gWb/oM0y+Ob0VxqT4Yx4nUDSXydoqxA2aohHOFTTbnhWjPiSSC51g==
X-Received: by 2002:a05:6000:616:b0:226:d80b:76ab with SMTP id
 bn22-20020a056000061600b00226d80b76abmr19317837wrb.547.1662299160446; 
 Sun, 04 Sep 2022 06:46:00 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a05600c1d1100b003a5fa79007fsm8480816wms.7.2022.09.04.06.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Sep 2022 06:45:59 -0700 (PDT)
Message-ID: <1fcb4065-c490-2ab6-8951-4b39be243e75@amsat.org>
Date: Sun, 4 Sep 2022 15:45:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 2/2] vvfat: allow spaces in file names
Content-Language: en-US
To: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20220903162302.3176003-1-hpoussin@reactos.org>
 <20220903162302.3176003-3-hpoussin@reactos.org>
In-Reply-To: <20220903162302.3176003-3-hpoussin@reactos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.978,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 3/9/22 18:23, Hervé Poussineau wrote:
> In R/W mode, files with spaces were never created on host side.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1176
> Fixes: c79e243ed67683d6d06692bd7040f7394da178b0
> Signed-off-by: Hervé Poussineau <hpoussin@reactos.org>
> ---
>   block/vvfat.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/vvfat.c b/block/vvfat.c
> index 35057a51c67..9d877028573 100644
> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -499,7 +499,7 @@ static bool valid_filename(const unsigned char *name)
>                 (c >= 'A' && c <= 'Z') ||
>                 (c >= 'a' && c <= 'z') ||
>                 c > 127 ||
> -              strchr("$%'-_@~`!(){}^#&.+,;=[]", c) != NULL))
> +              strchr(" $%'-_@~`!(){}^#&.+,;=[]", c) != NULL))
>           {
>               return false;
>           }

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


