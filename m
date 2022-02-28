Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3114C7F14
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 01:19:33 +0100 (CET)
Received: from localhost ([::1]:39772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOqEm-0001HK-Kb
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 19:19:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOqAQ-0006QB-FK; Mon, 28 Feb 2022 19:15:03 -0500
Received: from [2a00:1450:4864:20::330] (port=39507
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOqAP-0005LE-1Q; Mon, 28 Feb 2022 19:15:02 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 n13-20020a05600c3b8d00b0037bff8a24ebso357683wms.4; 
 Mon, 28 Feb 2022 16:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jiN8eJrcFKVu2ysVuH69Io0wZCv2WLCP8516u0Zxl28=;
 b=KpQlW1gslHKC58oT6Z+k951k0jtP15Sc41u4HOwR0gdIms2BPhNX7K6yVrzwKXViJZ
 K/tY5lsWf99OPHbyiyZERlWJ/3vbTEUiCqpzR1GPfebaLZ0zWtPKyeY2pNMkZLs5SzLv
 Q62aAl2e1ZNNaSnTDo764Gab7cD8aaYBbbdzLfZ1lCRGP7bwuUD4QF4I/+4xDtgXjLaR
 CdRKurSfgDtoOdx5EKEXbxvxy2KZF6kUyJcJ2PUFgeCglJFZac6dm3wTlGQtDUTTyBrT
 S3CPdKRs4xuh/QGXcgx8OcQqQfNp3rx6ytWAFdE3li9dyoO9V4DoB6Gyxl9AJrtAiQ2+
 eyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jiN8eJrcFKVu2ysVuH69Io0wZCv2WLCP8516u0Zxl28=;
 b=ZZoGQexvKA0gqaj92iNsRsMMQu05jrCRB5NrdZc2WNzhNUl1vHzmIDNVOTnSDsdLDe
 OpssPXahCj2z13EAnTxXXOCBRUvCJD3YmsesGFQ2ey4QXNdTeaNYTp7KflSHf3xGxmXk
 Rw0j1hIHDKVlMgCnKrDjDs2dbqxGoDU1xD0qU84PAJAnIMU87AzrLL/s/CKJWXz//w77
 ykImOccmUWqasUaAaBTFneF32JBeyVJOvJ0U/rqKaKc/Ftb6LyLc2t4Q62txL0Rvq5Ja
 iaFT6Zqo7zxPl18720WsaRwsktIBcfQu6JD7uBqlmObJ1FOp1s27FmY/Simnlguhx97T
 CCAw==
X-Gm-Message-State: AOAM533PvqGcYoho5DbGOoEMnaa31B12dCxYlNOv7g84wc8bm1P6zJ6w
 g0lbE7Mw4Zi7Pjyj8v8BLms0MRBZnKk=
X-Google-Smtp-Source: ABdhPJx5JPkru9/zyiNNj+QKTR2GdXXW8mBh63YB1CDnshmDgpTeA6QLvYk4ng2/yF8Gu1JI1M90dQ==
X-Received: by 2002:a1c:7518:0:b0:381:c77:ceec with SMTP id
 o24-20020a1c7518000000b003810c77ceecmr15483045wmc.57.1646093699411; 
 Mon, 28 Feb 2022 16:14:59 -0800 (PST)
Received: from [192.168.131.175] (62.red-95-127-166.staticip.rima-tde.net.
 [95.127.166.62]) by smtp.gmail.com with ESMTPSA id
 c14-20020a7bc84e000000b0038100c9a593sm1073882wml.45.2022.02.28.16.14.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 16:14:58 -0800 (PST)
Message-ID: <6044c28a-95f3-a2cf-33cf-ac4bee2cdb9e@gmail.com>
Date: Tue, 1 Mar 2022 00:56:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 7/9] util: Use meson checks for valloc() and memalign()
 presence
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
 <20220226180723.1706285-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220226180723.1706285-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/2/22 19:07, Peter Maydell wrote:
> Instead of assuming that all CONFIG_BSD have valloc() and anything
> else is memalign(), explicitly check for those functions in
> meson.build and use the "is the function present" define.  Tests for
> specific functionality are better than which-OS checks; this also
> lets us give a helpful error message if somehow there's no usable
> function present.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   meson.build     | 2 ++
>   util/memalign.c | 8 ++++++--
>   2 files changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

