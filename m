Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F0E18340C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 16:05:14 +0100 (CET)
Received: from localhost ([::1]:42970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCPOa-0003IC-5w
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 11:05:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41114)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jCPMw-0002I3-KI
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 11:03:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jCPMq-0002E2-JX
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 11:03:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20512
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jCPMq-0002Cy-Dq
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 11:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584025402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I3sOONKXHRmNx5FMzMIb4JJGfgiApuNAgQRcqM55cBY=;
 b=IrhGHhM1ASohRWuP+0gAdslIrlbdjqr6FAhdJ800FydORqa1zJlO97MyUn/2yJQ+8QKYWX
 NL4yjDz+XKQtkJrtj+dSNV92Lx1V0G8ehJnsV96oW5ZwMnWxU1w+/Pm1rjwOK5nbw/dpbd
 9Ks8uG7gILCO59djdO95x3YjzrDvs6I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-ybeWCFLoO5SLQWtcSHCX7Q-1; Thu, 12 Mar 2020 11:03:21 -0400
X-MC-Unique: ybeWCFLoO5SLQWtcSHCX7Q-1
Received: by mail-wr1-f70.google.com with SMTP id b11so2748519wru.21
 for <qemu-devel@nongnu.org>; Thu, 12 Mar 2020 08:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I3sOONKXHRmNx5FMzMIb4JJGfgiApuNAgQRcqM55cBY=;
 b=U3mEuiBjaH4mf0bmDBifqgjiFxQQ4orXGl9zTPlWOKd9VzyGcv81rgXG8A8pXJkJ98
 ky+0C9Ixb1P2JBvQ3ZdIfpt2r6t7HsV/qjw22l6PXnYbbGPh+yxDtK0pMj0UpdY/5Ghl
 POicNxA0Aw0ijnzUwqLAXcQJhMOY94Xdp8oevJktA1NXOiEwpeNbl/YRjxFebR30UjVE
 eniNf5OY++if0PrJEd6FKup2kCmMg2dwlym+onROoig16TQOhIrl6XH5PvkuNVqzQH0v
 WzYAB9brsmMFBStBShEqrNGxZQQQiYTKrDW2yhCi7HjTEOUdhVXYieARBp6H8+q2Ycdx
 5abw==
X-Gm-Message-State: ANhLgQ2FR2KrQsmu2cxRaxK4JqxOcAxIFLvUwzctdWoifxfW6HOSl22q
 YxPQprjjV+WQetRU7mqfxnwpRMm7gVAjiViP0S1LVv7Sg/TMJiJUX2/rHnTl7Nd1THoepGQUU74
 vULI+yxbV+rF4Fu4=
X-Received: by 2002:a7b:c381:: with SMTP id s1mr4150738wmj.0.1584025400215;
 Thu, 12 Mar 2020 08:03:20 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsBM3OkhUOIWjEXTWNznIOlwPwOgPW42415X+4fBtSvxhwFCWI70WvVLXeJvUHAtarCm50jUw==
X-Received: by 2002:a7b:c381:: with SMTP id s1mr4150711wmj.0.1584025400025;
 Thu, 12 Mar 2020 08:03:20 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.173.186])
 by smtp.gmail.com with ESMTPSA id m25sm12223091wml.35.2020.03.12.08.03.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2020 08:03:19 -0700 (PDT)
Subject: Re: [PATCH qemu v8 3/3] spapr: Implement Open Firmware client
 interface
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org
References: <20200310050733.29805-1-aik@ozlabs.ru>
 <20200310050733.29805-4-aik@ozlabs.ru>
 <e7a4f200-7f02-1e71-2a52-3e03b00f8af5@redhat.com>
 <851e92f4-202f-bd8c-d790-5bb96701aac2@ozlabs.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bb63a63e-30a1-1627-5a01-becd54d999ad@redhat.com>
Date: Thu, 12 Mar 2020 16:03:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <851e92f4-202f-bd8c-d790-5bb96701aac2@ozlabs.ru>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/20 02:26, Alexey Kardashevskiy wrote:
>> Thank you very much Alexey!  At least, since it can run petitboot, it's
>> not completely useless.
>>
>> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>>
> 
> Cool, thanks! Have you tried it yourself or you are just taking my word
> for it? :)

Unfortunately I haven't. :)

Paolo


