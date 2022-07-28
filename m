Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF6458395D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 09:18:58 +0200 (CEST)
Received: from localhost ([::1]:54054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGxnM-0000VC-DT
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 03:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oGxb2-0001I6-3x
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 03:06:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oGxay-0003og-Tp
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 03:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658991968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D5XlqDmPbalsNjzN7O3/2E53pyRum68igAYMamlhons=;
 b=DcyEN8lgybLvOHoBX2t2nrWjQw6nDRCgTKNCBrivY06yut651fUZRHQnTSdfGPAJsdBTHN
 UFmhBx2VBVynDKtS0cIWQ3uCKmz/EtKk2vna3uPKr2LVrOzjUDIJQp+2wgFA+cMQQrt6g+
 LXxgSGqnFAWyrYCeyvLVwCdl/bYQZSw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-tYxBnUGEMwCAkT-2d130GA-1; Thu, 28 Jul 2022 03:06:06 -0400
X-MC-Unique: tYxBnUGEMwCAkT-2d130GA-1
Received: by mail-wm1-f70.google.com with SMTP id
 bh18-20020a05600c3d1200b003a32044cc9fso568134wmb.6
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 00:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=D5XlqDmPbalsNjzN7O3/2E53pyRum68igAYMamlhons=;
 b=L/BFQyhtjo1sqS+SpUORRLsQ8U4+HtZVbEqoFoV5c8ejSXdH1kjfM6DmUii3K3AkUs
 KXFjqliNRfjqQaQrpSxxuHkTUWnEns7WiDPy5OzffQv8iDY+AXcQWy8u9XAbZaJ/ARJi
 cAksxeRfTTi+UX055u6IbiY9VbqMsHGnfm1ATC6Vh2rWsxoyypD9ioXGrKJsBFqlzBr1
 zW6uk0wPiAwORyIq1+z+J3Dfp8d5D+Kq0VikyiQ2x8xdyh7wl5O3QlNdNe2eD1IX5754
 qpgIxtjnAlSJwwfIjkTn8L+pao9sX1JW5hq/CFrprX6wgazCDn8EW8nIxtv5ZJ0PDjrT
 ib8g==
X-Gm-Message-State: AJIora/ZX3OXyaOdq9M5EONV+mWHC4njheBMQrcEe8cbvzrvgpdhDBBM
 ePxkUB8AdLtICgu+OfTQHmsNOEZn5u3RsoSczfA4vU67ZY3BQX+bRgCCtfrnSs5bmu6ophsKbIF
 2A9q1YEPQPwXVaGM=
X-Received: by 2002:adf:ecc5:0:b0:21e:b73f:e33d with SMTP id
 s5-20020adfecc5000000b0021eb73fe33dmr6015966wro.223.1658991965348; 
 Thu, 28 Jul 2022 00:06:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vTJs4o2G406vjY0xkdrETJcQiLeCv9IuMWfo1Om/THQAYlo5R7GE5M/nr6BHweiv/5+CKwxg==
X-Received: by 2002:adf:ecc5:0:b0:21e:b73f:e33d with SMTP id
 s5-20020adfecc5000000b0021eb73fe33dmr6015945wro.223.1658991965070; 
 Thu, 28 Jul 2022 00:06:05 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-134.web.vodafone.de.
 [109.43.176.134]) by smtp.gmail.com with ESMTPSA id
 y14-20020a5d614e000000b0021d6a520ce9sm89250wrt.47.2022.07.28.00.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 00:06:04 -0700 (PDT)
Message-ID: <eb25c0a5-7df2-286c-389a-1f49f0ac0710@redhat.com>
Date: Thu, 28 Jul 2022 09:06:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/8] tests/docker: Fix alpine dockerfile
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20220727163632.59806-1-lucas.araujo@eldorado.org.br>
 <20220727163632.59806-2-lucas.araujo@eldorado.org.br>
 <20d60b18-3ecc-9fbf-f853-1480b2935e05@redhat.com>
In-Reply-To: <20d60b18-3ecc-9fbf-f853-1480b2935e05@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 28/07/2022 08.52, Thomas Huth wrote:
> On 27/07/2022 18.36, Lucas Mateus Castro(alqotel) wrote:
>> Currently the run script uses 'readlink -e' but the image only has the
>> busybox readlink, this commit add the coreutils package which
>> contains the readlink with the '-e' option.
>>
>> Signed-off-by: Lucas Mateus Castro(alqotel) <lucas.araujo@eldorado.org.br>
>> ---
>>   tests/docker/dockerfiles/alpine.docker | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/docker/dockerfiles/alpine.docker 
>> b/tests/docker/dockerfiles/alpine.docker
>> index 3f4c0f95cb..2943a99730 100644
>> --- a/tests/docker/dockerfiles/alpine.docker
>> +++ b/tests/docker/dockerfiles/alpine.docker
>> @@ -21,6 +21,7 @@ RUN apk update && \
>>           cdrkit \
>>           ceph-dev \
>>           clang \
>> +        coreutils \
>>           ctags \
>>           curl-dev \
>>           cyrus-sasl-dev \
> 
> Not a good idea. If you look at the top of the file, you can see:
> 
> # THIS FILE WAS AUTO-GENERATED
> 
> So your modifications will be overwritten the next time someone runs the 
> lcitool.
> 
> I guess you'd need to modify tests/lcitool/projects/qemu.yml instead? Daniel?

Never mind, my e-mail program messed up the threading again, so I did not 
see that Daniel already replied.

  Thomas


