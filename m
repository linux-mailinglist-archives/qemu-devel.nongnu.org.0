Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2BC4DDE2B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 17:16:31 +0100 (CET)
Received: from localhost ([::1]:48970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVFHC-0000b6-1c
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 12:16:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVFFk-00082K-Jv; Fri, 18 Mar 2022 12:15:00 -0400
Received: from [2607:f8b0:4864:20::102a] (port=32937
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVFFj-0005t2-6q; Fri, 18 Mar 2022 12:15:00 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 q1-20020a17090a4f8100b001c6575ae105so5869246pjh.0; 
 Fri, 18 Mar 2022 09:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=v2FB3ibC0PN2D9Ou398gRnH+T0IlchrYbvmYBo0HFlk=;
 b=FF2YNc5AloZnzUobfsrndnKzcgbYsoxeQ6g5teL2w6jB3mIrcDK40+75QmubT90c1a
 7bO28Y70+ZIkRqkxhYG1pAPKV+g0hD8dyx/5p6G8rUQ2INooF30LR3Zw+uGIycZraJdM
 V6zjyor9ChmbNasZdd/6A/sKovjkVgULw6f9zEuYHSN2r+2vTHGlRi1LcYYVtFAOEmRl
 olYZ2SX7by6C/hb+n8XmtqqDlAbzPKIyCqLZP1nMkX+PC9ewxjVbgdqWuL2otJX7Zoz3
 GC4ma5MFsVn9TtRpLwayrmCN3P04YZPWXvaZSf97x7AOop6W9lA+uaQsmXfajbfewqGB
 zOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=v2FB3ibC0PN2D9Ou398gRnH+T0IlchrYbvmYBo0HFlk=;
 b=dzwDDkCBs/vbHq5fwIJxLhd4LnK/hENouWjbGpMtzOxgBNxAcSaRDUdD9pKoeSMN13
 BOAdxE8TxZEka8nHeV0drBB5vHzPyDfeHButpd95lmsBxYnOqoEt+dDtzBtcT4jCCQJf
 qberHKqPqbl4SDjsrboMJKLm79SLSBraeKfG5wP2xIu5U9heJo+OYv6OO0U41BvcOunH
 82vRn8m33SPst+7tPSxCMcmtqruQkU3QMUbGZxMTwAbHtfF2NRNDg+g3NjI7dEspu3MM
 NJMsosLjr2/D6Tmw0TiHh+k3UUvDDsB/CiiiGnGtcyUC3ndKz+JvXdGSAirzi/FuvV6Q
 WDcg==
X-Gm-Message-State: AOAM532a4YhanZJwk54LRXLio7McDhgHAtx7UvbtClLFD0KdV19V0plY
 e+K7Nab/cWBLAxU8Sd+4BUg=
X-Google-Smtp-Source: ABdhPJwPP2gmkXUBcS2XEUPFwAPEQONXJo6ho+eObrzVp/EJdX9RYTQRfSpc1mA2McJ2XPkWwJq9/w==
X-Received: by 2002:a17:902:f68d:b0:153:9686:97ab with SMTP id
 l13-20020a170902f68d00b00153968697abmr213734plg.4.1647620097354; 
 Fri, 18 Mar 2022 09:14:57 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a056a001a8600b004f78b5a4493sm9810766pfv.105.2022.03.18.09.14.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 09:14:57 -0700 (PDT)
Message-ID: <2ab1e5f9-6a34-6b82-8f43-b7dcf58bc8b1@gmail.com>
Date: Fri, 18 Mar 2022 17:14:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] gitattributes: Cover Objective-C source files
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20220317130326.39188-1-philippe.mathieu.daude@gmail.com>
 <62dbdfcf-771e-7c84-ab8b-b02a61112f86@gmail.com>
 <69c6db77-273e-dbeb-e695-e20772d003e2@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <69c6db77-273e-dbeb-e695-e20772d003e2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/3/22 15:42, Akihiko Odaki wrote:
> I don't think this is needed. I could see a diff annotated with a method 
> name even without this change:
> % git diff
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index cb6e7c41dc6..14a4416cc8b 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -1264,6 +1264,7 @@ - (id) init
>           [pauseLabel setTextColor: [NSColor blackColor]];
>           [pauseLabel sizeToFit];
>       }
> +    //
>       return self;
>   }
> 
> Commit 29cf16db23 says:
>> Since commits 0979ed017f0 ("meson: rename .inc.h files to .h.inc")
>> and 139c1837db7 ("meson: rename included C source files to .c.inc")
>> 'git-diff --function-context' stopped displaying C function context
>> correctly.
> 
> So I suspect Git has some knowledge of common file extensions like .c, 
> .h and .m although I couldn't find in the source code of Git.

'git-diff --function-context' doesn't work for me without this change.

