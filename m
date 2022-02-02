Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43824A6B87
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 06:38:20 +0100 (CET)
Received: from localhost ([::1]:57588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF8LT-0004dn-Ou
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 00:38:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nF8Jv-0003Ib-6M
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 00:36:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nF8Jt-0000nh-J0
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 00:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643780201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9v09vqvkeHovCCvudqMlYqI/o9lZEHP/KmtIgBTQh54=;
 b=Ab/sC8E/08Ct3K/DKka/RbMljyGg3xZPqTAFtRyI9LGnEkpGyfFppLkpVMZ4p1DR6L7kPy
 eTzFUz1mGzVvGSlLxoS5uCRZLGEfoSwaPThwJt0S3f14B5Nl56vbYdrXzisUj3eRslhYtD
 N3Bsiz33DLlp8dQ9Eu4cJWiQiY/Btak=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-4dDXUMekN_G1gxg1DittLA-1; Wed, 02 Feb 2022 00:36:39 -0500
X-MC-Unique: 4dDXUMekN_G1gxg1DittLA-1
Received: by mail-ej1-f72.google.com with SMTP id
 fx12-20020a170906b74c00b006bbeab42f06so3949357ejb.3
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 21:36:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9v09vqvkeHovCCvudqMlYqI/o9lZEHP/KmtIgBTQh54=;
 b=7iIckjgwvI8AvKy+OvzT2nUao2atG7K4+kAz9aUCSuEAxqipg6sd9h034j+o5mnIaa
 Lhr9rqpuWTOx+rvRXwlPgeI0dPxRGchGWvrnu9mySz/BPO4Hp6o3p9wNEUxZIgjnJqCb
 I/TZWGeO+KxxjGJ2TEmBi0FT3SQxXHy7XFtgJXj/dJf7u1qeb20nga49Ugp6Fy0ApJ19
 hkZ+hPBCCAlBrc73NC8+fvJxTjVT8Z6DPgJmx6aIOQOyDd2kg00rGNhjFX02tfOiGkuw
 tqjbnt0GswubVEq4Qg/YZEmU36QlgyNadpjUwcpI50kA+jKcAw3o2dd2MjXeJx9Obj7+
 RDaQ==
X-Gm-Message-State: AOAM532cbCyoLHXBXTsZf2rvMdGwnKkp5ULp2TTyOGmvTYLkMYbI+VbP
 G/tsIqkAMy0W63g1I6ZOLVKTVHU7PXneEdzl1zqjv/fUsSR8tOtmlXHrD61WJTodo7h/rMD9OC7
 nVrYwtiKhMJTHFcM=
X-Received: by 2002:a17:907:1b0b:: with SMTP id
 mp11mr23404682ejc.382.1643780198541; 
 Tue, 01 Feb 2022 21:36:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXPIpY3qLNoWIKMpYnPTuAJwhhGYAtWYq0DXhu5buQ2x1hcJUekaFVoyxoSXF9cFNqNwdjBg==
X-Received: by 2002:a17:907:1b0b:: with SMTP id
 mp11mr23404669ejc.382.1643780198338; 
 Tue, 01 Feb 2022 21:36:38 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id jt14sm15412276ejc.32.2022.02.01.21.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 21:36:37 -0800 (PST)
Message-ID: <2465b653-aaf8-e03e-4319-33be418d36e9@redhat.com>
Date: Wed, 2 Feb 2022 06:36:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] tests: Update CentOS 8 container to CentOS Stream 8
To: Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220201101911.97900-1-thuth@redhat.com>
 <CABJz62Osah308O2pHFMWs+D2X+Mq=aOf1NAKFcUaWF5bGzwJEw@mail.gmail.com>
 <87k0eexze4.fsf@linaro.org> <64143667-7027-e64a-26c8-99f1c72ebacd@amsat.org>
 <CABJz62Os1a6hDnfffcifJgS8C2upbKmo1h5Nez1NF4LV0eG12Q@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CABJz62Os1a6hDnfffcifJgS8C2upbKmo1h5Nez1NF4LV0eG12Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/02/2022 19.34, Andrea Bolognani wrote:
> On Tue, Feb 01, 2022 at 06:47:14PM +0100, Philippe Mathieu-Daudé wrote:
>> Andrea, do you think it is acceptable to merge this and fix on top, or
>> we should do it properly from start?
> 
> My preference is always to avoid follow-up tweaks if possible :) but
> ultimately the decision is up to the QEMU developers and maintainers.

I really wouldn't mind if we simply re-use the old name, but if the 
consensus here is that we should rename it, I think I'm with Andrea, then 
let's rather rename it properly right from the start.

  Thomas



