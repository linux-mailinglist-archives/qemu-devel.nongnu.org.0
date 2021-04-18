Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC1A3633D2
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 07:23:23 +0200 (CEST)
Received: from localhost ([::1]:36350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXzty-0006b3-TM
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 01:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXzn9-000501-5c
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 01:16:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXzn5-00041M-KD
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 01:16:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618722975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RBNspBYgWx/iXA3FFi7GF1OO0TrZ4MRAmcgZLV8LXRM=;
 b=JD4tSMSfnssVrjFm6Vn0lutHkimTyndp0+1h7oz48nysKZoijzUsUmO9/ywxin6rFf+Dao
 Wxw14bsNF7vpeLoI8fRyIJ159lkElfRMJ2w9RAAxX+Sh6IHPX6gp6JffqBzkjXD6VWYsXr
 1jJMRfKZUx+N4THjJK5hDoemenzNLrQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-q1vdh8bXNnKFWGZuZq0yRw-1; Sun, 18 Apr 2021 01:16:12 -0400
X-MC-Unique: q1vdh8bXNnKFWGZuZq0yRw-1
Received: by mail-wr1-f69.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso3561722wrf.11
 for <qemu-devel@nongnu.org>; Sat, 17 Apr 2021 22:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RBNspBYgWx/iXA3FFi7GF1OO0TrZ4MRAmcgZLV8LXRM=;
 b=gBMGUY81taZCedQBpTnFRHZRp+IzG5v3z9FUcfLAbVaxFHaVKmvLOCQOCITiysKWQQ
 +/Wsk6pJwCUfyXtnkfUz3DhjI0ssOFEaNIxuFeS1/9M28697iprnsGModGHVTlid+IG3
 7ri1epWhr55VYXxLRe+jBbOWRpAtyPANI9778R9I9Db3HSo9OSTxMzOWD+78J/qucz+t
 gld3+sWc0Hwk1JEdrOSWvT9JyUEASgF/DT6Qh1I0B2X1GzeNzPl45LQwVoAgTQg5I7KK
 oOSdc6HJGff3ajf1/43+SlfU7eaKEx6S00JhMlcCccPd4WUIy1o/I8daO2O0+qWKbXv/
 y4Tw==
X-Gm-Message-State: AOAM532hZ/HLmpX2cJNd1mZeXwkUMlCTX4Tv+WxYB0lajpYQG8uwoRJa
 d/tfxCyxS2w+gNIDY70SS9ktsc/SbEmjSFrbEFe69+bouwrm5ScIKFQbgNpjn1XdV995nvthULt
 2GhxqrTLlpJVu8Gs=
X-Received: by 2002:a5d:64af:: with SMTP id m15mr7433178wrp.298.1618722971517; 
 Sat, 17 Apr 2021 22:16:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGXmjwVeGYaHIx6h3fXDW945qW5JUIPxfjiYz25FYDNX1ZIIxl+ro3044UXBdFOYwFRPjZmw==
X-Received: by 2002:a5d:64af:: with SMTP id m15mr7433165wrp.298.1618722971300; 
 Sat, 17 Apr 2021 22:16:11 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u9sm15373694wmc.38.2021.04.17.22.16.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Apr 2021 22:16:10 -0700 (PDT)
Subject: Re: [PATCH-for-6.0?] mptsas: remove unused MPTSASState.pending
 (CVE-2021-3392)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210416102243.1293871-1-mjt@msgid.tls.msk.ru>
 <8c313f51-db0d-c9c0-621d-a9af689b7164@redhat.com>
 <f703a175-cddc-269a-dfbd-303b31cf7f27@redhat.com>
 <fac3b5e0-fec4-213c-1f4c-2488a179717c@redhat.com>
Message-ID: <ecd26542-c466-9bb8-2a32-b824fe9024d4@redhat.com>
Date: Sun, 18 Apr 2021 07:16:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <fac3b5e0-fec4-213c-1f4c-2488a179717c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-stable@nongnu.org, Cheolwoo Myung <cwmyung@snu.ac.kr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 7:14 AM, Philippe Mathieu-Daudé wrote:
> On 4/16/21 1:33 PM, Philippe Mathieu-Daudé wrote:
>> Cc'ing maintainers.
>>
>> On 4/16/21 1:27 PM, Philippe Mathieu-Daudé wrote:
>>> On 4/16/21 12:22 PM, Michael Tokarev wrote:
>>>> During previous attempt to fix CVE-2021-3392 it was discovered
>>>> that MPTSASState.pending is actually not used. So instead of
>>>> fixing the prob, just remove the offending code entirely
>>>
>>> What problem?
> 
> Digging a bit I found:
> https://bugs.launchpad.net/qemu/+bug/1914236
> and Paolo's comment:
> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg02660.html
> 
> So your patch now makes sense, but please:
> 
> 1/ Reword including Prasad description:
> 
> """
> While processing SCSI i/o requests in mptsas_process_scsi_io_request(),
> the Megaraid emulator appends new MPTSASRequest object 'req' to
> the 's->pending' queue. In case of an error, this same object gets
> dequeued in mptsas_free_request() only if SCSIRequest object
> 'req->sreq' is initialised. This may lead to a use-after-free issue.
> 
> Since MPTSASState.pending is actually not used, simply remove it.
> """
> 
> 2/ Add:
> 
> BugLink: https://bugs.launchpad.net/qemu/+bug/1914236 (CVE-2021-3392)
> Fixes: e351b826112 ("hw: Add support for LSI SAS1068 (mptsas) device")

And:

Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>

> With it:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
>>>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>>>> Cc: Prasad J Pandit <pjp@fedoraproject.org>
>>>> Cc: qemu-stable@nongnu.org
>>>> ---
>>>>  hw/scsi/mptsas.c | 4 ----
>>>>  hw/scsi/mptsas.h | 1 -
>>>>  2 files changed, 5 deletions(-)


