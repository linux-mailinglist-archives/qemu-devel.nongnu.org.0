Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD139323F3C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 15:48:17 +0100 (CET)
Received: from localhost ([::1]:58740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEvSa-0003O2-Lt
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 09:48:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lEvPe-0001Js-St
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:45:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lEvPc-00032I-0T
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:45:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614177911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NLEC3w7PRMkEZYpnDn9uU1eCWeAsBW6MNICZMYfDT00=;
 b=GP/b+ZQP5Jy7IUK57oJS4FibYhEZnW6EIWFo2S7VNLEnm5lKVW2i+aEDHFjTvahDbR/Z4n
 TGl2GKZvr13ufPHOu/uNMghPhp0BX8qzTmS16nFxZPUTaHnf+b6JzYgKIf4nedxKVnohEb
 MAlPIloPNdPuS1sKzZYQnkNkyUVMvwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-RbBJsuvjMPCd8ZV3DMpGgA-1; Wed, 24 Feb 2021 09:45:09 -0500
X-MC-Unique: RbBJsuvjMPCd8ZV3DMpGgA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BBA690B60A;
 Wed, 24 Feb 2021 13:52:07 +0000 (UTC)
Received: from [10.3.113.71] (ovpn-113-71.phx2.redhat.com [10.3.113.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5ED9160C5F;
 Wed, 24 Feb 2021 13:52:03 +0000 (UTC)
Subject: Re: [PATCH v2 4/4] utils: Deprecate inexact fractional suffix sizes
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210211204438.1184395-1-eblake@redhat.com>
 <20210211204438.1184395-5-eblake@redhat.com> <YDU5d/Ug+Jes4jE0@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <78295ebe-3887-2cdf-679e-0e7bbc93f791@redhat.com>
Date: Wed, 24 Feb 2021 07:52:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDU5d/Ug+Jes4jE0@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org, rjones@redhat.com,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>, tao3.xu@intel.com,
 armbru@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 11:20 AM, Daniel P. Berrangé wrote:
> On Thu, Feb 11, 2021 at 02:44:38PM -0600, Eric Blake wrote:
>> The value '1.1k' is inexact; 1126.4 bytes is not possible, so we
>> happen to truncate it to 1126.  Our use of fractional sizes is
>> intended for convenience, but when a user specifies a fraction that is
>> not a clean translation to binary, truncating/rounding behind their
>> backs can cause confusion.  Better is to deprecate inexact values,
>> which still leaves '1.5k' as valid, but alerts the user to spell out
>> their values as a precise byte number in cases where they are
>> currently being rounded.
>>
>> Note that values like '0.1G' in the testsuite need adjustment as a
>> result.
>>
>> Since qemu_strtosz() does not have an Err** parameter, and plumbing
>> that in would be a much larger task, we instead go with just directly
>> emitting the deprecation warning to stderr.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>>
>> ---
>>
>> I'm not a fan of this patch, but am proposing it for discussion purposes.
> 
> Likewise. I'm *not* in favour of this patch.

Glad we're in agreement.  Consider this one dropped, and I will queue
1-3 through my NBD tree.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


