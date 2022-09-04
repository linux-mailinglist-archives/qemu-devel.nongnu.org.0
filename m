Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399CD5AC488
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 15:43:01 +0200 (CEST)
Received: from localhost ([::1]:42878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUpts-0002Fg-9S
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 09:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUpsK-00087y-1x; Sun, 04 Sep 2022 09:41:24 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUpsI-0007H3-Ld; Sun, 04 Sep 2022 09:41:23 -0400
Received: by mail-wm1-x32e.google.com with SMTP id s23so3980925wmj.4;
 Sun, 04 Sep 2022 06:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=ooU2RXQu/trB+1A7E012Ad3uuG1L3Ttey5GYST6ZJi0=;
 b=LYaCi9gfhAuXMe94YYD5RplZ8YzDK1yUD/XYVcfsvqUUrwn45yjfdsSZc1zBfcUgda
 ghMuc3kuGHtD9G8ZjlVT75b9jAigTFw9eEcmS+EvN09H+IOP1wqD5SRejbmINmKQf+x3
 HWpxcSOsZ/amVgbbICviFB1IHBRyXVWY7g3UgNi42BIp2oW6jRS7xhtYTkD6M9x80WXT
 KIgU64Ox7fSI+el6bMW/ZdUs4Exw4M0CY94r7RaMCDeSARKQXoCf6lfhxe2jIqdai8NI
 ARV1fhcOfMyfURagxt4OTgRHE7dG63uExz5l2p2pC9KB6cD0JlGEAb78o266ETkk94p+
 /bWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=ooU2RXQu/trB+1A7E012Ad3uuG1L3Ttey5GYST6ZJi0=;
 b=1Nfpx5K7lulWjHuWdFBpMIxf1B9sjRs0vF91VOKXGJoYaLjPiAYzfwYjfSLn19ZwVR
 ZYfdj0ICKL+gu2Hb3HnYAsfjnA3dRwxw5ougfJ/y9iAnEb29+btf437rY9pyuShhxdHe
 60d65QU3zAh9HHg3JhZCOn3hhSwobzZpBlQ1Qr57zHMraQ7Mcujz94Vo/nDy4Yb6GGqQ
 IYFyFWbyIkYsnKfrrzZCR7CYrsb3SLHGYzE745NC9xc+lOdA4Sk2jYRJ+SKaPzm8zMEl
 4C9QgDDcODqEoZAv/1wHpe9UeFOLbu7EukJ5nJfumKy0xIPjW6iSGz+FmW07FMGYlyew
 +Sbg==
X-Gm-Message-State: ACgBeo0IoA6rp+9OtSjqBPGaqK+iWnyzJ8WLMjL7R32oKzEXUvqGO1Zo
 XzGwRGVHqk8iuhUnWf/+PE7Cy2bp2Ug=
X-Google-Smtp-Source: AA6agR7h6jj9zPGJz8U1kkwjtiPnUJLH4vpMmoClOL7LU9nzQdk3R78cUbcSt4PNwOz5MlItx+GFSQ==
X-Received: by 2002:a05:600c:410d:b0:3a6:1db8:b419 with SMTP id
 j13-20020a05600c410d00b003a61db8b419mr8318656wmi.119.1662298880946; 
 Sun, 04 Sep 2022 06:41:20 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c501200b003a32251c3f9sm15185605wmr.5.2022.09.04.06.41.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Sep 2022 06:41:20 -0700 (PDT)
Message-ID: <22d634e3-55b0-5a6d-47f7-6b08b248fa55@amsat.org>
Date: Sun, 4 Sep 2022 15:41:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 6/8] tests: Fix error strings
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
 <20220902165126.1482-7-quintela@redhat.com>
In-Reply-To: <20220902165126.1482-7-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
> They were copy-pasted from e1000e and never changed.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   tests/qtest/e1000-test.c  | 2 +-
>   tests/qtest/es1370-test.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

