Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B283E39E022
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 17:20:03 +0200 (CEST)
Received: from localhost ([::1]:54034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqH2o-0003KV-Er
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 11:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lqGzu-0006yR-GQ
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:17:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lqGzp-0003BC-NC
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623079015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9EgKYFRnOa10Iszzd4UnozFDR1K7njxUG06DFyTVaFM=;
 b=NisSzTVaoaThAfJAqaxgKTFORaBhzVbdS8t8prAo7Kv/hVn7T8eXiUVD1EF3GLAwyaqP8T
 LK1bRkbpoiXzG8bspgsqah9eSVMeNYPkhq/WkNTWPDjdFhPbztruUYVEXl8mflPE9ZXmAs
 UD7/niD3msVGQM9FqstdvYG0i8Iy2Z8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-_nZ_In3WN_KqTf3QjooXqg-1; Mon, 07 Jun 2021 11:16:54 -0400
X-MC-Unique: _nZ_In3WN_KqTf3QjooXqg-1
Received: by mail-wm1-f72.google.com with SMTP id
 128-20020a1c04860000b0290196f3c0a927so6925495wme.3
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 08:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9EgKYFRnOa10Iszzd4UnozFDR1K7njxUG06DFyTVaFM=;
 b=d0B7J9lWfwkNVka+sJHC51C2U2dPWNIj+iuLItqFoiZKC61l5FJlk7CxGYgI6P/jHh
 ADwQqXa56EQjT18blVByd752bosPkdYMNZm8Kfv/pL69RhuLD7QdTkg5vb/QSa/er9QR
 wDpT7IL5a7yrXgGLFym3wnmwbBjW/eCn4f8+Fxua+aIEbPPV60QfbDUVNAHHrCUp26gs
 eR2m93eA24fyCFO+a63OeXbmnUpkchvAlzGLuO0zUea+4frN8bfjpAwBRG+kN1r+t+vN
 xDd5AUFOiGFisZZjRT/M2UMhUcEpFxDF6FQYIO/WL3xQ/pGZa4jURxsq0Ti+N6jFgti/
 WkRQ==
X-Gm-Message-State: AOAM5321dWOa0bA0ZTyUfdgpUzBbRjFDiJDYTpPcHpZjsUmq0R4sPHVR
 seBuzaup681I50Icxb5aZhUvrkOSs25iTpSdnwa2DjOyuFG49hNZGD5fgY/CTC5ilkn6+Ct3a+E
 JppMGAvYY212+ges=
X-Received: by 2002:a5d:6a41:: with SMTP id t1mr10732889wrw.113.1623079013112; 
 Mon, 07 Jun 2021 08:16:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaYZplo83Guhm91cvarxdN2TdP3OoDxkZL60rdrSzW8isUITY/kpfxUtOIoffhz/TOVRHEdg==
X-Received: by 2002:a5d:6a41:: with SMTP id t1mr10732873wrw.113.1623079012967; 
 Mon, 07 Jun 2021 08:16:52 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 l2sm16034348wrp.21.2021.06.07.08.16.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 08:16:52 -0700 (PDT)
Subject: Re: [PATCH 0/2] block-copy: small fix and refactor
To: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210528141628.44287-1-vsementsov@virtuozzo.com>
 <YLdLrrTszu8MMxPv@stefanha-x1.localdomain> <YLd33jBVl5k3RAZK@redhat.com>
 <151b2470-9c6c-cda9-a77b-64cdb10a7550@redhat.com>
 <YL42y/CZIFJ6ICLB@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <c8a57c4b-544c-a5a6-728e-390a924d34ba@redhat.com>
Date: Mon, 7 Jun 2021 17:16:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YL42y/CZIFJ6ICLB@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 07/06/2021 17:10, Kevin Wolf wrote:
> Am 03.06.2021 um 09:38 hat Paolo Bonzini geschrieben:
>> On 02/06/21 14:21, Kevin Wolf wrote:
>>> Am 02.06.2021 um 11:13 hat Stefan Hajnoczi geschrieben:
>>>> On Fri, May 28, 2021 at 05:16:26PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>>> Hi all!
>>>>>
>>>>> This is my suggestion how to refactor block-copy to avoid extra atomic
>>>>> operations in
>>>>> "[PATCH v2 0/7] block-copy: protect block-copy internal structures"
>>>>>
>>>>> Vladimir Sementsov-Ogievskiy (2):
>>>>>     block-copy: fix block_copy_task_entry() progress update
>>>>>     block-copy: refactor copy_range handling
>>>>>
>>>>>    block/block-copy.c | 79 +++++++++++++++++++++++++++++++---------------
>>>>>    1 file changed, 53 insertions(+), 26 deletions(-)
>>>>
>>>> I posted suggestions for the doc comment on Patch 2, otherwise:
>>>>
>>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>>
>>> Thanks, fixed up the comment accordingly and applied to the block
>>> branch.
>>
>> I'm a bit confused.  Vladimir said in his review of Emanuele's patches
>> that he was okay with patch 7 and that he would rebase this
>> refactoring on top of it.
>>
>> Vladimir's main complaint for the s->method state machine was the
>> extra lines of code.  Here we have just as many new lines of code and
>> new parameters that are passed by reference.  Kevin, can you please
>> look at Emanuele's patches and possibly unqueue the second patch here?
>> It seems to me that it should have been tagged as RFC.
> 
> Sorry, I was not aware that Vladimir intended to rebase this one. This
> has already landed in master, so if rebasing the other patch is a real
> problem, we'd have to revert this one first.
>
It shouldn't be a problem, I have already rebased on top of it. I will 
re-spin a new series with this and other minor (and hopefully final) 
fixes soon.

Emanuele


