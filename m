Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1BD36B548
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 16:56:51 +0200 (CEST)
Received: from localhost ([::1]:39134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb2fK-0007hq-4V
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 10:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lb2dR-0006MU-Hh
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 10:54:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lb2dP-0001NF-1T
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 10:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619448890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YLDe9hP/qN7ivEtI2/jURxk63GgVuwS1TwQDkabjd/c=;
 b=SgCYndqyXvPRfhuM8iHoE6fu5Q9Ka9C0VCaH9f+75dQ1hja+ow3/HK51d5YJkHFSHfPgQl
 DP4+UVSfoNkANvrd0P+8ex9BF9Iswc3vz5lOXOYu1gZ3nwcfghfqzLQHwWVG1uiV3/w/P8
 TRoKn9vUcrrZBFWYkkTVyd1RLv7t8pE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-Yu2-RwijOc62LWS__QUILg-1; Mon, 26 Apr 2021 10:54:46 -0400
X-MC-Unique: Yu2-RwijOc62LWS__QUILg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6FDE83DD20;
 Mon, 26 Apr 2021 14:54:45 +0000 (UTC)
Received: from [10.36.112.156] (ovpn-112-156.ams2.redhat.com [10.36.112.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 748BD5C701;
 Mon, 26 Apr 2021 14:54:41 +0000 (UTC)
Subject: Re: X on old (non-x86) Linux guests
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <YIaPdjz7PpvwVPP/@work-vm>
 <94728962-8306-4849-7e54-e01b04f3ddc4@redhat.com> <YIbLr64oju1ZZnXQ@work-vm>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <780e806a-f0d6-7dc6-2a44-c83ae86ee31e@redhat.com>
Date: Mon, 26 Apr 2021 16:54:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIbLr64oju1ZZnXQ@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: kraxel@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/04/2021 16:18, Dr. David Alan Gilbert wrote:
> * Laurent Vivier (lvivier@redhat.com) wrote:
>> On 26/04/2021 12:01, Dr. David Alan Gilbert wrote:
>>> Hi,
>>>   Over the weekend I got a Red Hat 6.x (not RHEL!) for Alpha booting
>>> under QEMU which was pretty neat.  But I failed to find a succesful
>>> combination to get X working; has anyone any suggestions?
>>>
>>>   That distro was from around 2000; the challenge is since we don't have
>>> VESA on non-x86, we can't change mode that way, so generic XF86_SVGA
>>> doesn't want to play with any of the devices.
>>>
>>>   I also tried the ati device, but the accelerated mach64 driver
>>> didn't recognise that ID.
>>>
>>>   Has anyone found any combo that works?
>>> I suspect using one of the existing devices, lying about PCI ID, and
>>> then turning off all accelerations might have a chance but I've not got
>>> that far.
>>>
>>> [Alpha took a bit of a fight; none of the SCSI controllers were
>>> happy, but the CMD646 worked well enough to install off a CD image
>>> from a -kernel passed in ]
>>>
>>
>> Did you try to use kernel framebuffer with X fbdev driver?
> 
> I hadn't, but how do I get it into fb mode - vga=ask doesn't work, so
> again I don't think I can get into graphics.

In kernel 2.2, it seems to be "video=[FB]", perhaps video=atyfb ?

thanks,
Laurent


