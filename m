Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C3A38F1BD
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 18:46:42 +0200 (CEST)
Received: from localhost ([::1]:60050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llDiy-0007at-Uc
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 12:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1llDY6-0005a6-CW
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:35:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1llDY1-0002Ib-TI
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621874119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LNRBA7ez0iQI67D1OZRienojz578kYcs8mSiM/YkcXI=;
 b=XEeF/EDi3HbIXIIimJLWi3aZfqwOJWaMaNjFumNX1My4vOagtLHRMZ7oQToH3EKr2asrGA
 zNuUxASlUSpxl6z0XRU8i18qAzo1wUS78xhcYobhOPC4eLdyYpwpTx3KlOoFtwnb1qLEbt
 s4ZxQuWwj9jnSOMaswY0qhyjJYO6xvA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-31hFly3IOgGqF5HPerN1jw-1; Mon, 24 May 2021 12:35:17 -0400
X-MC-Unique: 31hFly3IOgGqF5HPerN1jw-1
Received: by mail-ed1-f71.google.com with SMTP id
 h16-20020a0564020950b029038cbdae8cbaso15816498edz.6
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LNRBA7ez0iQI67D1OZRienojz578kYcs8mSiM/YkcXI=;
 b=P4ldoHjkFsd3FOPtgeRezhIMEvTE6z9EM6URqN4NRzjBZovlKaeOFCcnPQ9wTDN6Ql
 uysyyfvc1U6rvgkgZB8DJE2IIizhz9wSj65mwchU6/kCWnWlq8IsvcoH4jKkjWHua5XR
 +lsZ5Vzo/rXkhCWfSmMWpelubmuJLHwAxoeEkVik5JxzM2Y0kCJbK5Cz5XrcOXHLy503
 fj9Ow/bSGQTZgPr5t5gFMKUp0ZLDzu8zvQ5MC8UVwOH2pOW9CJux4wdCv7EOR9qje/dU
 rU8esBNo8uyyPNVRlBAzJJ/3dVmIIKZq4hV7Ju/Ne3k2GbfjbmS34E5CVETOYjC2qN8h
 Y20g==
X-Gm-Message-State: AOAM533cVQc/s/6CY5td+alKVci6QqNS6Xxw5YoTfYEUtF+wH4bB/+WE
 9dZXZurp2TnwyhfvTIA3kNCWY80eP4xB1aPlC94vtk6ywLGErR8ZPm0dWqA6Dte7H4/b6V9++NN
 HzzEhwDD1NqfRQ8U=
X-Received: by 2002:aa7:cad4:: with SMTP id l20mr26514950edt.382.1621874116345; 
 Mon, 24 May 2021 09:35:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz00jnH+s/b3Sm4FhTIdiISkyOHnUNufMdwDoMwhBiVanw2ZfXF9O3H6Jc8OJpYB6xD5Xv6uQ==
X-Received: by 2002:aa7:cad4:: with SMTP id l20mr26514933edt.382.1621874116170; 
 Mon, 24 May 2021 09:35:16 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg18sm7976414ejb.41.2021.05.24.09.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 09:35:15 -0700 (PDT)
Subject: Re: [PATCH 0/5] block: file-posix queue
To: Kevin Wolf <kwolf@redhat.com>
References: <20210518083901.97369-1-pbonzini@redhat.com>
 <YKO/2COfzVc0pHIQ@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f5da00ad-b04a-21ec-06d0-5573d44b7814@redhat.com>
Date: Mon, 24 May 2021 18:35:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKO/2COfzVc0pHIQ@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/05/21 15:23, Kevin Wolf wrote:
> Am 18.05.2021 um 10:38 hat Paolo Bonzini geschrieben:
>> Hi Max/Kevin,
>>
>> this is a combination of two series that both affect host block device
>> support in block/file-posix.c.  I suspect both of them evaded your radar,
>> so I'm grouping them together and sending them out again.
> 
> Is this based on any other series? The first two patches seem to fail to
> apply, on my block branch as well as on master.

It should have been six patches not five.  I'll resend.

Paolo


