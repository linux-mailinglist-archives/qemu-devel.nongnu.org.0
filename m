Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3874C64247B
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 09:24:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p26lU-0008FB-RY; Mon, 05 Dec 2022 03:23:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p26lJ-0008CQ-UE
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 03:23:48 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p26lH-0002OE-50
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 03:23:41 -0500
Received: by mail-wr1-x42c.google.com with SMTP id f18so17383775wrj.5
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 00:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dYd9RNJ7dS9Pq4AOyck3yoH+nj3xigwdW4b0I8Qief0=;
 b=ZcAyfWoAJ9I6BHTS6OpSbW2omQOkLKJozDWMtQr3tYYmKC4kfXEZrzrdcjtna0lqcq
 foyYQuTxqA/mcqkm2huVt1guG+5IOob+MM/TTEaPTZ4Nyc8huBQS+InHzL2h0o7dsyGf
 CC8/9Fg6GsBBsNS8JhWz9H3AI63z+znlmbdGvobMajofPvf6EwR2HJJGbXvCSAkuX2tF
 1aOMEfp9PKOBcjqtYI/QkxlYQiEi7ok2mP7at6wOOS/zijvBVI2WPmH0HEHw/3gup2pl
 wtu8QbkxSFx2L/KCViCcVc7l+hJST+kWSw81MFoPWHwAm7Z5iiNnX2qBOwpuLpRRSUdO
 rGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dYd9RNJ7dS9Pq4AOyck3yoH+nj3xigwdW4b0I8Qief0=;
 b=a5/WSay08TQBpBgFvx8T8eESeHa36VrwpkQX/luE6fCkfBBIL1ztFWOYZ9yiow8j7D
 svHCQ+dbMWU9F9RgA8mmXFYuJ0nkmpk/fTFdyrPE1OYTtbYhn2R7ICcTZ/yfndaclkE7
 kRpCnQt0BFBA+KUgBqhH+SvLETcC8vjtppClc8ylx+sDoRL1zF1WlzgkJPf7SqGrjn1m
 Hw7t+c5fSqIce2WqwgvP8I5/FPplAY6byCtWymH4k38H1/WSiGeHU0n79ijAdDeKrPRl
 3og1uFB6D3dxfLUsInYLvN2nEUhhk1zbsJrpQB7vnusSU9keprIe3Q94NtpjXs5tLFm1
 /zaA==
X-Gm-Message-State: ANoB5pl7BJx9253bThIpL0hmNOr6RLQn2jdtdgP/R7VZgVAM55Y5TBYe
 iEKaw4U5CxaBRABA4g3f0/XTVQ==
X-Google-Smtp-Source: AA0mqf5rRpV1e7drf6w7DTiLE1YOUdO7E/qfjYPWX1QvtWnnYfidrR1tPthKqHOG7GhtzNnSRVfiug==
X-Received: by 2002:a5d:60c2:0:b0:242:358a:50b9 with SMTP id
 x2-20020a5d60c2000000b00242358a50b9mr11228498wrt.239.1670228617428; 
 Mon, 05 Dec 2022 00:23:37 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v6-20020adfe286000000b00241f467f888sm13561477wri.74.2022.12.05.00.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 00:23:37 -0800 (PST)
Message-ID: <dec95b7b-ae39-d0fc-c631-fcf550c0c3cb@linaro.org>
Date: Mon, 5 Dec 2022 09:23:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: REG: TTC Timer
Content-Language: en-US
To: Gowri Shankar <ggowri617@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
References: <CAJWWW5ikmoujzeYw97QEMG0uBCLyR2mypSe_Td4XJXjXHQFnyQ@mail.gmail.com>
Cc: qemu-discuss@nongnu.org, Frederic Konrad <fkonrad@amd.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Alistair Francis <alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAJWWW5ikmoujzeYw97QEMG0uBCLyR2mypSe_Td4XJXjXHQFnyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 22/11/22 12:27, Gowri Shankar wrote:
> Hi Team,
> 
> Advance Thanks for Your support.
> 
> Could you please clarify one point here?
> I am using a Xilinx ZCU102 machine with QEMU7.1.0.
> 
> I have seen QEMU 7.1.0 release has TTC timers for the Xilinx-zynqmp SoC 
> model.
> url: https://wiki.qemu.org/ChangeLog/7.1 
> <https://wiki.qemu.org/ChangeLog/7.1>
> 
> In this case, can the ZCU102 machine also use the TTC feature?
> If yes and possible, Could you please share the example code snippet?
> -- 
> Thanks & Regards,
> P. Gowrishankar.
> +919944802490

Cc'ing qemu-arm@ mailing list and Xilinx ZCU102 machine developers.


