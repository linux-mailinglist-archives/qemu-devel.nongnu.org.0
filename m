Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEEF32292A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 12:00:36 +0100 (CET)
Received: from localhost ([::1]:54426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEVQh-000100-2r
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 06:00:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEVPe-0000XG-5v
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 05:59:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEVPc-0000dh-HG
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 05:59:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614077967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VSLHQed8g/FeU/Q3xVYzmIVfvPpoGIElc5ie/ST8DEo=;
 b=EHBElwEvIydIzHWRtyU8mQBiLJP8SQjWJHcEV+5/vLS2ySntQD05E5bM67AR5e1u4HgU7T
 Fw7JXgxbtb5doeNmmbV+NhBGfgUEjMWVOKdRQC5pXa0x+i0XSjEx19bpvSZUdajldnx52p
 EySmFS6+OKu4yJN05ioViT16rkaqPKE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-2l4nUUlLNwOspRfhOYa8mA-1; Tue, 23 Feb 2021 05:59:24 -0500
X-MC-Unique: 2l4nUUlLNwOspRfhOYa8mA-1
Received: by mail-ed1-f72.google.com with SMTP id t18so6648313edr.19
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 02:59:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VSLHQed8g/FeU/Q3xVYzmIVfvPpoGIElc5ie/ST8DEo=;
 b=RZxskKq3yijdp7u6vZ/kTZ+T8ip+ouzudjsUezLBXtAdph9x53T1dG6HoiJXm+Z+Xw
 zA6B3eFeV5O00ulQl0F2k5ACUFMCYGQcimXfcmtnNjv9qvWND984VRsl4l4F0NI4YhZp
 7TEN+cebebVV9hO6ByZjhxl3Ef6KHXPHKm4FZUynbntZXT+3gZX0llUtv0CvahTP5Sk+
 Ce7eDqQJhMrxfwfKKolTQpELPYYsYQTDtunP3eR9CSP/4iufzGhvcyD2iENcybm61Ccs
 LbCzmEmZQ0HCvpBNvGnbfN+CwKTcdYaQWYKr//YZQ8xAQw/3yql8Q8GrWAKe6nGC8q6N
 R/RA==
X-Gm-Message-State: AOAM532OgDQWNpbC4xyfvtTnPIyP6UM/JftWfNar57kMcqDB0QjNa34e
 leXxd/Badyt39+66XQg0/2buuqm7GoIEarqMmRgvhnSiD1WOA/VeYRcMCBdXYddDlBWxd2lk0er
 PeEfQBrX7wXaMHVMxwfyG7UJBvvM4hmSsPZm7r/+DDZ7nVoEKOSO0LLY/upCfd/FdiGM=
X-Received: by 2002:a05:6402:715:: with SMTP id
 w21mr11523652edx.177.1614077962730; 
 Tue, 23 Feb 2021 02:59:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOYncQLghtJCXP+xI8QQQx6cINRP5TcW3FIqMpgpgqLlQm+ekvhSfuGNRgw9Q8sjd+LWnb5g==
X-Received: by 2002:a05:6402:715:: with SMTP id
 w21mr11523631edx.177.1614077962453; 
 Tue, 23 Feb 2021 02:59:22 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x21sm5629441eds.9.2021.02.23.02.59.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 02:59:21 -0800 (PST)
Subject: Re: A brief look at deprecating our JSON extensions over RFC 8259
To: Markus Armbruster <armbru@redhat.com>
References: <875z2knoa5.fsf@dusky.pond.sub.org> <YDPMs1Hu8LDRJUhX@redhat.com>
 <c5d13648-445d-92b9-6bff-95bd2b99d52e@redhat.com>
 <87y2fff90p.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f883798f-8054-61a3-a1ec-a1e80b6c2f4b@redhat.com>
Date: Tue, 23 Feb 2021 11:59:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87y2fff90p.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/02/21 10:06, Markus Armbruster wrote:
>> Markus, did you rebuild the qtests after disabling single-quoted
>> strings?  "make check-qtest-x86_64" would have rebuilt them, but I'm
>> confused by the results.
> I ran "make check" and looked at the failures:
> 
> Still confused?

Yes.  What's the patch that you used to disable the single quotes, and 
why didn't the patched parser choke on

     response = qmp("{ 'execute': 'qom-get', 'arguments': { 'path': %s, "
                    "'property': 'temperature' } }", id);

?

Paolo


