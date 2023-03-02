Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D536A822F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:30:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi3s-00060c-NA; Thu, 02 Mar 2023 07:29:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXi3q-0005zm-E8
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:29:26 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXi3o-0002JM-QE
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:29:26 -0500
Received: by mail-wr1-x42a.google.com with SMTP id g3so7474826wri.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677760163;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4IYfsoN2fa0aowgpP0Rkb7TmdinOeGqENvoZ6CJvrj4=;
 b=Ke6Ug9K0SeS90+xzKgTvUDYpSFb1EPZBM8SuYeUQH6NQ9oMs/hs8hzRpTNZpIAWbqb
 islWUDH+Py1mXgyReWxrlah5TzDqelJiBYnTaZs1eMa/LbXUA4gJlQnhLTm/roguksGY
 esbp0E9KTmQ2Uz6LcJozRRWA9yYvzDWJ8LPJ921waFe5X/5ZsYrQs+62DpXW18aqIw6U
 uDeMza4el/mMlDpJSIaw+59qtiU7aRICiKOASblrIZEIEFPlCB73r/9LH9rFhBb1E4D5
 P2mhduUev+f3YOvj9ARikFjruc6De0p1co+yfwE4RrznDFkxnkcLSoFweQ5/ueb+qBp4
 0Sdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677760163;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4IYfsoN2fa0aowgpP0Rkb7TmdinOeGqENvoZ6CJvrj4=;
 b=T3z+WuUNnCoMUXd3EDP2tQW2QXVHVxBzPCEFL6Hb1ILUp/3oup8cJWg1tivF0+ujYS
 1JFbacjihMzZIARaaIvtMfZd2QtqbjU01iJr61bs6I8VGp3KxYuS2MCmgoqFFpAhFG7p
 VuVxsKD0026Y4J1thEbckUek40vwWPx7RDrktAVtuqCnPnG/JPHemEY7GS9o7dy9r2Xg
 62M/lwjMH0QD+5oGpgVO3gB89iQR83ERKtyW0ht4Y1IxTrZGdrt8tKwAAnvD23uDv4Dd
 hcmQ0B4neQEWzphEElgvmDOIaPNkhNuM90G8b+20Ms5w82Y/nGvedBj0juwyrwI21qBF
 cirg==
X-Gm-Message-State: AO0yUKWt5G4SobFW9u9cTYIqOAC/Y8sv4UEDanzegiD69FE9HlRVZXUM
 0ad25vqgA4dg2BaJ3pIE8i96Fw==
X-Google-Smtp-Source: AK7set/S2xJtlHqjbIu1+D+UINIX+M8ABHf1QpJA2A+HeOKcAf7OOrMBG5Oo8p01EIUjYPKILaCZ7w==
X-Received: by 2002:adf:db90:0:b0:2c5:8d06:75c2 with SMTP id
 u16-20020adfdb90000000b002c58d0675c2mr7583929wri.35.1677760162958; 
 Thu, 02 Mar 2023 04:29:22 -0800 (PST)
Received: from [192.168.74.175] (76.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.76]) by smtp.gmail.com with ESMTPSA id
 a13-20020a056000100d00b002c6e84cadcbsm15308763wrx.72.2023.03.02.04.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 04:29:22 -0800 (PST)
Message-ID: <c45e55c7-0894-4f72-e1e2-dc49e66a6588@linaro.org>
Date: Thu, 2 Mar 2023 13:29:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] vfio: Fix vfio_get_dev_region() trace event
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
References: <20230302111731.2381505-1-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230302111731.2381505-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 2/3/23 12:17, Cédric Le Goater wrote:
> From: Cédric Le Goater <clg@redhat.com>
> 
> Format is missing a conversion specifier.
> 
> Fixes: e61a424f05 ("vfio: Create device specific region info helper")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1526
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/vfio/trace-events | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


