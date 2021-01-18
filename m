Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8EE2FA058
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 13:50:05 +0100 (CET)
Received: from localhost ([::1]:56414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Tyu-0003qc-IY
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 07:50:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1TwO-0000lL-BW
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 07:47:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1TwJ-0008LJ-ME
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 07:47:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610974042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KdlzUvkNWJbajh0tAjuADZtOah0WplAPdJxg1vrSDYo=;
 b=WeW3LXHEW1A8gJbj2pFWctCJx04CHcFIaOYCv9XLGHxrcNWEy2QjAs4voCsEkcPbTFQOLz
 60OPmQ5j/8NQMHoTclD/wZfACwjiJIHP1TkSLc1y3O70rZSGIeXi5YlJnQBNCBe79VblvM
 tSyJDf+a2J/1XdC2r2JJKqZhnNWLKLA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-OFyhJjlVMcGT9Q5G7hVBvQ-1; Mon, 18 Jan 2021 07:47:20 -0500
X-MC-Unique: OFyhJjlVMcGT9Q5G7hVBvQ-1
Received: by mail-wm1-f71.google.com with SMTP id u1so840472wml.2
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 04:47:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KdlzUvkNWJbajh0tAjuADZtOah0WplAPdJxg1vrSDYo=;
 b=CzbV8JthxlgRdnOZpXthwZBAbW4KfI0w/pnBCrcjPtb9gCcT3Z9U1E3m0xZnJSaCNI
 ggoSR63V8Pm9zxDyZmj8P+v1ye4BDKj8411adP7PWKPo1n6aFhTZtfq8Zmtmdp7O+xR/
 iSpFFPPjIaEVfbeaP+G8PbJWx7iwCyP0SuL7v4xeCSmIzkHF2+VqRkSSDO8l8bO35OYO
 bGHtx+gVNPlY9wXLjeH9MWFi22Wev8wGULkC4nkyDnR8WTNsXGQZfkDVnLTici3CBllT
 nf207oExSg2KmsGToSc+vFnbWx3RibEZrBx4ag9shtO9VzYT/qQAMC12+l7FqnP7lgjt
 OgmQ==
X-Gm-Message-State: AOAM531C7X/B6hGY+PN9SMF16yMw7iWbLrdNkwNgiboZ2yqX6wnlM/zU
 wecgs97b9j/gz0z9lqc9iel6zFKJc2JJLlXS8A4pQIJ161ksH8o9aXNmMaE2pbSJSdkg8O+9LUZ
 rWLVtsFfBr7/DzdI=
X-Received: by 2002:a5d:5227:: with SMTP id i7mr26515593wra.68.1610974039472; 
 Mon, 18 Jan 2021 04:47:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhIfSOTm17Vh8eiCAAHHOAPPskZv6ggtvywRXZuPtBmX7VzFyGew676IAjq5+vZj8V+vqLXg==
X-Received: by 2002:a5d:5227:: with SMTP id i7mr26515584wra.68.1610974039323; 
 Mon, 18 Jan 2021 04:47:19 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l12sm12172548wmj.9.2021.01.18.04.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 04:47:18 -0800 (PST)
Subject: Re: [PATCH 00/28] qemu-option, keyval, vl: switch -object/-M/-accel
 to keyval parsing
To: Kevin Wolf <kwolf@redhat.com>
References: <20201202090305.4129317-1-pbonzini@redhat.com>
 <de8c073c-471b-8149-1200-8c7f061aae37@redhat.com>
 <20210118102944.GB11555@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a601ba95-b6f0-ca53-0256-cec5f7cc5729@redhat.com>
Date: Mon, 18 Jan 2021 13:47:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118102944.GB11555@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: imammedo@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/01/21 11:29, Kevin Wolf wrote:
> Am 17.01.2021 um 17:48 hat Paolo Bonzini geschrieben:
>> On 02/12/20 10:02, Paolo Bonzini wrote:
>>> This series switches -object, -M and -accel from QemuOpts to keyval.
>>> Monitor commands device_add and netdev_add are also switched to keyval,
>>> though -device and -netdev for now are not.
>>>
>>> Along the way, the syntax of keyval and QemuOpts becomes more consistent
>>> and support for keyval-based options is added to -readconfig.  -writeconfig
>>> instead is removed (see patch 13 for rationale).
> 
>> Ping?  It's been over a month (even if with the Christmas vacation).
>>
>> Patches 1-2 were already reviewed so I have included them already.  I would
>> like at least the next 14 patches to go in as soon as possible. (The rest
>> can be routed through maintainer trees or I can post them together with the
>> softmmu/vl.c cleanups).
> 
> On which commit is this based? It doesn't seem to apply to master (maybe
> no surprise), but also not to 5.2.0-rc4, which was the state of master
> when this was posted.

I'll retest and repost.

Paolo


