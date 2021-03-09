Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66C9332FE1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:30:03 +0100 (CET)
Received: from localhost ([::1]:48156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJizS-0003up-US
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:30:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJiLj-0000gW-KO
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:48:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJiLg-0000gt-Fv
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:48:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615319335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZbjjoYGyeamDwuZt0Cr/b29TlJGpAUVhTXlKi+Ew2zM=;
 b=TpKKnUbcnct/GAAfC55lJk1h913wZweddl3166TDv2ZEZduLZ6aegXFTGj7+tmTZotY0IS
 aTfXYZkdJHCy+iKdAxgX5QrgfTHDj82SLAyZTVtONdZGDSJDrWagyebFinSoug3G+tCxw7
 6gfWhm4hwASy+8v0Ur5m8pHoC4OZ6/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-RdTQUe2HP8uRKwZxEdOymQ-1; Tue, 09 Mar 2021 14:48:51 -0500
X-MC-Unique: RdTQUe2HP8uRKwZxEdOymQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47207107465C;
 Tue,  9 Mar 2021 19:48:50 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8642860C13;
 Tue,  9 Mar 2021 19:48:41 +0000 (UTC)
Subject: Re: [PATCH v2] MAINTAINERS: Fix the location of tools manuals
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org, 
 Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <20210204135425.1380280-1-wainersm@redhat.com>
 <516694bd-42fe-7929-811b-545f257c58bf@redhat.com>
 <dd85243c-860d-e915-295d-8292d0a2f36f@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <dd68974a-d2df-88ea-52fc-fb8def4b4ee3@redhat.com>
Date: Tue, 9 Mar 2021 20:48:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <dd85243c-860d-e915-295d-8292d0a2f36f@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: peter.maydell@linaro.org, Qemu-block <qemu-block@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, dgilbert@redhat.com,
 stefanha@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/2021 18.41, Wainer dos Santos Moschetta wrote:
> Hi,
> 
> Any issue that prevent this of being queued?

Maybe it's just not clear who should take the patch ... CC:-ing qemu-trivial 
and qemu-block now, since I think it could go through the trivial or block tree.

> On 2/4/21 10:59 AM, Philippe Mathieu-Daudé wrote:
>> On 2/4/21 2:54 PM, Wainer dos Santos Moschetta wrote:
>>> The qemu-img.rst, qemu-nbd.rst, virtfs-proxy-helper.rst, 
>>> qemu-trace-stap.rst,
>>> and virtiofsd.rst manuals were moved to docs/tools, so this update 
>>> MAINTAINERS
>>> accordingly.
>>>
>>> Fixes: a08b4a9fe6c ("docs: Move tools documentation to tools manual")
>>> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>>> ---
>>> v1: was "MAINTAINERS: Fix the location of virtiofsd.rst"
>>> v2: Fixed the location of all files [philmd]
>>>
>>>   MAINTAINERS | 10 +++++-----
>>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 00626941f1..174425a941 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1829,7 +1829,7 @@ S: Odd Fixes
>>>   F: hw/9pfs/
>>>   X: hw/9pfs/xen-9p*
>>>   F: fsdev/
>>> -F: docs/interop/virtfs-proxy-helper.rst
>>> +F: docs/tools/virtfs-proxy-helper.rst

FWIW:
Reviewed-by: Thomas Huth <thuth@redhat.com>


