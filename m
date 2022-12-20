Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F50651F99
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 12:22:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7aZE-0004vM-Lw; Tue, 20 Dec 2022 06:13:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aZC-0004v3-TD
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:13:51 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aZB-000469-AR
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:13:50 -0500
Received: by mail-wr1-x433.google.com with SMTP id z10so821425wrh.10
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 03:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VUPNKL9dxb8Eyu81IEe/JfjE0xWABHKFhhEcaZHLNa4=;
 b=pbWtVy9WW2r6Uu1LJ9Ke9kv9vyq0qcMx0vn2f1cOdHNYuIPHVsFlrOTXKFMgPdncQr
 80NvRtzEnziKnxTHLkW6DLsysCmEAcNIZm9ODsQxY5uNFE5AL18u+U26OYPXfgXr6e1L
 1EZO59U0+udWH6zg2ogIqRoVoNDIG6IRCZm/RhmC4iyEFimYSJlS2KtiJPuNzVS+5OMD
 mPo1PZKgFbwsIpH23GlfYRpV13Mqv0kSna3xkmPDtLc4b5kYLv1wa4pcJiENTOGkNGEj
 N/P32WtJStLT6NN+4zJ71a/aNODAyhdEqqKeJ5vgl7YplaNPFTg0U7ZCc/sC7lvXeD17
 JFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VUPNKL9dxb8Eyu81IEe/JfjE0xWABHKFhhEcaZHLNa4=;
 b=c9kvkD2OSrAqZD/t/24NJwvG/IlvZUFwW7/Ueo0G7SLfXmAmAIqVyyQKq9NsJnAtJu
 g2S/WIvdw1jAGYvfn5e73Fr4r01VyHzXzG0NNZ1u1Ki9Y54svVcsR9bphmXgwM9jDEdv
 ocywsaCmls6YoSdJzn1Tp36nj9DWJZZry+7bzBjl0FUkSioE9YHe/opC4auuEo7QIYwD
 njHLc5AaXsdaf7XXTAXnqtBF2Dx2CexW/nDTYjngz7HEvhPsdy9smVRHoTtICLelCtn1
 4xVo5yVsE/vzfFDA/x95AFmqWiyoOc0XDvFqTPSMFHiA8eo1/o/Jnzq7+9duQ/P/KGkO
 8Vag==
X-Gm-Message-State: AFqh2koR9TKeZwAsM+ixI/qCgrnDc6u9nmFzBAtR72zfQQvLJCX0bdT6
 8Np40SMzgFLUWdzA2txNXsMKEw==
X-Google-Smtp-Source: AMrXdXufBtDqxana8ZHoTCnvX063ZLWIPbnF4OjzmwbTBBjAyp+uwDGWu/Pa0Yra1mqyzlhZuDiT0w==
X-Received: by 2002:a5d:6783:0:b0:24f:cccb:5c4f with SMTP id
 v3-20020a5d6783000000b0024fcccb5c4fmr1063322wru.49.1671534827995; 
 Tue, 20 Dec 2022 03:13:47 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f4-20020a5d58e4000000b002425be3c9e2sm12412981wrd.60.2022.12.20.03.13.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 03:13:47 -0800 (PST)
Message-ID: <cb2e3c46-638b-09de-b317-8163187ec486@linaro.org>
Date: Tue, 20 Dec 2022 12:13:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v3 08/18] ui: Clean up a few things checkpatch.pl would
 flag later on
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com
References: <20221220090645.2844881-1-armbru@redhat.com>
 <20221220090645.2844881-9-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221220090645.2844881-9-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 20/12/22 10:06, Markus Armbruster wrote:
> Fix a few style violations so that checkpatch.pl won't complain when I
> move this code.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   monitor/hmp-cmds.c |  7 ++++---
>   monitor/qmp-cmds.c | 21 +++++++++++----------
>   2 files changed, 15 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


