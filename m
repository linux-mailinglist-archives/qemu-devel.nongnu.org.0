Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9C54BF523
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 10:52:52 +0100 (CET)
Received: from localhost ([::1]:45716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMRql-0006B6-Kp
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 04:52:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMRoH-0004WO-Sv; Tue, 22 Feb 2022 04:50:23 -0500
Received: from [2a00:1450:4864:20::42e] (port=46699
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMRoB-00007w-Pq; Tue, 22 Feb 2022 04:50:13 -0500
Received: by mail-wr1-x42e.google.com with SMTP id j22so5900942wrb.13;
 Tue, 22 Feb 2022 01:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eV84QhMDTTH2HUa8aAukOB1u4rRGoKo1enQtOt/5XrI=;
 b=Wx5x6s1bVOyKMdXJq1gGdIcEFuPHkZp0jEHpvtuzPVf1GgSTZTmfjF0GPgsv9vlwDo
 APAmYQZEte/RpS8fRkn+8TDfhjsIoCGbxKZb78/W6d2MQBXmaNZgNob4Tsu9NGU2AoyN
 wFzD0262MbIVJZxgGs2HFuBHEaXgYc7mKKnsErqUuJs2gTINlaX+cQo2PGJnCAmxriLV
 3wIviUhTf6uL61buG2Z2xRE+JkHNInd+NKvo5cbCO1W9QiNMgmyWiVf8rkcTcPbdjqWM
 vUdMXs22zwBa7/OdKwPWNZNqs2jpxi8xhl9esgmDQSOLUa1X0Z0HEVJ0yECP6f5IeyPL
 Owog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eV84QhMDTTH2HUa8aAukOB1u4rRGoKo1enQtOt/5XrI=;
 b=RVheGcv38j7Vc3hPqT4RYOOGIuYJMxhVi+PTA2aRqZgnL5Lr81WZCLPQIRPGHw9nYl
 GQR2HYj8wK3VqBLP6Kltp+2g1Czs4NZ1b+4i/va2wuYTZG93c1bE2mUpkkJ0UTfrYnAr
 jb2ekNJ+ZBPCfmRwu0hn2Bwf6ivTLJm9mWe9HLwMBTa27UfjY9n4hYTUunp/T8q85Uty
 FRdzjdPCcq6BUr8wdcSdJ/gV/rPpbWyZlDymvpULcVsw7thMc+aqvaFG9mlnC+K4B5ny
 nrHeDPfwcliICeh03hngy856Nkh2lpEiW9Y6vPNDHZEyWnbjkfdQ2PDgDXJ38rKRcY/+
 jtzQ==
X-Gm-Message-State: AOAM532D4hLndbxf8A/cu2ndXk+9iCSnKcKUReTiOPn7EpBYdTnrgmxY
 qraxa9v+l67mHZd9uFUooKo=
X-Google-Smtp-Source: ABdhPJzi8SCrkRMmdXwwWiUoEZeun5FMRam6Nn4WgwbRk68yOxi5g8hGsfREv00xsnKnDZEgx9Nsjw==
X-Received: by 2002:adf:f2cb:0:b0:1e4:bd07:ed68 with SMTP id
 d11-20020adff2cb000000b001e4bd07ed68mr18652877wrp.306.1645523409084; 
 Tue, 22 Feb 2022 01:50:09 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm2062756wmb.48.2022.02.22.01.50.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 01:50:08 -0800 (PST)
Message-ID: <fc7e780d-e01e-f6cc-c136-1bab1e3d233d@gmail.com>
Date: Tue, 22 Feb 2022 10:50:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [RFC PATCH] gitlab: upgrade the job definition for s390x to 20.04
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220221230607.1277120-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220221230607.1277120-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/2/22 00:06, Alex Bennée wrote:
> The new s390x machine has more of everything including the OS. As
> 18.04 will soon be going we might as well get onto something moderately
> modern.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---
>   .gitlab-ci.d/custom-runners.yml               |  2 +-
>   ...18.04-s390x.yml => ubuntu-20.04-s390x.yml} | 28 +++++++++----------
>   2 files changed, 15 insertions(+), 15 deletions(-)
>   rename .gitlab-ci.d/custom-runners/{ubuntu-18.04-s390x.yml => ubuntu-20.04-s390x.yml} (87%)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

