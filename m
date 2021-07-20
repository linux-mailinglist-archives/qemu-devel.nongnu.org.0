Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47653CF60D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 10:21:52 +0200 (CEST)
Received: from localhost ([::1]:49322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5l0f-0005D3-Io
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 04:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m5kzW-000465-A0
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 04:20:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m5kzT-0001Xz-8Q
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 04:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626769233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f/KX+A8qHC1+tNOIGreERwFpHn7ZjKum4if0ieCABfA=;
 b=XijlyCTXp/Jtacz7msT4qC3eB9WSIMIXhjthnwDV8Ot/ADm5S5xXZi2XhfKMoCXg8RV/FV
 5KTtv95yeTk0GvovmOIhiMR2HfB53oUkASJxOrYZv9qV5IxtswtQOzWtHrNntSwTXPcbvo
 PQeBjLcUTSOwh0oGm7LXGRuBVSxhQSg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-fiQcOvvlPpGwrdJT6EmlfQ-1; Tue, 20 Jul 2021 04:20:31 -0400
X-MC-Unique: fiQcOvvlPpGwrdJT6EmlfQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 m9-20020a5d4a090000b029013e2b4a9d1eso10034204wrq.4
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 01:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f/KX+A8qHC1+tNOIGreERwFpHn7ZjKum4if0ieCABfA=;
 b=i6VvK8Tb5xF0Mpq3y319QdSpde7kmbbg2rkarP+9ghOcf2EHi3U1P4+pdnfbqkU12z
 8Pd5ea91dBAS1x6H+uXOM29+H8SqVrKKDTaicOIRtseAJXD8CjUHlwsLvL/OSpgsQNMb
 T/Tr3NJrwjvNBP99SL2Kubcm496m8cr6/lCmsyE6yyBvZFeUvzS33iN2rbXxlmQIl+VG
 PMer52UdWZUP94AjnWvSKKHgCLufGC0XVcPsY9opZU2BrSrBBUPl87DWYjOhGKUSU3UY
 fuGbuheE8B/DVzBvuEQMKV0nsATwvcdj8R/KV948HfEB9G2wRqko4JOgWSug/5LcS6l5
 Ht3g==
X-Gm-Message-State: AOAM531OQuTLmf2Zd5LYI5GDN0n3gBQuQ8OREGl76YHs7VthtC1yGP1b
 duNNFaipLjLQqZqWm16YR0ayeAtgoWckFnJn2ZE+Cx2Ciz13mD3rijUCdzadB/PAtumxcFun/Ge
 Oe4tyQvRt6c6H2BQ=
X-Received: by 2002:a05:600c:214a:: with SMTP id
 v10mr30669419wml.67.1626769230001; 
 Tue, 20 Jul 2021 01:20:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1Nwx7jaagf+tn/IOPyGAlaCc+Kn/sk0uVQ8nXaT6vBRes79ayxkEbXFzwr3qjagmD3SLQ6w==
X-Received: by 2002:a05:600c:214a:: with SMTP id
 v10mr30669404wml.67.1626769229823; 
 Tue, 20 Jul 2021 01:20:29 -0700 (PDT)
Received: from thuth.remote.csb (p5791dad8.dip0.t-ipconnect.de.
 [87.145.218.216])
 by smtp.gmail.com with ESMTPSA id s14sm8237631wmc.25.2021.07.20.01.20.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 01:20:29 -0700 (PDT)
To: Eric Blake <eblake@redhat.com>
References: <87d526f8-53bc-c196-6d5c-72b78a49518b@redhat.com>
 <20210720011151.l66z3q5hfc7urcfv@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Failing iotest 206
Message-ID: <4257171a-b3c7-d6e5-207a-2416ef2c4a11@redhat.com>
Date: Tue, 20 Jul 2021 10:20:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210720011151.l66z3q5hfc7urcfv@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: berrange@redhat.com, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/07/2021 03.12, Eric Blake wrote:
> On Mon, Jul 19, 2021 at 10:06:01AM +0200, Thomas Huth wrote:
>>   Hi,
>>
>> iotest 206 fails for me with:
>>
> 
>> --- 206.out
>> +++ 206.out.bad
>> @@ -99,55 +99,19 @@
>>
>>   {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options":
>> {"driver": "qcow2", "encrypt": {"cipher-alg": "twofish-128", "cipher-mode":
>> "ctr", "format": "luks", "hash-alg": "sha1", "iter-time": 10, "ivgen-alg":
>> "plain64", "ivgen-hash-alg": "md5", "key-secret": "keysec0"}, "file":
>> {"driver": "file", "filename": "TEST_DIR/PID-t.qcow2"}, "size": 33554432}}}
>>   {"return": {}}
>> +Job failed: Unsupported cipher algorithm twofish-128 with ctr mode
>>   {"execute": "job-dismiss", "arguments": {"id": "job0"}}
>>   {"return": {}}
> 
>>
>> Looks like it is missing a check for the availability of the corresponding
>> crypto stuff? Does anybody got a clue how to fix this?
> 
> What system is this on?

RHEL 8.4

> Which crypto library versions are installed?

gnutls-3.6.14-8.el8_3.x86_64
nettle-3.4.1-4.el8_3.x86_64

> I suspect this is related to Dan's effort to speed up crypto by
> favoring gnutls over nettle, where the switch in favored libraries
> failed to account for whether twofish-128 is supported?
> 
> https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg03886.html

You're right, I've bisected the problem now, and the commit that introduced 
the issue is this one here:

commit 8bd0931f63008b1d50c8df75a611323a93c052bf
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Fri Jul 2 17:38:33 2021 +0100

     crypto: prefer gnutls as the crypto backend if new enough

     If we have gnutls >= 3.6.13, then it has enough functionality
     and performance that we can use it as the preferred crypto
     backend.

     Reviewed-by: Eric Blake <eblake@redhat.com>
     Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

  Thomas



