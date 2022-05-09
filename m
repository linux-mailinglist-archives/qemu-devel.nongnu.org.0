Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB47C51FE4B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:28:52 +0200 (CEST)
Received: from localhost ([::1]:52304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3RT-0003R1-NS
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2vp-0000xX-2a
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:56:09 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:46832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2vn-0003YR-LV
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:56:08 -0400
Received: by mail-pg1-x531.google.com with SMTP id l11so6394757pgt.13
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 05:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=09M/13u+9tBbpLwSLnnkHrawWZkt6ANnfMLECuCpSxQ=;
 b=j8wUlTBkDGar/dHBnfkctJlWrM4UpiE2yQiEGv6l1EIzgMQRs46+d3P8UE4E3fvf5o
 Z9Gf2dw05gW/J7eEObs+CULteDq0ZPzZfRC8f6fP8rXKceFAnI9GdD9apOHdNimZxWLW
 QUR4Aa6Ht86uATP4EsLvOYy4XnbnlQzRQvLRDZtBDlcgHmUMVU5rvq221aTAIdBZkAR7
 7SLRr8mpNoYXWTw/itpLkm7RBGe39ZgYaEleVCNWMZFLOtMyG8W/cPMksGTTq2PEEFgk
 vlAwLVhQiBUvZKMIy0KOQ4vXufhaH5V2rf9mny2l7fpRn2c2pmwRjHWyE7kyHNg6lXPz
 tKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=09M/13u+9tBbpLwSLnnkHrawWZkt6ANnfMLECuCpSxQ=;
 b=GqsJzcY5bcP/TXX3ZyGque6tCtTbEt7FqxkcRlqWygLnHThcojlrgqGOuI/eg5aBjY
 RuyCjbiBsNy/gop2aNqGDHTCXnFb8EvdIRNRlX8JgkanwBeXey2bkyEuytVk43ZIZ0OJ
 szlp8nxfZ9QKc8IMeYigdAwHeKNjfDIuNmv0OXI0L7A1MKw6aDphvkJyqL4y5cYxbSU+
 0M3uzsEqfTSrROT9E+XWRCPzYwCc8yHQHHE3o+xx48YO5cBuFDncZjogjIoCMufXo7Dq
 yJi+g69NvRzDPByMzPiREjdBOs+P/EkelL7BsddDU71jRbLsztl4sdLFynNCYYvEdGLD
 kWug==
X-Gm-Message-State: AOAM532EnzG8UHFci1AYdD21FVj+xp29hePgaoTckppU9pCfudKkYql0
 H0XBJyobPkBemh2CbdJxDSw=
X-Google-Smtp-Source: ABdhPJyHUvjKMOjfwEMoBgdUvjKKf4hUimtZgOxDOMk3kFBEndh+OxA5EIUtMf2gTP4JMD+7rAlP+w==
X-Received: by 2002:a63:5b01:0:b0:3c6:4935:589 with SMTP id
 p1-20020a635b01000000b003c649350589mr12168173pgb.314.1652100966464; 
 Mon, 09 May 2022 05:56:06 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x4-20020aa79404000000b0050dc7628167sm8599642pfo.65.2022.05.09.05.56.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 05:56:06 -0700 (PDT)
Message-ID: <2ebc2416-abc1-bb33-d7e0-0cccd3cabffe@amsat.org>
Date: Mon, 9 May 2022 14:18:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] vhost-user-scsi: avoid unlink(NULL) with fd passing
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220427100116.30453-1-stefanha@redhat.com>
In-Reply-To: <20220427100116.30453-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x531.google.com
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

On 27/4/22 12:01, Stefan Hajnoczi wrote:
> Commit 747421e949fc1eb3ba66b5fcccdb7ba051918241 ("Implements Backend
> Program conventions for vhost-user-scsi") introduced fd-passing support
> as part of implementing the vhost-user backend program conventions.
> 
> When fd passing is used the UNIX domain socket path is NULL and we must
> not call unlink(2).
> 
> Fixes: Coverity CID 1488353
> Fixes: 747421e949fc1eb3ba66b5fcccdb7ba051918241 ("Implements Backend Program conventions for vhost-user-scsi")
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   contrib/vhost-user-scsi/vhost-user-scsi.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


