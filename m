Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C26690A93
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 14:41:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ7AZ-0004VA-At; Thu, 09 Feb 2023 08:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ7AX-0004UV-PT
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:40:57 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ7AV-0003jl-Qk
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:40:57 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h16so1770102wrz.12
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 05:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FGDQiE3NL84hYR/PEIYO4vMfaNU2vrZh1P+ENe6stto=;
 b=nIt4AkVMEXF8wwvyfNfJEBPGbUaYSgZlj7JUDU2L2Qfdf9JmT/1SYQa1wxTarMD1P1
 kdNxsZ/49WJy1lnE5ztb16zIovT8Gt2GkqfFe6B691ncdhx9uNDQ/wFHRY+SXMX4pxj4
 gaiDrunxpZam3Bh/8eF3MQ+McSK7XIhBytSUlCYQHRmrnXmFOWZGuj3pHFpctvxcT5Zv
 HXr/uVi5ncCi2uONfzQ2uWe6ubTVtng2FkY/msPE/jhgikkGywsOcAKPpwqnjggJCfSG
 oko+rIzN+lXUXngk/dv1Z6Lmj/I0TrYOM83Sa49Vz1uqnJdKlB/HX68K1Q+bpuxm66oV
 JRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FGDQiE3NL84hYR/PEIYO4vMfaNU2vrZh1P+ENe6stto=;
 b=4nF0YXy1uRu00NzJ88QxDwqNWk3+KyOiK8TCsx9srIeJ23Xi6lf8I7D0qrh+hCiAMe
 Q5YnCL9Hbm9s+a+tunaIcyPv2wz/tkkICVQp/I5Md3RhnACFwLqVZFjgU2IKJxKiIoqQ
 S1i+VKH0flTC11vQnAU0Qqh/07iVOKWflkEUIQBvdz+tZH8aHnwTkYMFjt8rtogbIAdE
 WLDHhT2suiPyEN5pwdaFYSeNAxMOFt0j0otAJi/gWCtugTHRto3qWAsrPmxW5EAbbudT
 4WHZTLKCwitNdqbb6FdMuIBoWEXH7RQW/UYl+QMXZQsIohNVFCfSNUMxbjDkpJ8xQXA4
 Ah4g==
X-Gm-Message-State: AO0yUKX/OzH5pAlF11HFeaWz71azFxpkI6LwXTdYjWpiU140jKFG5B+B
 9RSy/08cNctDIkW88msE9V55egSFFNoc/AVe
X-Google-Smtp-Source: AK7set+cw5Ev1kFkzE2yxlbVkVGDSRJaJ6zw7kvozMXSP63CBhTilzDJ6YW/IogjKhyhznpCUQE2Gg==
X-Received: by 2002:a05:6000:1b0e:b0:2bf:e05f:53ac with SMTP id
 f14-20020a0560001b0e00b002bfe05f53acmr11182891wrz.45.1675950054201; 
 Thu, 09 Feb 2023 05:40:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f3-20020a056000128300b002c3e600d1a8sm1314339wrx.95.2023.02.09.05.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 05:40:53 -0800 (PST)
Message-ID: <a09080c1-c033-4442-fd17-d88ae9b7aff3@linaro.org>
Date: Thu, 9 Feb 2023 14:40:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] migration: Remove spurious files
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20230209121449.30232-1-quintela@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230209121449.30232-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/2/23 13:14, Juan Quintela wrote:
> I introduced spurious files on my tree during a rebase:
> 
> commit ebfc57871506b3fe36cc41f69ee3ad31a34afd63
> Author: Zhenzhong Duan <zhenzhong.duan@intel.com>
> Date:   Mon Oct 17 15:53:51 2022 +0800
> 
>      multifd: Fix flush of zero copy page send request
> 
>      Make IO channel flush call after the inflight request has been drained
>      in multifd thread, or else we may missed to flush the inflight request.
> 
>      Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>      Reviewed-by: Juan Quintela <quintela@redhat.com>
>      Signed-off-by: Juan Quintela <quintela@redhat.com>
> 
> To make things worse, it appears like Zhenzhong is the one to blame.
> 
> for(int i=0; i < 1000000; i++) {
> 	printf("I will not do rebases when I am tired\n");
> }
> 
> Sorry, Juan.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   .../x86_64-quintela-devices.mak               |    7 -
>   .../x86_64-quintela2-devices.mak              |    6 -
>   migration/multifd.c.orig                      | 1274 -----------------
>   3 files changed, 1287 deletions(-)

Nice diff-stat! ;P

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

