Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB6C24EC28
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Aug 2020 10:21:56 +0200 (CEST)
Received: from localhost ([::1]:52558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9lGF-0004wv-0Z
	for lists+qemu-devel@lfdr.de; Sun, 23 Aug 2020 04:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k9lF7-0004Kg-I5
 for qemu-devel@nongnu.org; Sun, 23 Aug 2020 04:20:45 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50582
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k9lF4-0000kx-T0
 for qemu-devel@nongnu.org; Sun, 23 Aug 2020 04:20:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598170841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H7IEhxvjOpoYEjaAtb6qjWEixFsYESG+m7Uov6JWdOM=;
 b=Nnzepx4USJqFjqFP+9hLkvcbYQ0V3AAd3J2wR3cMdTHU85F8ZoUWDalIjeQl6yqrRYzD5a
 dZPpV7pXUrdpXiFBDa2QsrDAAG+HnpZHDADVmqYtySeAgxP4vczR3fZA7pR2P41LjDjPGj
 Sp6aJb7pTiFRQGmrBQAwIsa9ZzEAKmM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-kvRbqJSoMTuNsa85LKwviw-1; Sun, 23 Aug 2020 04:20:39 -0400
X-MC-Unique: kvRbqJSoMTuNsa85LKwviw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 347491005E61;
 Sun, 23 Aug 2020 08:20:38 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-57.ams2.redhat.com [10.36.112.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AB8D16E32;
 Sun, 23 Aug 2020 08:20:37 +0000 (UTC)
Subject: Re: [PATCH v2] CODING_STYLE.rst: flesh out our naming conventions.
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200810105147.10670-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2415571e-bfcd-e870-7994-e249a18fa726@redhat.com>
Date: Sun, 23 Aug 2020 10:20:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200810105147.10670-1-alex.bennee@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/23 02:54:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.948, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/08/2020 12.51, Alex Bennée wrote:
> Mention a few of the more common naming conventions we follow in the
> code base including common variable names and function prefix and
> suffix examples.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - punctuation fixes suggested by Cornelia
>    - re-worded section on qemu_ prefix
>    - expanded on _locked suffix
> ---
>   CODING_STYLE.rst | 30 ++++++++++++++++++++++++++++--
>   1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/CODING_STYLE.rst b/CODING_STYLE.rst
> index 427699e0e42..e7ae44aed7f 100644
> --- a/CODING_STYLE.rst
> +++ b/CODING_STYLE.rst
> @@ -109,8 +109,34 @@ names are lower_case_with_underscores_ending_with_a_t, like the POSIX
>   uint64_t and family.  Note that this last convention contradicts POSIX
>   and is therefore likely to be changed.
>   
> -When wrapping standard library functions, use the prefix ``qemu_`` to alert
> -readers that they are seeing a wrapped version; otherwise avoid this prefix.
> +Variable Naming Conventions
> +---------------------------
> +
> +A number of short naming conventions exist for variables that use
> +common QEMU types. For example, the architecture independent CPUState
> +this is often held as a ``cs`` pointer variable, whereas the concrete
> +CPUArchState us usually held in a pointer called ``env``.
> +
> +Likewise, in device emulation code the common DeviceState is usually
> +called ``dev`` with the actual status structure often uses the terse
> +``s`` or maybe ``foodev``.

Please let's not recommend single-letter variables like 's' here. This 
is a really bad idea, since they are hard to "grep" and can be confused 
quite easily. I think it would be best to simply drop that last part of 
the sentence (starting with "with the actual...").

  Thomas


