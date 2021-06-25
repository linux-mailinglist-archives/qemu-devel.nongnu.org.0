Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BD63B3FBC
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 10:48:38 +0200 (CEST)
Received: from localhost ([::1]:35352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhVt-0003dl-Ey
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 04:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lwhTH-0000kt-PJ
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:45:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lwhTE-0005yN-3A
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:45:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624610750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NOOizVuA3Vd+HBjYrZstN+KKFGgQ+6T5YOZwW4LsXPE=;
 b=eqSRzj0uQ0Ia9TC4cMv2OH4HMZxJ5AtJ1GnKoeXxIZLkRPBQf6juTye7ugAa0eh7btKv3x
 csUNjiCLAEoAqv3SnKhahFjy7M0Mdsd33+bg/JSnhWvE1OtBIDQwdimialPJJurijPzEO0
 rhda+dqH7uooAf3JnjrbhwP0CcurmI8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-1KZKeLTDMaieHM_K6ilGnQ-1; Fri, 25 Jun 2021 04:45:47 -0400
X-MC-Unique: 1KZKeLTDMaieHM_K6ilGnQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 u16-20020a5d51500000b029011a6a17cf62so3210277wrt.13
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 01:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NOOizVuA3Vd+HBjYrZstN+KKFGgQ+6T5YOZwW4LsXPE=;
 b=pk5Rs+hk0Ti+VcyDtF7yQVkhp8Scv6OzvJpOOdbCtqFZDvfP3fHnQz+WxdsuvjHqtM
 fFX45ifveXPqOO5+FxBNSL/TKK/UID3MF75IddkyjAlgao0Hj2gYrdFWn9eQ9RyjMcL3
 N7Wm01g+n4isB69igLhhnl8cKDREfTLvnVmuc0Uf3b9eZrXxiw7cFOulGg72A5JdKd4q
 5cqvHr1QWgXThBkgY60gVpxLkm99KN+dPvW5FOPj58zTDLCQWF3gCJxER+hpbz+E0smv
 UJ9nuSMZJuyp7Ql9tHt2MAaFgykEm8ufEW3eGTXY2jz2gKvzuGPn2JeEu26h7rRasqq3
 SDJg==
X-Gm-Message-State: AOAM531FBTc0rzJYj6FfnIPEYfKbIO5WFdcEpta+PnckoAhG9SNtMinI
 i2HRd3DIfQqunre3IlmgjYFxrhF9EKvEk1MzLuB+DCE8lIIIuSehKsffoGGhrr8alyVnphmLbP8
 TI9Rp7F+VpkJy0mI=
X-Received: by 2002:adf:d216:: with SMTP id j22mr9837990wrh.2.1624610746329;
 Fri, 25 Jun 2021 01:45:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpsldfdmJZCvriZXNTNDNDyPtWRco2kkNbW9bzxHeHwjgOeMC3uDtxqUn+3CgK1H9gCEv0uw==
X-Received: by 2002:adf:d216:: with SMTP id j22mr9837969wrh.2.1624610746145;
 Fri, 25 Jun 2021 01:45:46 -0700 (PDT)
Received: from thuth.remote.csb (pd9575d46.dip0.t-ipconnect.de. [217.87.93.70])
 by smtp.gmail.com with ESMTPSA id e17sm6163484wre.79.2021.06.25.01.45.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 01:45:45 -0700 (PDT)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210624183716.515721-1-thuth@redhat.com>
 <YNWUGh2XmQ7eXtmQ@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] audio: Make the AudiodevDriver enum conditional
Message-ID: <4c27da0d-ef3c-c1da-0d80-d8496292b85c@redhat.com>
Date: Fri, 25 Jun 2021 10:45:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNWUGh2XmQ7eXtmQ@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/06/2021 10.30, Daniel P. Berrangé wrote:
> On Thu, Jun 24, 2021 at 08:37:16PM +0200, Thomas Huth wrote:
>> This way, the upper layers like libvirt could have the possibility
>> to use QAPI to find out which audio drivers have been enabled during
>> compile-time of QEMU.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   Note: Marked as RFC since it's quite a lot of ifdef'ing here...
>>         not sure whether I really like it...
> 
> Same as my patch here:
> 
>    https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg00654.html

Oh, nice, I guess it means that it's not such a bad idea to introduce all 
those #ifdefs here :-)

Anyway, looks like my patch was incomplete anyway (I just hacked it together 
after my corresponding DisplayType patch - see 
https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg06529.html), since 
it lacks the wiring via a qapi command, so please disregard this RFC PATCH. 
Are you going to respin your series from March, Daniel?

  Thomas


