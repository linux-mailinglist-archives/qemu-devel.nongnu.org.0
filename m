Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E05429E43D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 08:37:01 +0100 (CET)
Received: from localhost ([::1]:44428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kY2UW-0007LK-6o
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 03:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kY2Sx-0006jV-0P
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 03:35:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kY2Su-0004q8-Ag
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 03:35:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603956918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tFs9FEtvsHSEIfzlc9M/2+MUn2adbOnlGKWQhb4+1w0=;
 b=GkVCGEDjABw3SMwDpRCBjrX8Ix9ALdkX63ZlEkAWsDt+2OHKeMD/tgOIpfxU9xvNk+559n
 7Mx4nM6ifjeqm+Bg8tYBR+UZUymFUAzkM7OkDKILST4BNpnW1BTZts+3TzqxPNuBSjE5eR
 QMJAFee08sJUL7nRDq2rOlyzYsWuVmk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-1tiLHqt9OlKat2l_EkZSTw-1; Thu, 29 Oct 2020 03:35:16 -0400
X-MC-Unique: 1tiLHqt9OlKat2l_EkZSTw-1
Received: by mail-ej1-f69.google.com with SMTP id z25so845942ejd.2
 for <qemu-devel@nongnu.org>; Thu, 29 Oct 2020 00:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5jLYXPsokD6LbY/LvEeZK8i5pfQzWV1vqLA4ue/flSo=;
 b=jVZLcV9177fdwvVT9s49gJrLNS3JbYu2d7UgFujj/Pz4zKontmARQQnS/M4z+QsNZ6
 Afpylfu6nDHgBvuA3GBUAu1BUu6hWMvTN47N+2U1v/xYyXhkn6LJoO7mdMRepco0XfxT
 CQ6e2pJGrDLFnwvtM3bFNdy7UhIGBknBrXv2mh8jqxbRn1GNHTO6E4yWGGUtIn4MwbZv
 tc+91ielqULf1NTLh6cZovcuqQC8O8v8WgnLYMt9Hmgkt2Iqm3VLg4ZpaCvBLUk8vAoC
 FNEKIULkQhfppuuQfJZoH//8Rj0i8KXSEUGwcx9yXjYcfh3HjUkCdIbuG9GYsZAdyuXJ
 zqBQ==
X-Gm-Message-State: AOAM53020ot6tZ5d7B7rHsH/jEW7sPn8cIo2aHIUj3Lg3ni1MgaA4eL6
 2QMNsiopc0Y0vECstlCYdBNb+D62QPd7qHZbi/kQertJfv0rdwGa4rX4jn248d12rRpOL+sC70/
 0Nf8Bii+GkHlwaiw=
X-Received: by 2002:a05:6402:1201:: with SMTP id
 c1mr2705969edw.210.1603956915635; 
 Thu, 29 Oct 2020 00:35:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyg52J34OcOQQZRVwtPHjkP5NL5JjvpeNAJV1lgIV7CwxJ0+bLTmfKz+M2NiSgihAE9TLzstw==
X-Received: by 2002:a05:6402:1201:: with SMTP id
 c1mr2705956edw.210.1603956915474; 
 Thu, 29 Oct 2020 00:35:15 -0700 (PDT)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id q9sm947771ejr.115.2020.10.29.00.35.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 00:35:14 -0700 (PDT)
Subject: Re: [PATCH 17/25] block/nvme: Simplify nvme_cmd_sync()
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20201027135547.374946-1-philmd@redhat.com>
 <20201027135547.374946-18-philmd@redhat.com>
 <20201028152141.GL231368@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a916929a-4b07-b5fb-8fa4-9235b17c369b@redhat.com>
Date: Thu, 29 Oct 2020 08:35:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201028152141.GL231368@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 00:47:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.921, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/20 4:21 PM, Stefan Hajnoczi wrote:
> On Tue, Oct 27, 2020 at 02:55:39PM +0100, Philippe Mathieu-Daudé wrote:
>> As all commands use the ADMIN queue, it is pointless to pass
>> it as argument each time. Remove the argument.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  block/nvme.c | 15 ++++++++-------
>>  1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/block/nvme.c b/block/nvme.c
>> index 2d3648694b0..68f0c3f7959 100644
>> --- a/block/nvme.c
>> +++ b/block/nvme.c
>> @@ -487,9 +487,10 @@ static void nvme_cmd_sync_cb(void *opaque, int ret)
>>      aio_wait_kick();
>>  }
>>  
>> -static int nvme_cmd_sync(BlockDriverState *bs, NVMeQueuePair *q,
>> -                         NvmeCmd *cmd)
>> +static int nvme_cmd_sync(BlockDriverState *bs, NvmeCmd *cmd)
> 
> Please rename the function to nvme_admin_cmd_sync() so it's behavior is
> clear.

Good idea :)


