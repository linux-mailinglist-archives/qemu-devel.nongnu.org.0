Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 618F84F66EF
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 19:22:58 +0200 (CEST)
Received: from localhost ([::1]:46336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc9Mv-0004u6-2B
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 13:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1nc9LD-0003Nq-82
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 13:21:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1nc9L7-00071F-3o
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 13:21:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649265660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ap/ayzngU+7DFXGQ89audvXkf6abZx5q+gyWctPkZt0=;
 b=c+BQ2EhAhNpmmgqWGiuoVnzKCkU24Ixs/cA3i3KYIRWSSmwS3+cEyofn7S+IgM9orGwmEj
 fXcLooUQeMeEnr8guFrfUwGZXbfCmQIjfLt2HkfIe++c0ED1hqs9U318HHDgIWhfVD0vzo
 O9up2zh4NNiGZ+erfX5FOlnjZvlOY08=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-1zwKeZeeOVmlEupKNxgIQg-1; Wed, 06 Apr 2022 13:19:50 -0400
X-MC-Unique: 1zwKeZeeOVmlEupKNxgIQg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7616185A5A8;
 Wed,  6 Apr 2022 17:19:49 +0000 (UTC)
Received: from [10.22.11.51] (unknown [10.22.11.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0F6453AC;
 Wed,  6 Apr 2022 17:19:48 +0000 (UTC)
Message-ID: <9878f830-d581-1069-5b06-54b8486b7b8b@redhat.com>
Date: Wed, 6 Apr 2022 13:19:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3] qapi, target/i386/sev: Add cpu0-id to
 query-sev-capabilities
To: Dov Murik <dovmurik@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220228093014.882288-1-dovmurik@linux.ibm.com>
 <YhyWg1UaOPMIkODz@redhat.com>
 <982bd5bf-a3a8-f75c-73bd-2722f72cc476@linux.ibm.com>
From: Cole Robinson <crobinso@redhat.com>
In-Reply-To: <982bd5bf-a3a8-f75c-73bd-2722f72cc476@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crobinso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/22 4:39 AM, Dov Murik wrote:
> 
> 
> On 28/02/2022 11:31, Daniel P. Berrangé wrote:
>> On Mon, Feb 28, 2022 at 09:30:14AM +0000, Dov Murik wrote:
>>> Add a new field 'cpu0-id' to the response of query-sev-capabilities QMP
>>> command.  The value of the field is the base64-encoded unique ID of CPU0
>>> (socket 0), which can be used to retrieve the signed CEK of the CPU from
>>> AMD's Key Distribution Service (KDS).
>>>
>>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>>
> 
> Thanks Daniel for reviewing.
> 

Hmm I don't see this in qemu.git. Who should pick this up?

- Cole


