Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD732F829C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 18:37:01 +0100 (CET)
Received: from localhost ([::1]:42318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0T1w-0001eA-7O
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 12:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l0Szz-0000jV-W7
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:35:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l0Szy-0005nX-7t
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:34:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610732097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1fkO1XnBSwypfn2lTNkhUfjpaFfACYQEHmdxIuRZ054=;
 b=fK5c9bAPppQ5Gaf2jZi9HVNJlv8WB412aSS5/a1XabKh1LM53CWh7sm0J3/E70my2uJMNU
 el2rwBWx2a4gIbk8L09o5EHHazBdzZ687CZKWeD2jbszYgF35ZacoYofz7Z/84KVsY9cve
 rmK/cmKecACKKzIm9mm2hD3CXhXpPlA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-6WRzRPdTMnixxZX73F8_qg-1; Fri, 15 Jan 2021 12:34:55 -0500
X-MC-Unique: 6WRzRPdTMnixxZX73F8_qg-1
Received: by mail-ed1-f71.google.com with SMTP id u18so4173493edy.5
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 09:34:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1fkO1XnBSwypfn2lTNkhUfjpaFfACYQEHmdxIuRZ054=;
 b=fpRjSMS+L9DoM/w5C6xQKL2A+dJ+KjoC6OadkAUGkbg/azdDR6ujm1Ts3NZSapQCSa
 WwUX1UKLfCjLl+T3NppUDto0klSpLcN7W4AnS4e36uDWTzMs+7aDD/1r/z8NL5FOr3w1
 A/udIYpQsoje9RvI9NeqZxxBPbb8cYT1IV581jPe3imZLcS6AxrMDQJOh7KWUqkfvzDU
 rllR6wot5S+RwHV2N+gr7rJcGjE5aJqmhUo2r7TJtrqKbF9WkfCNWD9FyoQExL0tOxSA
 FltM8Xh0WbqnWycTeyx6M0hlV/hSpAzOvO3MXF042yruAyqT4TCK0eGjIoVywg5Q8hZj
 fLpA==
X-Gm-Message-State: AOAM533XZ3aoCzhD4HLzj7DG7dokMvSyuUOs0S3IQBt+eYKDXRVNlc8k
 eBgHeMa9xE+iD/j0fQQgRmfVL2lALgnHkCymUiR97xf4dpa+jQRjof14StTemuEssELBnG/J436
 FgJHRU/9adLuZBgo=
X-Received: by 2002:a17:906:bfcc:: with SMTP id
 us12mr9534221ejb.163.1610732094274; 
 Fri, 15 Jan 2021 09:34:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZSq52+UHCnEPIwzR+pvj/GCG6CKP9FOpbMayXr2Mv2XDez2Y8c6/RXxbkdW7SD8ZLszgRsA==
X-Received: by 2002:a17:906:bfcc:: with SMTP id
 us12mr9534207ejb.163.1610732094064; 
 Fri, 15 Jan 2021 09:34:54 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w18sm1025615ejq.59.2021.01.15.09.34.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 09:34:53 -0800 (PST)
Subject: Re: Windows installer builds apparently broken since October?
To: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>
References: <CAFEAcA8ozrnbh8XVZa8OF9C9SnNKb4Wb-=gZianHPPp5zcKjmw@mail.gmail.com>
 <CAFEAcA-f4cueeYNr=i8w0LbdsNwJo3DMLAywsp5cOu7-P0wKCA@mail.gmail.com>
 <03e68d8d-9446-ebec-7be0-21764b567dda@weilnetz.de>
 <CAFEAcA9R3+tnmJa6qpVaSD-e-rQJu7QJ_ptg4=eZwJCAVOLwqQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <95c18bea-20b5-ed61-f5d5-502733de26a2@redhat.com>
Date: Fri, 15 Jan 2021 18:34:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9R3+tnmJa6qpVaSD-e-rQJu7QJ_ptg4=eZwJCAVOLwqQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/01/21 16:57, Peter Maydell wrote:
> On Fri, 15 Jan 2021 at 15:52, Stefan Weil <sw@weilnetz.de> wrote:
>> I forgot to mention that some of the problems with the Meson build also
>> occur on macOS with Homebrew: they always happen when a software package
>> requires special compiler flags to find its include files or libraries,
>> but the Meson build does not use the result from pkg-config for them.
> 
> Yeah -- we fixed that in commit 3eacf70bb5a83e4 for gnutls, which
> is the main one homebrew was running into. Is Windows having
> problems with other libs too?
> 
> Paolo: did we come up with a generic solution for this or
> do we really have to add entries to dependency lists all
> over the build system for every library we use?

I will work on a fix in Meson (basically not using -Wl,--whole-archive 
and instead linking in individual objects).  I also have a very ugly way 
to do the same in QEMU but I don't think it's worth pursuing it except 
for a proof of concept.

Paolo


