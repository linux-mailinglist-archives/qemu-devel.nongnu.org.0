Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1260382D80
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 15:34:59 +0200 (CEST)
Received: from localhost ([::1]:58540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lidOc-0005yq-Oa
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 09:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lidNU-0004yx-UT
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:33:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lidNS-0004Sh-IA
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:33:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621258425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=euIVBQ6wnPZrqi4rTjb8PfjzamxBzpTgrt3zYHC2hHA=;
 b=DlfyunHCeC/2qeRBTbU/LxkC1wTNhCrNGXRSsvF+vKqkcB5hQF8tCBsnqkN1Yboqlbrx0U
 IcxItABzBxOVyq4p8isqMJjovQ03mjFkYeJTPLIEz4K5Zb3QcB3eBqlC41WJFJT/acf2gT
 1Q26SGu5lieLny40huzdSkIcr657LRU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-oJrogpt_Op6STRp78oi8ug-1; Mon, 17 May 2021 09:33:43 -0400
X-MC-Unique: oJrogpt_Op6STRp78oi8ug-1
Received: by mail-ej1-f72.google.com with SMTP id
 cs18-20020a170906dc92b02903a8adf202d6so1035891ejc.23
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 06:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=euIVBQ6wnPZrqi4rTjb8PfjzamxBzpTgrt3zYHC2hHA=;
 b=RfvAZkuzVVFijvlCKsPE4YxNA2I/A3n0GVBrD6qqV8KQN+rclBsK7WP/vkuabwWXRk
 g5aBqXdp6QSA4oCWy1JsPx2t3pxicB2t7cHu0OU0q2fbTb7Yv7/65h73gAax36nEGxPA
 pP0cCyDRz0jNtY/A+nYD1mMuOc0Ba207I8lEVrs7c8Gu3xD5E7d7temqqndKa5mHJCHl
 NsSZohuEtLtpq4+jC1sv89ZXC/mX1z7ViVBuNqWph5r7ZGyDaeBV3jhgQL/KC4YPcYPQ
 AUui64hRJ2MgXw842gXVGLLOMZLwYyGUR2Nao1tXi5y5KbPh+jwdlx/R3zEOU1goi6OE
 QlTA==
X-Gm-Message-State: AOAM532ZuHR54AJwiISX8z2+LvA2Wl+s38KgdXaK2ig0Tl8MXhLhI54K
 IkTyplijU3IBVw8yoRSeT/Oo1xM7hefjyfE67Pb9r6r61a9ziYVxaRv9ByAVSJNqJH/FNPJ3FNF
 tLjpo41Ww675l7mY=
X-Received: by 2002:a05:6402:40d2:: with SMTP id
 z18mr24794edb.81.1621258422649; 
 Mon, 17 May 2021 06:33:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZnmi+uYgZwC02wegDXpeqRNmeZ/L2nMDobm631RHvCqXYRBd1CJ79Cn7qE5toVLa53jTkkw==
X-Received: by 2002:a05:6402:40d2:: with SMTP id
 z18mr24752edb.81.1621258422352; 
 Mon, 17 May 2021 06:33:42 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c10sm3908622eds.90.2021.05.17.06.33.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 06:33:42 -0700 (PDT)
Subject: Re: [PATCH] replication: move include out of root directory
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210517121909.2625099-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <73a1d9f2-f2e9-128f-c871-c419d74daca9@redhat.com>
Date: Mon, 17 May 2021 15:33:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517121909.2625099-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 2:19 PM, Paolo Bonzini wrote:
> The replication.h file is included from migration/colo.c and tests/unit/test-replication.c,
> so it should be in include/.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/replication.c                          | 2 +-
>  replication.h => include/block/replication.h | 4 ++--
>  migration/colo.c                             | 2 +-
>  replication.c                                | 2 +-
>  tests/unit/test-replication.c                | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
>  rename replication.h => include/block/replication.h (98%)

Including the following hunk:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

-- >8 --
diff --git a/MAINTAINERS b/MAINTAINERS
index 7877710e372..34c60d9284f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3257,8 +3257,9 @@ Replication
 M: Wen Congyang <wencongyang2@huawei.com>
 M: Xie Changlong <xiechanglong.d@gmail.com>
 S: Supported
-F: replication*
+F: replication.c
 F: block/replication.c
+F: include/block/replication.h
 F: tests/unit/test-replication.c
 F: docs/block-replication.txt

---


