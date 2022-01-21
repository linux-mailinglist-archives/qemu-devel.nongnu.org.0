Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867F7495EAD
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 12:56:30 +0100 (CET)
Received: from localhost ([::1]:44110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAsWr-00010E-6x
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 06:56:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nAsOc-0001LD-Ux
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 06:47:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nAsOa-0002Ne-3R
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 06:47:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642765674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=larz73vRBkLuxAuJ2EYsJUySHXE54sLimChuYyeISoc=;
 b=YxyETNQnJAHVmfyxdYNzEuWCelWtQ4W18uyX3CdBTqLHZCQfiBaY1eRPNHVjQsUQSXibOF
 UcEjX1p0Un/W9VpH6AcxPA43psZG6l0D8c082S7EIyumu9mwnbQgpMfu4HVrGFjsbv1k/c
 lRUUH8nKOsxIalu7/dxdSWv9LCxP4mo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-ITjVqUdHNwCC6KdnYIlfBQ-1; Fri, 21 Jan 2022 06:47:53 -0500
X-MC-Unique: ITjVqUdHNwCC6KdnYIlfBQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c16-20020a1c9a10000000b0034dd409329eso5012239wme.3
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 03:47:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=larz73vRBkLuxAuJ2EYsJUySHXE54sLimChuYyeISoc=;
 b=leSZiQGy4zQD2VBwsOAevyyq6hEh2I2WJVnhZ4v7xo+Xq6XIJOvqzPHCHFM6pGDXcP
 VBdG2MqZeG7rhookr3OU3OHLenjUe6wZD8zBB+salvobEZkkYIHN1Rj9E+43rgk6lktS
 r0/lVWeDzMXLpGhra4cF8k1fWmGtoLdVZtegEIHdIeoQ8Bt5Pq8I7spyTFatUN49DMYj
 XDt0n6XiUSDBlUelj9uNRk6t0qqD4lKgNFHK4oaZntaJJM0jOSRZ2rptdhOE/dJDEB/p
 rZQk+KL0ItB0f6WiXRBZOd0/EX7o5GQt6SNdY+QBScLPXgpa9CZ76OaAuu/dEMaZoI3s
 IpJQ==
X-Gm-Message-State: AOAM530pdU7OGVq989msFmp9N0si+kEUYRu5xGJzMzlOyJs/54AiaWwI
 xhgDda24Hoa2VB5/Q4k5eqFIrGGMGVg5+DXpjtudGmH6wO+XZiYajyEziyK+Vt85VeV5xiOtQkk
 5REUN+VWplBo5EQ0=
X-Received: by 2002:a5d:6947:: with SMTP id r7mr3621622wrw.510.1642765671988; 
 Fri, 21 Jan 2022 03:47:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyClzEUg9lwODPAO3xgfB8qTAuDuSKRvZzT4ER/m9rSh85/gp6vFz/EorqIj4YOkDU2r0KNSg==
X-Received: by 2002:a5d:6947:: with SMTP id r7mr3621607wrw.510.1642765671815; 
 Fri, 21 Jan 2022 03:47:51 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id f17sm4842807wml.31.2022.01.21.03.47.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 03:47:51 -0800 (PST)
Message-ID: <8e4fd7fd-52aa-6039-c242-38d3b93b5130@redhat.com>
Date: Fri, 21 Jan 2022 12:47:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 7/8] tests/lcitool: Remove libxml2
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220121103623.288054-1-f4bug@amsat.org>
 <20220121103623.288054-8-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220121103623.288054-8-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/01/2022 11.36, Philippe Mathieu-Daudé wrote:
> The previous commit removed all uses of libxml2.
> 
> Update lcitool's qemu.yml and refresh the generated files by running:
> 
>    $ make lcitool-refresh

Could you merge patch 4/8 and 7/8 so that there is only one refreshment 
patch in your series? ... it's a lot of churn otherwise...

  Thomas



