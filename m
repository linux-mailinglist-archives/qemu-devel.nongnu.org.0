Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D94B9452F59
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 11:42:00 +0100 (CET)
Received: from localhost ([::1]:55562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmvua-0007IB-06
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 05:42:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmvtg-0006Ty-N5
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 05:41:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmvtd-000281-RD
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 05:41:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637059260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pLJuSDE5I4FFe5aVbF3Qc45HT5I6Uuq+NOTPa2SYe4Y=;
 b=X2IiVchuCXW+x9SoVYFFEsQlo78XSjbEau9EGcHLSDL73E6cE0v/3vkL+icYHuV0M0i2mk
 wtbqlJhE7hKbuwK5l69foUt+4VzJrsifIzoReWKevlUayl3kYVyZBFuTH9zqyTb8KqDHOL
 z+4yYDxAgWpIRp47NJ43TB5d42w0bDU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-0LqPHf0FMK6c7OLLLvwGJA-1; Tue, 16 Nov 2021 05:40:58 -0500
X-MC-Unique: 0LqPHf0FMK6c7OLLLvwGJA-1
Received: by mail-wr1-f69.google.com with SMTP id
 p3-20020a056000018300b00186b195d4ddso4362406wrx.15
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 02:40:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pLJuSDE5I4FFe5aVbF3Qc45HT5I6Uuq+NOTPa2SYe4Y=;
 b=StrKDgBwL0nY7iEsNtAzUiknisvch/SgmiXZ9zkjG8GJq8xBBo+TCZvRDotvkOrG5B
 qBegfYbR8kXFpvt3X3qRI4aUMI7kRjtcjLyRIFJgI5mvCxGWcZzz5O46jsAQNIE7Dh1a
 am1/1jQfhwVXi33yL3akCUuBEGNHT9ws9RGXcf1/oueVDfMM0hiIXQGH+46C/D0mTcQX
 n2tbS7F3g2z5yCgR6yt/b6s4TQTE01iuTmmuv53wjLD35iOco1DYsa1/wx6LgXlSrt4o
 FhY1MHfBdkTGZCV9Q81EFovIFuF59eDoeUXN/BH5z4mzY9pqxzR/Rr1jPlXhbJzZaU2N
 lk6A==
X-Gm-Message-State: AOAM530GjFuK4E9xr1X/RZMunknTdk6xDaQNqFOXjJheatgDvI2p6OUI
 fNbOef4C2cZg5Dyp/XKPEDTQmnu+GuzvBdrRU0L4Cwwcln+T3kLdIYJcHuhQCN9U2LhQ9Vy6MFC
 sazoAybN3e8cZpbo=
X-Received: by 2002:a7b:c010:: with SMTP id c16mr6513962wmb.141.1637059257728; 
 Tue, 16 Nov 2021 02:40:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvglWxE9EXqQWZZgmBkHPdafGkmGYIviLI+JD/hDRa4bRtl2mWJj69O2guLAHb+SOdRglQ4A==
X-Received: by 2002:a7b:c010:: with SMTP id c16mr6513939wmb.141.1637059257554; 
 Tue, 16 Nov 2021 02:40:57 -0800 (PST)
Received: from [192.168.43.238] (85.red-95-127-186.staticip.rima-tde.net.
 [95.127.186.85])
 by smtp.gmail.com with ESMTPSA id w4sm5156254wrs.88.2021.11.16.02.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 02:40:57 -0800 (PST)
Message-ID: <06f45f57-c034-7286-cb89-358272938e3b@redhat.com>
Date: Tue, 16 Nov 2021 11:40:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Cirrus-CI all red
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <701011ce-8bc1-9e93-82ed-a4d72c70b2da@redhat.com>
 <4e540821-9bc2-77b5-ad70-ebc5df53e039@redhat.com>
 <YYpF4coXvnStffD5@redhat.com> <87fss5k1lv.fsf@linaro.org>
 <YYpcR/SBHNlqj5CV@redhat.com>
 <938ec78f-1ca1-f3df-26be-790e53d9cc7e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <938ec78f-1ca1-f3df-26be-790e53d9cc7e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yonggang Luo <luoyonggang@gmail.com>, Ed Maste <emaste@freebsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 10:15, Thomas Huth wrote:
> On 09/11/2021 12.32, Daniel P. Berrangé wrote:
>> On Tue, Nov 09, 2021 at 11:27:42AM +0000, Alex Bennée wrote:
>>> Daniel P. Berrangé <berrange@redhat.com> writes:
[...]
>>> It seems to be triggering the builds now although GitLab still reports
>>> failures for some other reason now.
>>
>> The cirrus-run image we're using is lockde to version 0.3.0. I'm
>> testing an update to version 0.5.0 which has various reliability
>> fixes, essentially around making it retry on transient errors.
> 
> We should maybe also simply bump the timeout for the cirrus jobs ...
> sometimes they get delayed and just need a little bit more than 60
> minutes to finish ... so would it be OK to us 70 or 80 minutes here?

Sounds a good idea, this would be more useful that what we have now.


