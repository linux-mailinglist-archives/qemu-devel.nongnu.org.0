Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61436572780
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 22:40:26 +0200 (CEST)
Received: from localhost ([::1]:59262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBMgD-0001A3-Ff
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 16:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUp-0005Uv-Sr
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:39 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUo-0004r7-J2
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:39 -0400
Received: by mail-wr1-x42a.google.com with SMTP id o4so12766049wrh.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AfFiIPj26qyK9G2ElhQrQLyyHJKZyrkdUA9W5YbdrtM=;
 b=l3MdXvXhk860p0HvC9OG1pHz/luuUivwPkzYVUvsa5EIzxu3aGU89csCIVR+GYrK1s
 zl3w6stp6mP4Mydo16ZwGJVD+oQRR+5xCgOZuw7e6CWCb9cvJJ3/d13lxTtpz0ZkqKZA
 OmVkD8qHMKkg9XR405kl5D71bpsLstq9gbGJovxMNzHdvwita/yQUzz9teKtEhJ62jET
 RKNcSrflADR9a2ah20vXJfUn4UBYUnxyplabXRluYq3oxtU1TBhzM0lxVKuUgVOMtLqw
 7+66tK/jjjAmHbOIJYtYYWrp9GgqCHOtgx3Z4G2ao8ovA7tszj7wUgT8s2rnHL0CIhLj
 7PlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AfFiIPj26qyK9G2ElhQrQLyyHJKZyrkdUA9W5YbdrtM=;
 b=4ck7PeXWhgQEFQHa1Oi3pa7eMfVvhdI7C77ed3A3TmLoBoBY5aPf7FtKJrpyPJmC00
 T1/q6MM7cxdC7j4HQvRDCNUxXa6PYBNP4/OWVjGiCSJM5ZOD/2geEk/8Hj1VLcCP5jX6
 tdHOH/F8OZtj33z7A4UwBob2K6k0h9zZEN7ZyxOotc2syimHJQhh9aQsSiTe8Ni95svJ
 ncxjx6SmJz0lMybDqzxovrsWM4WRrZn2lrV/w4mWZQ6rFQNDW9sISxCP6Qd3cJAHruqM
 dj/YX6z1yz+BIpli1T70i0j7+ojdhWXjSiXp5xmDi9WwoEIp6PFni4a6yZCBEjjg6tn1
 OLFw==
X-Gm-Message-State: AJIora/PqyN/4sxSJQIS22SL5WcHBZUmrkGOU5lLoEfBrHaHk/+fAY8e
 /XjZvVYGYVeLbn8p0n0QuTo=
X-Google-Smtp-Source: AGRyM1uIDCcsXCdPcXunr+hcXocQFrQDMY2tVH1e+wv71XAnPAbU449pD/PJXT6+B6DRsH+CgiysYg==
X-Received: by 2002:a5d:4e49:0:b0:21d:6e8a:fa3 with SMTP id
 r9-20020a5d4e49000000b0021d6e8a0fa3mr22591616wrt.528.1657657717351; 
 Tue, 12 Jul 2022 13:28:37 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a05600c1c9000b00397342e3830sm4874474wms.0.2022.07.12.13.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 13:28:36 -0700 (PDT)
Message-ID: <169afb80-f646-bddf-34bb-0612d6cc68e6@amsat.org>
Date: Tue, 12 Jul 2022 22:22:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v5 5/8] target/mips: Use error_report for UHI_assert
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com
References: <20220628111701.677216-1-richard.henderson@linaro.org>
 <20220628111701.677216-6-richard.henderson@linaro.org>
In-Reply-To: <20220628111701.677216-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 28/6/22 13:16, Richard Henderson wrote:
> Always log the assert locally.  Do not report_fault, but
> instead include the fact of the fault in the assertion.
> Don't bother freeing allocated strings before the abort().
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/sysemu/mips-semi.c | 39 ++++++++++++++----------------
>   1 file changed, 18 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

