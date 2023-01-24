Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2736797FF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 13:27:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKILo-0000Yd-53; Tue, 24 Jan 2023 07:24:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKIKT-0004s2-OA
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:23:10 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKIKO-0007C5-H4
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:23:06 -0500
Received: by mail-wm1-x335.google.com with SMTP id j17so11329394wms.0
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 04:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4YZP82TWB0gYIxyBfJd2bBTQ6gSPENAGra9+u7bu37U=;
 b=hC5hRhX8erR061tcBrG1cDH4KtgxTcpsiX6g7nlXUUDjVW3Z9IbjK835upAxAt7cAx
 nqmcY4yVYVEFowDQBV47yWLYHu3AiQ/48f9/G0/SzsSpwy5JYOzFkhq3NduxhEUTG69m
 YF/eTeUCZ2RAR1P4kjtctg2f75TOtbUCD2o/10TilcWQcbQtgrirt+SO0bKUn0QfrWqb
 2WGLQ1Bgf9Vll1jVbDJFeGT7bt7xHnu7G3opxstwXndBifa7OmCTYcjCWd5U2V0lyG8l
 OOH4csCFT9eutSg96JXHD8AbSC1xi9v7T+bqB29n5pWU06UWB7FBDpiA0Rl98JU3kBOV
 3giQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4YZP82TWB0gYIxyBfJd2bBTQ6gSPENAGra9+u7bu37U=;
 b=PDnBGkudMY2hlc9zERFNmkDyA+HPgMWElsZqz9HbdooZlAe1O2icnKFNL7TxbcCq0O
 hMKmAMZJg7Xpe9dEbJumwmaUJtLs20umniHAgybxeJDRnPrQVUnT58Dl8msk4veotMwo
 kbsEn+nvvyjjCFAdkwuidrbcAQEj8LysqgFwFhJFtZzd9BqRbemWeoJo92hCK+1Wtaya
 BxB/4UBXmMou15vjxrBHUIy5ZxK6DTQG946Pn8tvhjsfbzePcPnU9zbEgyfLEN1CHUvh
 INisEkviQjmTNR3r9RA+pXjtiem1yAJjOG+dWDUQ+ZKNeoH1VKusGT2lmBsT1Xs2tYDg
 nK2A==
X-Gm-Message-State: AFqh2kpEgHPnAmPANFRKD9d4sg0Jya2ya9Yx/BI6JT3HZZsGuz9tAh7b
 VuqIzuhdCoS6wz0DMNteW4yRPA==
X-Google-Smtp-Source: AMrXdXtovW+GswSFT4Rar63QFnPkeqU04/X9iNgBQZdfqRFNIjzs0GNw01+oadFzXmo9l4WKHs6d7A==
X-Received: by 2002:a05:600c:510d:b0:3da:f719:50cd with SMTP id
 o13-20020a05600c510d00b003daf71950cdmr26422629wms.18.1674562983054; 
 Tue, 24 Jan 2023 04:23:03 -0800 (PST)
Received: from [192.168.37.175] (173.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.173]) by smtp.gmail.com with ESMTPSA id
 o24-20020a05600c511800b003d9de0c39fasm18022546wms.36.2023.01.24.04.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 04:23:02 -0800 (PST)
Message-ID: <0e588044-b051-d80f-b5ad-811a3f677ba0@linaro.org>
Date: Tue, 24 Jan 2023 13:23:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 11/32] qom: Move HMP commands from monitor/ to qom/
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, kraxel@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, marcandre.lureau@redhat.com, dgilbert@redhat.com,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, jasowang@redhat.com,
 jiri@resnulli.us, berrange@redhat.com, thuth@redhat.com,
 quintela@redhat.com, stefanb@linux.vnet.ibm.com, stefanha@redhat.com,
 kvm@vger.kernel.org, qemu-block@nongnu.org
References: <20230124121946.1139465-1-armbru@redhat.com>
 <20230124121946.1139465-12-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230124121946.1139465-12-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 24/1/23 13:19, Markus Armbruster wrote:
> This moves these commands from MAINTAINERS sections "Human
> Monitor (HMP)" and "QMP" to "QOM".
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   monitor/hmp-cmds.c | 19 -------------
>   monitor/misc.c     | 49 ---------------------------------
>   qom/qom-hmp-cmds.c | 67 ++++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 67 insertions(+), 68 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


