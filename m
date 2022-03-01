Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF5A4C7F2C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 01:27:47 +0100 (CET)
Received: from localhost ([::1]:51278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOqMk-00015l-I4
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 19:27:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOqAb-0006WY-8v; Mon, 28 Feb 2022 19:15:19 -0500
Received: from [2a00:1450:4864:20::42d] (port=45697
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOqAX-0005NM-Jr; Mon, 28 Feb 2022 19:15:12 -0500
Received: by mail-wr1-x42d.google.com with SMTP id p9so17882125wra.12;
 Mon, 28 Feb 2022 16:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UI8hpLZ7bki1qr4wTAFcF+JrzJC7Pzz8gjiU9O+K8vk=;
 b=qOSFu74HKsruLDbZpHMetRVxOvAcqgHfG7KSFx9EKazOh+BWO+IjkP0eN9+AftjGWs
 5Y5nkhDrJaifCtwShDqC5WZG9+/bkSRZZbamYAB/gNOnKEO0n9dpVAvnT4+uSmWnzAsP
 R2R5IrmvlAi7NCjBYyEwnBI/qI1mlEsiRZmEiJ82tcY5AqRrcVqcPEn2prrRaPUHvT0E
 /4GnhXLBwBftfh5N2uD9ucWRPdggtZI8wkiETp72hTrOW1zFg5XDVZAHbxC2lsnU0ZvL
 ySi9knE9ZQVIPJlEnh9p16IamzOz3bmTcX3QzDWpikKrC+uQUl3Ik66azlFJVU6NKjM1
 LWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UI8hpLZ7bki1qr4wTAFcF+JrzJC7Pzz8gjiU9O+K8vk=;
 b=X/AzNOEc3pYj+La6e4kRLJHZYBPOuSbw0oCmfx78h1CxESx1qrsgwlGBdSXsT7xEep
 PiXQhTQpbMFJS9M5/aZaYrR4k0Bc1Jd6l8yVuEM5R/bthWB1CTlZTEesYFOclOWoqRl8
 3c5t5Gjrms0wL0SSJ0cVrp86OKauaM7R8KmPf1JABYHTnxpGs3DnrjtScMBFBiUSESzE
 pLSGDJ3ep56pygTunvzA98to3ya6z0v/EJSebV3aInArBwuz+7qEXm1HEGMAiAL2CMhk
 EyOfQ1ncOsiVvRFZtV2pAihmEInYjYiC3AJI/TxTRHchD6NPtXNdLIm9VI7FFM+gZrft
 QfCg==
X-Gm-Message-State: AOAM533MpCky/KB6AyuaYL49uU5HQaYvUH4dhERzrpLG0IwlUUikmINi
 OV+mNeb9GfobxoETA2pOkrQ=
X-Google-Smtp-Source: ABdhPJw7KEXjtYCStD7oDqdEeltaBgR3gmT8F5W0qoxjiFbeRlqn4yr12hog7tf3vIRK8G9iM7LtKQ==
X-Received: by 2002:a5d:5850:0:b0:1ea:7d9c:4397 with SMTP id
 i16-20020a5d5850000000b001ea7d9c4397mr17555155wrf.225.1646093706097; 
 Mon, 28 Feb 2022 16:15:06 -0800 (PST)
Received: from [192.168.131.175] (62.red-95-127-166.staticip.rima-tde.net.
 [95.127.166.62]) by smtp.gmail.com with ESMTPSA id
 a17-20020a5d5091000000b001edb61b2687sm16736535wrt.63.2022.02.28.16.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 16:15:05 -0800 (PST)
Message-ID: <07e8a36f-c58e-b800-4feb-2c2af6d5b4c0@gmail.com>
Date: Tue, 1 Mar 2022 01:00:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 2/9] util: Make qemu_oom_check() a static function
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
 <20220226180723.1706285-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220226180723.1706285-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
> The qemu_oom_check() function, which we define in both oslib-posix.c
> and oslib-win32.c, is now used only locally in that file; make it
> static.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/qemu-common.h | 2 --
>   util/oslib-posix.c    | 2 +-
>   util/oslib-win32.c    | 2 +-
>   3 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

