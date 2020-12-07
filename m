Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AC32D1B98
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 22:05:09 +0100 (CET)
Received: from localhost ([::1]:40748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmNgy-00028g-3O
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 16:05:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kmNeW-0001Bh-3Y
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:02:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kmNeT-0004d0-I1
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:02:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607374949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kYkdnpQAroHrBV+Z7JwuA/j+zFSvDi5QKLecYRVbKdA=;
 b=POO5BzYnweZxEjZzAEIVJNqHmm78yw0XOuhtVo+DmnweyhMr8w/frOxxWadAH0mW8ndiW6
 rP4StGA9UmoZb+mtdFVAlhaHhxYa8l98y0dGAa6Fh6o9+dk0RK6fJkc2+jDbhkfv30a2RE
 UwQ6K1dQABoUav76MwJEn4hcN/BoySY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-Rpudpto2P6ia5ovKZppO9Q-1; Mon, 07 Dec 2020 16:02:25 -0500
X-MC-Unique: Rpudpto2P6ia5ovKZppO9Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E72DA8144E2;
 Mon,  7 Dec 2020 21:02:23 +0000 (UTC)
Received: from [10.10.116.117] (ovpn-116-117.rdu2.redhat.com [10.10.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E9D85D6AB;
 Mon,  7 Dec 2020 21:02:22 +0000 (UTC)
Subject: Re: [RFC PATCH] python: add __repr__ to ConsoleSocket to aid debugging
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201207200737.5090-1-alex.bennee@linaro.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <092ecec7-d4a3-f345-7619-dab4c9a43f69@redhat.com>
Date: Mon, 7 Dec 2020 16:02:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201207200737.5090-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 3:07 PM, Alex Bennée wrote:
> While attempting to debug some console weirdness I thought it would be
> worth making it easier to see what it had inside.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   python/qemu/console_socket.py | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/python/qemu/console_socket.py b/python/qemu/console_socket.py
> index f060d79e06..77966d1fe9 100644
> --- a/python/qemu/console_socket.py
> +++ b/python/qemu/console_socket.py
> @@ -45,6 +45,14 @@ class ConsoleSocket(socket.socket):
>           if drain:
>               self._drain_thread = self._thread_start()
>   
> +    def __repr__(self):

def __repr__(self) -> str:

> +        s = super(ConsoleSocket, self).__repr__()

Use python3-style super(): super().__repr__()

> +        s = s.rstrip(">")
> +        s += ", logfile=%s" % (self._logfile)
> +        s += ", drain_thread=%s" % (self._drain_thread)
> +        s += ">"
> +        return s
> +

Reviewed-by: John Snow <jsnow@redhat.com>

feel free to take this through your testing tree.

--js


