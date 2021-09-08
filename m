Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 839F1403EDD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 20:08:02 +0200 (CEST)
Received: from localhost ([::1]:55878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO1zN-0001YJ-II
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 14:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mO1yS-0000sO-KM
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 14:07:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mO1yR-0003GA-8I
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 14:07:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631124422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ZAU6aYK/VMCQI6wEJV2gKVwZcVAxGMWRSX5QPNburI=;
 b=Yt/YjVZJu1+nRe+AEmCih0Ozg38j9uFpUSh/PY4EUrHKxMfWPXe+Za3n2I2KqGYaPG2RZU
 cRxahwpxpbN84v2IZzLnO7Jw/g72DT+8yy6cw0PTqA84GODp9/h0fWF7uxQc3AAhuSiceK
 A+mpthKLEsY9O29s3PvElw89cL1caKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-GTZLIKKKNaGq5vNim1G-pw-1; Wed, 08 Sep 2021 14:07:01 -0400
X-MC-Unique: GTZLIKKKNaGq5vNim1G-pw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55BAA10059D0;
 Wed,  8 Sep 2021 18:07:00 +0000 (UTC)
Received: from redhat.com (ovpn-113-24.phx2.redhat.com [10.3.113.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD9681002391;
 Wed,  8 Sep 2021 18:06:59 +0000 (UTC)
Date: Wed, 8 Sep 2021 13:06:58 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 4/5] qapi: introduce x-query-registers QMP command
Message-ID: <20210908180658.25eibl5lqmk3e2nv@redhat.com>
References: <20210908103711.683940-1-berrange@redhat.com>
 <20210908103711.683940-5-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908103711.683940-5-berrange@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 11:37:10AM +0100, Daniel P. Berrangé wrote:
> This is a counterpart to the HMP "info registers" command. It is being
> added with an "x-" prefix because this QMP command is intended as an
> adhoc debugging tool and will thus not be modelled in QAPI as fully

ad hoc

> structured data, nor will it have long term guaranteed stability.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hw/core/machine-qmp-cmds.c | 28 ++++++++++++++++++++++++++++
>  qapi/machine.json          | 37 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 65 insertions(+)
> 

> +++ b/qapi/machine.json
> @@ -1312,3 +1312,40 @@
>       '*cores': 'int',
>       '*threads': 'int',
>       '*maxcpus': 'int' } }
> +
> +##
> +# @RegisterParams:
> +#
> +# Information about the CPU to query state of
> +#
> +# @cpu: the CPU number to query. If omitted, queries all CPUs
> +#
> +# Since: 6.2.0

Consensus seems to be "6.2", not "6.2.0".

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


