Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA4C2304F2
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 10:07:41 +0200 (CEST)
Received: from localhost ([::1]:53826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0KeB-0005rQ-UV
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 04:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1k0KdF-0005Q9-9f
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 04:06:41 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:20251
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1k0KdC-00076R-7r
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 04:06:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595923597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g62gKk23pwaPZr1jd3oGgtEgsDFXSjFHy5b+HvjXMpY=;
 b=gszE7Z0ovnWCI+pjfQ/M2DTRPc27xsEJac4CpxAIfiRYwf2f9pOtgIx1Lo9tVw6yOhc4wX
 7LFuCUDAurXfcHHswJmCD+6DGrIcJZQf0DnbFq/HI7eS+PhXZgRyRIdGnQwFMCapfbv9ad
 VcOVEaKhjYco1zRpey1lMj2BfOOI/z8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-gPAc6BT3MTuEaTQgMlvRTg-1; Tue, 28 Jul 2020 04:05:30 -0400
X-MC-Unique: gPAc6BT3MTuEaTQgMlvRTg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFEA4107B814
 for <qemu-devel@nongnu.org>; Tue, 28 Jul 2020 08:05:28 +0000 (UTC)
Received: from [10.40.195.1] (unknown [10.40.195.1])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3C915D9CD;
 Tue, 28 Jul 2020 08:05:27 +0000 (UTC)
Subject: Re: [PATCH v2 0/2] qmp: Expose MachineClass::default_ram_id
To: Eduardo Habkost <ehabkost@redhat.com>
References: <cover.1590481402.git.mprivozn@redhat.com>
 <20200727184109.GB225270@habkost.net>
From: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <f820a890-da1f-9a0a-2484-6a1ffeafefb3@redhat.com>
Date: Tue, 28 Jul 2020 10:05:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727184109.GB225270@habkost.net>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 00:06:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: imammedo@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/27/20 8:41 PM, Eduardo Habkost wrote:
> Hi Michal,
> 
> It looks like this has fallen through the cracks, my apologies.
> 
> I'm queueing this for 5.2.  I assume this is the latest version,
> correct?
> 

Yes. No worries, I forgot about it too :-) If I remembered, I would have 
pinged.

Michal


