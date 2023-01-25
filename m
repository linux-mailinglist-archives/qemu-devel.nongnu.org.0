Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8068C67A777
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 01:22:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKTYA-0006jf-Th; Tue, 24 Jan 2023 19:22:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKTY8-0006jL-K6
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 19:22:00 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKTY7-00059W-54
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 19:22:00 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so190931wms.4
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 16:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xuFq6RJivLim++G3MXmi7Zykq658fQT1Tb9saKt4XlA=;
 b=DE9fuVm8CJzeTq/c18zqNjl5/AZYF7RSYcNG8roparpA661fpmeablKRA9kWeP5gfZ
 Jv2hkpMm1sb6sq8q9X2C/sUF5Q0+9X2qmbIHUyLYXFL7JqdCdjDPvLlcdlEP5m9Owq39
 al6kDFld+1IKrsbTQW7GgJaHabB+PR9gny8fRqa0DZPaVT82XKBqfTud9mTbQPO3QvuW
 fU0mkC35zWvZNaNyV2LofWIcwGFzyh0NhjJqSYInhtK12RvHY9+l9KHbObnoI1dVN5wp
 a+zo8XSbZ5FLUNfS5vR4eblGAkZJI6Y2VhLQAI/KIq5wjmdpnkslpKIPQj+rQrAseDUV
 97UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xuFq6RJivLim++G3MXmi7Zykq658fQT1Tb9saKt4XlA=;
 b=FQNoQc73hxKVWX6D/nwMdziTXvaR9CzvOccmUlDrCQMSy/kRUVCCildePLgje11D+U
 mXghm6g9tueI2WCEOXdJl8HtS81q2Dmc60S6MWKmYfq8C4MwjDObnQa0LhHk3NKjl6LR
 scVUq0GeuUMUrb6dj4lIUO+Nc3MNZ1jDKsOXy6fgRmh4LvrDhQcOA79wDdNr4ubcE3Bp
 tSQqthMoUx7bq2tWAoRG1EBK21P2cdReU4VD1caMwXKyrquPg7wk6GQWPiMUSAmVrDM2
 80IzuEx0Md0FDtCFx2FyTek9f2Fso/eRCAP9+L4pS0oG8YYo5RIz7WPpEhxSYElHpqBx
 r69A==
X-Gm-Message-State: AFqh2kq+a+mZtyx0rK7WwqXv7T28iOHkUnaUpLaH/14n/JNZQaKc7ZMX
 3bQ6Dawtn7h5n3hhm4cGE1y+9g==
X-Google-Smtp-Source: AMrXdXurzMdmlAjSpjgRkWFxmUUPdDSXsVBrkt9SQviKzHPVRaHD0tuC41jp3IWR7ow2ajfHxiKRiw==
X-Received: by 2002:a05:600c:1695:b0:3da:1c49:d632 with SMTP id
 k21-20020a05600c169500b003da1c49d632mr28997783wmn.1.1674606117864; 
 Tue, 24 Jan 2023 16:21:57 -0800 (PST)
Received: from [192.168.0.114] ([196.89.153.183])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a05600c150500b003dafb0c8dfbsm301896wmg.14.2023.01.24.16.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 16:21:57 -0800 (PST)
Message-ID: <3982a6f6-9c36-52c4-f512-f3ad31a59584@linaro.org>
Date: Wed, 25 Jan 2023 01:21:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/1] modules: load modules from /var/run/qemu/<version>
 directory firstly
Content-Language: en-US
To: Siddhi Katage <siddhi.katage@oracle.com>, qemu-devel@nongnu.org
Cc: joe.jin@oracle.com, dongli.zhang@oracle.com,
 christian.ehrhardt@canonical.com, berrange@redhat.com, pbonzini@redhat.com
References: <1674585590-13888-1-git-send-email-siddhi.katage@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <1674585590-13888-1-git-send-email-siddhi.katage@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 24/1/23 19:39, Siddhi Katage wrote:
> From: Siddhi Katage <siddhi.katage@oracle.com>
> 
> An old running QEMU will try to load modules with new build-id first, this
> will fail as expected, then QEMU will fallback to load the old modules that

You corrected the comma/space typo :)

> matches its build-id from /var/run/qemu/<version> directory.
> Make /var/run/qemu/<version> directory as first search path to load modules.
> 
> Fixes: bd83c861c0 ("modules: load modules from versioned /var/run dir")
> Signed-off-by: Siddhi Katage <siddhi.katage@oracle.com>
> ---
>   util/module.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


