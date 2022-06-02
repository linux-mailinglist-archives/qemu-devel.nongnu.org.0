Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E1953B786
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 12:52:13 +0200 (CEST)
Received: from localhost ([::1]:60138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwiR1-0002ue-RZ
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 06:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nwiKQ-00015R-KN; Thu, 02 Jun 2022 06:45:28 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:42972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nwiKO-0002Qd-RY; Thu, 02 Jun 2022 06:45:22 -0400
Received: by mail-pf1-x431.google.com with SMTP id 187so4418237pfu.9;
 Thu, 02 Jun 2022 03:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JcLPUm6jVq8XD9zax/MCsqxoCdSVIi+FEnYSPjtjPXs=;
 b=QVrqkFFXSuWVgAaOkU4qsj0u+0SIwQYcz1sozvPDjuwLhDULk2oe+4KrU9MwOwwxQ1
 wntGanyF3exFGayvofjZY8tnxVDStYqnvvFVMZmC8fjflaFxJhagNAaxR60nyQJ+MB2T
 +O4XJI2XIQJei+7M/C18O6OmseM/SA6Iz3N+o/YU2P4Q9K8+fExr9oudstTiuD5wSOZQ
 IKFlq5J7FThLOJL/rwxg36ifYeKpCs4ROze2lMZsvwW+UC5GDRYmbIjAUKND7Q11V/yM
 7I7S58jiBeHSx347ak275fPv1/x0uPqDElIcCQzN7hXGxUOo/yWkl8Kz9vMhMkpaJKU7
 gp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JcLPUm6jVq8XD9zax/MCsqxoCdSVIi+FEnYSPjtjPXs=;
 b=1385/INLaJIfHm2sLCOPtXSyjipDcS9fFXA0i/yr+UPnr6YY31ZYXTAXOx1E0/UlD1
 cUzXHha1NWjEDG8mlD0ZwMHgbxDcwtm/ciXZXm7TUk+cUGVmq+zl65EbQ7pRjN+lHS+L
 wjijfOP7o7yy5Dw179rcARX/Pfrh5CPhLEascWIhSMGCtJI7Y6bNVlp3G44maZPqQUx4
 6bHg5JWgHAIcOFd4fpEbJcLkgP5MfrA+vzyqrWnYylG8aG+wLlvkLAqUqhpzwR4oRm6Y
 dkfweACLmujMNZ/Pi7iubHKD8jPF/ynL/aQQIcGcUrmkI885IiDhEFFxtRlMul6Y5e3p
 qnZA==
X-Gm-Message-State: AOAM533/wf5fTtC5yfuRbGOtdp7M6GAjpoXuWEPlmU4mTz3PwCz0YyU5
 i2MwGqzeNv3wMFeNhiSaLAo=
X-Google-Smtp-Source: ABdhPJwoU7FTW5xjKqwxBcsixTnimafssKmBQQXcafGg9y70SZJwe9liUYBlSpMTVUtMNNzvXUia4w==
X-Received: by 2002:a63:2c01:0:b0:3fa:a256:2e75 with SMTP id
 s1-20020a632c01000000b003faa2562e75mr3695884pgs.545.1654166715533; 
 Thu, 02 Jun 2022 03:45:15 -0700 (PDT)
Received: from [192.168.109.175] (32.red-88-29-183.dynamicip.rima-tde.net.
 [88.29.183.32]) by smtp.gmail.com with ESMTPSA id
 t6-20020a654b86000000b003fba6db1b50sm3053427pgq.85.2022.06.02.03.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 03:45:15 -0700 (PDT)
Message-ID: <b9a77da5-bc32-60a2-8b5d-20e759e7755d@amsat.org>
Date: Thu, 2 Jun 2022 12:45:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH 1/1] block: use 'unsigned' for in_flight field on driver
 state
Content-Language: en-US
To: "Denis V. Lunev" <den@openvz.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>
References: <20220530103957.629398-1-den@openvz.org>
In-Reply-To: <20220530103957.629398-1-den@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x431.google.com
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

On 30/5/22 12:39, Denis V. Lunev wrote:
> This patch makes in_flight field 'unsigned' for BDRVNBDState and
> MirrorBlockJob. This matches the definition of this field on BDS
> and is generically correct - we should never get negative value here.
> 
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> CC: John Snow <jsnow@redhat.com>
> CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Hanna Reitz <hreitz@redhat.com>
> CC: Eric Blake <eblake@redhat.com>
> ---
>   block/mirror.c | 2 +-
>   block/nbd.c    | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

FWIW there is another occurrence in qemu-img.c.

