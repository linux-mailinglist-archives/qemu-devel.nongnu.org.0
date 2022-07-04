Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5791556558B
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 14:36:50 +0200 (CEST)
Received: from localhost ([::1]:49114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8LJo-0000Qf-Kk
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 08:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8LBK-0001Ev-I9
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:28:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8LBH-0001I2-GG
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656937678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Zzn9+hcpXQQ2jqDoTt9WhRH6tN/cIQf2nYCX0Cxf3s=;
 b=QFhjJ0mHUIrO8O1Zw60ROy/r5Kfjch2P1KAE9O1rj9Zi6ncVPfbc88kyA2L4vUGOvZGRcJ
 P3J5Xut036BqGFI/kjBswF3WIHMMxb9NmbuIER5Und5LLbM/23d/R57WWOibcEEhMEphXf
 Sz7vbQLZk/cxsr6mgAjAH7dp9h9AqPo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-WNe9fnG4NZihQnbBB3OgPw-1; Mon, 04 Jul 2022 08:27:56 -0400
X-MC-Unique: WNe9fnG4NZihQnbBB3OgPw-1
Received: by mail-ed1-f71.google.com with SMTP id
 v16-20020a056402349000b00435a1c942a9so7164951edc.15
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5Zzn9+hcpXQQ2jqDoTt9WhRH6tN/cIQf2nYCX0Cxf3s=;
 b=zRNAKywIgbQG+B6gwOCy1tXlyRlC1fikAwYnqu1DsxDbSClUVgHqTbwYj9PrGBUJ+x
 eUUDZTIKi1jpIhk1dzyjSXym2GesGTWvLqGUPiKkoQMpMTWGI5iotmUW1uNMhOOhxp4D
 hIkYjosBFwV7JEoqt8U8pL1bUzDV4ao9QDy1yh49/3vYTGx2pxxlglpZ64k2+h/eG2t6
 X35J6tSEPA4Aq2zpy1tli1DL5mroEZ7GoUUS5aa5lw8REnGDhCTa3WA0wQmyxbM3sdy2
 qhlw0KcrLFE3LnRCEvr0Qh6+MJ8NrDoqP/HFuKpk6f+m5IVGCZVmTO0m7gOnzegn1l4y
 AVvg==
X-Gm-Message-State: AJIora9SixY3m+qQR5la+v9MH41A53gxeO9956tCO8/s/hqa4i04v55k
 XxDN5WBoXqs33E7GC2VM4MmxyoSLPO23/BsccByOwGC8g6dPAWG+83PQQPCe32jwmVcqBzslpkx
 GZxhfTifgJxOUFAU=
X-Received: by 2002:a05:6402:5249:b0:435:a419:300a with SMTP id
 t9-20020a056402524900b00435a419300amr38293966edd.56.1656937675872; 
 Mon, 04 Jul 2022 05:27:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sfrW+KQzvY9ACUseBcpDL9NGvNa4ZPme7mx4PjE5UMXaxAl4iU4lqTXbqi+OsZnH+b7wGpSA==
X-Received: by 2002:a05:6402:5249:b0:435:a419:300a with SMTP id
 t9-20020a056402524900b00435a419300amr38293932edd.56.1656937675711; 
 Mon, 04 Jul 2022 05:27:55 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a170906c20f00b006feb875503fsm14274384ejz.78.2022.07.04.05.27.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 05:27:55 -0700 (PDT)
Message-ID: <f31072b0-aa5c-c3ce-072c-fb29dcbd3fed@redhat.com>
Date: Mon, 4 Jul 2022 14:27:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 00/10] Implement
 bdrv_{pread,pwrite,pwrite_sync,pwrite_zeroes}() using generated_co_wrapper
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ari Sundholm <ari@tuxera.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Fam Zheng <fam@euphon.net>, Jeff Cody <codyprime@gmail.com>,
 qemu-block@nongnu.org, Vladimir Sementsov-Ogievskiy
 <v.sementsov-og@mail.ru>, Stefan Weil <sw@weilnetz.de>
References: <20220609152744.3891847-1-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220609152744.3891847-1-afaria@redhat.com>
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
> Start by making the interfaces of analogous non-coroutine and coroutine
> functions consistent with each other, then implement the non-coroutine
> ones using generated_co_wrapper.
>
> For the bdrv_pwrite_sync() case, also add the missing
> bdrv_co_pwrite_sync() function.

Thanks, applied to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block

Hanna


