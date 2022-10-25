Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C68FF60CFBC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 16:58:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onLKX-0005b7-LF; Tue, 25 Oct 2022 10:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onLKU-0004qe-7i
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 10:54:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onLKR-0000KR-Ae
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 10:54:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666709690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tz3iZX09kHq3cgNxY0+rJfZHeWtzgKFGFrua2Lw8i4o=;
 b=g4dctqAJV8ZpRP+02/Hicf5ETKZKKRfZjinMNotzpWc/58j8QtdFo9qm9C1Ehk/2LKDgT1
 /cPeUZOVP6YxJ8HoDBLmPfhrUPYwQ881hwLPlv9HtMqiYwIZPwzLiZhe8dqPiLxsB0nZwv
 H1q4j+Hs+qY4ihMwOfsspEwSGpB1wnM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-53-rJXoHD-mPum-VJ4BBzrBGQ-1; Tue, 25 Oct 2022 10:54:48 -0400
X-MC-Unique: rJXoHD-mPum-VJ4BBzrBGQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 h26-20020adfaa9a000000b002364ad63bbcso4885469wrc.10
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 07:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tz3iZX09kHq3cgNxY0+rJfZHeWtzgKFGFrua2Lw8i4o=;
 b=kCzQbbB3aic/siM1guFExEbtmFOSK0CGtZsW/K4Rz9X+neqnMsRrxw2g1bWzDAxEV8
 AdJznAfMlFIREQYGs5knXEQdt8D1LGwY5kW/GLhe6UxQtsBfVdEswrw+09mgdbFCVOLW
 BAJQoCyp8jbXXoCduDMG3zeqzcpy5CYYa8oB9dCu0LWWphnOlkyBYcBKx7xosXSyRTIx
 ZpZbqDdwR86IoN7n4VOwjKRF665b0t154ioLr06e89eUKkieOlhGHe3n0meRWay9oQ48
 GIO8TtqeN4w93og1/Oetn7izUxwcZerk1nhUIrk5qxpcDPo4tiuMHI9z/jjWfUbaylZY
 3VsA==
X-Gm-Message-State: ACrzQf0vbIVg69WiFPcrdpaDqDrTDZlG98xYnxTWMYuH2r7PpQhDbRYZ
 fjvz55TlmBxSgXuKMM4djYvbf+L8OSnJ1rSWXqrLz415PcP36vKg+UyBt+dbDkBPDwUA22zbVGU
 y1oAlFhSpadSPeXg=
X-Received: by 2002:adf:ed82:0:b0:236:62cc:77ce with SMTP id
 c2-20020adfed82000000b0023662cc77cemr11751652wro.271.1666709687834; 
 Tue, 25 Oct 2022 07:54:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM78QzJ6UJznnuY2jMXh0O3Xlhqyj/hZcaYVlORg7LteEZmUIIiapnM5DBFWWR6/mDzmR+Lidg==
X-Received: by 2002:adf:ed82:0:b0:236:62cc:77ce with SMTP id
 c2-20020adfed82000000b0023662cc77cemr11751634wro.271.1666709687653; 
 Tue, 25 Oct 2022 07:54:47 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-58.web.vodafone.de.
 [109.43.176.58]) by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c35d400b003b47e75b401sm11750752wmq.37.2022.10.25.07.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 07:54:47 -0700 (PDT)
Message-ID: <ee90e31f-1036-1ce8-d1c1-174cc58cf0e0@redhat.com>
Date: Tue, 25 Oct 2022 16:54:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20221013055245.28102-1-akihiko.odaki@daynix.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/qtest/libqos/e1000e: Use e1000_regs.h
In-Reply-To: <20221013055245.28102-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/10/2022 07.52, Akihiko Odaki wrote:
> The register definitions in tests/qtest/libqos/e1000e.c had names
> different from hw/net/e1000_regs.h, which made it hard to understand
> what test codes corresponds to the implementation. Use
> hw/net/e1000_regs.h from tests/qtest/libqos/e1000e.c to remove
> these duplications.
> 
> E1000E_CTRL_EXT_TXLSFLOW is removed from E1000E_CTRL_EXT settings
> because hw/net/e1000_regs.h does not have the definition and it is for
> TCP segmentation offload, which does not matter for the implemented
> tests.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/e1000_regs.h         |   1 +
>   tests/qtest/libqos/e1000e.c | 119 +++++++++++++-----------------------
>   2 files changed, 45 insertions(+), 75 deletions(-)

Acked-by: Thomas Huth <thuth@redhat.com>

I can take it through my testing-next tree:

  https://gitlab.com/thuth/qemu/-/commits/testing-next

  Thomas


