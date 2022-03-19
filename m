Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0734DE556
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Mar 2022 04:27:28 +0100 (CET)
Received: from localhost ([::1]:49050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVPkU-0003rQ-JS
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 23:27:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nVPit-0002DO-Te; Fri, 18 Mar 2022 23:25:47 -0400
Received: from [2607:f8b0:4864:20::102c] (port=54096
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nVPir-0006kY-2z; Fri, 18 Mar 2022 23:25:46 -0400
Received: by mail-pj1-x102c.google.com with SMTP id bx5so8840716pjb.3;
 Fri, 18 Mar 2022 20:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XTW4S5ckpvq8HegZ6yTgNuRtPlmgbfhUQGcBCDoCe88=;
 b=KeWvWE07J+UiNMb+xel1xebiUWM3ebXDsajyb0kskEGEyW9Ad8QbfqzSuycF56s5+C
 5PcSuEYlH4oAqjYCzJjwWLKPMchoVDUNY6AH1+Khs9t7vTzUuKOJoBytNiyiCDhUWa2P
 +dIb+VdUw+WHCIeuaIs6tbGxD+0fE4ELBzLqrU1XKC77ztpEH7CEzbKmU2YIYLCH93R+
 dRwITr+BDijQ1rmP7091QX3TgQPV1HU8rEukIo5dhfn7PGoPghqz/j2tQEGRPhy5sJOM
 prk2VzrZG2kF7bke3Gh1FPOq/YwH3grc5pHs0GCRGsOm5mLaVCWj/QZXXxI0GopRc5Bl
 0XEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XTW4S5ckpvq8HegZ6yTgNuRtPlmgbfhUQGcBCDoCe88=;
 b=lWT/yUYnQTAR4qaF+bT0T/TIZCl/OHyf46GSyGDHzRzRdCKEOZBnLXcP/DSBYt/Xfr
 /Kw7LKGuN4SDcxdd1JbWLS6O3CBX1TG1CeLXML10ZIIg2dZquCKq+596GWIy2ZvTEMBL
 Rsx9VNlBWbk9Nbxq/MKbFGLZdPUJYUXmX7o3slvDEAT8ZdImQyZ3pCI1fXqbMRGxhz8f
 j7AeQeC1J7pFO3c+HjCLAcj5Zk9kgdOqT9EBW7Pt/QlLpF5YaFWuwY6YuKm8EMmQCxC8
 tf3fMpL20Qttbq9V+1Nn+zP8PkAbrBPGTzEdCv7War3GY9AzSKZHVrYFp9EyZ7ZX1fV/
 EfIw==
X-Gm-Message-State: AOAM532Z2D63ghtw40xOpCwhFn903IbfO0QdxzuvwGlyblJRZhMwcz+o
 cWhIxGwG+7KrC4Xr83n0zjI=
X-Google-Smtp-Source: ABdhPJzyMZz90iloxkS9KPCdtPii3t2vJu1VknelNfN4KT6CN71gL5FEJr34vC+KySm8dEJ9Tw+NpQ==
X-Received: by 2002:a17:902:ec86:b0:154:4f9:f938 with SMTP id
 x6-20020a170902ec8600b0015404f9f938mr2570945plg.5.1647660338977; 
 Fri, 18 Mar 2022 20:25:38 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a639b11000000b003810ac60e40sm8453116pgd.69.2022.03.18.20.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 20:25:38 -0700 (PDT)
Message-ID: <a37d98d4-5fdf-8a57-af64-eab4daacf49d@gmail.com>
Date: Sat, 19 Mar 2022 12:25:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] gitattributes: Cover Objective-C source files
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>
References: <20220317130326.39188-1-philippe.mathieu.daude@gmail.com>
 <62dbdfcf-771e-7c84-ab8b-b02a61112f86@gmail.com>
 <69c6db77-273e-dbeb-e695-e20772d003e2@gmail.com>
 <2ab1e5f9-6a34-6b82-8f43-b7dcf58bc8b1@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <2ab1e5f9-6a34-6b82-8f43-b7dcf58bc8b1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/03/19 1:14, Philippe Mathieu-Daudé wrote:
>> Commit 29cf16db23 says:
>>> Since commits 0979ed017f0 ("meson: rename .inc.h files to .h.inc")
>>> and 139c1837db7 ("meson: rename included C source files to .c.inc")
>>> 'git-diff --function-context' stopped displaying C function context
>>> correctly.
>>
>> So I suspect Git has some knowledge of common file extensions like .c, 
>> .h and .m although I couldn't find in the source code of Git.
> 
> 'git-diff --function-context' doesn't work for me without this change.

With some debugging, I found Apple's Git distribution actually carries a 
default gitattributes file which annotates *.m.
https://github.com/apple-opensource/Git/blob/master/gitattributes

However, it does not annotate *.c or *.h. Apparently there is no "c" 
diff pattern and they are handled with the "default" diff pattern which 
is actually designed for C. In fact, "c" diff pattern is not present in 
the documentation:
https://git-scm.com/docs/gitattributes#_defining_an_external_diff_driver

In conclusion, *.m should be listed in gitattributes but *.c.inc and 
*.h.inc should not be if my understanding is correct.

Paolo Bonzini, I found you are the author of commit 29cf16db23. Can you 
test the above conclusion?

Regards,
Akihiko Odaki

