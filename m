Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7A0698E3C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 09:03:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSZEY-0004Zf-56; Thu, 16 Feb 2023 03:03:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSZEH-0004ZE-5z
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:02:57 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSZEF-00052G-Kv
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:02:56 -0500
Received: by mail-wm1-x32c.google.com with SMTP id p5so904848wmg.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 00:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YG5pg9lhsT5qV52IYe8eatRxvge66GcVl1p4PvL5aWU=;
 b=vJYEAvZu7sxg3Zp/m3rkwHVX+2PaAbgQkYhzgvDWL4WxGX8FloZQ5XimScvEwwfeUm
 QlMAFyjH4krFF/0UkeDRfqlbEt465aMLzxf8Eq8zDq18Sid/do9aqeLjpshMtojQySq9
 DDMSwLNB7K87iWRvbtqqhSMaZMMvrLd3oeThRr70c+GqqwhjY2tF2JxCmbWXKV196Zw9
 tYuqvqhDzrpdtw49TqVN4VX/CCh4pd0KnDbrxVk5ujAOGHzGPhyPKBMz88dFc2x4lmE4
 aiT52oOuBeKIA+Py6Ml7ePKRNEmCJR+4Y4PoJjjDruf9JBWQno75HjS6gKZMm9CPZO+N
 pkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YG5pg9lhsT5qV52IYe8eatRxvge66GcVl1p4PvL5aWU=;
 b=4VYU+6585n7cKNm0OU2q0qlYEjrHP+CKHucTXoZEgFxb9noCyEY+3/P5ihGpnfYhqF
 a65mnxz4+hu1k3kR2VrTh5dcfaGyx4+8xEWA1IiBBrLZdr8MsJr7SjnqspXDq8hoplrS
 +oDERBQ+caT8W/G2A4unQwKRn/qnwWgC7JP9E3TOkFBusVMgcmOT1+7bC/0VhKjeTtmL
 cYKYCby8gEwx+PV+GnOta4TsDswbFaVExCtkVV9C215keQ6YIjt1t4CikyT3rjSmwvAy
 VRhnAJ++Ze1laHOcdyBru2DsQVtT5CI0MruDUiku2lq6aBXTeDN3buWR1sSSVwnTSPIU
 cMUQ==
X-Gm-Message-State: AO0yUKXD0YUwRWxVUiCwMAdwMSYtD8bBAq2KGtOWukPgBZKPA/+W+VLR
 KBse9OX4d+lNfiduAfOg86BO8g==
X-Google-Smtp-Source: AK7set+D4ks4qqhOGLolYI6C+jhQgDzeXz+gpRcEYEuAlc7A5dNfVne2s8Navj6/gVA2A/VLTp2bCA==
X-Received: by 2002:a05:600c:44c4:b0:3df:f7f1:4faf with SMTP id
 f4-20020a05600c44c400b003dff7f14fafmr3764085wmo.34.1676534574178; 
 Thu, 16 Feb 2023 00:02:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 1-20020a05600c028100b003e200dc15f5sm856579wmk.42.2023.02.16.00.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 00:02:53 -0800 (PST)
Message-ID: <80dbfc7d-4831-8e4b-5776-6effcd55931c@linaro.org>
Date: Thu, 16 Feb 2023 09:02:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 4/4] target/mips: set correct CP0.Config[4,5] values
 for M14K(c)
Content-Language: en-US
To: Marcin Nowakowski <marcin.nowakowski@fungible.com>, qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <20230216051717.3911212-1-marcin.nowakowski@fungible.com>
 <20230216051717.3911212-5-marcin.nowakowski@fungible.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230216051717.3911212-5-marcin.nowakowski@fungible.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 16/2/23 06:17, Marcin Nowakowski wrote:
> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/mips/cpu-defs.c.inc | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


