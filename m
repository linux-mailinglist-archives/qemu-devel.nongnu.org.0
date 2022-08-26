Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B125A3075
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 22:29:22 +0200 (CEST)
Received: from localhost ([::1]:54178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRfxB-00073T-OG
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 16:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRfvy-0004sv-KO
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:28:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRfvv-0007MT-QE
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:28:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661545683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MfuToNCW0viJlt+EMK0Wa1UFUo0HYrWPh08kNsDn36I=;
 b=YfY6+l0p1QZdInLQFkKtEvRk0kwbcsmCDVxGGLy9j/5LAXJrhJDsRUmvwobFFOUqYoAGZJ
 dUVMkQyeVlNioDYgJQYA9CamoZSViyB9lEnwUa5ImgE12kjBz4sduuw469vxWd4RWKOPXy
 IeB1ZkFGXSZm30NgDz9MQxYZ7A2MlyM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-398-aURw3HW-M8WtWs-NBy8Zyg-1; Fri, 26 Aug 2022 16:28:01 -0400
X-MC-Unique: aURw3HW-M8WtWs-NBy8Zyg-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay27-20020a05600c1e1b00b003a5bff0df8dso4047469wmb.0
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 13:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=MfuToNCW0viJlt+EMK0Wa1UFUo0HYrWPh08kNsDn36I=;
 b=QicK+82i3mRcvpGoH4iWUp4I8QwakJOFSAd1ZB3RQAVfHs3/JIgHki27+zygtPzpwN
 alG0hlX42CJ6N/azkmhhR2ZDKUjE2x/nE5YwHMn+dBCwQFde74tCWwvfIq0KOmZLFDxO
 2vuwJZCIrlhcOttQxNP7/4UK5yfYq6EDLw6SFzPB6g84lU0T7UOJ8DBUskQBYeknC8tk
 T/XvALvASbR0c0tT+waEmojnIPjTqIYVNO0ZOabQYij9oHPCtIs7ugQb7n39r2nKlO4z
 vI3/6Ih2NPOmjMJdnwFFbquQ8TgHVJWYjEFvYdeZ0YNFbsdY3QhB2k+mmb5n4qXpTKCw
 eWqg==
X-Gm-Message-State: ACgBeo2p0l72zjH1RMg0BXOkjqwBebDjLdsI5hbUWkEMGd/X3HFMNyo+
 n4tFmvt7QL83Bfx4AJnpMWZ9otuPVGAe8780dhYebCH4XXO64tKWT8TuleaP1+m5jCDrFkVS/PF
 xBEBrzCfanU+4ZAo=
X-Received: by 2002:a05:600c:4a09:b0:3a6:9a22:3979 with SMTP id
 c9-20020a05600c4a0900b003a69a223979mr704880wmp.57.1661545680617; 
 Fri, 26 Aug 2022 13:28:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5UsUA2ndr7xPfv2QFnDByuWwtU5XeZg/KS+FivMEYhzWs6k60bBLZedTidz2RmcCKwU6vQxg==
X-Received: by 2002:a05:600c:4a09:b0:3a6:9a22:3979 with SMTP id
 c9-20020a05600c4a0900b003a69a223979mr704868wmp.57.1661545680413; 
 Fri, 26 Aug 2022 13:28:00 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-60.customers.d1-online.com.
 [80.187.98.60]) by smtp.gmail.com with ESMTPSA id
 n5-20020adff085000000b002207cec45cesm699486wro.81.2022.08.26.13.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 13:27:59 -0700 (PDT)
Message-ID: <4d2cf2a9-436e-8d4b-3ead-61dc78c5f55d@redhat.com>
Date: Fri, 26 Aug 2022 22:27:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 14/25] gitlab-ci: update aarch32/aarch64 custom runner
 jobs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-15-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220826172128.353798-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 26/08/2022 19.21, Alex Bennée wrote:
> The custom runner is now using 22.04 so we can drop our hacks to deal
> with broken libssh and glusterfs. The provisioning scripts will be
> updated in a separate commit.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/custom-runners.yml               |  4 +--
>   ...4-aarch32.yml => ubuntu-22.04-aarch32.yml} |  6 ++--
>   ...4-aarch64.yml => ubuntu-22.04-aarch64.yml} | 36 +++++++++----------
>   3 files changed, 22 insertions(+), 24 deletions(-)
>   rename .gitlab-ci.d/custom-runners/{ubuntu-20.04-aarch32.yml => ubuntu-22.04-aarch32.yml} (86%)
>   rename .gitlab-ci.d/custom-runners/{ubuntu-20.04-aarch64.yml => ubuntu-22.04-aarch64.yml} (81%)

Reviewed-by: Thomas Huth <thuth@redhat.com>


