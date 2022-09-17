Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBB05BBAA7
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 23:21:09 +0200 (CEST)
Received: from localhost ([::1]:37616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZfFM-0007qv-O8
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 17:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZfCw-00051s-5N
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 17:18:38 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZfCu-0005Zg-I6
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 17:18:37 -0400
Received: by mail-wr1-x42d.google.com with SMTP id c11so41325056wrp.11
 for <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 14:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=fIBx1d5Iz+fsvHerBXK+DsOZc6zgWtoBe1yh5KSt/Rw=;
 b=kHUAfSTdm468tvbeuwfOtjnHstgrbt2a7imJwPDCF+MdlhwLw5zBnQZHSG88JXqpRP
 BLDk6lZsr1jA6Tspk441yPOu5OWSzcCEgn9DnTSXo8LlE6hBJOUlqAt5MyKSAXA+Ukph
 pYXIRkRvzfhd916d0bYhrrEGKgze7u5++Q3VvqiLXfmS9JoFvyDVQcNtgaEg0skmx7+x
 yAiB60zRXnxhphBXkrWnIq8732OjMCcUKcCcJnp9qFVklzDeMgsKc/g9ItDFZvPsLKg9
 UkqYPki0tGnInYIR932Y7YqklSNYy3LFaPqE43MoLdr1lqWyjuMGWdLZao0/cPByopQF
 dYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=fIBx1d5Iz+fsvHerBXK+DsOZc6zgWtoBe1yh5KSt/Rw=;
 b=yuxurZo+9QFBskQ4mHPxDALE2gFae4WPHQP9RjQt5yRC8PctPA7GNepV8gOBKG+F5B
 49lAuSq9Ky+IbdQhEielAW3DPvNHQ2ikBUUYY9VQfyk0qGYmncobpIevadVVPElPkhXA
 TXjPzehwrv5evbdganU5YXCMWCEBOwZDDRCb66TvHfMWzJWJ/8OeLWXUknxgriUjoP3p
 jS0dkhVeahTRb6kAFNh01BinkPx0U7+9svmT/kJ+82DW7he+SmTEVyRORIZ5R30ycpKV
 K43Cu50AN/hyGHXs+krBq9OdWLT+2MGw92h+uXh3xCYeB293VU2ZTfq7o55PjeEtVNPH
 gdZw==
X-Gm-Message-State: ACrzQf07xoj4JUcImmQK3JQZLVbkaVIfbdDvbcTFGaEKJ0nBoZy0VQsO
 3AEsdQi48xJ+QR+xZcrHNzw=
X-Google-Smtp-Source: AMsMyM5Bs9MXN2dI9CaKhECv12m8Zlyr94+m+pgJsNiuW9Up7CID9ZKQfReIs6x+uKKQt50A6zcFSw==
X-Received: by 2002:a5d:69cf:0:b0:22a:c2d3:1d4a with SMTP id
 s15-20020a5d69cf000000b0022ac2d31d4amr6635618wrw.473.1663449514487; 
 Sat, 17 Sep 2022 14:18:34 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 7-20020a05600c228700b003a604a29a34sm6999105wmf.35.2022.09.17.14.18.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 14:18:34 -0700 (PDT)
Message-ID: <db49e38f-415e-46f8-b6ab-717f4a925819@amsat.org>
Date: Sat, 17 Sep 2022 23:18:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 1/7] scripts/nsis.py: Drop the unnecessary path separator
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-2-bmeng.cn@gmail.com>
In-Reply-To: <20220908132817.1831008-2-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.529,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 8/9/22 15:28, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> There is no need to append a path separator to the destination
> directory that is passed to "make install".
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   scripts/nsis.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

