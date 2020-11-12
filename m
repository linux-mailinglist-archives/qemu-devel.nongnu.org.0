Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D44C2B0FD3
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 22:11:32 +0100 (CET)
Received: from localhost ([::1]:46484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdJsR-0005oL-EQ
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 16:11:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdJrG-0004hp-Jo
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:10:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdJrE-0007G9-6S
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:10:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605215414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qj9jNYDof8vPAE0coLqRfkJafmhULYIi5XnfZa/tpOk=;
 b=Wl3dGjnTVy2gOt8si/3G2r9BW75XDIyK9gDNxGLGhscVl4SQFnPCE1SYW/yDBZbePj4Wo0
 3zKNTLWsf4rUuiawXaylF+CATZx8hdPw/4RM7Hyr6RymqU/ZuC8Ry0FHUGxNjqNKyO85x1
 etDs41M7pP4qnEifsmpp0nzhb3OMVsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-hK93DZyoOYK8N5ZiEr2q4Q-1; Thu, 12 Nov 2020 16:10:12 -0500
X-MC-Unique: hK93DZyoOYK8N5ZiEr2q4Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB4771899425;
 Thu, 12 Nov 2020 21:10:11 +0000 (UTC)
Received: from [10.3.113.51] (ovpn-113-51.phx2.redhat.com [10.3.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A6B06EF5F;
 Thu, 12 Nov 2020 21:10:11 +0000 (UTC)
Subject: Re: [PATCH] docs: Better mention of qemu-img amend limitations
From: Eric Blake <eblake@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
References: <20200923203719.732958-1-eblake@redhat.com>
 <CAMRbyytkQDyB6s_+SEOr-09aAVDAWK9=PxGK-_wzsNeeKiU39w@mail.gmail.com>
 <02fe0ea2-a2a0-2618-96f5-df1d7b91d169@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b2e0d546-e28e-264b-38ba-1fe094d8a45f@redhat.com>
Date: Thu, 12 Nov 2020 15:10:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <02fe0ea2-a2a0-2618-96f5-df1d7b91d169@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping^2

On 10/20/20 10:44 AM, Eric Blake wrote:
> On 9/23/20 4:56 PM, Nir Soffer wrote:
>> On Wed, Sep 23, 2020 at 11:38 PM Eric Blake <eblake@redhat.com> wrote:
>>>
>>> Missed during merge resolution of commit bc5ee6da71.
>>>
>>> Signed-off-by: Eric Blake <eblake@redhat.com>
>>> ---
>>>  docs/tools/qemu-img.rst | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
>>> index c35bd6482203..2b5891b54db7 100644
>>> --- a/docs/tools/qemu-img.rst
>>> +++ b/docs/tools/qemu-img.rst
>>> @@ -265,6 +265,10 @@ Command description:
>>>    --force allows some unsafe operations. Currently for -f luks, it allows to
>>>    erase the last encryption key, and to overwrite an active encryption key.
>>>
>>> +  The set of options that can be amended are dependent on the image
>>> +  format, but note that amending the backing chain relationship should
>>> +  instead be performed with ``qemu-img rebase``.
>>
>> Because of the backing format?
> 
> Sorry for not answering this earlier (and now this serves as a ping for
> the patch):
> 
> Consider if you have:
> 
> Base.raw <- Overlay.qcow2
> 
> and want to rebase it to:
> 
> Base.qcow2 <- Overlay.qcow2
> 
> where Base.raw and Base.qcow2 contain identical guest-visible content.
> The problem at hand is that 'qemu-amend' needs to know what the backing
> format is both before the rebase (to know how to properly read the
> existing image) and after the rebase (to ensure that future opens of
> Overlay.qcow2 still properly read the backing format).  But there is no
> obvious command-line spelling to specify the difference between the
> backing format pre-amend and the backing format post-amend.  Maybe we
> could add that, but I felt it was easier to just document that instead
> of trying to amend the image (which involves multiple steps, and may
> require upgrading/downgrading between v2 and v3, which in turn may
> affect decisions on efficiency of representing regions of zero) at the
> same time as the backing file/format, it's easier to just update the
> backing file/format with a stand-alone command.
> 
> I can add that to the commit message, if the patch itself is reasonable.
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


