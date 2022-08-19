Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D03599657
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 09:53:24 +0200 (CEST)
Received: from localhost ([::1]:42640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOwoj-0002qw-O2
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 03:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oOwly-0001BO-1D
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 03:50:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oOwlt-0006uf-Ax
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 03:50:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660895424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+M3g05CtGXx7cpJCY8TqrRjr4JUmERV43aiJVnf6ACE=;
 b=Z9iWl6pbjeK29IDQPFci/4Y/xQ8sT8p+zZ3n8vZyhq6Mi8m2UPxQrlWa6rhyK9cx5srG7J
 D09UID90rYpeE7o+gyFMiF21N01p5Ao8kHn9nI1OTyknN6COsud8X9kDvwRw6SqhYK/VxO
 TINuvdOJPwG1RSKcyjDJRlKlWUVdlYc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-369-VbJ0m0XYPI2Sctadxy_jWg-1; Fri, 19 Aug 2022 03:50:23 -0400
X-MC-Unique: VbJ0m0XYPI2Sctadxy_jWg-1
Received: by mail-wm1-f72.google.com with SMTP id
 h62-20020a1c2141000000b003a4f57eaeaaso2108590wmh.8
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 00:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=+M3g05CtGXx7cpJCY8TqrRjr4JUmERV43aiJVnf6ACE=;
 b=cgr4+o/8d2ldATGcwya/BHnWx2dPmmLKK5P0YDY2mQwxptKhe3EWzIN6sYgus9M5PY
 /B+FF1w1xx2hHm97/arcQOTE7qpWEsabAvIwRmbnpQ3NiFpBtbVmO02u6ZRWvxThwvh9
 /rpJuoMTKLIwj2XiMi3zo+9gBSKB7qgLJgmv+PzBusaoca3Y7LfjGNxOO/QPQx+Yz49x
 WbEphfVkkZBCpGxRU9UtTNUydETrDOEd+DOLmCDMCDGINeYf8BZUJ72foIn7fHnwThjq
 Zm+KByW216yHggJA8IXyc69bZMsS94azEGkvFGqTgUkHORMGLtLc9lTqVCasO2janZzn
 55yw==
X-Gm-Message-State: ACgBeo1EaTiidhIsWCCdB+gXuZLzD9iWGKOs82SVwd/TIAxOcYR/NKch
 FvjTtg8MbLBPZhxxI93hdS4hb9WwlbZcG2EzofpuBXvwKLIVMrHpxYh+QbAT6etBrw38LdlH5o5
 t/qy1VqTHk5ETUrU=
X-Received: by 2002:a1c:f718:0:b0:3a3:2416:634d with SMTP id
 v24-20020a1cf718000000b003a32416634dmr4049690wmh.83.1660895422028; 
 Fri, 19 Aug 2022 00:50:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5ap9Vgvw3XxBAiyg2dVMKux9UC0Hu1ZokluhJG2MVLk7ugEfDAXjWc9a0knBk/ypXDUiJ07w==
X-Received: by 2002:a1c:f718:0:b0:3a3:2416:634d with SMTP id
 v24-20020a1cf718000000b003a32416634dmr4049661wmh.83.1660895421686; 
 Fri, 19 Aug 2022 00:50:21 -0700 (PDT)
Received: from [10.0.0.51] (88-103-235-154.rci.o2.cz. [88.103.235.154])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003a32251c3f9sm9588426wmg.5.2022.08.19.00.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 00:50:21 -0700 (PDT)
Message-ID: <2ac21034-c728-04ad-cb33-07870c1f0cc3@redhat.com>
Date: Fri, 19 Aug 2022 09:50:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] ci: Upgrade msys2 release to 20220603
Content-Language: en-US
To: luoyonggang@gmail.com, "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220728200422.1502-1-luoyonggang@gmail.com>
 <8721edcf-9f67-5428-4ca9-eba3bd94075e@linaro.org>
 <CAE2XoE8M+Tz3t=zh5GhX+vYCipNRdZUYieSjtAO2OUsJcYnAPw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAE2XoE8M+Tz3t=zh5GhX+vYCipNRdZUYieSjtAO2OUsJcYnAPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 16/08/2022 20.53, 罗勇刚(Yonggang Luo) wrote:
> I have reason to think that's msys2-64 bit failed because out of memory
> 
> I tried to show the memory size of the windows docker, it's result 
> are 6224352KB, that's less than 6GB?
> https://gitlab.com/lygstate/qemu/-/jobs/2891399652 
> <https://gitlab.com/lygstate/qemu/-/jobs/2891399652>
> 
> Can we increase the memory size to 16GB

I'm not aware of any way to increase the memory size for gitlab jobs ... 
Daniel, Alex, do you maybe know?

  Thomas


