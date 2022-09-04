Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DBC5AC489
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 15:43:18 +0200 (CEST)
Received: from localhost ([::1]:46852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUpu9-0002mA-NV
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 09:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUpsY-00007k-ES; Sun, 04 Sep 2022 09:41:38 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:50772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUpsW-0007NW-St; Sun, 04 Sep 2022 09:41:38 -0400
Received: by mail-wm1-x32f.google.com with SMTP id j26so4007287wms.0;
 Sun, 04 Sep 2022 06:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=dqVwd18p1DsIP/IBAl+XO5nPTE9MtSeevxVt+bdXMmA=;
 b=HhwutgATYqRYQjAFkJHvnOkXFSC1tfMJ/9QGNO7oapJc5vxXrnDHRWS0pg6RNb8wkM
 2ACnVxeytuRNOsklwnds47Hh4e40682HeepY0vxnjmncRH4mkDHpmAF6y70p5YK1z4OY
 c2NGtj88VkVpeAcZupFwpFJL+e8GtAa8v9ecCeU/Ru5dYglOIneBgnA3rLIpFRVNqJ6p
 V1OCeWbBFG4yVGQrwFd8X3S9P7mgJpO6GdVKNYkWhuXRKV0tI3QUq9XOkrQ7qmOv4JVL
 ypBV2aN0Mamn4GjLgZw9pa795erhLbl4ZPBVPr1HNf5bZFBLq5XEQiZlXTt0OP2FXLmO
 xT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=dqVwd18p1DsIP/IBAl+XO5nPTE9MtSeevxVt+bdXMmA=;
 b=QI26dwWHxDFU1BYiyA9WSZe9u8+Cc1OidveDQwYlGt9st0n/tsz/2pVgiBw2aOkn7q
 +0kJNFJokQ1RDETWIWHJG/6XWKArmZwaYf7oIh+oRZjKb3TLvrzWhP6+cgdFwhlRl0yQ
 AqVYu2He119L0V1jJJoRgMvOnimmYrmUarH1Dvd8X/l0Ug/Pq4+P/pXrlGTndO9jYjFO
 AcepImoY1qD4WcztYF6erg1ZU5qM47WfypSWfofpuX85hdqwAPtqEyU8RtQ5bOvByMd0
 g0fnoo9R1FF08z70J+xC3adwT2wdbMxijHvJPhsokrY3fs+1cfT+w2EoFpQgJ5gxf9rq
 UtAA==
X-Gm-Message-State: ACgBeo0imcDo2TCGud64E2iBIhfAZ8GjhAAjj4lIMPHWLxJOBXbhGaZV
 OC+L2otU30+tdllcMWwQylc=
X-Google-Smtp-Source: AA6agR5bIfF4NrBy3pu+3hPvHbZR6GYN7d+d2ck9Z2OmUHgpLYZI+bw1TJHO5HXXyiA9GarjAapIZw==
X-Received: by 2002:a05:600c:4618:b0:3a5:f3f0:3a60 with SMTP id
 m24-20020a05600c461800b003a5f3f03a60mr8136680wmo.11.1662298895089; 
 Sun, 04 Sep 2022 06:41:35 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c1d0700b003a62052053csm18756474wms.18.2022.09.04.06.41.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Sep 2022 06:41:34 -0700 (PDT)
Message-ID: <b201ddd1-be1a-0bb7-fefb-27b41866831e@amsat.org>
Date: Sun, 4 Sep 2022 15:41:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 2/8] qtest: Set "-net none" in qtest_init()
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-block@nongnu.org
References: <20220902165126.1482-1-quintela@redhat.com>
 <20220902165126.1482-3-quintela@redhat.com>
In-Reply-To: <20220902165126.1482-3-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.978,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 2/9/22 18:51, Juan Quintela wrote:
> This way, we don't have networking by default.  If test needs it,
> configure it.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   tests/qtest/bios-tables-test.c | 2 +-
>   tests/qtest/libqtest.c         | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

