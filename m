Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9846032AC29
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:21:17 +0100 (CET)
Received: from localhost ([::1]:56626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCSC-0003Yf-EH
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:21:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHCKB-0004Vj-Rp
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:12:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHCK4-0002mu-6t
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:12:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614719571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZZ5X6NL4wz9R6tQIGg8KuAwePuAGRBQNXToH2txns9w=;
 b=Ac6L0NyNVwFjO97+X4O0DnWGzXc8rGOziXeh9ODF9Rni1XM22RL7oI+MIbbGiRZsAyUhfS
 S2BgUssob9IT9fbOETFdjHzIuq5wAitrgERoZ9CaEWDBT91ReV6eX0jSUo2VW8bLRqHvDx
 aSfdTCiadARlx52G71fBuZbRG00As24=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-vfSJ7gQVOZGEtBZWqUqkKQ-1; Tue, 02 Mar 2021 16:12:46 -0500
X-MC-Unique: vfSJ7gQVOZGEtBZWqUqkKQ-1
Received: by mail-ej1-f72.google.com with SMTP id e13so3917602ejd.21
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 13:12:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZZ5X6NL4wz9R6tQIGg8KuAwePuAGRBQNXToH2txns9w=;
 b=o+NPSSyXLd90l+XlBY9APsaxWhlaEkk3kjKS7XDR4hlUAST5QMhi2pkXaFnBnAoPxq
 Jz5TpA8BnX8kJPURQ4jdklRvHa+iLeZqSwcftBSz+75qGvmiCkZ8O7gV0y2WvyUTSdRU
 aMZipNIiJyYn02ucNuaoYx/oXGQBJTkZ65P+eyAA6Mr+f1AC6jiGYcQYjC5RR4WnBhg8
 4/oN4KrjPmppRP1XawTIZmOBXPuoIUxL/T6oMHOyvV1R2hi1Vpb7kFWNNyRrlN/qJWMp
 gx1IHHSoL8lWeeeUiItj+hcfSoKLSlnBacc0W0unAKA/cmmIFuDyUVNBEhN8QsLz+U7J
 1WgA==
X-Gm-Message-State: AOAM5301R5fR3d6TP7Yds4wjDQKxBsNmdYyRABz3G/JERi0Kb3ww4ykZ
 M8KwPGchobtCS3byT3OoOzvosOt4xe7BbZYbkaG94/KAkitNR/DL9zQ5xwxdgUjZ6U1EMN1zarR
 pPp4/ARO5kJ21psc=
X-Received: by 2002:a17:906:5811:: with SMTP id
 m17mr5664843ejq.115.1614719565401; 
 Tue, 02 Mar 2021 13:12:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytaoLxfDLIu5Sq/SvGW9O1Evb1IguNKJoQj6PbXRg56d55HqH8t5OfyLjyn7KLoQe0H5bcvw==
X-Received: by 2002:a17:906:5811:: with SMTP id
 m17mr5664833ejq.115.1614719565286; 
 Tue, 02 Mar 2021 13:12:45 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y16sm17143920ejk.43.2021.03.02.13.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 13:12:44 -0800 (PST)
Subject: Re: [PATCH 1/3] qapi, audio: add query-audiodev command
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210302175524.1290840-1-berrange@redhat.com>
 <20210302175524.1290840-2-berrange@redhat.com>
 <6ed46b74-c426-0c85-61eb-668f49a31795@redhat.com>
Message-ID: <562f8b94-b222-7b31-5a3b-3b96817faea4@redhat.com>
Date: Tue, 2 Mar 2021 22:12:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <6ed46b74-c426-0c85-61eb-668f49a31795@redhat.com>
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 10:10 PM, Philippe Mathieu-Daudé wrote:
> On 3/2/21 6:55 PM, Daniel P. Berrangé wrote:
>> Way back in QEMU 4.0, the -audiodev command line option was introduced
>> for configuring audio backends. This CLI option does not use QemuOpts
>> so it is not visible for introspection in 'query-command-line-options',
>> instead using the QAPI Audiodev type.  Unfortunately there is also no
>> QMP command that uses the Audiodev type, so it is not introspectable
>> with 'query-qmp-schema' either.
>>
>> This introduces a 'query-audiodev' command that simply reflects back
>> the list of configured -audiodev command line options. This in turn
>> makes Audiodev introspectable via 'query-qmp-schema'.
>>
>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
>>  audio/audio.c   | 19 +++++++++++++++++++
>>  qapi/audio.json | 13 +++++++++++++
>>  2 files changed, 32 insertions(+)
> 
>> +
>> +##
>> +# @query-audiodevs:
>> +#
>> +# Returns information about audiodev configuration
>> +#
>> +# Returns: array of @Audiodev

Also with chardev we return ChardevBackendInfo. I'm not sure
if this is because I'm custom to read it, but it seems clearer.
Can we return a AudiodevBackendInfo type?

>> +#
>> +# Since: 6.0
>> +#
>> +##
>> +{ 'command': 'query-audiodevs',
>> +  'returns': ['Audiodev'] }
>>
> 
> Can we use 'query-audiodev-backends' similarly to
> 'query-chardev-backends'?
> 


