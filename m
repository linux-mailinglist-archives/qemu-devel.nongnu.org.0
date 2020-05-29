Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CDE1E7C8A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 14:03:25 +0200 (CEST)
Received: from localhost ([::1]:49070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jedjQ-0000So-GJ
	for lists+qemu-devel@lfdr.de; Fri, 29 May 2020 08:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jedhw-0007IW-Nd
 for qemu-devel@nongnu.org; Fri, 29 May 2020 08:01:52 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:29472
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jedhv-0005zI-1T
 for qemu-devel@nongnu.org; Fri, 29 May 2020 08:01:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590753710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lhj4ltU7rIWq36z0li+Sxa7AwwW73HbWPiZtwtFJmT8=;
 b=Fd5yZ6WmpMrplYvbqCe2ZobFGc4F9bsMPcqC+pJjsXiXNFM9dPM2n6FH5Y8/LHM5eL1GVW
 L78vwhchu3RogDj7OBAk5jjSNqTv/pHdw6rNHQgpRiKy+Mf1QNaggv8nrsJcQ0tFNo0t1W
 mFYNcnG/4BhbbpVr9iMGT5x2c/AAObY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-ysa-trahNcav07VP1EFjFQ-1; Fri, 29 May 2020 08:01:44 -0400
X-MC-Unique: ysa-trahNcav07VP1EFjFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF6731800D42;
 Fri, 29 May 2020 12:01:43 +0000 (UTC)
Received: from [10.3.112.88] (ovpn-112-88.phx2.redhat.com [10.3.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC1E778366;
 Fri, 29 May 2020 12:01:43 +0000 (UTC)
Subject: Re: [PULL v3 00/11] bitmaps patches for 2020-05-26
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20200528181849.1823820-1-eblake@redhat.com>
 <9311ff39-d237-4d14-cc73-b4e38b7e40c1@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <6f98a951-eb79-91da-dff5-4035c875705b@redhat.com>
Date: Fri, 29 May 2020 07:01:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9311ff39-d237-4d14-cc73-b4e38b7e40c1@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/29 03:05:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/29/20 12:37 AM, Vladimir Sementsov-Ogievskiy wrote:
> Hi!
> 
> Strange thing with your pull requests: I receive only small part of 
> them.. I thought it's my problem of receiving part, but now I've checked 
> that in mailing list archive there are same only two emails: 00/11 and 
> 08/11 https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg08061.html

It was intentional for both v2 and v3:

> 
> 28.05.2020 21:18, Eric Blake wrote:

>>
>> v3: port sed expression to BSD sed
>> v2: fix iotest 190 to not be as sensitive to different sparseness of
>> qcow2 file on various filesystems, such as FreeBSD (sending only the
>> changed patch)

and I even tried to mention what I was doing, although I also see how it 
could have been easy to miss that buried in the middle of the cover letter.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


