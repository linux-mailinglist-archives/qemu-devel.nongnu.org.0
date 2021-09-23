Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C76D415C0E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:37:03 +0200 (CEST)
Received: from localhost ([::1]:57758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTM6A-0005IG-D4
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mTM2t-0001X4-Mx
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:33:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mTM2r-0007nG-N4
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:33:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632393215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nm+bmt/ZDD+Q6WttiovZxD1cFXLe2jECBuPwADSaVic=;
 b=ajlS2mI2ovFgfCc3rwwG2RWOD8qnrZYvm6rHsGOiP1LoLuXkINxpRz8n2U2yvka9kjJtzC
 mQ20mZkFfmD0KTi2T3EqlktuawiDeUuvWpRt5mqNZywEb0nVfdI0i8UlVOpEG6s67WlllT
 XTJxNfR9iLCUMpHL3Y6TQj8YU4JwJNk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-fEAw-vFlOvCiyZ--ku39dw-1; Thu, 23 Sep 2021 06:33:34 -0400
X-MC-Unique: fEAw-vFlOvCiyZ--ku39dw-1
Received: by mail-wr1-f69.google.com with SMTP id
 v1-20020adfc401000000b0015e11f71e65so4785043wrf.2
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 03:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nm+bmt/ZDD+Q6WttiovZxD1cFXLe2jECBuPwADSaVic=;
 b=ap7xOnJDS43MtZZ4AvC7RDD30G/A6XyC/NZJnHyOJKsdv2hmbEz+d7hqvzs+wiI8RF
 QcSEJlBqumWsx+ATddHh+Y8hCrBv7a9zjTkXtWSoyquDTnjStqm6YKzQwTN0RBWpWjQ+
 Sp8F33KnQtFAp5/2Ee02+a4JT39/N+vBlxyUpF8DRNdntRr1Khaj/qC4m6J6+pSx1Wvh
 6Oyk5rUkj7G3ujrrMWoDjejtxMbiFGRGDoC3I3W4P4L7yZED4FO5i7LnNu7Zynlu+DTq
 UnL3nNVP9btv8W4pe5npiupYBOQMqFrTMWgIvg1E+NnXMLSo3PxFj4vMAdnUVh7yp6t/
 VrVA==
X-Gm-Message-State: AOAM5322PS9swotNEgZK7gSTHtLWSuW9rQjGdE7GOfD/ZCgYBoJtv8iK
 suc+KmiHOcdLVEJryO5GPk7jkwxS6UcsUuCDdCbkPKyEqMSRoyQJTFI2rzSr3moMykATR1NmTst
 QJ2HWEuEiTBxE/Es=
X-Received: by 2002:a5d:4b0b:: with SMTP id v11mr4252681wrq.359.1632393213794; 
 Thu, 23 Sep 2021 03:33:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRiA8sJy5uOKyzLWK+o77jpQbqqTgGaSwQ11RpDSDBWNkz1knGcHlmVTED9GD4UNrBFD//cw==
X-Received: by 2002:a5d:4b0b:: with SMTP id v11mr4252668wrq.359.1632393213669; 
 Thu, 23 Sep 2021 03:33:33 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id j14sm4840083wrp.21.2021.09.23.03.33.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 03:33:33 -0700 (PDT)
Message-ID: <0f7c7991-e0af-1447-91be-260134c746d5@redhat.com>
Date: Thu, 23 Sep 2021 12:33:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/6] iotests: add 'qemu' package location to PYTHONPATH in
 testenv
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210923001625.3996451-1-jsnow@redhat.com>
 <20210923001625.3996451-2-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210923001625.3996451-2-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/21 02:16, John Snow wrote:
> We can drop the sys.path hacking in various places by doing
> this. Additionally, by doing it in one place right up top, we can print
> interesting warnings in case the environment does not look correct.
> 
> If we ever decide to change how the environment is crafted, all of the
> "help me find my python packages" goop is all in one place, right in one
> function.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/235                    |  2 --
>   tests/qemu-iotests/297                    |  6 ------
>   tests/qemu-iotests/300                    |  7 +++----
>   tests/qemu-iotests/iotests.py             |  2 --
>   tests/qemu-iotests/testenv.py             | 14 +++++++++-----
>   tests/qemu-iotests/tests/mirror-top-perms |  7 +++----
>   6 files changed, 15 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


