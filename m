Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFAB2B1C04
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 14:43:35 +0100 (CET)
Received: from localhost ([::1]:59454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdZMU-0007Ni-3i
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 08:43:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdZJT-0005IF-6F
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 08:40:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdZJQ-0001nM-JK
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 08:40:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605274823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nCtfiF1kCv1BGM6t7bOPbrPqh18WICLgRMZG07Nlwhk=;
 b=Jw6/O9iOej769LjBw+CusRB7enyVoPMtbR4uuFKIHQn1FK0S7xid3CpICN8MBIUKZv7qIn
 sYVo/TeZcx1H+02Nnrwq/CXVQW7t942JnCE4O+gwuT7Pjkhy2+QDmdVlTR9ucLdxb8pQzI
 2fQdLD9m0WbIZCVajbvqvK+VA3AiagI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-1yt7f8t4Ma2wCAFU4ItM5Q-1; Fri, 13 Nov 2020 08:40:20 -0500
X-MC-Unique: 1yt7f8t4Ma2wCAFU4ItM5Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3C0318B9EC3;
 Fri, 13 Nov 2020 13:40:19 +0000 (UTC)
Received: from [10.3.113.51] (ovpn-113-51.phx2.redhat.com [10.3.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72D8876644;
 Fri, 13 Nov 2020 13:40:19 +0000 (UTC)
Subject: Re: [PATCH] docs: Better mention of qemu-img amend limitations
To: Kevin Wolf <kwolf@redhat.com>
References: <20200923203719.732958-1-eblake@redhat.com>
 <20201113094956.GC5834@merkur.fritz.box>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <395f0c67-6526-6621-3e49-a87e76c2a0d3@redhat.com>
Date: Fri, 13 Nov 2020 07:40:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113094956.GC5834@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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

On 11/13/20 3:49 AM, Kevin Wolf wrote:
> Am 23.09.2020 um 22:37 hat Eric Blake geschrieben:
>> Missed during merge resolution of commit bc5ee6da71.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>  docs/tools/qemu-img.rst | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
>> index c35bd6482203..2b5891b54db7 100644
>> --- a/docs/tools/qemu-img.rst
>> +++ b/docs/tools/qemu-img.rst
>> @@ -265,6 +265,10 @@ Command description:
> 
> Adding a little more context:
> 
>>    The set of options that can be amended are dependent on the image
>>    format, but note that amending the backing chain relationship should
>>    instead be performed with ``qemu-img rebase``.
>>
>>    --force allows some unsafe operations. Currently for -f luks, it allows to
>>    erase the last encryption key, and to overwrite an active encryption key.
>>
>> +  The set of options that can be amended are dependent on the image
>> +  format, but note that amending the backing chain relationship should
>> +  instead be performed with ``qemu-img rebase``.
>> +
> 
> I think the problem is your local conflict resolution. This patch would
> duplicate the paragraph.

D'oh.  Thanks for spotting that, patch withdrawn.


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


