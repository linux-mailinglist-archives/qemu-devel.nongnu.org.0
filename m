Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE3A36CAB4
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 19:58:37 +0200 (CEST)
Received: from localhost ([::1]:40102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbRym-0002E8-FO
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 13:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbRur-0007wq-L8
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:54:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbRuk-0005SG-SF
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:54:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619546066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TM+svcTZ/wDka84IRL3/Cdpk8TEPss61VFViHnM1gzk=;
 b=PBmOEvfJL2Xn/Aq6rkSPbbdTMksVDl6MB1j0FxH5cMfFpXYXKOSyDTNm2Wi/CazI9ztIIG
 xNBtdbJq/12m1fQSwiGXlxHDPBJMel22lWkmafcP7JXQuFU3c0Di5owGSAD9F8J+JDkKfJ
 okR4FQjxHQ/fOciDtEfo2O/nBWYcaiM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-aPc9QiAdN_6AbU-b-9vFNA-1; Tue, 27 Apr 2021 13:54:24 -0400
X-MC-Unique: aPc9QiAdN_6AbU-b-9vFNA-1
Received: by mail-wr1-f72.google.com with SMTP id
 t18-20020adfdc120000b02900ffe4432d8bso21071516wri.6
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 10:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TM+svcTZ/wDka84IRL3/Cdpk8TEPss61VFViHnM1gzk=;
 b=IsWQXSzV521q+nXlqfAHEMFJ1txAT05NmAG9Yn8iSZN0rI35L6ueHbLhHU8OoGyNhL
 dHaR/0TMHVflYJnbuGfwPey+SrxafBRt/dz+2wORgx6KdpWw+QWkhWFbfOUD8mN8NUoU
 ZWMvDU3fISUSy6JF4+L5lW+MZ5KhiGNZ37/218ncLBApnw2ztupL6PRXM0AhhyV6cZ0X
 O4HX25flMiWhuBOH6vDkTFeQ0u2y0pUr3oWZ6IQaJ51jLM7rCcK3VllDNhITD3fIqzFV
 uZEBfpAc2PQ5rjqmpnY/hSYH9xqRcMSUIOu2NjRfmA/sNdDrfTwEFADqQgR1jqcvRrJJ
 /YUA==
X-Gm-Message-State: AOAM530v44x7aYuJzDZdx2tt3WpbI6oyY/UvnZxLtR5CPipDiPnvSHgu
 OWhVxfhkuQggSpxUb2hg5jfL0ZCyp5GPwMIduAKTYUc6i6FnF7DPtmjMS+4MPUYLUfmQ92m9KQl
 +oQ3hDOSVC6aMho8=
X-Received: by 2002:a05:6000:1786:: with SMTP id
 e6mr30893303wrg.243.1619546063126; 
 Tue, 27 Apr 2021 10:54:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhK26YARDeJidj992m/5HfBifmGD0U1KOVTqFSbe6GsKhekd+nGL59r0S4A3nSyOOFCxz3QQ==
X-Received: by 2002:a05:6000:1786:: with SMTP id
 e6mr30893284wrg.243.1619546062956; 
 Tue, 27 Apr 2021 10:54:22 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y8sm5673607wru.27.2021.04.27.10.54.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 10:54:22 -0700 (PDT)
Subject: Re: [PATCH] hw/ide: Fix crash when plugging a piix3-ide device into
 the x-remote machine
To: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20210416125256.2039734-1-thuth@redhat.com>
 <4c1c6e99-066e-f916-31dc-acb50caa5320@redhat.com>
 <YIgXlp9Auj+b00aN@stefanha-x1.localdomain>
 <bf5d8b58-3364-3f61-0c89-53f16c64bcb3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5bbdc5d9-692e-63bb-2ad6-38a5711c4021@redhat.com>
Date: Tue, 27 Apr 2021 19:54:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <bf5d8b58-3364-3f61-0c89-53f16c64bcb3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/21 7:16 PM, John Snow wrote:
> On 4/27/21 9:54 AM, Stefan Hajnoczi wrote:
>> I suggest fixing this at the qdev level. Make piix3-ide have a
>> sub-device that inherits from ISA_DEVICE so it can only be instantiated
>> when there's an ISA bus.
>>
>> Stefan
> 
> My qdev knowledge is shaky. Does this imply that you agree with the
> direction of Thomas's patch, or do you just mean to disagree with Phil
> on his preferred course of action?

My understanding is a disagreement to both, with a 3rd direction :)

I agree with Stefan direction but I'm not sure (yet) that a sub-device
is the best (long-term) solution. I guess there is a design issue with
this device, and would like to understanding it first.

IIUC Stefan says the piix3-ide is both a PCI and IDE device, but QOM
only allow a single parent. Multiple QOM inheritance is resolved as
interfaces, but PCI/IDE qdev aren't interfaces, rather abstract objects.
So he suggests to embed an IDE device within the PCI piix3-ide device.

My view is the PIIX is a chipset that share stuffs between components,
and the IDE bus belongs to the chipset PCI root (or eventually the
PCI-ISA bridge, function #0). The IDE function would use the IDE bus
from its root parent as a linked property.
My problem is currently this device is user-creatable as a Frankenstein
single PCI function, out of its chipset. I'm not sure yet this is a
dead end or I could work something out.

Regards,

Phil.


