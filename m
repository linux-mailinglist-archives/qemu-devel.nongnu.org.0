Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A794361EDC
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 13:36:08 +0200 (CEST)
Received: from localhost ([::1]:50848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXMlb-0004rC-Lo
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 07:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXMjF-0003BM-89
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 07:33:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXMjC-0002HH-Cv
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 07:33:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618572816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VlBoNlxlR962VnoPte3xy+lO1+uBWoXQzEhH8pfVyME=;
 b=gppWrmJYlRFE+kyfPbAOCERNGxvMd8A3iCsIiNuVtuRSI8CUTucwob4/Ws1cNekojA+qvW
 a6gx9aJ7e26g5QhiMUJeYAARmA5xy9kLr1VcGCCWePclLlk6erFnUKL5mcSHvD1vApRZkx
 1jtgT4SgDD4wMg6nvmawD6M5627Q6x8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-2he1C1ZrMnSJraXkNwemVg-1; Fri, 16 Apr 2021 07:33:35 -0400
X-MC-Unique: 2he1C1ZrMnSJraXkNwemVg-1
Received: by mail-wr1-f71.google.com with SMTP id
 s9-20020a5d51090000b02901028ea30da6so4309395wrt.7
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 04:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VlBoNlxlR962VnoPte3xy+lO1+uBWoXQzEhH8pfVyME=;
 b=LiWGrqKU7b0HaTBIZ8iCwrqFXLyNTOxRWDrtzrKVpNeJbWhmSKg/mb5U1gthXn6zTM
 clBT0PIfmSVAfDwckUp+2n0esTougAUOVeOijHuJ6z9LckbmgAI8bbc2mgxzzz/zqQry
 ce4SfuZIthEKloAHzrcNYpXj67zFpozJAAaSue5rA2hKkElny1AVwTsM5i/SmqMQw1Zk
 KdEd8JRqTawd30cqXKdFILNBWhsuPQKw2XqBkfm3f4TVJY4WHpqv3ooe5lj1fkUNbdhY
 M1vEdGkMP1fnlv2x4YB3a/MND7hfyLyWNRh1VQAmh7Gs+uGlcfMIO61nhyI7cR1Ev+T4
 Xz8g==
X-Gm-Message-State: AOAM531ZV0sYwJO0bywfYuoSb/zheWwzEP4oVLUDrXEH5zO6xHdFptPQ
 unUnRs7TWSo9wMoEiSSNNzhPSkM7h9iWGP6XCvxlqdxgYQNZf0kQJ2+sb/3WHGvbOgtrRI4tRoZ
 88x4tvuU3olK36I4=
X-Received: by 2002:a5d:468b:: with SMTP id u11mr8578941wrq.293.1618572814162; 
 Fri, 16 Apr 2021 04:33:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwetqQfVtK8u7sRWSckaMN8DNJ6CmFKnbr5pEqdU+3nY5xKgOHQ40v523WVU6Zt4GOvsxLOXQ==
X-Received: by 2002:a5d:468b:: with SMTP id u11mr8578918wrq.293.1618572813995; 
 Fri, 16 Apr 2021 04:33:33 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c8sm10796122wrd.55.2021.04.16.04.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 04:33:33 -0700 (PDT)
Subject: Re: [PATCH-for-6.0?] mptsas: remove unused MPTSASState.pending
 (CVE-2021-3392)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210416102243.1293871-1-mjt@msgid.tls.msk.ru>
 <8c313f51-db0d-c9c0-621d-a9af689b7164@redhat.com>
Message-ID: <f703a175-cddc-269a-dfbd-303b31cf7f27@redhat.com>
Date: Fri, 16 Apr 2021 13:33:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8c313f51-db0d-c9c0-621d-a9af689b7164@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing maintainers.

On 4/16/21 1:27 PM, Philippe Mathieu-Daudé wrote:
> On 4/16/21 12:22 PM, Michael Tokarev wrote:
>> During previous attempt to fix CVE-2021-3392 it was discovered
>> that MPTSASState.pending is actually not used. So instead of
>> fixing the prob, just remove the offending code entirely
> 
> What problem?
> 
>>
>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>> Cc: Prasad J Pandit <pjp@fedoraproject.org>
>> Cc: qemu-stable@nongnu.org
>> ---
>>  hw/scsi/mptsas.c | 4 ----
>>  hw/scsi/mptsas.h | 1 -
>>  2 files changed, 5 deletions(-)
>>
>> diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
>> index 7416e78706..5abbc742aa 100644
>> --- a/hw/scsi/mptsas.c
>> +++ b/hw/scsi/mptsas.c
>> @@ -257,7 +257,6 @@ static void mptsas_free_request(MPTSASRequest *req)
>>          req->sreq->hba_private = NULL;
>>          scsi_req_unref(req->sreq);
>>          req->sreq = NULL;
>> -        QTAILQ_REMOVE(&s->pending, req, next);
>>      }
>>      qemu_sglist_destroy(&req->qsg);
>>      g_free(req);
>> @@ -303,7 +302,6 @@ static int mptsas_process_scsi_io_request(MPTSASState *s,
>>      }
>>  
>>      req = g_new0(MPTSASRequest, 1);
>> -    QTAILQ_INSERT_TAIL(&s->pending, req, next);
>>      req->scsi_io = *scsi_io;
>>      req->dev = s;
>>  
>> @@ -1319,8 +1317,6 @@ static void mptsas_scsi_realize(PCIDevice *dev, Error **errp)
>>  
>>      s->request_bh = qemu_bh_new(mptsas_fetch_requests, s);
>>  
>> -    QTAILQ_INIT(&s->pending);
>> -
>>      scsi_bus_new(&s->bus, sizeof(s->bus), &dev->qdev, &mptsas_scsi_info, NULL);
>>  }
>>  
>> diff --git a/hw/scsi/mptsas.h b/hw/scsi/mptsas.h
>> index b85ac1a5fc..c046497db7 100644
>> --- a/hw/scsi/mptsas.h
>> +++ b/hw/scsi/mptsas.h
>> @@ -79,7 +79,6 @@ struct MPTSASState {
>>      uint16_t reply_frame_size;
>>  
>>      SCSIBus bus;
>> -    QTAILQ_HEAD(, MPTSASRequest) pending;
>>  };
>>  
>>  void mptsas_fix_scsi_io_endianness(MPIMsgSCSIIORequest *req);
>>
> 


