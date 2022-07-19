Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB8A579452
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:35:50 +0200 (CEST)
Received: from localhost ([::1]:47852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDhll-0007zb-RQ
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDhju-000640-6T
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:33:54 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:40664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDhjs-0007RE-PI
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:33:53 -0400
Received: by mail-il1-x133.google.com with SMTP id c16so5980013ils.7
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 00:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=avwhMN37F+gsRXGvgyeFBV5lpswlneDi1cTFSc6qYlk=;
 b=mpgLPxlauDdPQmNXZr/QQWHrbYpZa/wxXYyr4h0+WHbJzwgbHX6c+9JnMJCMLg42+D
 WVRO1PjNW6YyYv1g3ycIwXv5wdfgzZ2KbiGqqcmrIhepZ8yVMToZKMlLUnJo1aiVUVAe
 Qzpv0D3UqLbyFJz0MWcuKNWzjoSV0MJzQkSfaEXyC2D6lq3NOtXgq1DJdXbXz1qQ1zXJ
 tqyboz1kRQd02tY9MdgoxCFT5woOGOICFhJKU6BXSzFRFxUXU894GMnPq+/K/SE45IZh
 K8fxPaC7fFfY/zZ9d6tNBNiFXQOr6JGS6Os1jKCk395ZmilXJy0dqCrziaOrAomDU3+K
 bkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=avwhMN37F+gsRXGvgyeFBV5lpswlneDi1cTFSc6qYlk=;
 b=MuG2k8qBX16W1vFno6qZhc0Xo3ykXwm0pc5kscQS0Nc7aNzJjZvJfoD8VsVB+WOcYn
 1hSa8wRDfifnIw8LVL1lv0icxBG0fTWjIapIVUccRmeD80NclTL3hciAWtWoAbxsWzVH
 SHcRppC2Qxq7WTW0Zaw0wLrJZ1edJbEwTN5XREA2YpNWo6UlTri0msTxWEKEaD69jNNF
 qbPFFE66Akr3P67Lv7YqnMvR+zZnV359Z3cXGfk9Ph7gQWpq+lcFHfzke5CFUtUlZPHU
 zcFc/gnMS2g9OYcfkYhS8waFJsusafarEIGwa5zTt4XREHp40kofndtzQrA629ltWoIO
 +xQw==
X-Gm-Message-State: AJIora8a9jcztHR5QfLShQbiTAeZxolPmlTVE+ragEVlV8PfEmbiVez/
 m9xzpWjTnZ5qwJH7wZtfzmwmGQ==
X-Google-Smtp-Source: AGRyM1vxL2ih3KXv6aNKkyEilwNKrL9v48cfEHXxrVxFn5LdT8sHqqVD3MKv+NNCwzILd3XXqX9MYA==
X-Received: by 2002:a92:6b10:0:b0:2db:efeb:6a42 with SMTP id
 g16-20020a926b10000000b002dbefeb6a42mr15382779ilc.40.1658216030871; 
 Tue, 19 Jul 2022 00:33:50 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.163])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a0566380ca900b00339e158bd3esm6397894jad.38.2022.07.19.00.33.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 00:33:50 -0700 (PDT)
Message-ID: <38c4237f-1d9c-12fb-a490-d46fb20b5013@linaro.org>
Date: Tue, 19 Jul 2022 13:03:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/8] tests/tcg/loongarch64: Add some tests.
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, f4bug@amsat.org, peter.maydell@linaro.org,
 yangxiaojuan@loongson.cn
References: <20220716085426.3098060-1-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220716085426.3098060-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/16/22 14:24, Song Gao wrote:
> Hi, All
> 
> This series adds some float reference files, fixes some
> float_convd/float_convs/float_madds bugs, and adds some
> instructions tests.
> 
> Thanks.
> Song Gao
> 

Queued all of these.  I added the #ifdef for pickNaN to patch 2, and I have left patch 3 
as is.  (My quibble with patch 3 is minor, and it's more important to have the bug fixed.)


r~

