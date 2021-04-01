Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E779D35171E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 19:14:04 +0200 (CEST)
Received: from localhost ([::1]:60636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS0tP-0001Uo-W3
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 13:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lS0q9-0000N0-Df
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 13:10:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lS0pt-0001aw-P2
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 13:10:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617297024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EsDyXxD0acQtxsS0PhStDOGtRXRFuIC+3/o0quFJzq8=;
 b=Q1/P7oQ7xoM2XFzEy9fo5qlmCqLkUCXSCGLj43cM9nt/Fmm98dSfXbRwTdNpB2GoHaE4lU
 HBi3TQVzbpNJE9EeSUQEtAHM5jBKl0y64yIaVN36BGtAaJvtWCbsCq147PX8ijqHatvpEF
 4owzqakqwplkr7dQlPBFZCuMupMfMSs=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-EmIqwgu8O5GziSG35t-Vyw-1; Thu, 01 Apr 2021 13:10:21 -0400
X-MC-Unique: EmIqwgu8O5GziSG35t-Vyw-1
Received: by mail-oo1-f69.google.com with SMTP id h18so3064232oot.8
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 10:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EsDyXxD0acQtxsS0PhStDOGtRXRFuIC+3/o0quFJzq8=;
 b=Qp0o2JTd3idglPryg3KW/JXeFHwTR4Udc1nJYNyjBXsNixLALfVfElKwsv0xNaG5pV
 fDDDx7rTWUAmf1zzyLHbJuhGQk81ad52bdQExKKcndPPLMZHB/R9nKMVlIGKRRcm1HmE
 G/3yPOu6bei1MGGa2QukFZ0dmpGAu8h2fZgWifNpmelZdcEaRjsmG+hXud9yvJj2SrkS
 Q1T7wC4xsWSW0TAny0/a6Zge3cNhLwq+mbImr3W9ZfeF4P6F6Io/4z3DnjvF87wuNjd3
 NeMMwSNnUqGd+dR3tpXWWJgZCxNmetk7njvUYbx0L9bGCvq2Oi3XrSnVhTP1n9f4eUrz
 gYOQ==
X-Gm-Message-State: AOAM532lEJb7JbLbJzbwmnNOqW+U9XBSKBUbPYN9SOqeKmbaF8Tg9KuQ
 YNqH4N9GroOBgGyv7iI6uNdNgGmGvBJK7+ycQ92DzuSEultJ9vjpEtNvCfgrQWVbtgmvAKsO3J4
 8EsBbMdSQU00y+NY=
X-Received: by 2002:aca:fc0d:: with SMTP id a13mr6891923oii.133.1617297019391; 
 Thu, 01 Apr 2021 10:10:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgCsgQKewjW4kECial4abOxcZDHn7DpJfRh/tYpyBH8rQoi3AZPuKln8YqwOjrE8s53asElg==
X-Received: by 2002:aca:fc0d:: with SMTP id a13mr6891834oii.133.1617297017727; 
 Thu, 01 Apr 2021 10:10:17 -0700 (PDT)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 y194sm1206256ooa.19.2021.04.01.10.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 10:10:17 -0700 (PDT)
Subject: Re: [PATCH 1/2] iotests/231: Update expected deprecation message
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210401155211.2093139-1-ckuehl@redhat.com>
 <20210401155211.2093139-2-ckuehl@redhat.com>
 <b4276364-0eee-f244-1146-ee8ac1a01a59@redhat.com>
 <f8741f0d-48b7-76cb-945e-3c5ede14fab4@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <17c170c6-3f50-461a-d92d-f978aea61984@redhat.com>
Date: Thu, 1 Apr 2021 12:10:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <f8741f0d-48b7-76cb-945e-3c5ede14fab4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
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
Cc: kwolf@redhat.com, dillaman@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/21 12:07 PM, Max Reitz wrote:
> On 01.04.21 18:52, Max Reitz wrote:
>> On 01.04.21 17:52, Connor Kuehl wrote:
>>> The deprecation message changed slightly at some point in the past but
>>> the expected output wasn't updated along with it; causing it to fail.
>>> Fix it, so it passes.
>>>
>>> Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
>>> ---
>>>   tests/qemu-iotests/231.out | 4 +---
>>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> Uh, well, you know what, I can’t find any version where there was any 
>> other output.  Even back in 66e6a735e97450ac50fcaf40f78600c688534cae, 
>> where this test was introduced, I get this diff.
>>
>> What’s going on there?
> 
> Okay.  So:
> 
> Jeff’s original patch[1] included the “Future versions may cease to 
> parse...” part.  v1 of his subsequent pull request[2] did, too.  But 
> v2[3] didn’t.  Looks like Markus made a comment on v4 of the patch, and 
> then Jeff fixed up the patch in his branch, but didn’t change the test. 
>   In any case it’s clear that the reference output was wrong all along.
> 
> About the “no monitors specified” part...  The only place where I can 
> find “no monitors” is in Jeff’s patches to add this iotest.  I have no 
> idea where that orignated from.
> 
> So:
> 
> Reviewed-by: Max Reitz <mreitz@redhat.com>

Thanks! And excellent sleuthing. This accidental conspiracy went much 
farther beyond the git log than I thought...

Connor

> 
> 
> [1]
> https://lists.nongnu.org/archive/html/qemu-block/2018-09/msg00282.html
> 
> [2]
> https://lists.nongnu.org/archive/html/qemu-block/2018-09/msg00307.html
> 
> [3]
> https://lists.nongnu.org/archive/html/qemu-block/2018-09/msg00592.html
> 


