Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C20356543A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 14:00:06 +0200 (CEST)
Received: from localhost ([::1]:43448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8KkH-000065-8i
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 08:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8KZj-0008DC-Nl
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:49:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8KZi-0002lV-Du
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:49:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656935349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T9ouRJK4T9z4yRr+wGiq0f8E2RxXD0AGd4hLbhLYcHk=;
 b=IIiwl/AO8Zf64KoLFkQ15v6G5L7y4hMME0Sfmjo2+uWYQ2r50ivESo224ircHCZTzVh/k5
 3tuNLM+QZ+sr/r6Wv6Ze4eNsxmslqyc47MhQJ4SKB/m3GRVMpebco8vNXy5nadjD8TFRzy
 jMv0bG0KNhdwpBwkOAiqm7zsrA0EPVY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-VbK1IcRVN8KOpx3epqgwSA-1; Mon, 04 Jul 2022 07:49:08 -0400
X-MC-Unique: VbK1IcRVN8KOpx3epqgwSA-1
Received: by mail-ed1-f69.google.com with SMTP id
 c20-20020a05640227d400b004369cf00c6bso7135301ede.22
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 04:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T9ouRJK4T9z4yRr+wGiq0f8E2RxXD0AGd4hLbhLYcHk=;
 b=aV8MH835oBrQyRwAwlLk9mn3L3GkeYpa6GvAc3L//E+LEi95OArSqavLLQtVUPd7cK
 jJAZf5YLvCFOD7+AwrQ7uX5LWHWt+yzBqsECPh+8HqUcj43SjU8Dw/s+/ECUU2VEhYYr
 fkrEA8mVQiW+O0MVzVEyHAiKLY1EhArYoCeB1BYaWa6BNjGI4acoy5bZ+qP1R+71HWiW
 srls8GJABNB9DHBFY9GilOg6CLMykY7PiuRAIdzy3U3dYlLGSNs5eKSAi6Tcp0Yfsydg
 C9C+UXtVJbLn0Ih+KtxqSGb26TdaJgJrYk9bZePdEzjxxMeiq7AqmWss2I8CcfC0yCOS
 305w==
X-Gm-Message-State: AJIora+L5Rny+48ISynfe948FbLXhkpa8XwG1lSuA28pUxuiXUWGU2xp
 2WGih2wgyE3bdcU0eABuhN3LYWaiQcfNiSegZkbww0oySjK+yaG6H/QMes3zpjxrK7yifWaazNu
 XCiFtRPmdGXkQMh4=
X-Received: by 2002:a05:6402:c44:b0:431:52cc:f933 with SMTP id
 cs4-20020a0564020c4400b0043152ccf933mr37965081edb.41.1656935347405; 
 Mon, 04 Jul 2022 04:49:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tYouTuem8kXuzP+R1wNFWsC1IcJ0e9hVLZhZGcWaXI4ZmSj1qQQm+9JDnbqL5CMH50A4BSZA==
X-Received: by 2002:a05:6402:c44:b0:431:52cc:f933 with SMTP id
 cs4-20020a0564020c4400b0043152ccf933mr37965064edb.41.1656935347276; 
 Mon, 04 Jul 2022 04:49:07 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 se13-20020a170906ce4d00b006fef0c7072esm14042537ejb.144.2022.07.04.04.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 04:49:06 -0700 (PDT)
Message-ID: <d02cdcf8-0c37-f036-7a4e-c4c5366f4fd8@redhat.com>
Date: Mon, 4 Jul 2022 13:49:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 05/10] block: Make bdrv_co_pwrite() take a const buffer
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ari Sundholm <ari@tuxera.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Fam Zheng <fam@euphon.net>, Jeff Cody <codyprime@gmail.com>,
 qemu-block@nongnu.org, Vladimir Sementsov-Ogievskiy
 <v.sementsov-og@mail.ru>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220609152744.3891847-1-afaria@redhat.com>
 <20220609152744.3891847-6-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220609152744.3891847-6-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 09.06.22 17:27, Alberto Faria wrote:
> It does not mutate the buffer.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/block/block_int-io.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


