Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 299666D40C8
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 11:38:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjGdy-00084W-GK; Mon, 03 Apr 2023 05:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjGdw-000839-7a
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 05:38:28 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjGdu-0001LS-BO
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 05:38:27 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e18so28619024wra.9
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 02:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680514704;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tEsPQLcFTVUBBQzBJKaIowUYL0XySD8h9xsEZ5sdlqc=;
 b=ZJPTeps9ElSF27tlqQkyISGgGTNN9ddEiRJWdV9Qv2QjZmWwFR5l2fMWT3KogU12bf
 gBYYkCW43F2BUR8t8GjmtKRkTvpDlEAYQVaCUPfi5QyX6rp0ziPJzz6/ly6GQbJ9CC+G
 HH9G1NDIBMavAjrp+P+7k/EIfBxCZk/pJUncOGwGRBaiv2fzG8zJuZNwmH7fZzA5+/QV
 qoEbyzSm3cMYi/2mkkeTNOXzRX4OfSWQgnF7+Dnk4AnjpgpPJRIfWQL6Zy28HD1EP1w3
 JNx4b02iCc12s/jrMGOeTEF3em8EXAv1Av51ruSseOq/QvyeXmr9dF1FgmyYNpB/gpqd
 frHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680514704;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tEsPQLcFTVUBBQzBJKaIowUYL0XySD8h9xsEZ5sdlqc=;
 b=neAUi/Tkd9DzrgxIPJQpDLcPoRurGnkqYQwuFlNnHsU/bENrU/r5V5FC13Lerd8MXf
 T8K/5Nu761deOBA0Lm1J7oESrKXLGWmW0O4mk7U7jUUYr5STV1dDLl43wZZb6CFP829j
 N63kdb+kAuxiiuabKD7zqUMorR5HAdqovA/SL5H7SmvAAbuvKbG9N7Ch/Damr6kpk3o7
 uVnmkpjGWmAHflQ0XZknrbNsfAynmevNblYQhVFe0YrtnXEunqNgB5OALFCSeldeirs2
 FfljTrq9aR4McbYpcjs3aZZmIhNBcG3rUfU6F7irNGWp+/7Y29Bgvp6Y9DS1Tac+qRGr
 ks1A==
X-Gm-Message-State: AAQBX9cpFW8Q6LmeMF6W9F+w6VjhGvNqOjIwkPyRkSsyGWO/c4J5l+cZ
 7A61yne8TZR531sdb9LroGR53Q==
X-Google-Smtp-Source: AKy350aDV3P0G4687kpCMUVvOliLMF5RH4iNHIO6hiRu2HYETML4ISUW/rCYrUcWoOa+7RSpplbwmw==
X-Received: by 2002:a5d:550c:0:b0:2d9:5608:ee0 with SMTP id
 b12-20020a5d550c000000b002d956080ee0mr27085186wrv.69.1680514703858; 
 Mon, 03 Apr 2023 02:38:23 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b13-20020adff24d000000b002c573778432sm9181576wrp.102.2023.04.03.02.38.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 02:38:23 -0700 (PDT)
Message-ID: <1a4048c2-b9cc-fe3c-cbba-64fe84f78827@linaro.org>
Date: Mon, 3 Apr 2023 11:38:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: property 'cxl-type3.size' not found
Content-Language: en-US
To: Maverickk 78 <maverickk1778@gmail.com>, Fan Ni <fan.ni@samsung.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <CALfBBTuGSPYE_HV1ns_9T_Ud3BEAajhN2ivMCJ37f+hC1XOy+w@mail.gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CALfBBTuGSPYE_HV1ns_9T_Ud3BEAajhN2ivMCJ37f+hC1XOy+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.37,
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

Cc'ing CXL maintainers.

On 3/4/23 11:04, Maverickk 78 wrote:
> Hello,
> 
> I am trying qemu-system-aarch64 & cxl configuration listed in
> 
> https://www.qemu.org/docs/master/system/devices/cxl.html 
> <https://www.qemu.org/docs/master/system/devices/cxl.html>
> 
> qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 
> -cpu max \
> ...
> -object 
> memory-backend-file,id=cxl-mem0,share=on,mem-path=/tmp/cxltest.raw,size=256M \
> -object 
> memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest1.raw,size=256M \
> -object 
> memory-backend-file,id=cxl-mem2,share=on,mem-path=/tmp/cxltest2.raw,size=256M \
> -object 
> memory-backend-file,id=cxl-mem3,share=on,mem-path=/tmp/cxltest3.raw,size=256M \
> -object 
> memory-backend-file,id=cxl-lsa0,share=on,mem-path=/tmp/lsa0.raw,size=256M \
> -object 
> memory-backend-file,id=cxl-lsa1,share=on,mem-path=/tmp/lsa1.raw,size=256M \
> -object 
> memory-backend-file,id=cxl-lsa2,share=on,mem-path=/tmp/lsa2.raw,size=256M \
> -object 
> memory-backend-file,id=cxl-lsa3,share=on,mem-path=/tmp/lsa3.raw,size=256M \
> -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1 \
> -device cxl-rp,port=0,bus=cxl.1,id=root_port0,chassis=0,slot=0 \
> -device cxl-rp,port=1,bus=cxl.1,id=root_port1,chassis=0,slot=1 \
> -device cxl-upstream,bus=root_port0,id=us0 \
> -device cxl-downstream,port=0,bus=us0,id=swport0,chassis=0,slot=4 \
> -device 
> cxl-type3,bus=swport0,memdev=cxl-mem0,lsa=cxl-lsa0,id=cxl-pmem0,size=256M \
> -device cxl-downstream,port=1,bus=us0,id=swport1,chassis=0,slot=5 \
> -device 
> cxl-type3,bus=swport1,memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem1,size=256M \
> -device cxl-downstream,port=2,bus=us0,id=swport2,chassis=0,slot=6 \
> -device 
> cxl-type3,bus=swport2,memdev=cxl-mem2,lsa=cxl-lsa2,id=cxl-pmem2,size=256M \
> -device cxl-downstream,port=3,bus=us0,id=swport3,chassis=0,slot=7 \
> -device 
> cxl-type3,bus=swport3,memdev=cxl-mem3,lsa=cxl-lsa3,id=cxl-pmem3,size=256M \
> -M 
> cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G,cxl-fmw.0.interleave-granularity=4k
> 
> 
> 
> I hit this following error
> qemu-system-aarch64: -device 
> cxl-type3,bus=swport0,memdev=cxl-mem0,lsa=cxl-lsa0,id=cxl-pmem0,size=256M: property 'cxl-type3.size' not found
> 
> 
> Any clue if I am missing something?
> 
> 
> Regards
> 
> 
> 


