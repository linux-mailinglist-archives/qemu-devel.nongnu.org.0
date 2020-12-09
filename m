Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228472D48B9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:16:28 +0100 (CET)
Received: from localhost ([::1]:60924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn40p-0007hz-7H
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:16:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kn3i6-0000FP-It
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:57:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kn3i4-0004Rr-1Z
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:57:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607536623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qJwbV/WrqViepUSM7wrg9bKlFwoWWL/Uxe1iil0/ixE=;
 b=JbeFSZ0jkLiBpVHnmw4ESPaGYqtJTrqZ+gE1Mna3iMu73eksrw5Xh/b3rfG2Pm1IzAmF5x
 TWGDl3xpABB35bgNkrXcI6xcnFnPKFobxdb8hs7SAcQooAEosEgaV7IBe7jRzuY7vX7AMS
 iTC4pyT5J+p18xkWrIEQQb+kNNy8WiU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-EC2nhIUYOQqRtzyee3kceg-1; Wed, 09 Dec 2020 12:56:59 -0500
X-MC-Unique: EC2nhIUYOQqRtzyee3kceg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74DC910054FF;
 Wed,  9 Dec 2020 17:56:58 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8343F5C276;
 Wed,  9 Dec 2020 17:56:54 +0000 (UTC)
Date: Wed, 9 Dec 2020 12:56:53 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 4/5] hw/smbios: use qapi for SMBIOS entry point type enum
Message-ID: <20201209175653.GT1289986@habkost.net>
References: <20200908165438.1008942-1-berrange@redhat.com>
 <20200908165438.1008942-5-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200908165438.1008942-5-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 08, 2020 at 05:54:37PM +0100, Daniel P. Berrangé wrote:
> This refactoring prepares for exposing the SMBIOS entry point type as a
> machine property on x86.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
[...]
> +##
> +# @SmbiosEntryPointType:
> +#
> +# @2_1: SMBIOS version 2.1
> +#
> +# @3_0: SMBIOS version 3.0
> +#
> +# Since: 5.2
> +##
> +{ 'enum': 'SmbiosEntryPointType',
> +  'data': [ '2_1', '3_0' ] }

Markus, Michael Roth: would it be OK to extend QAPI to accept
dots in enum values?  I would like to reuse Daniel's patch, but I
would prefer to use "2.1" and "3.0" as option values.

-- 
Eduardo


