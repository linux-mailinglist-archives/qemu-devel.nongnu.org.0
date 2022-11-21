Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5FD63200E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 12:14:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox4kl-0000Xh-JF; Mon, 21 Nov 2022 06:14:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4kh-0000U2-LS
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:14:15 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4kf-0001Rq-2a
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:14:15 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 84-20020a1c0257000000b003cfe48519a6so6235079wmc.0
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 03:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZbaT+h3HOWmwH80QTmRWo5DhLpqaUHQTyIlM150qwnU=;
 b=vLulSZ+PrdUF7JEJJcVkfnmuQlfMz4yMvPPLTsx4PK6KtImG7Eoh7Xd3Q7ExSKG4YO
 dje4nrJk+TN+VWUgAl0coO+fJqYSPFU6qvVvjPMw2y0F7WPF7Iaa0wRejoFEfSrd74v3
 XrNrCiHruGI4E3QXduczg4AmhUgb3DzcspOuk+ufxr7qJt/UN7uyrXxnNjeYt87RZAqW
 iOsH8hLfs0FmcVFeIzjPxO8yKX9zstYT736bLvKQayO125byKnd3sLa/X+RemUnFugP/
 CRZBqiL6lyNCnSRpDeU6sKwUf7XoK/DSgTRAAEOhMX/Sw0rSuX7YAxAsYLGAq/p3ldsp
 /VfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZbaT+h3HOWmwH80QTmRWo5DhLpqaUHQTyIlM150qwnU=;
 b=bKEJKxJ2kUGEB5HSy2kapke8uiZ9xmCfIlxckcAfo6aec1gSMMqcEj87E9Hn6/HklL
 dHnk0UrRbavQxeNE6CK6QgV1sb8qIYU6D8afxjCqwRMb/7I+3iBpzf7NOTIQCyGVYuM2
 U8x+bZDJU3Ll5qgB7CiXZ1VcOovwm3SaTcL4segs9UPKszWnwPnUVf2Ynl0bzWZgdiy3
 Rcmfs/DJlnEDatyky2ucytjpByhdUbwGoKlYmShQy9e5szrURLhKnwxPrZcVcp/OzKRd
 OGKnLQmfaKCuwvYwSOHA+z7EC3Csu1C1fYJLyO8H8uipISDi7MLrfqNFGWSCz96SECpz
 N0ZQ==
X-Gm-Message-State: ANoB5pmUjJtv5yJuhDSTynXTNvwdycuos9KrbvTa0+3NtyDspV4sB7SG
 fbhAQ1FeMSEOMAFPOpeV21C5Mg==
X-Google-Smtp-Source: AA0mqf71AGltKJelYFDct6k/3CP25Eb8Ymdin9Y9rY0Z09RFqwH2Y41tPzVqcI/zA6LbCcipq1RaRg==
X-Received: by 2002:a05:600c:4194:b0:3cf:5080:412c with SMTP id
 p20-20020a05600c419400b003cf5080412cmr15113647wmh.99.1669029250518; 
 Mon, 21 Nov 2022 03:14:10 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m29-20020a05600c3b1d00b003c6b7f5567csm26560249wms.0.2022.11.21.03.14.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 03:14:09 -0800 (PST)
Message-ID: <57036749-77f4-9958-6642-d10789506371@linaro.org>
Date: Mon, 21 Nov 2022 12:14:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 01/10] error: Drop some obviously superfluous
 error_propagate()
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: eblake@redhat.com, vsementsov@yandex-team.ru
References: <20221121085054.683122-1-armbru@redhat.com>
 <20221121085054.683122-2-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221121085054.683122-2-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 21/11/22 09:50, Markus Armbruster wrote:
> When error_propagate(errp, local_err) is the only reader of
> @local_err, we can just as well change its writers to write @errp
> directly, and drop the error_propagate() along with @local_err.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/arm/virt.c        | 14 +++++---------
>   hw/hyperv/vmbus.c    |  8 +++-----
>   qga/commands-win32.c |  8 +++-----
>   3 files changed, 11 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


