Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E64606643
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 18:51:49 +0200 (CEST)
Received: from localhost ([::1]:46578 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYlm-0004nH-R1
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:51:46 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYlK-0006LK-U9
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olXx6-0001z2-K3
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:59:26 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olXx4-000793-5h
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:59:23 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 m29-20020a05600c3b1d00b003c6bf423c71so2756833wms.0
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 08:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SuQVtmNWACAM/Cha3VCQEhJEt7snaW6H4e0aiVOaN+c=;
 b=id6v1YqyDEqoU4/GCMXlm+LXCnzo7qT8EkxDK1UgbV0PhDKNunye+lss3gRUlWGrX5
 +v/BXnAngZXIn5lm1i9+FuGF6v/I+QWhwpD9ThXPffiIR2x+PsMCVQPrWNRn5Cqns+0B
 HDHuRNKCuuZKhCoJ4sEyEVT2Iz18I1Vi4VOCTeT4cNaw0qXTrLxUxYrR1cWZbs3Xc2Zi
 COUJAJw/5gdcEyasRpx+SYkXgOdjsZExDkS+NKx8NEJ4n8qltsNqGGmuvA22Qk5Gpmoz
 JCWyhWPglI9LhSDk2FYUWn2AicOUE+e/DvdT8QSunn9OGhntFvNqTHLuJFS9Mw+GPo21
 YTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SuQVtmNWACAM/Cha3VCQEhJEt7snaW6H4e0aiVOaN+c=;
 b=bbCsQE4Y/dRdt5dwjnO50Qg8obxOm/bld7erFGtI30Q6Wdhbwu2rS3eBIPLnpnx2oG
 PRL002L+PILfb1FdYeDvg5dqWQEtpV4cjRNOMN1vLU4qy8kDxQ5phPeNcIdeUNTdRp8e
 UqE/5X8CcKFdqYipoNTVIledAC26MaK9YoRvwn6nDZuGQaQUvzgkAheNJ62ZTA+IsMMm
 BXzShJKCdMVUjp8Ln5D/x1+VGNpgl1sC+LBJcWHjhsDqAorOIGBDLTtvhGKs1wplOumT
 5Zx7oQvSFi3EnWIRbNWx56AuSN23BQW8noaVWjRXJkvdJ4KCdoL68UlXf2QIr/Wc7jo7
 Om+A==
X-Gm-Message-State: ACrzQf2sKsZsfw/+m+nbS9Yd2iEQ57N52Fjaj9ixlgZ9WVZuE6vZHXio
 DGmMjCn8q4AeM5JqJdCygUeUeQ==
X-Google-Smtp-Source: AMsMyM7nwXAZ58oR6vmjNrniduaoqgDKVHVh41TPSKbacSJFVNgY1FTnakL/Vat55DqJahTxit+G7A==
X-Received: by 2002:a7b:ca4f:0:b0:3c6:ce01:bc4a with SMTP id
 m15-20020a7bca4f000000b003c6ce01bc4amr31617218wml.42.1666281560324; 
 Thu, 20 Oct 2022 08:59:20 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 e10-20020adfdbca000000b0022e66749437sm16944620wrj.93.2022.10.20.08.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 08:59:19 -0700 (PDT)
Message-ID: <2fee5129-8977-7614-e7c3-a4506670ddfe@linaro.org>
Date: Thu, 20 Oct 2022 17:59:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 12/26] block/vvfat: Unify the mkdir() call
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "open list:vvfat" <qemu-block@nongnu.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-13-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020115209.1761864-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/22 13:51, Alex Bennée wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> There is a difference in the mkdir() call for win32 and non-win32
> platforms, and currently is handled in the codes with #ifdefs.
> 
> glib provides a portable g_mkdir() API and we can use it to unify
> the codes without #ifdefs.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20221006151927.2079583-6-bmeng.cn@gmail.com>
> ---
>   block/vvfat.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


