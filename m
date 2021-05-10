Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE31377E56
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 10:38:01 +0200 (CEST)
Received: from localhost ([::1]:55504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg1QN-0005k3-QV
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 04:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lg1Ot-0004v6-R3
 for qemu-devel@nongnu.org; Mon, 10 May 2021 04:36:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lg1Oq-0008Hm-Ql
 for qemu-devel@nongnu.org; Mon, 10 May 2021 04:36:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620635782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g2Oqv5afYphX+i13NdtYuulCdow6Q+Hs4b/rD9O8X+4=;
 b=GxUPslIB9u5k3TrgmVSX2Ewz6+PY8y1LCOXQEWZpFCUDAAubu/oRtCHL8L38b52D728gfU
 1V2sw3i7LQu2hP64WZYVfKyW9lnziwrfUXquzidV5/wT20JKZxjXQ/dhxa2DAk0cuSwgb9
 jY0z/ZKNfzp5MMHFn5VA0MX/L7uKHpQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-S4e8mwXnM0ixAPttbVx2Xg-1; Mon, 10 May 2021 04:36:20 -0400
X-MC-Unique: S4e8mwXnM0ixAPttbVx2Xg-1
Received: by mail-ej1-f69.google.com with SMTP id
 qk30-20020a170906d9deb02903916754e1b6so4455634ejb.2
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 01:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g2Oqv5afYphX+i13NdtYuulCdow6Q+Hs4b/rD9O8X+4=;
 b=Pv2qL4Bat9aLpgtD9SITkGoZ0RDETtjXIs3ENNNYnIwUaxsYK52hEWQuEQ+nzcnX6M
 pJOQo7eTypyjryxbJvIz/yiPXWxNTkHHD+9mQP70rGLqO1IkcJ86ctWH78NPq6hLFZzw
 wfvmAbSTko669ctZtdkZl6YdTmufhJzJqJ1G+US+K7OhT0v3b0tFYKqdrrA0KBRAnyN5
 jEM3ttGmas5K09Tyj+L2tafgkPqwUBAKuGfv0BF+FJotYON8xMZQIJq1FSPglqBw3czb
 REjskvxQA1UWGdbOz9tuoLTC8s9zww0R8vLHYZL8JRbxTme7XX8scMuvSJJ3fhOoHUHL
 +jSw==
X-Gm-Message-State: AOAM532NN5vsh1MZR+SoYc0vN7TYmTUVFyLsZDYtMbLq3Op0z404Bp7W
 23OVK7NXI0xfHtQ95s5c5B6XB+nbRclSTux+9OgJD/BbPFox4c5epDM2jt/fw/pa6E1V/PNDfDv
 TETd1nEoPonDDtSE=
X-Received: by 2002:a17:907:7749:: with SMTP id
 kx9mr24842354ejc.90.1620635778858; 
 Mon, 10 May 2021 01:36:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmCYshVrmtuM2MjanL1m7F4ZMSJZ/Ev1wb+DYUWu7PU3nXEF+D00RZX+dh7bL/n8nVMUhPig==
X-Received: by 2002:a17:907:7749:: with SMTP id
 kx9mr24842338ejc.90.1620635778685; 
 Mon, 10 May 2021 01:36:18 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 bh14sm8690512ejb.104.2021.05.10.01.36.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 01:36:18 -0700 (PDT)
Subject: Re: [PATCH] qemu-iotests: fix pylint 2.8 consider-using-with error
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210506084813.12007-1-eesposit@redhat.com>
 <9c80031b-83ad-dd59-6d77-254fee7e7a82@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <b234273a-3364-3f39-c709-f403c3dc0c24@redhat.com>
Date: Mon, 10 May 2021 10:36:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <9c80031b-83ad-dd59-6d77-254fee7e7a82@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 07/05/2021 17:39, Max Reitz wrote:
> On 06.05.21 10:48, Emanuele Giuseppe Esposito wrote:
>> pylint 2.8 introduces consider-using-with error, suggesting
>> to use the 'with' block statement when possible.
>> http://pylint.pycqa.org/en/latest/whatsnew/2.8.html
>>
>> Modify all subprocess.Popen calls to use the 'with' statement,
>> except one in __init__ of QemuIoInteractive class, since
>> the return value is assigned to a class field and used in other methods.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   tests/qemu-iotests/iotests.py    | 63 ++++++++++++++++----------------
>>   tests/qemu-iotests/testrunner.py | 22 +++++------
>>   2 files changed, 42 insertions(+), 43 deletions(-)
> 
> Thanks, looks good, functionally.  But I just can’t keep myself from 
> nagging about indentation (I wouldn’t have, but flake8 says I may be 
> justified):

No problem , I expected that there would be style problems :)
I will fix the indentation and send v2.

Thank you,
Emanuele


