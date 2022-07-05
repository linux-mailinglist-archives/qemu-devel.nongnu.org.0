Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DCA5665AD
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:58:12 +0200 (CEST)
Received: from localhost ([::1]:54966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8eNn-0001dW-Ct
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8eMV-0000eu-66
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:56:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8eMT-0007mz-KV
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:56:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657011409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j57BRTmrGhONHidbYVSgNOWSBtYHpYmyAIBsdn87KXA=;
 b=iVIefeaM3zULqDst/7lNruHU7PABrCZdd+CjVllF37sOrfDzHgGd6hZ7KEMui2yzSMiM8m
 O3hjTXym6sx2uF7SYlCL7WRN33k0nRyIfXw0p1OtyoOEAhpEPtW5Ds4NQMUL428AMt7v7F
 3inWMTw7C3bISLTLLxhLJWoj3jeZ2HI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-GAt_Hqr9P3SvhJB_m8YC-Q-1; Tue, 05 Jul 2022 04:56:46 -0400
X-MC-Unique: GAt_Hqr9P3SvhJB_m8YC-Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 v16-20020a056402349000b00435a1c942a9so8915782edc.15
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 01:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j57BRTmrGhONHidbYVSgNOWSBtYHpYmyAIBsdn87KXA=;
 b=Jx0zmp6qZUs3PSkv6ZQYz36h25ytD8O+1YwmpDhNjB4E1xVjouHKxf1utrNLO3YnvS
 0hHL3I8zLJt/7SdFhybVSy67h6T+wwXdseCQa+EcuWVrIoX1EmSB1JnF/HSiZST/ik+X
 3Luok9pJVyV46vnPKttXC/EKeA6JOdxUYLrEEt6n48sMbSHoPfG+KgXqF9hf4bawXndC
 ClmBbr8HBP90iyJ7m3QhqFhah2hTGD+2M7wAL1fobp2/AK8fqJ+agdqtZICNvoaRywY0
 QKKNusEOzldvx//wbCwGMtyOeb84EAxsL79soKRakn2kO/qm9cfdIcMXxpwiHyobluwC
 3ChA==
X-Gm-Message-State: AJIora/zR4aBr7nkBuLvyzIQ2pWgHCzAk58UWYaHZ5/TVO/G46WFZheV
 qBLNsFY2WA9ndMGbfxtIZvJjNXlo1YBKoYvj/MSDSrmHDbofXf4q9hnltw+64p9fYjRe8zoDv9p
 laUB9NH3+N5UA/dE=
X-Received: by 2002:a17:906:5a6c:b0:72a:854b:bf62 with SMTP id
 my44-20020a1709065a6c00b0072a854bbf62mr22264937ejc.600.1657011405735; 
 Tue, 05 Jul 2022 01:56:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uVU58uhWbztLlcbLs4k6j2qyQhciEydNoYv3B+ye7ngT7mI7XOWsrTdmidu9K8yHfraUdAtg==
X-Received: by 2002:a17:906:5a6c:b0:72a:854b:bf62 with SMTP id
 my44-20020a1709065a6c00b0072a854bbf62mr22264918ejc.600.1657011405516; 
 Tue, 05 Jul 2022 01:56:45 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 dt16-20020a170906b79000b00704fa2748ffsm15593460ejb.99.2022.07.05.01.56.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 01:56:45 -0700 (PDT)
Message-ID: <3bed80cb-60d4-4fa1-2f9e-ed76cbeb8b0d@redhat.com>
Date: Tue, 5 Jul 2022 10:56:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 14/18] block: Implement blk_flush() using
 generated_co_wrapper
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113907.200001-3-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220517113907.200001-3-afaria@redhat.com>
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

On 17.05.22 13:39, Alberto Faria wrote:
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/block-backend.c             | 11 -----------
>   block/coroutines.h                |  2 --
>   include/sysemu/block-backend-io.h |  2 +-
>   3 files changed, 1 insertion(+), 14 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


