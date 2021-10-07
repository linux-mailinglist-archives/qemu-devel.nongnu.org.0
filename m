Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9E4424E5B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 09:54:57 +0200 (CEST)
Received: from localhost ([::1]:39588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYOEy-0003Az-2n
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 03:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYODu-0002MD-0J
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 03:53:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYODs-0001k6-Jt
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 03:53:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633593228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+CvSL59/DcBhv8OwoUwGEbzIMzk2NRbNShKaeWCcQ2Q=;
 b=ciJ7mvXycq8hyNj/LPFCsPMeyBUPGa85Dg83G4vbXjtTxewtkwI0U72qiOZnOEKfEQ4Mkf
 a8AfIuhj4AO+hlg5NaJDECmD5i21ZAxIpbPAdtb8anVLLzggwK2ZwO3WNyDY7KWxGw12IJ
 3NhVMp9Oxx9JCTfou+2rfE8RZt+eLog=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-gePPqlzINgC-C04gJzXfkQ-1; Thu, 07 Oct 2021 03:53:47 -0400
X-MC-Unique: gePPqlzINgC-C04gJzXfkQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 bo2-20020a0564020b2200b003db3540f206so4874801edb.23
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 00:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+CvSL59/DcBhv8OwoUwGEbzIMzk2NRbNShKaeWCcQ2Q=;
 b=XOMRUwvY0jMRQZTzepJD7NvUkHZy/n3ZV6zD8DJgAY4+qWC80n39jN2QMtCgIFZslG
 csHGY0kdA636m2UPbLkoA3kmtwlTrWhEIXS4tPe4t9NmD+p+EP0kTV+BkfGMcz56O5gX
 b6KrXDwKOB7ytHl2miCs1xOX8XcDL6yV56/O8KRVWopVXvqzLNzanApOzBZzV0b83YSR
 kaPNDNxPHIOYLt7du3RLo0b/8VSe3XeF9461nkyo+Z0uwFh1SDmMYMAW0m1nl7AP9kZI
 r/Gr+onPhXdRUvf3E8FOwQCT0Gx8jpkV4ZKuXzIbSlvoZiUDVtIz+kDeVKz0DlfWRoGb
 tccw==
X-Gm-Message-State: AOAM531RGXBaxK5djnIhjr/xxfxDCQACqcQJwqL/K38ft7QNLUessLts
 dTlBd9R7DN+zJJqSBZI6yeDr4tvoBcrYKShv7vCbI59akkXKoRdHRoNRGo+GTFlWxhDfAtdUSPi
 WAm9p7pJwUCie8B4AV/D+Qi/dOETeYucbCM3bJKawb6zF2eq6YtnYPjZlpmShiyaSScM=
X-Received: by 2002:a05:6402:3489:: with SMTP id
 v9mr4320045edc.130.1633593225753; 
 Thu, 07 Oct 2021 00:53:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGFNTZNryKQTB1FIyQLBVFEDpas+VjdoEl/fZQGOLqPYd85GZ3yXrsV77Fqr2hoGBsAoOmxw==
X-Received: by 2002:a05:6402:3489:: with SMTP id
 v9mr4320019edc.130.1633593225544; 
 Thu, 07 Oct 2021 00:53:45 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 jt24sm10036839ejb.59.2021.10.07.00.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 00:53:43 -0700 (PDT)
Subject: Re: [PATCH 2/2] qemu-iotests: fix image-fleecing pylint errors
To: Kevin Wolf <kwolf@redhat.com>
References: <20211006130100.389521-1-eesposit@redhat.com>
 <20211006130100.389521-3-eesposit@redhat.com> <YV3UCaO5oJU2TeIR@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <ae47932f-4a0c-cfba-d222-8bf30e9da56b@redhat.com>
Date: Thu, 7 Oct 2021 09:53:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YV3UCaO5oJU2TeIR@redhat.com>
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
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 06/10/2021 18:51, Kevin Wolf wrote:
> Am 06.10.2021 um 15:01 hat Emanuele Giuseppe Esposito geschrieben:
>> The problem here is that some variables are formatted with
>> unnecessary spaces to make it prettier and easier to read.
>>
>> However, pylint complains about those additional spaces.
>> A solution is to transform them as string with arbitrary spaces,
>> and then convert it back into a tuple.
>>
>> Removing the spaces makes it a little bit ugly, and directly
>> using the string forces us to change the test reference output
>> accordingly, which will 1) contain ugly weird formatted strings,
>> 2) is not portable if somebody changes the formatting in the test
>> string.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> Changing our logic because of a style checker feels wrong. I'd rather
> stick in a line like this before the definitions:
> 
> # pylint: disable=bad-whitespace
> 
> (Not sure if the syntax of this is entirely correct, but from the
> comment in your patch and existing uses in iotests, I think this would
> be the line.)

Ok, I will add the line. Same remarks from the previous patch applies: 
unfortunately then we disable the warning for the whole file.

Since here (like the previous patch) the error spans on multiple lines, 
adding a # pylint: disable= comment on each line is infeasible and ugly.

Emanuele


