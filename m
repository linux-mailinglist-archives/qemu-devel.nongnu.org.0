Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18523679272
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 09:00:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKEDT-0001ka-Cy; Tue, 24 Jan 2023 02:59:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKEDR-0001kN-62
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 02:59:37 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKEDP-00032b-Mi
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 02:59:36 -0500
Received: by mail-wr1-x434.google.com with SMTP id r9so13005944wrw.4
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 23:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sBEedCc5INHJh7G8+4JRzFbNPKnISCHn1cZg09BxI6o=;
 b=XAmPQjMjwK1Y9UanIb/3750Oo/Xkiw0X3X2x27CpM8iPAvShngQU47AfWIicmUp66u
 LqDN00k0letLjOcSdv7o6/pEhn59ZgI+UVgSqkiMHKbPOTGa9p/ws6r8b+bXnv1cYYHM
 svYooO5deI3zALbUsxCFMhMJJggPHwQ4jrYW83qJe0tSJkmEjIlQMNtVL22v+hN/wDct
 5Mfa18Dw7VRHKtTxx4fR6eXln4LbM2YVIChCmEmhZ8TBpSTk/gGTdBX3kXXzzTv/idhR
 i3DTGmwx5kvj85POpKrXGkGTrPD7U7tmmj2YsS/xo46pYZBvBXr2omsL0cC+tI9Bu6kb
 MNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sBEedCc5INHJh7G8+4JRzFbNPKnISCHn1cZg09BxI6o=;
 b=ymuO8nsk2CjSQFxRbSyAsxO/7ffD7NbnghHzmGwoJ5RviAlOjnhQNZEIHr5moWV59T
 A1mL3oRRi6WTupZ1KKTrcgVa0vq5lQ51vxGL+gVGrjMT2HT6AnqESTwlIzxeZ6zYUMWR
 Ok1hO194nX0mdkeICTUaJOz5nsopQIu6TB9tKSASb1pD9tRQ8QlutKHV6BXYuCrekT1J
 PYgBtvTJFLHUxaz79OAT3XB3HSfQrXt1AEpNb4nKBdgF/praadviOlBSshI/rfhRCUsg
 em5uGmcu8MXq5yGZ5otJIpxfInB+RxGoa/ADA/TsQLRPjyuWzsu0XHZO/ps7TXzO/lot
 Ej1A==
X-Gm-Message-State: AFqh2kqT1U3jqWKOW/reAhQfnoOZU+ZSjR0OjYD9Pbb57ioQMNgqRItS
 OC31v3v0AyH91LVv6qi3Ar0whA==
X-Google-Smtp-Source: AMrXdXu9Mf8mIgHpICnWKIDcs/I9/gUmnAWWuq6cyxoAjmkNi2gQ3MpEZQxjKZ6T8R4IM3rITEF8IA==
X-Received: by 2002:a5d:50d0:0:b0:2bd:d9ae:41d4 with SMTP id
 f16-20020a5d50d0000000b002bdd9ae41d4mr23020187wrt.44.1674547173631; 
 Mon, 23 Jan 2023 23:59:33 -0800 (PST)
Received: from [192.168.159.175] (92.red-88-29-181.dynamicip.rima-tde.net.
 [88.29.181.92]) by smtp.gmail.com with ESMTPSA id
 i2-20020a5d4382000000b002bf95500254sm1228589wrq.64.2023.01.23.23.59.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 23:59:33 -0800 (PST)
Message-ID: <ad8788bb-e41b-b234-a45b-e8466aed12db@linaro.org>
Date: Tue, 24 Jan 2023 08:55:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] block: Handle curl 7.55.0, 7.85.0 version changes
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, kwolf@redhat.com, hreitz@redhat.com
References: <20230123201431.23118-1-anjo@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230123201431.23118-1-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 23/1/23 21:14, Anton Johansson via wrote:
> * 7.55.0 deprecates CURLINFO_CONTENT_LENGTH_DOWNLOAD in favour of a *_T
>    version, which returns curl_off_t instead of a double.
> * 7.85.0 deprecates CURLOPT_PROTOCOLS and CURLOPT_REDIR_PROTOCOLS in
>    favour of *_STR variants, specifying the desired protocols via a
>    string.
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   block/curl.c | 44 +++++++++++++++++++++++++++++++++++++-------
>   1 file changed, 37 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


