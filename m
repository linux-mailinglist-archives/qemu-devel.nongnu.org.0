Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8035C4C6021
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 01:34:12 +0100 (CET)
Received: from localhost ([::1]:42218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOTzM-0001ZC-Ei
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 19:34:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOTxh-0000pe-4X
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 19:32:25 -0500
Received: from [2607:f8b0:4864:20::42c] (port=41553
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOTxf-0003Hb-N7
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 19:32:24 -0500
Received: by mail-pf1-x42c.google.com with SMTP id p8so9537680pfh.8
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 16:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Zip19zpffkFHbuemM8Uk+lGKqMMsP0qVcZksbgzR9fI=;
 b=pj88QjspUebiQ5frO2qN684iHll4pqqr43cxInG8wel9MqRHi6RuqM0q9GCOQPvolm
 2uJYblzDqVUh2j0G89IZ7DkuGsKEy3M/9iU5c4J3BXAVVszk8ZYnp4t8zI7q5M/JpfM0
 61gtNgaPL0vrHoJguQgOQxP8AlUk0euEeFS3zJzxxd1ro5r1SMaM3FGw/NLO0/HT5C1p
 JvKC/m2l/jwgg0DfsWgSE31GHw80ocvla8LP4fRNdb6x1RMFoisKHr7FaTwJy14jUD8m
 fGAI96lMxMDtTMw4RcawhNyXvY+t60MGGBvnkeMXMTrgULaGzkktA85mZyz/sTIYHdo9
 ucwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Zip19zpffkFHbuemM8Uk+lGKqMMsP0qVcZksbgzR9fI=;
 b=Z34dMNWZwAm+HLrgqPVDJPRloHoV47yUGxhMt4kM2GYHHwaOhtQs7mvBq7kxkL/Op2
 mZnajN4/CmwPhMUJ4T6+4dx8AzVNWxrqNp6m/l8X0A85+kbgYO+5diD+k+Wbid/yj9VZ
 LR63X7jPkZvpBcXfDvRzhZaM6gtH407DXT84u9McWmu3pLECL45Tkbeu+l8hcttvkqV6
 7JrN1zuMI/o1OTtCIZ/4H/vyTDnUD7TCpusIfBASWTsmsMHu6jyjPPIiy3YOXyyXKQK8
 nhtrVrxzm00dE+xptDSKl75YZDtxtObOOeARIwm+BmOl4VVuVIkcFfEh+Z4eM+UCsSS/
 Qm8A==
X-Gm-Message-State: AOAM530eWdiurLivO5hL51gj1F/6JdvVOxu65gAq8GlaDyy4tbCtryOo
 k4Xj6rQ5t9bfddu616QoD/8=
X-Google-Smtp-Source: ABdhPJzwmUwB85AfHA9P001S7TJgI4YTIWoFFou3xcB3PdYUTrxDHYATQT0RHVxG9PPE7YjdT3gHMA==
X-Received: by 2002:a63:3111:0:b0:373:a1fa:8998 with SMTP id
 x17-20020a633111000000b00373a1fa8998mr14771478pgx.415.1646008342436; 
 Sun, 27 Feb 2022 16:32:22 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a056a0026ca00b004f38e426e3csm10944080pfw.201.2022.02.27.16.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 16:32:22 -0800 (PST)
Message-ID: <a8877602-f3d6-11e7-b2e9-068c76bf8d94@gmail.com>
Date: Mon, 28 Feb 2022 09:32:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4] ui/cocoa: Use NSWindow's ability to resize
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220226104054.43538-1-akihiko.odaki@gmail.com>
 <CAFEAcA_OprFX4ub6dYzTNmwP7y2D31AmhknQ0xjQ11jYw8Nxig@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAFEAcA_OprFX4ub6dYzTNmwP7y2D31AmhknQ0xjQ11jYw8Nxig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42c.google.com
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/02/27 23:56, Peter Maydell wrote:
> On Sat, 26 Feb 2022 at 10:41, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>>
>> This change brings two new features:
>> - The window will be resizable if "Zoom To Fit" is eanbled
>> - The window can be made full screen by clicking full screen button
>>    provided by the platform. (The left-top green button.)
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>> ---
>>   ui/cocoa.m | 543 +++++++++++++++++++++++++----------------------------
>>   1 file changed, 252 insertions(+), 291 deletions(-)
> 
> This is making too many changes in a single patch to be
> reviewable -- can you break it down into more digestible
> chunks, please?
> 
> thanks
> -- PMM

Unfortunately it is not possible. The most of the change is caused by 
the convergence of two windows (full screen window and normal window) 
into one. ui/cocoa depends on them for coordinate calculations and event 
handling, which happens basically everywhere in QemuCocoaView. The old 
implementation with two distinct windows and the new one with a unified 
window are essentially incompatible and cannot be mixed.

Regards,
Akihiko Odaki

