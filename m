Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EBC2B43F5
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:50:05 +0100 (CET)
Received: from localhost ([::1]:43496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedxM-0005NL-Jb
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:50:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kedtM-0001Od-Bs; Mon, 16 Nov 2020 07:46:00 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:32795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kedtK-0002IS-Rv; Mon, 16 Nov 2020 07:45:56 -0500
Received: by mail-wm1-x343.google.com with SMTP id p19so11960063wmg.0;
 Mon, 16 Nov 2020 04:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2jIbk/38FH8QQjTl8UliVYTI6/dfVe2pjOe88w0owD0=;
 b=WAzJwyNzRh9ikhbDBuUYY4jmSrjrzA3ylg7UpJbNCELeozEttj/AZkIWqN3ZA6ZHa7
 YPLu2TJIy+9BYyh9MkPXgadETCmJ7poj93LRU6QIh3ktx19WRV+BY1Zej4waOaiY+lYz
 QjNNfYT2Gedx43Bu76FtboNlDdOEmu+FRUoQ6zL76C8TO95Er85wfQ1hh5KUHytsjyA5
 eIVfLchU//12617oBw6sBX+zkEBmI/noaqLMRhFX7QER62pEBfIoLcZ3BLMeEvGJx8mi
 d6fYtLp40h9vQW7nrEyVWk0XcrrgwJjmbN6cvdExv3UQ7Ybu6ECP2q+Y+oT/jqSR3wmJ
 XHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2jIbk/38FH8QQjTl8UliVYTI6/dfVe2pjOe88w0owD0=;
 b=FkbxbRHJe0ZeRpZzeXFQsY8sGCW8kvFQ+P2a8/2kQLX/z7kMDJ52CQhUocIgOLAR+m
 ECemnlBoGbZCXuq/dAFD88onBDtDY/K77Vgu8Mmi5KeaMitfVExE4TFpaaXBWUMq3w8/
 i3UwtyMWQi215QtjqniHLQJYyiO2kxziNJyYHhBJKJ45utBSTB3Ly5YtAR3qjt0xOJr2
 ZAsEpk9yudDYG1D/qHoK2gHA3vvEzmaMi6C0sn5g5cfL4diJTnuGTFgLkmRwMf9zxCQi
 R9gR1Dsx14upGLbdG7Lyih8Mh2Hz24GCrRZ0WYWSJHf+l/lTunO+4v1oXRpqjsYchJyV
 ngbw==
X-Gm-Message-State: AOAM530BSof2fhF+JyvJhxvol/qMzbj6g7zJgIEQLGGHqXUschexp7g7
 GbWdxeN+cNEs22P+2Jw5B5M=
X-Google-Smtp-Source: ABdhPJx5yIBRzmHkdNN6SRzx2gS/wJwUrcc3gXlNPIHuRP0Cn7aZqzJyZWOV9NrlGkGUM+e+i32kzQ==
X-Received: by 2002:a7b:c5c6:: with SMTP id n6mr15911857wmk.131.1605530753167; 
 Mon, 16 Nov 2020 04:45:53 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id f13sm17178570wrq.78.2020.11.16.04.45.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 04:45:52 -0800 (PST)
Subject: Re: [PATCH v3 3/4] nand: put it into the 'storage' category
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201112125824.763182-1-ganqixin@huawei.com>
 <20201112125824.763182-4-ganqixin@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <347769b3-78d4-6378-5b7a-3c1f6030bf6b@amsat.org>
Date: Mon, 16 Nov 2020 13:45:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201112125824.763182-4-ganqixin@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, zhang.zhanghailiang@huawei.com, mst@redhat.com,
 laurent@vivier.eu, armbru@redhat.com, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/20 1:58 PM, Gan Qixin wrote:
> The category of the nand device is not set, put it into the 'storage'
> category.
> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/block/nand.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

