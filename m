Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9293945C39E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 14:39:42 +0100 (CET)
Received: from localhost ([::1]:47802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpsUu-0001Kg-GZ
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 08:39:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mprwX-0007K9-Gd
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:04:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mprwV-0006Yi-Cq
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:04:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637759046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zDqhseHdFgB+eJQE/FJB/fl971Szg1W2fidoUqkXi8E=;
 b=LneraO9B92g1MIpHIlvoR17d2ieFkFDeZnWlPjk6E2QIP3l2Mzq45dfQcQr3EG0TlTyh2M
 Rngl3N16xcqNzXUJjo6HFvfXUXcCmockjm7/v+/DktNVP7b7GLYmMgGeRd+XJymrRbSNa1
 y6e9zgffp3pETSNOmTsp1xda9YMFMq4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-sH4cr7kCP3yuSUu2HuPzQg-1; Wed, 24 Nov 2021 08:04:03 -0500
X-MC-Unique: sH4cr7kCP3yuSUu2HuPzQg-1
Received: by mail-wr1-f69.google.com with SMTP id
 q15-20020adfbb8f000000b00191d3d89d09so480932wrg.3
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 05:04:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zDqhseHdFgB+eJQE/FJB/fl971Szg1W2fidoUqkXi8E=;
 b=TmGpABj6gab/8SG6ZdNeX8FtYZDlumzm5z9WEx/hnrjsHK7NmYYyoER+7WVlgdyeKH
 00leq+FZDzxitPdiSmW+oHlWfrQWRD9+sk8Ats7xi3vk5KyqukeFnNGnkFOZBtlb5km4
 DM+9ZALWB1m7uK2QUiCflwNd8Po+nCyZ+XuM+MhQtf5k8EnJ4BdzJv7iY8vC2t5rQ4AL
 70Ib5FTK61mg3YiL21ifNxvLVCBLq0ptlGDTVWU7Tcko3JPsWIIuekr7tZGbjX3XquSp
 c4vagmvCmX77FiAT01qMPF9ZtqO66dby3VVe+6WQth93y8kCfz4MGyegK2t9LPwDkron
 z2GQ==
X-Gm-Message-State: AOAM533aow81Mp/tCniAhfg6aAl2CBwAamzuxJsQuiOW44zbOddpM0tm
 RdVp6QUp0RbIDQnd8RH7a2oMxrEhW/YsHQzz5G7zwMZ6unTaeL/HG2SAgrvQ//ciXr+pGh9I+a2
 VBeBcnvp7b9PbWNk=
X-Received: by 2002:a05:600c:501f:: with SMTP id
 n31mr15210953wmr.101.1637759042781; 
 Wed, 24 Nov 2021 05:04:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMZyIxLTBwmAO4GIGWqpBn8RROnX6BLX/V7OnyHycRa2MnlF2jTPGHYmEwkYz2vxOWvZ3XUg==
X-Received: by 2002:a05:600c:501f:: with SMTP id
 n31mr15210918wmr.101.1637759042586; 
 Wed, 24 Nov 2021 05:04:02 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u15sm5288640wmq.13.2021.11.24.05.04.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 05:04:02 -0800 (PST)
Message-ID: <095addd4-99ae-e2be-8ec6-06ee4d2b469e@redhat.com>
Date: Wed, 24 Nov 2021 14:04:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] ui: avoid compiler warnings from unused clipboard
 info variable
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211123134302.45741-1-berrange@redhat.com>
 <20211123134302.45741-2-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211123134302.45741-2-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/21 14:43, Daniel P. Berrangé wrote:
> With latest clang 13.0.0 we get
> 
> ../ui/clipboard.c:47:34: error: variable 'old' set but not used [-Werror,-Wunused-but-set-variable]
>     g_autoptr(QemuClipboardInfo) old = NULL;
>                                  ^
> 
> The compiler can't tell that we only declared this variable in
> order to get the side effect of free'ing it when out of scope.
> 
> This pattern is a little dubious for a use of g_autoptr, so
> rewrite the code to avoid it.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  ui/clipboard.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


