Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7B931C133
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 19:12:48 +0100 (CET)
Received: from localhost ([::1]:55656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBiMY-0002pJ-IY
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 13:12:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBiKM-0001mE-KG
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 13:10:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBiKK-0006X6-Ar
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 13:10:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613412627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NbXfCzZ5gC5AjuOTRSfuckHb3BrmHKrMjUVMoLCmNBw=;
 b=W3VIfrpuhBLRwKbhJjZpRMnaiJBlVrvtTiHUKaIVNG3NZrNnQb+ltdHmYCgECW0JRTQQsK
 qw6cf+S+wibfQ/Enb6gBVOePVN8V3V+BrREYdp6DzNxGhs/x17SAC6w5KD1LmtEamaVUwk
 8dVZF/BZkvx2FKbL1kPWknPywwJtXq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-FhDjzoz7Pq2PzygfjUxPyA-1; Mon, 15 Feb 2021 13:10:25 -0500
X-MC-Unique: FhDjzoz7Pq2PzygfjUxPyA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76369835E20;
 Mon, 15 Feb 2021 18:10:24 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBA4F60BE2;
 Mon, 15 Feb 2021 18:10:23 +0000 (UTC)
Subject: Re: [PATCH] docs/sphinx/qapidoc.py: Handle change of QAPI's builtin
 module name
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210212161311.28915-1-peter.maydell@linaro.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <492a45e2-adc3-9364-a141-076f1fc90cb0@redhat.com>
Date: Mon, 15 Feb 2021 13:10:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210212161311.28915-1-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 11:13 AM, Peter Maydell wrote:
> In commit e2bbc4eaa7f0 we changed the QAPI modules to name the built-in
> module "./builtin" rather than None, but forgot to update the Sphinx
> plugin. The effect of this was that when the plugin generated a dependency
> file it was including a bogus dependency on a non-existent file named
> "builtin", which meant that ninja would run Sphinx and rebuild all
> the documentation every time even if nothing had changed.
> 
> Update the plugin to use the new name of the builtin module.
> 
> Fixes: e2bbc4eaa7f0
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/sphinx/qapidoc.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
> index e03abcbb959..b7b86b5dffb 100644
> --- a/docs/sphinx/qapidoc.py
> +++ b/docs/sphinx/qapidoc.py
> @@ -464,7 +464,7 @@ class QAPISchemaGenDepVisitor(QAPISchemaVisitor):
>           self._qapidir = qapidir
>   
>       def visit_module(self, name):
> -        if name is not None:
> +        if name != "./builtin":
>               qapifile = self._qapidir + '/' + name
>               self._env.note_dependency(os.path.abspath(qapifile))
>           super().visit_module(name)
> 

Reviewed-by: John Snow <jsnow@redhat.com>


