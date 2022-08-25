Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CA25A1300
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 16:09:28 +0200 (CEST)
Received: from localhost ([::1]:40580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRDXz-0002xf-M5
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 10:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oRDS9-0006kK-4r; Thu, 25 Aug 2022 10:03:25 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:33690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oRDS3-0007vs-Md; Thu, 25 Aug 2022 10:03:24 -0400
Received: by mail-pg1-x52b.google.com with SMTP id g189so3926543pgc.0;
 Thu, 25 Aug 2022 07:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=ampgdjCqAvWsgy0ONMh5K2rN4VlRw5ot8+dNDYAXEQk=;
 b=U+xkDRBmHu0o73HTYykout9virWIpp8mA+faHkGO4NBW5TgTO0Az3glpeKHC+Qi4UB
 y6436CPZ58J15pf14NEjhaS4vqwK8qxWvEKVZ34lnAi5cyrrQkyARsWyGeF1kU4WCKSV
 zxKAQBIfBS8FDoust++aT52YKMXRE+o5/iUggLzXBf/oSugZSmDag3DKp30ETp1B7l0m
 atgPvEnuhej0frlY7JBVHnxoS6axZMeNflD40qgkxc3TsFKz00YDz8e/p65PzzWZhZAK
 dqYBN4hQW2oC3DR7Q+RJe6hRQ8r0XzTiZHAL58FwiyQv8AFw2rOPDF2Z0lfOStJMp+kN
 VeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=ampgdjCqAvWsgy0ONMh5K2rN4VlRw5ot8+dNDYAXEQk=;
 b=HEjVv5sQj3r8GKVCCbLnjmKjGSKhftUpAAFZm2YXcrPx0EHY1zRfuK4rCQ1mnoJcY+
 XMzK7571QalJjHEdOhpWUEli3gKiIpk0zbIyeMwWcFs2JSmSzopeOjL/S7eHFTM9imvo
 6yz88sPmK/9DKPIy3Ptd0qtgXQy/PY/zh3F2mdQrSQeHQEkhdGJVnp3jKNJ/2EgLMY3z
 O36wOnT1gHbQOPke/mJr3306XpKpKzDHAZJKqNYO2pSL4EZmn8RYaLyxlagSoNkyG56x
 pdPdvSVfdojRB1wocgBYrFAdQlUATl6YspNGU5jP/JhdkDHBXBvv3AbLGXJ6H6XHz5Z5
 ETfQ==
X-Gm-Message-State: ACgBeo0KT8650vgcgNWsbCcKM/o5Vxbgy7+kClNv6x4ssTJk5iU+6TEX
 wWRLa301fm+G/VJzg9SZFu0=
X-Google-Smtp-Source: AA6agR6OGRsP4zvrbqLyiG8JHWBibhszMh5zTlyokYgozY0U/Q0h5OKFQSO3sBirA618QHyPVhfyDA==
X-Received: by 2002:a63:c1f:0:b0:41a:9b73:a89e with SMTP id
 b31-20020a630c1f000000b0041a9b73a89emr3389999pgl.342.1661436197755; 
 Thu, 25 Aug 2022 07:03:17 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a63ba47000000b0040caab35e5bsm9923670pgu.89.2022.08.25.07.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 07:03:17 -0700 (PDT)
Message-ID: <8276f599-58f8-8d5d-3334-8d123bb80ff1@amsat.org>
Date: Thu, 25 Aug 2022 16:03:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH] tests/avocado: Fix trivial typo
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Cc: qemu-trivial@nongnu.org, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20220824080926.568935-1-thuth@redhat.com>
In-Reply-To: <20220824080926.568935-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 24/8/22 10:09, Thomas Huth wrote:
> The intention was likely to use "intend" instead of "indent" here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/avocado/avocado_qemu/__init__.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


