Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E6B4B5194
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 14:24:52 +0100 (CET)
Received: from localhost ([::1]:38230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJbLX-00033d-8s
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 08:24:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJabq-0004lE-Cz
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:37:39 -0500
Received: from [2a00:1450:4864:20::32b] (port=55013
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJaBe-0008Ev-1B
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:10:36 -0500
Received: by mail-wm1-x32b.google.com with SMTP id c192so9511572wma.4
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 04:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7jGirUhK5lEECykxqa7W+lVWmlognC3un0SqZDa0plk=;
 b=CH2/8OphbJZR9V99aqdITwuf5+lCbAfGHeiCyr+6dvrbNTf/AOU5Oh7spwrW+Cfmvj
 gRUuVkoGvIVW3mUjNs2wF7Qa5vUOmbZpZrQ3F1SKwJlyP9dGh43aY987coEQQoj3gukr
 U4xgFXVML84gPXVMwj7fjpUksY2AxdqvVFu8Lshp/kqM9X4ogC7O3WZAnDALqgJn1bFC
 WcLXIH80/BA3tJLC+MWA8K4pIv/hJRDmj+qc7Ezhnva4mxu99OUkfYrHr7DD5SoeF/Qp
 OOibrDWaAj1UgvGFD4vOuzE+hpKqlGS82NsYzmKOx7dqaI+d8SbRhk4h1rIwemZ2mm0b
 BnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7jGirUhK5lEECykxqa7W+lVWmlognC3un0SqZDa0plk=;
 b=sTk0MN81Ho7P2ZhOSwK6rtcG5iNAnqarkZhGNE28aYhOmSSKgtlyCv2zjEavRmPmHQ
 gjx8rpyZhM181hBiQmdetG7feqwvfbMliTIC1df7FnFEI6qR2NKb3lpz+Gf0CqSezN2V
 UWLcaeTAJ/sd/nBje6TduOq4sc+knexQ4CP/R80e0yhFVqE0eUWNEsymzC5uwFri4PNB
 DxiSIzSWsf4Xtetaik/UzwH4LAR+5Ppzeb0FpshCZCzbZeQbJFtmxO3QedKml9lMQftD
 d6OfxXVgPIOvj6/Ys6AuXCozHKOhaDdD/4/Tdk/K2k5Iqi9FnLBqV2Yc+fTOAfwI0Xmp
 D/HA==
X-Gm-Message-State: AOAM530GTc9TodeqBUx8jYvlJzj8vmHMTYp4rOwLv4RLzGF2ARkr2SmI
 3E65gv2vGCXh7Kl4gVCKInw=
X-Google-Smtp-Source: ABdhPJw3H/210ismMdsEE4xqIhyUobNbAuQCHyQRrh1HB+UY9eruGe6vr12w7y5A4nqUzndbPu9bSQ==
X-Received: by 2002:a05:600c:4e11:: with SMTP id
 b17mr3339870wmq.31.1644840631655; 
 Mon, 14 Feb 2022 04:10:31 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id f9sm9274190wry.27.2022.02.14.04.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 04:10:31 -0800 (PST)
Message-ID: <ccacb932-0d51-10c4-081c-ab1a8ad95f4a@amsat.org>
Date: Mon, 14 Feb 2022 13:10:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v4 01/13] lcitool: refresh
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Will Cohen <wwcohen@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Li Zhang <lizhang@suse.de>
References: <20220211163434.58423-1-f4bug@amsat.org>
 <20220211163434.58423-2-f4bug@amsat.org>
 <d1bfb5c5-8b7b-849d-d0a4-cab3ebe07057@gmail.com>
In-Reply-To: <d1bfb5c5-8b7b-849d-d0a4-cab3ebe07057@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.785, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 12/2/22 16:14, Akihiko Odaki wrote:
> On 2022/02/12 1:34, Philippe Mathieu-Daudé via wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   tests/docker/dockerfiles/ubuntu1804.docker | 2 --
>>   tests/docker/dockerfiles/ubuntu2004.docker | 2 --
>>   2 files changed, 4 deletions(-)

>> diff --git a/tests/docker/dockerfiles/ubuntu2004.docker 
>> b/tests/docker/dockerfiles/ubuntu2004.docker
>> index 87513125b8..159e7f60c9 100644
>> --- a/tests/docker/dockerfiles/ubuntu2004.docker
>> +++ b/tests/docker/dockerfiles/ubuntu2004.docker
>> @@ -66,7 +66,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>>               libpam0g-dev \
>>               libpcre2-dev \
>>               libpixman-1-dev \
>> -            libpmem-dev \
>>               libpng-dev \
>>               libpulse-dev \
>>               librbd-dev \
>> @@ -91,7 +90,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>>               libvdeplug-dev \
>>               libvirglrenderer-dev \
>>               libvte-2.91-dev \
>> -            libxen-dev \
>>               libzstd-dev \
>>               llvm \
>>               locales \
> 
> This can't be applied to master.
> 
> % git am ~/mbox.txt
> Applying: lcitool: refresh
> error: patch failed: tests/docker/dockerfiles/ubuntu1804.docker:89
> error: tests/docker/dockerfiles/ubuntu1804.docker: patch does not apply
> error: patch failed: tests/docker/dockerfiles/ubuntu2004.docker:91
> error: tests/docker/dockerfiles/ubuntu2004.docker: patch does not apply
> Patch failed at 0001 lcitool: refresh

This was based on the testing/next tree which is now merged,
so this should now applies directly.


