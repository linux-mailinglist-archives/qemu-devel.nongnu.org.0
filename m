Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6F9303CD9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 13:22:34 +0100 (CET)
Received: from localhost ([::1]:53130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4NMf-0003CC-4p
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 07:22:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4NLY-0002hV-Bn
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:21:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4NLU-0005Hp-9Q
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:21:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611663677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oiOvHYZDb2vHCtMUHG53MeKJ6/JA7RosI2FqW+/QpMk=;
 b=jF57g1OYMfICCg3oBVu1Iksc957q56k790n8ciQqJ9GZG8VW64tOeXJI0b3Xv1c/w0KZhb
 6cw/xKxw3QXIFFrH/kfS3StQrHGiSi+HANJM50yyOYXBTIrypw6WnYRtL+aekHFwWImqN4
 vVn0nIdk1EWy0zowPwwvPe7kJWe8HKM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-dwTJefF-OvWSxj-I4Oa3Mw-1; Tue, 26 Jan 2021 07:21:15 -0500
X-MC-Unique: dwTJefF-OvWSxj-I4Oa3Mw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04BFF9CDA2;
 Tue, 26 Jan 2021 12:21:14 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-175.ams2.redhat.com
 [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B70F60636;
 Tue, 26 Jan 2021 12:21:12 +0000 (UTC)
Subject: Re: [PATCH] iotests/118: Drop 'change' test
To: Kevin Wolf <kwolf@redhat.com>
References: <20210126104833.57026-1-mreitz@redhat.com>
 <20210126111839.GC4385@merkur.fritz.box>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <d2975235-d9a8-bfa8-438f-7e2fa570aa0e@redhat.com>
Date: Tue, 26 Jan 2021 13:21:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210126111839.GC4385@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.01.21 12:18, Kevin Wolf wrote:
> Am 26.01.2021 um 11:48 hat Max Reitz geschrieben:
>> Commit 0afec75734331 removed the 'change' QMP command, so we can no
>> longer test it in 118.
>>
>> Fixes: 0afec75734331a0b52fa3aa4235220eda8c7846f
>>         ('qmp: remove deprecated "change" command')
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
> 
> Thanks, applied to the block branch.
> 
> (I was just about to make the same change myself...)
> 
> If you don't mind, I'd squash in something like the following.
> 
> Kevin
> 
> diff --git a/tests/qemu-iotests/118 b/tests/qemu-iotests/118
> index 88e8354e21..cae52ffa5e 100755
> --- a/tests/qemu-iotests/118
> +++ b/tests/qemu-iotests/118
> @@ -1,8 +1,7 @@
>   #!/usr/bin/env python3
>   # group: rw
>   #
> -# Test case for the QMP 'change' command and all other associated
> -# commands
> +# Test case for media change monitor commands
>   #
>   # Copyright (C) 2015 Red Hat, Inc.
>   #

Sure, looks good.

Do you plan on sending a pull request today?  I was, and so I’d like to 
include this patch then.

(Well, I was planning to send it last week, then came the 
coroutine-sigaltstack stuff, then this, and right now I’m debugging 178 
breaking after ccd3b3b8112b670fdccf8a392b8419b173ffccb4...)

Max


