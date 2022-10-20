Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA6B6066A4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:03:35 +0200 (CEST)
Received: from localhost ([::1]:37858 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYx8-0005XB-98
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:03:30 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYsM-0007Fn-5c
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olXsu-00050c-0L
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:55:04 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:43552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olXsp-0006Ib-Hu
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:55:02 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 bh7-20020a05600c3d0700b003c6fb3b2052so2529837wmb.2
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 08:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FwF+cOcHQ9de6GGnLMBk2yyMERfbdDRyqw/kISHUWVw=;
 b=ppHqpdO0Locj+OjgeIMYijfjLGi/6g6s4GUovIAdjbCk54y9FfQdnY4M9XFaRTbTPf
 mkK/9q4Tq+4nM10klKywhpXx1JL5BtQ9BfDIeSu31gh7EMlMIBDJdwsvZAlALi8866nJ
 S5zOcylXyk3OdY33/QWadnxgR+tNN8s+gxrkvDESjZj75fnKSyBI7CT0dbz3My8QeOEN
 TL08A7wveggjbY8gdXvd7iEw7X6JBbkkvrhuOG1n7HiAqH8/gT/b4OcBufCVINaJotdi
 vFaEHIl+i40r1W02f/Tc0Up+HXZbxzCfqmdxRhZ3vqhmj8l2Udv/s/zNWdrUVCw1MD3G
 Mhiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FwF+cOcHQ9de6GGnLMBk2yyMERfbdDRyqw/kISHUWVw=;
 b=vrD8TeTc6DvCGOyOOV8U4a85P6DNxTjoTF3OEZDNK43VFFNUjHD5RPZUbdYqhRsA1O
 a6GXOFOPP9wyxxBZYHKJ3reZ2Kc7eZw1I3YjQhWskG/29c5QJUdYX4rjf/Lx5dhobQq9
 B/cDgU/Nvtfnp9V9inlENWr4yYDJyXeAOA7Ro0Y7MMHsjKX4T620Te6stF3gOKleo3eu
 dMTIAtEcujqpZuWMD/B3+r1yySMpYpGtV8dPWbeMjNkB7jAL3Yum1V7JVsePXKhCGL+y
 laMS2UN5MjgpfkF/hWghyqTCSb1NM4waHaV2WiQxK34SnEU4ppXmfbSb7JBajMw5kgvG
 vMkQ==
X-Gm-Message-State: ACrzQf1E16wjqB/6MwRuVCkLjXYUXw+p5u73pTvYvtFsmStoPKGo6hAj
 GaHTrdhfezXY1Z0l+Dw1xpkBWA==
X-Google-Smtp-Source: AMsMyM5N/fBnWAgLpyxK5StZcY+fCh5r/pGkKL2CFSKWEZalibb7K3twZeHsaKhoJhkOFCA2WSRTHA==
X-Received: by 2002:a7b:c4d9:0:b0:3c4:e77f:b991 with SMTP id
 g25-20020a7bc4d9000000b003c4e77fb991mr10239828wmk.104.1666281298290; 
 Thu, 20 Oct 2022 08:54:58 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b0022e32f4c06asm16893280wrs.11.2022.10.20.08.54.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 08:54:57 -0700 (PDT)
Message-ID: <5ceb572b-f478-bb48-94a3-59f1b3c9f50a@linaro.org>
Date: Thu, 20 Oct 2022 17:54:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 10/26] tcg: Avoid using hardcoded /tmp
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-11-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020115209.1761864-11-alex.bennee@linaro.org>
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
> Use g_get_tmp_dir() to get the directory to use for temporary files.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20221006151927.2079583-3-bmeng.cn@gmail.com>
> ---
>   tcg/tcg.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


