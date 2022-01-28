Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE60149FE7C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:54:46 +0100 (CET)
Received: from localhost ([::1]:40732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDUWL-0005Uw-Os
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:54:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nDTsm-0008Q4-As
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:13:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nDTsk-0004Ou-Cb
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643386429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pPcJdjHEAg7REBF/Vsx84ym6UySBMXgoZni83RgVALQ=;
 b=i8+vWYJb4IzobL5Q1aOgnLH0CwaITn+B+47p8+U3rpZcsYyVmYpsYKCKjld+3Bq3iSyEbQ
 qfJVyb+DYQD3bF6ns924bu1stZK4cKu+ks59zd45Tin4ZUlos21nS3hqqe1s9SE6Gxq99Z
 ZxnLRbbYJdefQZzzo6xhOQooKpHh89w=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-6KfIB_ocNmG-9imgcuOoBg-1; Fri, 28 Jan 2022 11:13:47 -0500
X-MC-Unique: 6KfIB_ocNmG-9imgcuOoBg-1
Received: by mail-ej1-f70.google.com with SMTP id
 h22-20020a1709060f5600b006b11a2d3dcfso3114795ejj.4
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 08:13:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pPcJdjHEAg7REBF/Vsx84ym6UySBMXgoZni83RgVALQ=;
 b=qBBdbyg+cpgtUNADC3mcQIm02+kSd3Ys83sc60NAY/dtaJDtfl82PdPqCnM1O15UUs
 tsyh+xY3cItxD3V8+I6zgUpAe/ZCav6KxC4TgM9oywLzCxzhB1InAmnF3+5hcZD42KAE
 shpSZ30EXFunFZce86S4eCQ1dKrxWkpYh2De1bbPBnCURMtqvJJsybEmiEmME57DVYRK
 UiG0xZrsQ3p1z66v6U5N0xRM8MD0kJckkQNcDp5qr5bBlFQ3RDKz/leYSFMV13Ii7qHT
 VF8Kseoqa9VpVskBoPpnScCITOz9WrIcIrk9R90AnPLcUCkaFhxe3EJnBH/LTdWbcKAK
 QQJA==
X-Gm-Message-State: AOAM5305KSNdOU3LVZ7FnVvhzfyWsaFvWTVJdowMTr+ccqlj15lulH/Q
 pdxqxy2ul/Epd+UWzoUN8RBN9iZgpoP/fkeie8a0PWK7Rygep4FKDNbNfoRc7r27zJFDtsGnG/k
 XEKNQKZgf8KRcPGc=
X-Received: by 2002:a17:907:1c11:: with SMTP id
 nc17mr7313021ejc.675.1643386425942; 
 Fri, 28 Jan 2022 08:13:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpUzJp05zUkcshYnFU++gKpgM0G2G2JLN4XgMQGcXUlg+kPu2/X16fSyfq0T3+DR0xRhjV9Q==
X-Received: by 2002:a17:907:1c11:: with SMTP id
 nc17mr7312924ejc.675.1643386424524; 
 Fri, 28 Jan 2022 08:13:44 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id e19sm9039469ejl.225.2022.01.28.08.13.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 08:13:44 -0800 (PST)
Message-ID: <1e8c10a2-5f0c-ac8a-cea0-6c5fe63b379d@redhat.com>
Date: Fri, 28 Jan 2022 17:13:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] qsd: Document fuse's allow-other option
To: Kevin Wolf <kwolf@redhat.com>
References: <20220124170300.20680-1-hreitz@redhat.com>
 <YfLCBDnTibtJnNU3@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <YfLCBDnTibtJnNU3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.01.22 17:02, Kevin Wolf wrote:
> Am 24.01.2022 um 18:03 hat Hanna Reitz geschrieben:
>> We did not add documentation to the storage daemon's man page for fuse's
>> allow-other option when it was introduced, so do that now.
>>
>> Fixes: 8fc54f9428b9763f800 ("export/fuse: Add allow-other option")
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   docs/tools/qemu-storage-daemon.rst   | 9 +++++++--
>>   storage-daemon/qemu-storage-daemon.c | 2 +-
>>   2 files changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
>> index 9b0eaba6e5..f7a300c84e 100644
>> --- a/docs/tools/qemu-storage-daemon.rst
>> +++ b/docs/tools/qemu-storage-daemon.rst
>> @@ -76,7 +76,7 @@ Standard options:
>>   .. option:: --export [type=]nbd,id=<id>,node-name=<node-name>[,name=<export-name>][,writable=on|off][,bitmap=<name>]
>>     --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=unix,addr.path=<socket-path>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
>>     --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=fd,addr.str=<fd>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
>> -  --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>[,growable=on|off][,writable=on|off]
>> +  --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>[,growable=on|off][,writable=on|off][,allow-other=on|off|auto]
>>   
>>     is a block export definition. ``node-name`` is the block node that should be
>>     exported. ``writable`` determines whether or not the export allows write
>> @@ -103,7 +103,12 @@ Standard options:
>>     mounted). Consequently, applications that have opened the given file before
>>     the export became active will continue to see its original content. If
>>     ``growable`` is set, writes after the end of the exported file will grow the
>> -  block node to fit.
>> +  block node to fit.  The ``allow-other`` option controls whether users other
>> +  than the QSD user will be allowed to access the export.  Note that enabling
>> +  this option as a non-root user requires enabling the user_allow_other option
>> +  in the global fuse.conf configuration file.  Setting ``allow-other`` to auto
>> +  (the default) will have the QSD try enabling this option, and on error fall
>> +  back to disabling it.
> "QSD" is not an acronym that is used (or introduced) elsewhere in this
> document.

It’s used in “qsd-qmp.sock”, “qsd-nbd.sock”, and “qsd.pid” O:)

> I suggest replacing "QSD user" with "user running the process" and "will
> have the QSD try" with simply "will try".

Sure, sounds good, will do!

Hanna

>>   .. option:: --monitor MONITORDEF
>>   
>> diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
>> index 9d76d1114d..a1dcc4aa2e 100644
>> --- a/storage-daemon/qemu-storage-daemon.c
>> +++ b/storage-daemon/qemu-storage-daemon.c
>> @@ -100,7 +100,7 @@ static void help(void)
>>   "\n"
>>   #ifdef CONFIG_FUSE
>>   "  --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>\n"
>> -"           [,growable=on|off][,writable=on|off]\n"
>> +"           [,growable=on|off][,writable=on|off][,allow-other=on|off|auto]\n"
>>   "                         export the specified block node over FUSE\n"
>>   "\n"
>>   #endif /* CONFIG_FUSE */
> Looks good otherwise.
>
> Kevin
>


