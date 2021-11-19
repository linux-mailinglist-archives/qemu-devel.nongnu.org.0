Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A557E456BF7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 09:57:40 +0100 (CET)
Received: from localhost ([::1]:57846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnziF-0000qP-84
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 03:57:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnzfR-00062L-UU
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 03:54:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnzfN-0000mA-3m
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 03:54:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637312080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iwfk7K8iuIYo4JOyavwq9OQ6O4e5wmLUPk90dsOHtjU=;
 b=c3PbaUVanZ7DeywAeHfDFgser3hT4z0e+19jX59LpO1Ms6endNt0tVOuPIB6WqZqYxjyD4
 CfIG9Ey/+Mk6L14ltEOepq6gTXknRxvFKPIZYyoxKYV9dblsRhtsnZif+C9ZfuC/7BjC1d
 YGYU2idDLVLKaqQBcs8UrolmzywofRU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-rRalOLJdNyyTq_FJaj1ovQ-1; Fri, 19 Nov 2021 03:54:39 -0500
X-MC-Unique: rRalOLJdNyyTq_FJaj1ovQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 201-20020a1c04d2000000b003335bf8075fso3768248wme.0
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 00:54:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iwfk7K8iuIYo4JOyavwq9OQ6O4e5wmLUPk90dsOHtjU=;
 b=J1qoWAOb8Q8CqhdT168SoBOg0WVyLf2k8JCUq+ZPspb5rXZkWklsbvZDGVy2BelyEB
 dmJG6LgtmWFqxJHfMAfxOxItuvrO8u0xcdttzWcW+vEOCNp7rV+1uBSdmeBaNFheKM8T
 MXxK4mcElsMX95JG77oIAk0jzbfZXYeZwKmbPbKkxC1ik6unxWzmFzLdgsaIB4SFhCef
 w29OY5HohF0lJQR13LYg1OAaHH4ztZWoCl6ag3LYnQ/etMCnHio+UFynSYN1ZeSQTPW+
 1sZn0eFntzVMueFwry9rKT7hRO7zjZ6meqzetjI0S1Ttq+vrgE5QrrWK5Lt8ei1+XhkZ
 aTyw==
X-Gm-Message-State: AOAM533VynZ7ATkdgNh1suZovBgnANXHGXzBUmBaS1rZwSxMt5SapCiJ
 fdGT2dAAr5iMFdxuPjCqVhtd0FjQps0KUdQAMbDu6unUqHfud8ti+BV2j2oX+JCVFq4hIQrZj4q
 X7ZtaRmpryxJwZLs=
X-Received: by 2002:a1c:4d8:: with SMTP id 207mr4839795wme.2.1637312078097;
 Fri, 19 Nov 2021 00:54:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDQq8UZlafFvr/ENXuI+ZT0OxVEoFjLnemqgJG/8+4Wx5XaFVh8aSXRZe4vSh84FOJjM9rqw==
X-Received: by 2002:a1c:4d8:: with SMTP id 207mr4839781wme.2.1637312077963;
 Fri, 19 Nov 2021 00:54:37 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f7sm14780208wmg.6.2021.11.19.00.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 00:54:37 -0800 (PST)
Message-ID: <1bcbe209-708e-43dd-b2fa-065def264421@redhat.com>
Date: Fri, 19 Nov 2021 09:54:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/7] python/machine: add instance disambiguator to default
 nickname
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211118204620.1897674-1-jsnow@redhat.com>
 <20211118204620.1897674-4-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211118204620.1897674-4-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/21 21:46, John Snow wrote:
> If you create two instances of QEMUMachine(), they'll both create the
> same nickname by default -- which is not that helpful.
> 
> Luckily, they'll both create unique temporary directories ... but due to
> user configuration, they may share logging and sockfile directories,
> meaning two instances can collide. The Python logging will also be quite
> confusing, with no differentiation between the two instances.
> 
> Add an instance disambiguator (The memory address of the instance) to
> the default nickname to foolproof this in all cases.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/machine.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


