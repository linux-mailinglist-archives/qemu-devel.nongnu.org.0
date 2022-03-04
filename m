Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159D64CD7A0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:22:55 +0100 (CET)
Received: from localhost ([::1]:34900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9la-0006PK-LA
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:22:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQ9GQ-0006W3-76; Fri, 04 Mar 2022 09:50:38 -0500
Received: from [2a00:1450:4864:20::331] (port=52883
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQ9GO-0003sL-J5; Fri, 04 Mar 2022 09:50:37 -0500
Received: by mail-wm1-x331.google.com with SMTP id r65so5172274wma.2;
 Fri, 04 Mar 2022 06:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PIzom54KlKXM2O3ojwcf86n5xJUYw+LTRbd0luKA2WY=;
 b=pWoXi8z456fMV30GeD1XgAaNB5jPYKFdA5FxqdKVLCtP9qf/kv5bMo+HxPCol0ngon
 1Vk79MKik2YckZzpOS+w6Y3jP1lTuxbj6hxl10DRc6UFmG4kbhUYyXx2E1wTQceEHPqY
 1Z63G154onDZLdVGtVGD+qwYkNggneqU5/16aMW4piJh3dwsz0mbXqocvtupg1ISlPu4
 Y9BbdeyHQLBt8fnoIQFXmjwvX1q5NXsPis9vnVlehkLL2tGyERMzP9/sQK3ZaLg1nRU5
 HTU82HFDX5EavJv86Ec/Qyp7ZO9zElIkxIZh7ASFdG2xHlK8Q1RKffVQHs4871o4Oazb
 5CSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PIzom54KlKXM2O3ojwcf86n5xJUYw+LTRbd0luKA2WY=;
 b=Q9Q1xxgP4Sz0QKH1bO9QPencX/r5Jh+znvbLkL0UV00ZDyZd2RfJorezJ3a4EX1tNQ
 fVccqA3qI0JO1PZR6vInckGJL4jPE/qQuuu9d44cULGocs1t82ayy+UguoM3t2PXJ5o4
 Vdp/XIvqBmEEM7Puv08k6bNnEYRcTyQ7WoSTcy6jJZma5Yv692N5e5Cb+hxo9aFV/KFM
 +xBjFOSpj79H+yaEG2eQRBq/4QJdzsKXVaLEiW6kZJyoyy5IqiWQNJ5HmgMSkatVnC3c
 p6HI0xJlZzGqOYrmkq07v71Ve+h397FMM6uH32XN2Q/0AH8o1pLQXamNVLGXuhBIUNT4
 Gvgg==
X-Gm-Message-State: AOAM530SMZaoH4TxJvA3LOpgNok9X7Az72GBpS0xyxdyc5YdlIKIZc8W
 b3kvkkSR311+Op0IFF85AQ+oP8tima0=
X-Google-Smtp-Source: ABdhPJx0XJv7awghOg268FNEmRa773gA0HuF8gc5sz9IwDopRrVrDBjKwQRnN1Mo2G4zx+VNS0jTLw==
X-Received: by 2002:a7b:c950:0:b0:389:5328:aaa8 with SMTP id
 i16-20020a7bc950000000b003895328aaa8mr5038170wml.181.1646405434962; 
 Fri, 04 Mar 2022 06:50:34 -0800 (PST)
Received: from [192.168.88.252] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a5d6989000000b001f073d78a68sm1932210wru.115.2022.03.04.06.50.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 06:50:34 -0800 (PST)
Message-ID: <103f7819-ecdb-7918-30a8-3bb09b8acdc0@gmail.com>
Date: Fri, 4 Mar 2022 15:03:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 8/9] util: Put qemu_vfree() in memalign.c
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220304112126.2261039-1-peter.maydell@linaro.org>
 <20220304112126.2261039-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220304112126.2261039-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/3/22 12:21, Peter Maydell wrote:
> qemu_vfree() is the companion free function to qemu_memalign(); put
> it in memalign.c so the allocation and free functions are together.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-id: 20220226180723.1706285-9-peter.maydell@linaro.org
> ---
>   util/memalign.c    | 11 +++++++++++
>   util/oslib-posix.c |  6 ------
>   util/oslib-win32.c |  6 ------
>   3 files changed, 11 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

