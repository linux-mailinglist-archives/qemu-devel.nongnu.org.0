Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D433C6CCE
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 11:01:46 +0200 (CEST)
Received: from localhost ([::1]:37446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3EIT-0003Na-AR
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 05:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m3EH7-0002SQ-9b
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 05:00:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m3EH3-0004LM-2V
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 05:00:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626166815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1I0u++z2Fc13trsY0pqHVCI2Rtu9xb+BxWSzbQhAKW8=;
 b=dkpl78XwecStIqazFI1GahGzK5XWcHH0xrYPD1Hsbz76JOMUwjk5++V79CD1xcC/dNxINi
 BIHQYsv7e6c8qFaTbGDpgdR/cWSILz/V9gIWXO5r9QTypK0AuUhws0PRuoTidhWKkuFjqf
 UBjVuA0vFBSO/eqI6OFuIDIoAcxSQNY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-1I1DUj48PnCQNAk0pRQQhQ-1; Tue, 13 Jul 2021 05:00:12 -0400
X-MC-Unique: 1I1DUj48PnCQNAk0pRQQhQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 u13-20020a5d6dad0000b029012e76845945so8399550wrs.11
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 02:00:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1I0u++z2Fc13trsY0pqHVCI2Rtu9xb+BxWSzbQhAKW8=;
 b=iJajoTk2bJ/FT6Ea+wEtQO495NlWS+vq63OId4dkJz/0lE9L0yBheoa1Dshku3grsV
 fBY3lqFuadmP1df7D+TUBS5urXjU/gFMxiOBXFzNgEkc9Jmabe4htvIdxsmAk9O31eAy
 G1KaigcNWz6l/Y61TSwE/CWpq/0sWuEEeusH2U4dO/8yIV8c9tFTOYqRInNnTh1dxzd4
 ve+XeSqjaWBz1JMyxSP9kFmu2g326/muklhfKH8qK/BPGvbZU78rjjTO5aoR4AVFq2tD
 +dRn9GXSlXXYZNGIjVlRih/82Kg14JuD5r/xOluu27+SerNX5cXI7tE7NckGy5briI/N
 HTpg==
X-Gm-Message-State: AOAM532I79K09EmtAPFxGgUk/qPwPu/TyYjx8QMzcIwkuQAfZR9Sqfc/
 hKAadTut0EttDj/KQ8hpJrEm5tgDz98FCLNpD9j5IJTU2J+PWEHso2Y027uJTxBqJ+25MC2cxzn
 ZEvPR3IGHGT7eecw=
X-Received: by 2002:a5d:457b:: with SMTP id a27mr4179775wrc.280.1626166811726; 
 Tue, 13 Jul 2021 02:00:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypRyC9r6Djzswd/yssj4SQfiGqde5y+s1WvsNIzkKJxmPSuiJU6McJIzJSjSvhjkk50+CsDg==
X-Received: by 2002:a5d:457b:: with SMTP id a27mr4179742wrc.280.1626166811500; 
 Tue, 13 Jul 2021 02:00:11 -0700 (PDT)
Received: from thuth.remote.csb (pd9575fd2.dip0.t-ipconnect.de.
 [217.87.95.210])
 by smtp.gmail.com with ESMTPSA id p18sm1672960wmg.46.2021.07.13.02.00.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 02:00:11 -0700 (PDT)
Subject: Re: configure --without-default-features confusion
From: Thomas Huth <thuth@redhat.com>
To: Cole Robinson <crobinso@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <d7cb1c8f-036d-1be8-e259-cd71ce8a1649@redhat.com>
 <3261e019-9240-0fe2-0872-e5a77100957e@redhat.com>
Message-ID: <f669c64e-416e-1858-5f27-0bde8fe8293e@redhat.com>
Date: Tue, 13 Jul 2021 11:00:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3261e019-9240-0fe2-0872-e5a77100957e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/07/2021 09.20, Thomas Huth wrote:
> On 08/07/2021 21.12, Cole Robinson wrote:
>> Hi all,
>>
>> I'm a bit confused about the intended scope of ./configure
>> --without-default-features. When I try it here there's still lots of
>> stuff enabled:
>>
>> $ ./configure --without-default-features
>>      ...
>>      VNC support                  : YES
>>      VNC SASL support             : YES
>>      VNC JPEG support             : YES
>>      VNC PNG support              : YES
>>      brlapi support               : YES
>>      vde support                  : NO
>>      netmap support               : NO
>>      Linux AIO support            : NO
>>      Linux io_uring support       : YES
>>      ATTR/XATTR support           : YES
>>      RDMA support                 : NO
>>      PVRDMA support               : NO
>>      ...
>>
>> So rdma/pvrdma, which I have libs for, are disabled, but brlapi, which I
>> have libs for, is auto enabled. VNC is not dependent on any external
>> libraries, but it's still enabled. Etc.
>>
>> ...okay now that I poke at this a bit, the brlapi bit and most (but not
>> all) other features are disabled if I fix this:
>>
>>> diff --git a/configure b/configure
>>> index 650d9c0735..a71ebe10ff 100755
>>> --- a/configure
>>> +++ b/configure
>>> @@ -5189,7 +5189,7 @@ if test "$skip_meson" = no; then
>>>           -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
>>>           -Dvhost_user_blk_server=$vhost_user_blk_server 
>>> -Dmultiprocess=$multiprocess \
>>>           -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek 
>>> -Dguest_agent_msi=$guest_agent_msi -Dbpf=$bpf\
>>> -        $(if test "$default_features" = no; then echo 
>>> "-Dauto_features=disabled"; fi) \
>>> +        $(if test "$default_feature" = no; then echo 
>>> "-Dauto_features=disabled"; fi) \
> 
> Looks like you've found a bug... Could you please send this as a proper 
> patch to the mailing list?
> 
>> But there's still a handful of things that are left enabled, for example
>>   VNC, xen, vhost-vdpa, ...
>>
>> Is the intention for this knob to be a 'disable everything'?
> 
> I guess yes, but I think it's still work in progress ... not every feature 
> has been revisited since this switch has been introduced.

Ok, scratch that sentence. After looking at configure and meson.build in 
more details, these rather seem like bugs to me.
I'm hacking some patches, will post them later today.

  Thomas


