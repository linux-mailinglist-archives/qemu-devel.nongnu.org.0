Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9316E3A2960
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:31:05 +0200 (CEST)
Received: from localhost ([::1]:47500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHxo-0002E6-HD
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrHj2-0005ja-O9
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:15:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrHiz-0000r9-3U
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:15:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623320144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j1DEK9AiXADttiWw5JQQaxtUrqD2AigyUYPGD6NCcDk=;
 b=XIdw1RmnTWjA3PdnAFdxNGDOOC0q44PuZGhnUz7HPLBiTEpJ7yWZnMqm5y9wyu3xYWxpSb
 sf8Q0GajGREEqL/7OoyHuOznhqmX5fgdQMtc//rQfBCCALQPZity/CzRAF/xBMlNltzP6b
 Vpg0Vipnwjr4M4GxfDrsN/LNOQ6M2LQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-BYyd1EC5O42Oaf3CdFGyXQ-1; Thu, 10 Jun 2021 06:15:42 -0400
X-MC-Unique: BYyd1EC5O42Oaf3CdFGyXQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 q15-20020adfc50f0000b0290111f48b865cso674505wrf.4
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 03:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j1DEK9AiXADttiWw5JQQaxtUrqD2AigyUYPGD6NCcDk=;
 b=EE4CW3mSonjdshr6DkHG+VdiVvgpDG6SI1uNxjN8kcGWfv9VwAfIbleoXf2aCTvDFL
 F924TqlGTXiV97YqN9UIJLmNsH82X15naZzZk3LpHWFu9IsUVxQIVOQByCttgAvlpXXI
 u8CZs2T0+hBJzO1s7pkjeIH+ZNBiZGnjXcOh/fARQX2jsO/DN+whV/XR58wyys2ok/kD
 jkyEqeGoCwjsGEIw6g0HrKum5RKY2Rx0dT3H87qA+EmgDsmrRwogosu/67vT8GHvowlI
 Rhh3L9oaeE7Um1whmth3kabFs0sOKVqa0qlRtwLfOGGC7sZIItJky1megRVW069OiWe7
 lPMQ==
X-Gm-Message-State: AOAM530HXs0WvZUVlrxNj3J6DTdYBSC0uSdiH+aBx1Pj/kELuo0qxM6j
 xfb7h3hJ4QA0uaMLdvMwoodKfh/7/vB9cDYK8T51p8ASkt5XzzadLAQbjzr9n0qysiDhQ59Xstc
 wbGeohBddHAdc7lc=
X-Received: by 2002:a1c:2507:: with SMTP id l7mr4241221wml.188.1623320140989; 
 Thu, 10 Jun 2021 03:15:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXEb1FZSVhi2oCmg6hNsNhBlgImCdAI6LNbs0HGjnYZ8TeWudCaB5+yaUVOP/e45igIEK1jw==
X-Received: by 2002:a1c:2507:: with SMTP id l7mr4241205wml.188.1623320140845; 
 Thu, 10 Jun 2021 03:15:40 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id n1sm2489581wms.18.2021.06.10.03.15.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 03:15:40 -0700 (PDT)
Subject: Re: [PATCH 02/11] qapi/misc-target: Group SEV QAPI definitions
To: Markus Armbruster <armbru@redhat.com>
References: <20210610064556.1421620-1-philmd@redhat.com>
 <20210610064556.1421620-3-philmd@redhat.com>
 <875yymdpo7.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <043f0098-d043-b649-9b2d-1ebee6f5f92c@redhat.com>
Date: Thu, 10 Jun 2021 12:15:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <875yymdpo7.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Connor Kuehl <ckuehl@redhat.com>, Eric Blake <eblake@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 11:39 AM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> There is already a section with various SEV commands / types,
>> so move the SEV guest attestation together.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  qapi/misc-target.json | 75 +++++++++++++++++++++----------------------
>>  1 file changed, 37 insertions(+), 38 deletions(-)
>>
>> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
>> index 5573dcf8f08..1b81f7017d4 100644
>> --- a/qapi/misc-target.json
>> +++ b/qapi/misc-target.json
>> @@ -219,6 +219,43 @@
>>    'data': { 'packet-header': 'str', 'secret': 'str', '*gpa': 'uint64' },
>>    'if': 'defined(TARGET_I386)' }
>>  
>> +##
>> +# @SevAttestationReport:
>> +#
>> +# The struct describes attestation report for a Secure Encrypted Virtualization
>> +# feature.
>> +#
>> +# @data:  guest attestation report (base64 encoded)
>> +#
>> +#
>> +# Since: 6.1
>> +##
>> +{ 'struct': 'SevAttestationReport',
>> +  'data': { 'data': 'str'},
>> +  'if': 'defined(TARGET_I386)' }
>> +
>> +##
>> +# @query-sev-attestation-report:
>> +#
>> +# This command is used to get the SEV attestation report, and is supported on AMD
>> +# X86 platforms only.
>> +#
>> +# @mnonce: a random 16 bytes value encoded in base64 (it will be included in report)
>> +#
>> +# Returns: SevAttestationReport objects.
>> +#
>> +# Since: 6.1
>> +#
>> +# Example:
>> +#
>> +# -> { "execute" : "query-sev-attestation-report", "arguments": { "mnonce": "aaaaaaa" } }
>> +# <- { "return" : { "data": "aaaaaaaabbbddddd"} }
>> +#
>> +##
>> +{ 'command': 'query-sev-attestation-report', 'data': { 'mnonce': 'str' },
>> +  'returns': 'SevAttestationReport',
>> +  'if': 'defined(TARGET_I386)' }
>> +
>>  ##
>>  # @dump-skeys:
>>  #
> 
> Just code motion, so
> 
> Acked-by: Markus Armbruster <armbru@redhat.com>
> 
> Opportunity to wrap the long doc comment lines.  Should be kept under 70
> or so.

Hmm is that a QAPI specific requirement? It is not enforced by
checkpatch, and still in the 80-90 grey area:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg763806.html

(I can do if respin required, but I'd rather have this catch earlier,
not at code movement).

Thanks for the A-b!


