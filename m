Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DA21F5D1F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 22:26:07 +0200 (CEST)
Received: from localhost ([::1]:53612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jj7IU-00055T-5J
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 16:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jj7HL-0004Su-GJ
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 16:24:55 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43336
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jj7HK-0004pS-BJ
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 16:24:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591820692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Wbws7/1lywR6Cd6iltJb5nwCJ5B+e2OezziK5Ywyrk=;
 b=AZaj4O65CjWNOmppTtovJW/IWpdVu9cWCz07HBlfksChCBC1Ad/Ibx9NpkX/0RDY60Yn0X
 EB6rhb9Bq8cTgaGJXkqenOA4RXO4hpOkePT2RkU8r0gabEKBOkrnLA3p6ITlqZjNHOkpw0
 6PmqU5vOCrNxja1r8nQULSf1Guzb4t8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-pZ6laOESNoWW0uS_LPIdmA-1; Wed, 10 Jun 2020 16:24:48 -0400
X-MC-Unique: pZ6laOESNoWW0uS_LPIdmA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2ED20801504;
 Wed, 10 Jun 2020 20:24:47 +0000 (UTC)
Received: from [10.3.113.22] (ovpn-113-22.phx2.redhat.com [10.3.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B7661017E2B;
 Wed, 10 Jun 2020 20:24:46 +0000 (UTC)
Subject: Re: [PATCH v8 34/34] iotests: Add tests for qcow2 images with
 extended L2 entries
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1591801197.git.berto@igalia.com>
 <898d88297e4d81aa744b5a39974224f3ae5c0543.1591801197.git.berto@igalia.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <9de25111-d171-6fd0-49a9-e91d0dccb791@redhat.com>
Date: Wed, 10 Jun 2020 15:24:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <898d88297e4d81aa744b5a39974224f3ae5c0543.1591801197.git.berto@igalia.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 23:51:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Derek Su <dereksu@qnap.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/20 10:03 AM, Alberto Garcia wrote:
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>   tests/qemu-iotests/271     | 801 +++++++++++++++++++++++++++++++++++++
>   tests/qemu-iotests/271.out | 676 +++++++++++++++++++++++++++++++
>   tests/qemu-iotests/group   |   1 +
>   3 files changed, 1478 insertions(+)
>   create mode 100755 tests/qemu-iotests/271
>   create mode 100644 tests/qemu-iotests/271.out
> 

Big, but looking rather thorough.

Patch 31 has conflicts on 31, 36, 61, and 291, when compared with my 
pending pull request that improves qcow2.py output:
https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg02527.html

although the resolution is obvious enough: regenerate those .out files. 
With that done, I was able to apply the series and test this.

Tested-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


