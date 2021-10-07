Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24C2425138
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 12:37:01 +0200 (CEST)
Received: from localhost ([::1]:37198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYQlp-00035B-0b
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 06:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYQkc-0001es-7T
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:35:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYQkW-0003GG-Dl
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:35:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633602939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2dDcBZY8iQMnaRhPFd44kZ0g0R6QbaEJSninHe0O2Fk=;
 b=EXgFqlMTaHsoWhlGRWQPhZs8IdbArWZXcNb0kA/VKFp6k1dTuOGDteGAWKC9fW6Zs2S/3v
 gOQwaoFKqCh4Js0s072WVLD1UsFhLyAr3KcumrFSd1LUMVmYhuSiuhG9VGA0vCPuznIK4Y
 c/eSHnhECeEq95slvRq89jjve2RYpzQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-OEOXiLqQMfKjEBuBlXEEgQ-1; Thu, 07 Oct 2021 06:35:31 -0400
X-MC-Unique: OEOXiLqQMfKjEBuBlXEEgQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 u24-20020aa7db98000000b003db57b1688aso94134edt.6
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 03:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2dDcBZY8iQMnaRhPFd44kZ0g0R6QbaEJSninHe0O2Fk=;
 b=d3w3gKP2tyKX1UHyMhxY9ElL6jDEIRf5JjXhBAcNu4tFi4GpP9anZF5OizEQSrNO5k
 KCOlkM8NKCPV7sJ0s0bkYtkpqqpQ7ZGm8Tl1w407WOoBPggWhm7owTYlN9GWiiFtxH2J
 Em7j5HNBmBfBKlbrr29mqaG/oBwMV2S9UaqR9lHvwx0vhc311hAl3sq4p0wIsLmyNAP6
 1v/s50lmHEDbHGmoO8VFxc7Qbw12x73G5ELCOMSVUaLtHVZRlj9t+KVyras4idaOrQP/
 WaxWGc3O44LxPHGhF3jKK01MlF7U9MYGhrdsPE7B4B2P59P8bc6k8vbkJDlwqa7DKEbp
 XA/Q==
X-Gm-Message-State: AOAM532FrfdY/MuqgSdu4zd9E0pudRFDHgR+GhF/l0Mzllrp6iSQoJLK
 YmNhNWZGg7df0tAiOig8FsAxXHWnUWIDNUvlw3b1TQE1fHdPejIAE0zs8NjUN/AHsdPPLxajC4H
 LC9JkYz6F/kvGtDShKn/N9P11IlQn1no7s4k6DnvOoVtpv+nM3Sl87aMGfuAmimleno4=
X-Received: by 2002:a17:906:1806:: with SMTP id
 v6mr4791356eje.420.1633602929401; 
 Thu, 07 Oct 2021 03:35:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxS7SB6SFFbsI832EVGv4oYVmKlJO9g38LYDrInxD5qa4dz3VLMnqlhcQQtMNI4hnu9GbSDHw==
X-Received: by 2002:a17:906:1806:: with SMTP id
 v6mr4791322eje.420.1633602929090; 
 Thu, 07 Oct 2021 03:35:29 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 d3sm9967821ejb.35.2021.10.07.03.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 03:35:28 -0700 (PDT)
Subject: Re: [PATCH 2/2] qemu-iotests: fix image-fleecing pylint errors
To: Kevin Wolf <kwolf@redhat.com>
References: <20211006130100.389521-1-eesposit@redhat.com>
 <20211006130100.389521-3-eesposit@redhat.com> <YV3UCaO5oJU2TeIR@redhat.com>
 <ae47932f-4a0c-cfba-d222-8bf30e9da56b@redhat.com>
 <YV6xk5s96HpCwxUm@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <1021d0f8-6ff4-e326-a428-c3095baf15a5@redhat.com>
Date: Thu, 7 Oct 2021 12:35:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YV6xk5s96HpCwxUm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 07/10/2021 10:36, Kevin Wolf wrote:
> Am 07.10.2021 um 09:53 hat Emanuele Giuseppe Esposito geschrieben:
>>
>>
>> On 06/10/2021 18:51, Kevin Wolf wrote:
>>> Am 06.10.2021 um 15:01 hat Emanuele Giuseppe Esposito geschrieben:
>>>> The problem here is that some variables are formatted with
>>>> unnecessary spaces to make it prettier and easier to read.
>>>>
>>>> However, pylint complains about those additional spaces.
>>>> A solution is to transform them as string with arbitrary spaces,
>>>> and then convert it back into a tuple.
>>>>
>>>> Removing the spaces makes it a little bit ugly, and directly
>>>> using the string forces us to change the test reference output
>>>> accordingly, which will 1) contain ugly weird formatted strings,
>>>> 2) is not portable if somebody changes the formatting in the test
>>>> string.
>>>>
>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>
>>> Changing our logic because of a style checker feels wrong. I'd rather
>>> stick in a line like this before the definitions:
>>>
>>> # pylint: disable=bad-whitespace
>>>
>>> (Not sure if the syntax of this is entirely correct, but from the
>>> comment in your patch and existing uses in iotests, I think this would
>>> be the line.)
>>
>> Ok, I will add the line. Same remarks from the previous patch applies:
>> unfortunately then we disable the warning for the whole file.
>>
>> Since here (like the previous patch) the error spans on multiple lines,
>> adding a # pylint: disable= comment on each line is infeasible and ugly.
> 
> It doesn't fail with my pylint version, so I can't try it out, but does
> the following work?
> 
> # pylint: disable=bad-whitespace
> ... definitions ...
> # pylint: enable=bad-whitespace

You are right, this is valid and looks very good. In this way I can just 
temporarily disable the error for the variables.

> 
> Kevin
> 


