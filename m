Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98A35A1052
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 14:23:37 +0200 (CEST)
Received: from localhost ([::1]:44932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRBtZ-0003Bl-0C
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 08:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRBqX-0007Wp-Q7
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:20:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRBqQ-0004vw-Eh
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:20:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661430020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZP1o64A5hroCkh8IEZeQfmERU6MUWWPCjCcWiOLYkr8=;
 b=U1uM0bD0h61We1NLCnMpCQIL8B+ZN6JvqzLtWKPqylN/htrMlwWjpdmTMJbjsJii5DN12+
 gSYY5tSbyMlg97iIA6B9bSt5P/roxG8rjb6BhfdFARTLXLKxoe061fLPf8H98cvO20QQdQ
 pQ3N7CTxpTun6DFO6I/Lq4WpFd25H/M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-470-7bNZ5kGnM52v6dI5KSieTg-1; Thu, 25 Aug 2022 08:20:17 -0400
X-MC-Unique: 7bNZ5kGnM52v6dI5KSieTg-1
Received: by mail-wr1-f70.google.com with SMTP id
 m7-20020adfa3c7000000b002251ddd0e05so3372301wrb.10
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 05:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=ZP1o64A5hroCkh8IEZeQfmERU6MUWWPCjCcWiOLYkr8=;
 b=3JKNDlzHGTKtfBZluOMCJt+jDN1048OJkrM40u7MUpedTZD0BNCTbxuarC7LMnxnkz
 i2YObiTxJWvMAX6Gc+YGZB7qQsk0tehQxefYjYQhwx03RfeLUSJCbk41v+skJqt0+RM3
 7PxbNUPTZmeZ8qIM7cQG13UvjNo2k9u89dLcY7MDJmu84uWItTpCpyqlq4C+hcnqhGwc
 SW/ABWTF/7NKh+RRAzOYcfwPCWksnP7IZpG3Pziynv5nBdCFW9kHvteEnsx9YdHV7WiM
 p3fQ3qdLeoijXzXrbXJ9fUCgxEfl8QkWU2uIbce3I1i3gZRtqSYn9HT4Qn7xiuPVrZyF
 bGXQ==
X-Gm-Message-State: ACgBeo2DxW744uQPdoOYfJ5x2kBwWXQKM3Wr4b9N+JKCtKBmxXEo32tm
 wHGdBkzqY4CUldqal3XRlEpBoFvD0i3KDcLppHTQiwO4Yvq9+IjYT9QA+5rTNAmiwdvao8xp9tA
 gmzntv4Ig23kblhE=
X-Received: by 2002:a5d:595f:0:b0:225:84b4:787f with SMTP id
 e31-20020a5d595f000000b0022584b4787fmr935534wri.535.1661430016287; 
 Thu, 25 Aug 2022 05:20:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7OqifRN4M/vEPDfnnAjNlZ5qlKBxYOQihN2PUg7fSPmav4K2pLqA+Mek5K8oWuqqoTi/JifQ==
X-Received: by 2002:a5d:595f:0:b0:225:84b4:787f with SMTP id
 e31-20020a5d595f000000b0022584b4787fmr935516wri.535.1661430016005; 
 Thu, 25 Aug 2022 05:20:16 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-177.web.vodafone.de.
 [109.43.177.177]) by smtp.gmail.com with ESMTPSA id
 t18-20020a05600c129200b003a5fa79007fsm4974274wmd.7.2022.08.25.05.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 05:20:15 -0700 (PDT)
Message-ID: <fdc3f4a1-0586-087a-d93f-2cd23c0610ea@redhat.com>
Date: Thu, 25 Aug 2022 14:20:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 35/51] tests/qtest: device-plug-test: Reverse the usage of
 double/single quotes
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-36-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220824094029.1634519-36-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 24/08/2022 11.40, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> The usage of double/single quotes in test_pci_unplug_json_request()
> should be reversed to work on both win32 and non-win32 platforms:
> 
> - The value of -device parameter needs to be surrounded by "" as
>    Windows does not drop '' when passing it to QEMU which causes
>    QEMU command line option parser failure.
> - The JSON key/value pairs need to be surrounded by '' to make the
>    JSON parser happy on Windows.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   tests/qtest/device-plug-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
> index 2e3137843e..a1fb99c8ff 100644
> --- a/tests/qtest/device-plug-test.c
> +++ b/tests/qtest/device-plug-test.c
> @@ -95,7 +95,7 @@ static void test_pci_unplug_json_request(void)
>       }
>   
>       QTestState *qtest = qtest_initf(
> -        "%s -device '{\"driver\": \"virtio-mouse-pci\", \"id\": \"dev0\"}'",
> +        "%s -device \"{'driver': 'virtio-mouse-pci', 'id': 'dev0'}\"",
>           machine_addition);

It's also a shorter string, so that's even nicer to read!

Reviewed-by: Thomas Huth <thuth@redhat.com>


