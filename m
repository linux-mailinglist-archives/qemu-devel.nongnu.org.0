Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5463633D0
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 07:22:15 +0200 (CEST)
Received: from localhost ([::1]:35202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXzsr-00068i-VO
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 01:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXzlr-0004Xg-5N
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 01:15:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXzlh-0003A1-VY
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 01:14:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618722884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lZftzCuFpck+79pBzXNAmr8dmb+q+nkvctb2VRwN+Kw=;
 b=RxpdybSrC7uN/3hPJzS8pQ3Q1llTeP667FlSINTvIiKG8d0DRDN+RX7NeXVUddM3xZ+Obk
 UdGR0V0J9Ebb0Fiv3yUjhKQs3JLh53r4IP5qRYUPmfBmZMpgWDBG/iLBkgZi6pyM5Rj0GP
 Ez/nZDFFSMca10agFYtKGHqxF0oHah0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-w56HPo4HOFiHf4qAEwLEVw-1; Sun, 18 Apr 2021 01:14:39 -0400
X-MC-Unique: w56HPo4HOFiHf4qAEwLEVw-1
Received: by mail-wr1-f69.google.com with SMTP id
 93-20020adf80e60000b0290106fab45006so2455165wrl.20
 for <qemu-devel@nongnu.org>; Sat, 17 Apr 2021 22:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lZftzCuFpck+79pBzXNAmr8dmb+q+nkvctb2VRwN+Kw=;
 b=Orcv5x1GKcoIYip/CB9UiNlfLE+4xYHgSJDMLyBv6ZemK8j2wyzZJ9KIOQBTKRXfn3
 DUrKtRuXymTQb0qRW7kcm1fd3CRa9jgqdScrJHnyi3a2HKnAbecWuxRlj4pOqNu/Jg5b
 br+UmE2dH9M2R8QtPw5ZT2kwOiTytNTwcRsD85Uc0m6a9QEtqieCYkukS9WnAL+45i4A
 IKUeKwyx7ZxmO43Islp9lBonZnvrWE6Rs6VscOTUjJgc41T+nq+S7+AtIqRXeWsluEuN
 Ck9qlKx3Lprolr5jU1SoIzBHVhehIIcPScfvfZWBDFtDkICdFEeMMN8EHhBlDW3MOaVE
 uP5g==
X-Gm-Message-State: AOAM530wfYfxQHcS45k4xlapviCKYCZjkkNzNVVz1H31zWWRudphVmt9
 EUvLb59DS9Ts/dQ1wCHWzE8hzOBwupx1UUYEDP3XNARnjOtvUKKWhGcokjNMpyWwl7ehIjg0iFo
 2Umb5vVBMF/hO+LQ=
X-Received: by 2002:a1c:6184:: with SMTP id
 v126mr15478609wmb.118.1618722878667; 
 Sat, 17 Apr 2021 22:14:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlGOjmjeLAlnRjzXRuKsJ6EasBih9i8K0qgdFZQ4qX7NIdgzLegmjuoV6EH5NlO1rvR3ERzg==
X-Received: by 2002:a1c:6184:: with SMTP id
 v126mr15478584wmb.118.1618722878312; 
 Sat, 17 Apr 2021 22:14:38 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id q126sm5078248wma.6.2021.04.17.22.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Apr 2021 22:14:37 -0700 (PDT)
Subject: Re: [PATCH-for-6.0?] mptsas: remove unused MPTSASState.pending
 (CVE-2021-3392)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210416102243.1293871-1-mjt@msgid.tls.msk.ru>
 <8c313f51-db0d-c9c0-621d-a9af689b7164@redhat.com>
 <f703a175-cddc-269a-dfbd-303b31cf7f27@redhat.com>
Message-ID: <fac3b5e0-fec4-213c-1f4c-2488a179717c@redhat.com>
Date: Sun, 18 Apr 2021 07:14:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f703a175-cddc-269a-dfbd-303b31cf7f27@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-trivial@nongnu.org,
 Don Slutz <Don@CloudSwitch.com>, Li Qiang <liq3ea@gmail.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/21 1:33 PM, Philippe Mathieu-Daudé wrote:
> Cc'ing maintainers.
> 
> On 4/16/21 1:27 PM, Philippe Mathieu-Daudé wrote:
>> On 4/16/21 12:22 PM, Michael Tokarev wrote:
>>> During previous attempt to fix CVE-2021-3392 it was discovered
>>> that MPTSASState.pending is actually not used. So instead of
>>> fixing the prob, just remove the offending code entirely
>>
>> What problem?

Digging a bit I found:
https://bugs.launchpad.net/qemu/+bug/1914236
and Paolo's comment:
https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg02660.html

So your patch now makes sense, but please:

1/ Reword including Prasad description:

"""
While processing SCSI i/o requests in mptsas_process_scsi_io_request(),
the Megaraid emulator appends new MPTSASRequest object 'req' to
the 's->pending' queue. In case of an error, this same object gets
dequeued in mptsas_free_request() only if SCSIRequest object
'req->sreq' is initialised. This may lead to a use-after-free issue.

Since MPTSASState.pending is actually not used, simply remove it.
"""

2/ Add:

BugLink: https://bugs.launchpad.net/qemu/+bug/1914236 (CVE-2021-3392)
Fixes: e351b826112 ("hw: Add support for LSI SAS1068 (mptsas) device")

With it:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>>> Cc: Prasad J Pandit <pjp@fedoraproject.org>
>>> Cc: qemu-stable@nongnu.org
>>> ---
>>>  hw/scsi/mptsas.c | 4 ----
>>>  hw/scsi/mptsas.h | 1 -
>>>  2 files changed, 5 deletions(-)
>>>
>>> diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
>>> index 7416e78706..5abbc742aa 100644
>>> --- a/hw/scsi/mptsas.c
>>> +++ b/hw/scsi/mptsas.c
>>> @@ -257,7 +257,6 @@ static void mptsas_free_request(MPTSASRequest *req)
>>>          req->sreq->hba_private = NULL;
>>>          scsi_req_unref(req->sreq);
>>>          req->sreq = NULL;
>>> -        QTAILQ_REMOVE(&s->pending, req, next);
>>>      }
>>>      qemu_sglist_destroy(&req->qsg);
>>>      g_free(req);
>>> @@ -303,7 +302,6 @@ static int mptsas_process_scsi_io_request(MPTSASState *s,
>>>      }
>>>  
>>>      req = g_new0(MPTSASRequest, 1);
>>> -    QTAILQ_INSERT_TAIL(&s->pending, req, next);
>>>      req->scsi_io = *scsi_io;
>>>      req->dev = s;
>>>  
>>> @@ -1319,8 +1317,6 @@ static void mptsas_scsi_realize(PCIDevice *dev, Error **errp)
>>>  
>>>      s->request_bh = qemu_bh_new(mptsas_fetch_requests, s);
>>>  
>>> -    QTAILQ_INIT(&s->pending);
>>> -
>>>      scsi_bus_new(&s->bus, sizeof(s->bus), &dev->qdev, &mptsas_scsi_info, NULL);
>>>  }
>>>  
>>> diff --git a/hw/scsi/mptsas.h b/hw/scsi/mptsas.h
>>> index b85ac1a5fc..c046497db7 100644
>>> --- a/hw/scsi/mptsas.h
>>> +++ b/hw/scsi/mptsas.h
>>> @@ -79,7 +79,6 @@ struct MPTSASState {
>>>      uint16_t reply_frame_size;
>>>  
>>>      SCSIBus bus;
>>> -    QTAILQ_HEAD(, MPTSASRequest) pending;
>>>  };
>>>  
>>>  void mptsas_fix_scsi_io_endianness(MPIMsgSCSIIORequest *req);
>>>
>>
> 


