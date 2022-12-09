Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382A2648388
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 15:15:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3e9m-0006ZA-Lr; Fri, 09 Dec 2022 09:15:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3e9h-0006Yf-Ac
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 09:15:14 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3e9d-0000aX-IO
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 09:15:11 -0500
Received: by mail-wr1-x433.google.com with SMTP id co23so5341411wrb.4
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 06:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hoLe4ulqiVS0SFd1BYJLwl1bnoc3JWUI+OAjOHdPWeQ=;
 b=znva7hN7awH30j11L05qjqRCVWQN+wBJMNU0YJNOh7kSRizOOhw3WVr5OEFvmwpHKa
 fWaGx33Qp65ezo2SKBawDXsMXXv0AYFrwYWQSe5vwjScsTJixMlBL4NK5pcnODmVHgQd
 Rewwy7SlfkTSv8eLyXg1xjNJJCcR4dUdzfaKk8DZgh7SGg+ke6iRJV92cvbYu5m6H/tS
 9jcCqaZxXLiJtFo6r4rqOjcqywLsksCosMqDAY27yfkgpffckREaZkr6snkwyjr8ZKk/
 M846iALgCG0CpgGekJqxWacxj12rhfWI2InWL44qQUdMOnX0k9y4dawI/xIcqKomhijp
 ZqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hoLe4ulqiVS0SFd1BYJLwl1bnoc3JWUI+OAjOHdPWeQ=;
 b=oep0U0JcgPFg/eZDXiBkOFzPMQkalnAU8tAui0NIwMCK+JSZmtvearH07eh7EfP1Y4
 icrup6nLZ0b+pO5EWcjw/3NXGz8CB+AhuDjrJWqyPRl8Zrxc+CNYkr22xADU3DbFWCz3
 ndyFRQYuVZkS6zIKzwHYgJnzEDvn6X33PqGyUgN3xEIdKYeiaQ78z2o4wcU6bkdTzUU2
 y/pHktr4EgMVJXAHiBpQityIZDCXXg2bjIt7Ue1KAUBRck5YgquKxrNaXbeqbSGrpsRs
 w4ATHZ7jltRJmJBcmfCAAgVkGTr70mqHSL4ENUY3f44qf6/0N9FWyYu/l5JACAejAN9j
 LcCQ==
X-Gm-Message-State: ANoB5pl0QOqDQ98CAxBLXYEt2tf4+8w4Iz6ABPims2j/nLJ9cBhRfZGI
 wk6X1gVgwP3pzsOJCVhpBvsh3w==
X-Google-Smtp-Source: AA0mqf6HieiHpkkLTeQ6whwfN626UvhkfXYdZIHf/J9QsOuujE2sdQN+I7POLGrzAcOYYOSNjOpjJQ==
X-Received: by 2002:adf:de06:0:b0:242:1277:925b with SMTP id
 b6-20020adfde06000000b002421277925bmr4284210wrm.59.1670595308046; 
 Fri, 09 Dec 2022 06:15:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k8-20020a5d5188000000b002421888a011sm1430815wrv.69.2022.12.09.06.15.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 06:15:07 -0800 (PST)
Message-ID: <80f21d96-a2be-41fb-d2f2-1d09b31aca13@linaro.org>
Date: Fri, 9 Dec 2022 15:15:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 3/5] include/hw/pci: Clean up a few things checkpatch.pl
 would flag
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, ben.widawsky@intel.com,
 jonathan.cameron@huawei.com
References: <20221209134802.3642942-1-armbru@redhat.com>
 <20221209134802.3642942-4-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209134802.3642942-4-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
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

On 9/12/22 14:48, Markus Armbruster wrote:
> Fix a few style violations so that checkpatch.pl won't complain when I
> move this code.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/hw/pci/pci.h | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


