Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 938771CF7DF
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 16:51:55 +0200 (CEST)
Received: from localhost ([::1]:45378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYWGA-0003NB-FI
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 10:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jYWFO-0002vM-HB
 for qemu-devel@nongnu.org; Tue, 12 May 2020 10:51:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22547
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jYWFM-0005NJ-EK
 for qemu-devel@nongnu.org; Tue, 12 May 2020 10:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589295063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=F97HdtcG2AY5sh2LKeRUqAa8vQ6X0z/nHFKKVL0mmTY=;
 b=W6qsX0VDMUG/3xpY5+vSA5/PcRi6ChTaA9bl0OzZr1DjSjR2+eZjNYn89DSUJ8rTH9qFXn
 DIO7UGbskfhxJZswPA322PdnCw7fYkH2qfsdIpvFnpWhxrI59oNutiY0Ux0JTHWO3wH1YH
 4pKix5xxB/89DDkCCULozpRN7fi49gE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-xwLnMgEEP_mKhWV5GLW36Q-1; Tue, 12 May 2020 10:51:01 -0400
X-MC-Unique: xwLnMgEEP_mKhWV5GLW36Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84A4C474
 for <qemu-devel@nongnu.org>; Tue, 12 May 2020 14:51:00 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-112.ams2.redhat.com [10.36.112.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D58746A962;
 Tue, 12 May 2020 14:50:58 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] net: Drop the legacy "name" parameter from the
 -net option
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>
References: <20200512123149.30207-1-thuth@redhat.com>
 <20200512123149.30207-2-thuth@redhat.com>
 <34b66d39-27ce-36a9-b478-c17cbd1e5712@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <87787afc-46dd-c4df-15ff-48041111bc6c@redhat.com>
Date: Tue, 12 May 2020 16:50:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <34b66d39-27ce-36a9-b478-c17cbd1e5712@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 02:02:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/2020 16.26, Eric Blake wrote:
> On 5/12/20 7:31 AM, Thomas Huth wrote:
>> It's been deprecated since QEMU v3.1, so it's time to finally
>> remove it. The "id" parameter can simply be used instead.
>>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   docs/system/deprecated.rst | 15 +++++++++------
>>   net/net.c                  | 10 +---------
>>   qapi/net.json              |  3 ---
>>   3 files changed, 10 insertions(+), 18 deletions(-)
>>
> 
>> +++ b/qapi/net.json
>> @@ -474,8 +474,6 @@
>>   #
>>   # @id: identifier for monitor commands
>>   #
>> -# @name: identifier for monitor commands, ignored if @id is present
>> -#
>>   # @opts: device type specific properties (legacy)
>>   #
>>   # Since: 1.2
>> @@ -483,7 +481,6 @@
>>   { 'struct': 'NetLegacy',
>>     'data': {
>>       '*id':   'str',
>> -    '*name': 'str',
>>       'opts':  'NetLegacyOptions' } }
> 
> Why is 'id' left optional? I'd expect it to be mandatory, now.

That's because it is still optional, indeed. It is currently perfectly
valid to run "qemu-system-xyz -net user -net nic" without specifying any
"id". If I remove the "*" here, the old syntax breaks. I don't think
that we want this here, so "*id" has to stay optional.
(FWIW, the ID is then created internally, see assign_name() in net/net.c)

 Thomas


