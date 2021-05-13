Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1131A37FF95
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 23:05:21 +0200 (CEST)
Received: from localhost ([::1]:38036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhIWF-0000ei-JL
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 17:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lhITY-0006bj-QX
 for qemu-devel@nongnu.org; Thu, 13 May 2021 17:02:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lhITP-0002Q4-Hm
 for qemu-devel@nongnu.org; Thu, 13 May 2021 17:02:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620939741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3tZaij37AksZa6/oW2MLPgxkfY5ipUOiwYKj84XrO8s=;
 b=AZAywzmgI14BpiV+d083u41EgzaVqbumT3oW3grGzVa/Ey8ejY45uF3iQz39ETAWVQ4f6r
 XRXXC5I0s7zRh5xfpcYfuVyJhWsPvwfLpewAOGp8DX59upG98ODUucumE2cd6BLKglEjzT
 hsEkedEJxIDok/VTLUqVAW/02aqSWaM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-_9xnR8OTNAOKbKQJjOwDmg-1; Thu, 13 May 2021 17:02:20 -0400
X-MC-Unique: _9xnR8OTNAOKbKQJjOwDmg-1
Received: by mail-qt1-f198.google.com with SMTP id
 k13-20020ac8140d0000b02901bad0e39d8fso18773787qtj.6
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 14:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3tZaij37AksZa6/oW2MLPgxkfY5ipUOiwYKj84XrO8s=;
 b=IqD71uYfPbR+6HeD6uufHy3RSCbRWo38LNOJDSJmMZ3l9uHOu1zLhqOlJOuB1hFMAH
 guz4KXGfC7tkrTJeHTNJn53SWZWnOCD1Htn9/G9Hkeso8FsmerwEARvaRtqCg2hdC+IQ
 r4Bj3bKu08OIrC8oFKRAWUpbkOYIdgmMewyPDPwGo2yUEriGNzV1UTeM0cVAdx/9V+oR
 gsUucTf4WbAkKkv5QEdFVH8OEy6Tm+IjF827Re7iKNP4sv1PQnmKDI5S9VY2JcMSgrhd
 xd3xKdhP4dql5C/1ynZPUa+p2sV/V3FHp7fs4RlDK7TtN10c3lJbHFQdClZe+a3E8fsp
 Dbcw==
X-Gm-Message-State: AOAM533v10lrx5uvStj/Ox2UgR4PtyIqS9TioMO1+jXiu2rWIZjDCj7K
 KiVOunK93+SS4LT27mh8buWBpdeNKSBS/jwuwpREPajOvpN5F6dN9x+cpkZxapiXhe/Ehri3WQ6
 DD+ExbUHQqae9SNM=
X-Received: by 2002:ac8:7fc5:: with SMTP id b5mr39717313qtk.122.1620939739670; 
 Thu, 13 May 2021 14:02:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiEUJ1lwSDKmcHrxG/Qwn0XvtwuhX94BXfhksfmHusn6AyeNJ5WKPAlWBsbmsaddB6TyyXUg==
X-Received: by 2002:ac8:7fc5:: with SMTP id b5mr39717296qtk.122.1620939739504; 
 Thu, 13 May 2021 14:02:19 -0700 (PDT)
Received: from [192.168.1.108] ([177.194.71.112])
 by smtp.gmail.com with ESMTPSA id o135sm3313340qke.124.2021.05.13.14.02.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 14:02:19 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH] MAINTAINERS: convert to JSON
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20190401112945.25592-1-pbonzini@redhat.com>
 <c75b2eb6-4127-61e3-20e0-b572de89668d@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Message-ID: <e49b9ef9-2d01-7a0d-38a1-2891c52a4279@redhat.com>
Date: Thu, 13 May 2021 18:02:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c75b2eb6-4127-61e3-20e0-b572de89668d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Matteo Croce <mcroce@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FYI, I had to setup Thunderbird to reply to you because Gmail web 
interface was crashing when I was trying to expand the e-mail to delete 
the code. So, as Peter mentioned, a nice April fools' joke.


On 5/13/21 3:32 PM, Philippe Mathieu-Daudé wrote:
> Cc'ing John/Willian/Wainer
> 

I think I understand why you brought this thread back now. Finding a way 
to correlate maintainers and tags is, indeed, a nice feature that can 
help with your idea about correlating tags and maintainers to use on tests.

The problem I see is that JSON is a good machine-readable file. It is a 
pain to edit it manually. So, despite the April fools' joke, my 
suggestion would be to create the JSON or any other machine-readable 
file from the MAINTAINERS file using a script.

> On 4/1/19 1:29 PM, Paolo Bonzini wrote:
>> JSON is already in wide use within QEMU for QMP and QAPI, enable
>> wider usage of MAINTAINERS by applying a well-defined machine-readable
>> format.
>>
>> Converting scripts/getmaintainers.pl is left for next year.

Year-base contribution!


