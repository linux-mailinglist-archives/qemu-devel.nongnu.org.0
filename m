Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C947336BC61
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 01:56:42 +0200 (CEST)
Received: from localhost ([::1]:53580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbB5l-0008H0-Rv
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 19:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbB4Z-0007mD-TC
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 19:55:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbB4X-0000Xk-6j
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 19:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619481321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k37t0J81xr47pn1kXdiJWXx4YJhK/8ovkhVzHRcWBr0=;
 b=RMKuOAciYrfgF6w2oTYoviOi5U723CYSJ08A60iS50mvnUXrKjzYu8BfHYKuCCK67C7IML
 xRjxdtBw3VjU3jMu1gAMlrBlXcfsM8PmkeYz6fCxV2nEZG2MG2envMW4fbxdXeGEQD4qSt
 euRTFo+dRrjtpR0BwkpZykFNYGE6u10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-f87O9xHgPXSvakAfBH8s5Q-1; Mon, 26 Apr 2021 19:55:19 -0400
X-MC-Unique: f87O9xHgPXSvakAfBH8s5Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C37AD801FCE;
 Mon, 26 Apr 2021 23:55:18 +0000 (UTC)
Received: from [10.10.112.236] (ovpn-112-236.rdu2.redhat.com [10.10.112.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4ADCE1002EE6;
 Mon, 26 Apr 2021 23:55:16 +0000 (UTC)
Subject: Re: [PATCH 12/22] qapi/parser: add type hint annotations
To: Markus Armbruster <armbru@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-13-jsnow@redhat.com>
 <87zgxm5yrp.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <07ad14a5-a1bb-691f-cdc1-93ef82b28e77@redhat.com>
Date: Mon, 26 Apr 2021 19:55:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87zgxm5yrp.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/21 8:34 AM, Markus Armbruster wrote:
> value: object isn't wrong, but why not _ExprValue?
> 

Updated excuse:

because all the way back outside in _parse, we know that:

1. expr is a dict (because of get_expr(False))
2. expr['pragma'] is also a dict, because we explicitly check it there.
3. We iterate over the keys; all we know so far is that the values are 
... something.
4. _pragma()'s job is to validate the type(s) anyway.

More or less, the _ExprValue type union isn't remembered here -- even 
though it was once upon a time something returned by get_expr, it 
happened in a nested call that is now opaque to mypy in this context.

So, it's some combination of "That's all we know about it" and "It 
happens to be exactly sufficient for this function to operate."

--js


