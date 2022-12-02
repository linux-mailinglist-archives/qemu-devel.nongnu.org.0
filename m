Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B473464044E
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 11:15:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p134R-0005SB-2p; Fri, 02 Dec 2022 05:15:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p134H-0005Ro-0o
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:14:53 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p134F-0004xf-A9
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:14:52 -0500
Received: by mail-wm1-x32b.google.com with SMTP id m19so3185906wms.5
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 02:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yy7/ro0Bp6LjhnRp/TgmhMDyulD0b3Fd+KhNVUrja9c=;
 b=IEPk4j4w+2jc8h9kP8NcTvRx9jCEExlxvbpbQoo9+ni53n33VuY8eylRnglgDbWX8G
 F97NKfURv06p0Mjl3cUrHHGdjJoNiAZ5FsxZH5omj19oxtp9JPRzQNkr1eU4yCW/UbEl
 dmcNgBmaMlLQufqZWQwLEmZ2VGs+ldlJXgxlRmOGBN6kyjdzeCreQ8UqyOpM/iO+KXdk
 ct47i7Cl1aKxeEeXB0/zkKLk9Z3mQYrmSiQjZrBo6l04eo5wx2ttqZHjBKDONdXWBuzN
 8U62GGDXF80jHezFa2+ePe2T9lYGu0On0/wR52idckMdO7kWsk7eshLx8/HYe0G/uhkt
 Bogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yy7/ro0Bp6LjhnRp/TgmhMDyulD0b3Fd+KhNVUrja9c=;
 b=4M0jeySYHTtYQStNfE6s3/0e0b7TBFgWgydQaWIq7IFf74d5Z3zv5A/U3jKmkDp2Zd
 mrQ1PEOA8MZyWfnvHTC6WhPBJNBZBW0icXkDCFIHCe684ZkLf62gfnkVE7SNAeZNR/T7
 /55Z0WoPZPzfArGJGw5Ga81k1iMPuNgcv4/vEsmF14Dt4WyaKCTNyUaSGIcU2FC9iFKq
 oQUKQkQ0aq0PsmNU48Y2m6JKY7s2m0tLWZZF6Ozv7Uxc2zMto4Pfota4eKxmfNUVIje7
 Hih1KaOsy2WD40ESMmIfE7+R9ZPN094323FOn3/3gomKuzyhWQdXcNOb3WDM57Lx/v6G
 jpMQ==
X-Gm-Message-State: ANoB5pm+bmp7TnkDsLgAPjC1iohYiTpow80rOCplvdQ5/Cep85IeD4DN
 lpdsdoP/8m8D5RC41I0D5u62LA==
X-Google-Smtp-Source: AA0mqf4b/0Z1eRzOR/jr6Am8uE4asZVLfie74v4Y/fzrA2/AeXF8JNyNpVzJRAB6A6W9NNA7kDu9XQ==
X-Received: by 2002:a05:600c:1c9d:b0:3cf:69ec:9628 with SMTP id
 k29-20020a05600c1c9d00b003cf69ec9628mr51802346wms.79.1669976089425; 
 Fri, 02 Dec 2022 02:14:49 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d8-20020a05600c34c800b003cf4eac8e80sm10011746wmq.23.2022.12.02.02.14.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 02:14:48 -0800 (PST)
Message-ID: <a720b214-54fe-12d1-a894-0709330716a0@linaro.org>
Date: Fri, 2 Dec 2022 11:14:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v2 03/14] ui/spice: Require spice-protocol >= 0.14.0
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com
References: <20221202100512.4161901-1-armbru@redhat.com>
 <20221202100512.4161901-4-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221202100512.4161901-4-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/12/22 11:05, Markus Armbruster wrote:
> Version 0.14.0 is now old enough to have made it into the major
> distributions:
> 
>     Debian 11: 0.14.3
>     RHEL-8: 0.14.2
>     FreeBSD (ports): 0.14.4
>     Fedora 35: 0.14.0
>     Ubuntu 20.04: 0.14.0
>     OpenSUSE Leap 15.3: 0.14.3
> 
> Requiring it lets us drop two version checks in ui/vdagent.c.  It also
> enables the next commit.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   meson.build  | 2 +-
>   ui/vdagent.c | 4 ----
>   2 files changed, 1 insertion(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


