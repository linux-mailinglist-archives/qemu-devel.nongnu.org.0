Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991106074EC
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:19:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olp7w-0004y3-QJ
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:19:44 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olp7Q-0001qY-As
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olp76-0000KM-Cu
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:18:57 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olp74-0003qj-T8
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:18:52 -0400
Received: by mail-wr1-x432.google.com with SMTP id u10so4150255wrq.2
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 03:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gSvLyqT2me3HwSX6zm/t5Hpc98ZaHpehQTZBKXuZF2o=;
 b=PZWl2AiJok3eJRD/+48hjCoQcX8/5ZIhFwo9HyNB94SJ3qoTnTU7D94wGDxEomBxAB
 CIVlCjw3ftJm7h/3+aQzjFjaOGwphovUFlccAvvjHlDXcZhfg8rn14C8brEVfbvIOLST
 PG74pnUZhk/Mrv+cZjt+6lXXncFe/CZnwmoMusJLFZID2ih23+3zpJj2lg7ivQB6nSuP
 WukR7G7o7x5o/BMyrR06XfSuSfgGp15g+hFZlmSACSOIv4PNYk54i3C8YUu9nZM0j6Mf
 H2KG4Br8hZatH7gFjPEbszjid8RIH6RPzEwRJjAsWGzNVFZ5/YOlxKRBS+67kCcDFmlU
 4p8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gSvLyqT2me3HwSX6zm/t5Hpc98ZaHpehQTZBKXuZF2o=;
 b=s3R5h7dg62dGKCixhyFlIU8J1Vti2WsEP06Jw6au+27lF913Vvt64iAYBLwkMw4Ksl
 96dEt/3BYPhF6fk4r6JkmQEAhxHR0eWGQSokhfesSdJBigqcwLmzHT/wHbBDy8fOBwQQ
 s4aqiNT3md/9NzmreNCTS6bTqxM89H4/jL+VyRm42FqUWTepy5hT8orVy444WcGI6X2W
 ulSmvRY/leVU1wFf9etNRGpx9yvCmquh2mwFDk/VKNnXsix8EGYJZO/7ugt4wL58+xtr
 3UmaTQXj+VaKe0aDOceYkwdn3yTclm7vPz3XvZhNsC7Hs81YmGC9CeIYMMC/DMaZ0aH4
 XM+g==
X-Gm-Message-State: ACrzQf0myaA7PChri4Zci7H3xQtLd8L/iXkCXP5PzNdtf2CQ9PjM3WZJ
 yTq6eEl8/8MeOjdFrt1uSNDoxA==
X-Google-Smtp-Source: AMsMyM4J2oFrG2ayVaLyVj/gKPYm/vOmdGpMXDgE2bXapnVZsvvxjFKhOy/05+vEq1gluYAIazV3rg==
X-Received: by 2002:a5d:65d0:0:b0:236:580e:c3f9 with SMTP id
 e16-20020a5d65d0000000b00236580ec3f9mr384228wrw.101.1666347529225; 
 Fri, 21 Oct 2022 03:18:49 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a5d5009000000b0022e3d7c9887sm18427284wrt.101.2022.10.21.03.18.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 03:18:48 -0700 (PDT)
Message-ID: <e6470da4-41a9-b625-1298-3d92532aa61d@linaro.org>
Date: Fri, 21 Oct 2022 12:18:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v14 13/17] qemu-sockets: move and rename
 SocketAddress_to_str()
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, xen-devel@lists.xenproject.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
 <20221021090922.170074-14-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021090922.170074-14-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/10/22 11:09, Laurent Vivier wrote:
> Rename SocketAddress_to_str() to socket_uri() and move it to
> util/qemu-sockets.c close to socket_parse().
> 
> socket_uri() generates a string from a SocketAddress while
> socket_parse() generates a SocketAddress from a string.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   include/qemu/sockets.h |  2 +-
>   monitor/hmp-cmds.c     | 23 +----------------------
>   util/qemu-sockets.c    | 20 ++++++++++++++++++++
>   3 files changed, 22 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


