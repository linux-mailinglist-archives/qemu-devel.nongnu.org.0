Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2891680C54
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 12:49:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMSea-0005p3-4g; Mon, 30 Jan 2023 06:48:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pMSeX-0005jo-1o
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:48:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pMSeV-0004EN-EO
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:48:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675079326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XFzBQRFIdCYm/KS+Ic8XpkmLqtOFEmqvCe255nvlm+g=;
 b=dcp1eQbzM+EboCnNPvvPnt02rfBZ7Yvdcgvxq11qdWKaUnqNET5iTXzKI3hLPZ13vo3icZ
 PMz1x40vgg1j3ZLW7Ixj0pW6mb9kj++f3LwD/rwlSz87S+gU0D1bkQhlEkWiaaMRw1GbUI
 HdKSXUu6dz3kpXeIVhe+5wB1G6C+GIg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-t4AytaUVPLCC__AIPtf0nA-1; Mon, 30 Jan 2023 06:48:45 -0500
X-MC-Unique: t4AytaUVPLCC__AIPtf0nA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B35A418E004A;
 Mon, 30 Jan 2023 11:48:44 +0000 (UTC)
Received: from [10.39.208.22] (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D3C72026D4B;
 Mon, 30 Jan 2023 11:48:43 +0000 (UTC)
Message-ID: <320bba67-f89a-19cd-bb7f-5b8b679780ce@redhat.com>
Date: Mon, 30 Jan 2023 12:48:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/3] Vhost-user: replace _SLAVE_ with _BACKEND_
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, stephen@networkplumber.org,
 chenbo.xia@intel.com, thomas@monjalon.net, dmarchan@redhat.com
References: <20230130104548.13262-1-maxime.coquelin@redhat.com>
 <20230130060706-mutt-send-email-mst@kernel.org>
From: Maxime Coquelin <maxime.coquelin@redhat.com>
In-Reply-To: <20230130060706-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=maxime.coquelin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 1/30/23 12:08, Michael S. Tsirkin wrote:
> On Mon, Jan 30, 2023 at 11:45:45AM +0100, Maxime Coquelin wrote:
>> This series continues the work done to get rid of harmful
>> language in the Vhost-user specification.
> 
> I prefer a positive "switch to a more inclusive terminology".
> To consider if you keep doing this work.

Right, it is indeed better. I will post a new revision using positive
wording.


Thanks for the review,
Maxime

>> While the spec texts were changed to replace slave with
>> backend, the protocol features and messages names hadn't
>> been changed.
>>
>> This series renames remaining occurences in the spec and
>> make use of the new names in both libvhost-user and the
>> Vhost-user frontend code.
>>
>> Maxime Coquelin (3):
>>    docs: vhost-user: replace _SLAVE_ with _BACKEND_
>>    libvhost-user: Adopt new backend naming
>>    vhost-user: Adopt new backend naming
>>
>>   docs/interop/vhost-user.rst               | 40 +++++++++++------------
>>   hw/virtio/vhost-user.c                    | 30 ++++++++---------
>>   hw/virtio/virtio-qmp.c                    | 12 +++----
>>   subprojects/libvhost-user/libvhost-user.c | 20 ++++++------
>>   subprojects/libvhost-user/libvhost-user.h | 20 ++++++------
>>   5 files changed, 61 insertions(+), 61 deletions(-)
>>
>> -- 
>> 2.39.1
> 


