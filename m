Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3A748BAA0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 23:19:30 +0100 (CET)
Received: from localhost ([::1]:44434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7PUG-0003xM-MR
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 17:19:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7PT6-0003Gy-V0
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 17:18:16 -0500
Received: from [2607:f8b0:4864:20::62e] (port=36856
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7PT5-0003wG-CH
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 17:18:16 -0500
Received: by mail-pl1-x62e.google.com with SMTP id p14so1013942plf.3
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 14:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j929x0x7hZ5nNpVqd72tD/sYtT0ykZ2LaNBcs7TkGCg=;
 b=BwKNczo9ZC9i+47uQ+LDEXvPRQNNDrOPc+WMqzTzs5W3V6DUgwoVrLQhq6kVMSpytw
 aMOX6p+Yoz3fHPUxwmvwybB8Oqx5xHWON9vsJMGCppiPOVHEijvoyrmYa0HMxf8fTRK1
 JYzlex0+XrPb+yEejH2Zt5SyoS1a6dsfvOUcTxgLLAq3w0+ynzTaL7ShvaiPSDpSSCqS
 X5E91LyShbP5oXY37zokVkRF+cilTKAweRoAIXk3pAmw7Z9ERM/BJy8c815WDq6g6oe2
 tWeeFYmrP10iZ1ihBlum9Atijz2shCg57IZ617epMxybjDx+nJ584wXMY72yefTnQXL0
 SVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j929x0x7hZ5nNpVqd72tD/sYtT0ykZ2LaNBcs7TkGCg=;
 b=wdqa+CyJC8ZtVA229Elt1i9rdxBvKzRHnBofSnfQT4tYwAwSkk4i4LPmZJV2Zxhq1y
 omcCzLaoCvHVul1cb1QukvkhQncEe4AlhtYBBa4F47AG6TFzRfajbc92jrInS2Ddn3YB
 X6tGHsgV5wN4/HsimHtQ5+gs9Hxx1AFyqQ7XJXq5jaKRwqhHEPDS6QaJ77lpMSBfcf7b
 fTaOrxskA+eQfcGkEFArtsX3/mCaihRsJKUWd4qz08yGZNm3UJ7Dgb2t3m5lcSPxudNd
 khZJS9cj6olOr231FCso3oqY6yoMsio72AvMQZrhIJj8eG8V/yeXonvQHsfSdk4LzNhH
 xxyg==
X-Gm-Message-State: AOAM530Y17M/TkhBmN4742d1ZFwk+UHuxnjVUw1919LooIqGGcJ8E3PX
 L5PKs79hJGTyOSAknleuq2Q=
X-Google-Smtp-Source: ABdhPJzl7p+0afpQxEekiDfNbv4+6/kLEchXHOwGE/L80JBGApbfuYhBBlqgEYrGDWdl0FMWksrD+Q==
X-Received: by 2002:aa7:93ba:0:b0:4bd:bbca:1936 with SMTP id
 x26-20020aa793ba000000b004bdbbca1936mr6447588pff.43.1641939494156; 
 Tue, 11 Jan 2022 14:18:14 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id p6sm305539pgl.16.2022.01.11.14.18.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 14:18:13 -0800 (PST)
Message-ID: <9f910809-420e-4705-45bd-143004597864@amsat.org>
Date: Tue, 11 Jan 2022 23:18:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH 1/4] tests/qtest: Add a function that checks whether a
 device is available
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>
References: <20211220081054.151515-1-thuth@redhat.com>
 <20211220081054.151515-2-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211220081054.151515-2-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/12/21 09:10, Thomas Huth wrote:
> Devices might not always be compiled into the QEMU target binaries.
> We already have the libqos framework that is good for handling such
> situations, but some of the qtests are not a real good fit for the
> libqos framework. Let's add a qtest_has_device() function for such
> tests instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qtest/libqos/libqtest.h |  8 +++++++
>   tests/qtest/libqtest.c        | 44 +++++++++++++++++++++++++++++++++++
>   2 files changed, 52 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

