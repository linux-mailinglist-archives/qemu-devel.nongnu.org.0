Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A17545D69A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 09:58:37 +0100 (CET)
Received: from localhost ([::1]:48598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqAaS-0008IG-Ih
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 03:58:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mqAYs-00075V-H2
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 03:56:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mqAYp-00079B-B0
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 03:56:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637830614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XGrP0qGeVoukuSwWND4EAF8d64OTQ39qQC5GQSvQvEI=;
 b=VloL15eqs/lkEOXMATacRsizOZCLh8B4hA/cidsm0oq8/hcDe7O+iikq0NB227Ax3mU+jL
 Q3caoJ6Gi4OkDGrL/Pfte9W4URJ6ueVa1XMYV8aJz3bY4xg8dossbDhbQpdCfQO1d6stKZ
 iXfuGLCs1rtTI7FZpaLhGxNupT6BrrY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-CwzXQPCfMha8Ph1d7V6PGg-1; Thu, 25 Nov 2021 03:56:51 -0500
X-MC-Unique: CwzXQPCfMha8Ph1d7V6PGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 535CB760C5;
 Thu, 25 Nov 2021 08:56:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CF23610A5;
 Thu, 25 Nov 2021 08:56:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9FCF811380A7; Thu, 25 Nov 2021 09:56:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 2/2] hw/i386: Rename default_bus_bypass_iommu
References: <20210811085842.2511545-1-jean-philippe@linaro.org>
 <20210811085842.2511545-2-jean-philippe@linaro.org>
 <87tug0pv3a.fsf@dusky.pond.sub.org>
 <20211125021619-mutt-send-email-mst@kernel.org>
Date: Thu, 25 Nov 2021 09:56:42 +0100
In-Reply-To: <20211125021619-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Thu, 25 Nov 2021 02:19:21 -0500")
Message-ID: <871r34pq9h.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Thu, Nov 25, 2021 at 08:12:25AM +0100, Markus Armbruster wrote:
>> Michael & Marcel, this patch fixes a bug that became a regression when
>> the fix missed 6.1.  It's been stuck on the list since August.  Please
>> have a look, and if it's good, get it merged.
>
>
> Thanks for the reminder. Jean-Philippe, Cc maintainers
> will help patches get merged in a timely manner in the future.
>
>>  I just asked the arm/virt
>> maintainer to do the same for PATCH 1.
>
> Some questions below.
>
>> Jean-Philippe Brucker <jean-philippe@linaro.org> writes:
>> 
>> > Since commit d8fb7d0969d5 ("vl: switch -M parsing to keyval"), machine
>> > parameter definitions cannot use underscores, because keyval_dashify()
>> > transforms them to dashes and the parser doesn't find the parameter.
>> >
>> > This affects option default_bus_bypass_iommu which was introduced in the
>> > same release:
>> >
>> > $ qemu-system-x86_64 -M q35,default_bus_bypass_iommu=on
>> > qemu-system-x86_64: Property 'pc-q35-6.1-machine.default-bus-bypass-iommu' not found
>
> I don't see this behaviour. What did I miss?

I looked at the source and somehow missed that the fix is already there
(commit 739b38630c45).  Sorry for the noise!

[...]


