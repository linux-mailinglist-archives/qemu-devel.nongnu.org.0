Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABA835A2D5
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:18:47 +0200 (CEST)
Received: from localhost ([::1]:56282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtqI-0000tj-FE
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lUtfu-0005bZ-Sg
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:08:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lUtfs-0007zU-G9
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:08:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617984478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rtBgoY4QF8YDYvgzpngZq6F4FxVO/gsNXeya9hiC84w=;
 b=SfmyzHPgYLKsVgpLXNKTHCB9sBJfq4Dv10et6wqxALdqICUqB79DXoygMdb2xYttnMWnOj
 oOKAnxdnhm/bW5MekmczLqfPp2xqC8czx9U6CIMdrtwtbDygrnR3t6TeqIK0oO/Zrlfaxd
 6Q7ivnOWkzk8m0vxWwDAW2ZNDhxN8o8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-ZyPypmBePoGEhzsYb0HEPw-1; Fri, 09 Apr 2021 12:07:57 -0400
X-MC-Unique: ZyPypmBePoGEhzsYb0HEPw-1
Received: by mail-ed1-f69.google.com with SMTP id l11so2884759edb.2
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 09:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rtBgoY4QF8YDYvgzpngZq6F4FxVO/gsNXeya9hiC84w=;
 b=MO9ZMSK8rGEBb9FiHATxgaRmEGZJDoa9TGXXj7IeDyc1CpHyuVgsjYREX72WzaHYWc
 2k/o8q7Dyt01cTwVmS/Z03Uaa2qt6UJRzZbZim73hXu/C7yXz2xw52wTfcDDGIoxKrbq
 XgvuHGnw6r35Sx+II6gsIPxjzEHB+a5s9SvA4go+8lzeXevNzERtjJHMRGX0qNuYUVZV
 dhoSC0kjvQvsXB+qrYTCRAbq5GICmVCd6JHfTl9xRhOEfPw9MTtP+4vTTHIxwx47wYVA
 TslU6IS1sb6N/CkeD37zxC9BNwCHYI+NTLKH0aq/npvaQSGLEw7Tj3kMXdHXRy74HWVL
 UWLw==
X-Gm-Message-State: AOAM533iZrvGnitxsEqknn83WuqhZiHbGJAh4PpDGcxQwwQ5OQOX002p
 xzoHxSNVAEx5JRdVdSeL2cdj6ImgfVe+bPOC/kJawn6gSSGczL+t8CwhReKVKapewrfX6iNFy71
 4imWmPjXFB4JoHAKVV/DTRGKHRf/RGoFvhb39gyU3K7n8umcS4xbIPSQLp/Cc4vUrV/g=
X-Received: by 2002:a17:906:2a0f:: with SMTP id
 j15mr14405938eje.159.1617984475613; 
 Fri, 09 Apr 2021 09:07:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuYlh/gF+uEM14A1XjHW2NbgL1YWUg7Y2eXECdFcx/TiPoq72Ko1d8IhIwfYsMC2rLbGzA3A==
X-Received: by 2002:a17:906:2a0f:: with SMTP id
 j15mr14405913eje.159.1617984475354; 
 Fri, 09 Apr 2021 09:07:55 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.173])
 by smtp.gmail.com with ESMTPSA id y7sm1686532edq.88.2021.04.09.09.07.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 09:07:54 -0700 (PDT)
Subject: Re: [RFC PATCH v2 02/11] python: qemu: pass the wrapper field from
 QEMUQtestmachine to QEMUMachine
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
References: <20210407135021.48330-1-eesposit@redhat.com>
 <20210407135021.48330-3-eesposit@redhat.com>
 <4d920857-c398-3527-d71e-1f0f79be9034@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <4a63b9bd-0716-b059-2ef0-a51e6e3d2328@redhat.com>
Date: Fri, 9 Apr 2021 18:07:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4d920857-c398-3527-d71e-1f0f79be9034@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
>> index c721e07d63..18d32ebe45 100644
>> --- a/python/qemu/machine.py
>> +++ b/python/qemu/machine.py
>> @@ -109,7 +109,7 @@ def __init__(self,
>>           self._binary = binary
>>           self._args = list(args)
>> -        self._wrapper = wrapper
>> +        self._wrapper = list(wrapper)
>>
> 
> Unrelated change?
> 
> (I'm assuming you want to copy the user's input to explicitly avoid 
> sharing state. Commit message blurb for this would be good.)

Yes, unrelated change. I do not see the benefit of copying the user 
state. I will drop it.

>>
> 
> ACK

(Apologies for the ignorance, is this an Acked-by?)

Emanuele


