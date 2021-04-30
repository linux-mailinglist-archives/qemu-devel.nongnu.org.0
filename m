Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 649DC36FBB5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:47:28 +0200 (CEST)
Received: from localhost ([::1]:55506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTUN-00019Q-FK
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcSFA-0005um-QY
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 08:27:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcSF4-0004B0-7M
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 08:27:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619785652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=beKLOIWCsFidtgCIESRmEqMg0agCstSgnovusb+rPJU=;
 b=L6oJfVIo0M8gYpNOsabWJ5ALrqyKpnnRixA6YhC2Ny4906J9I9ICkBOnJg1tKilzxJw10a
 DyyTYeiZQ5qzTeHoUcUZpDonYSDTxpA9T/QF8gjIOXIHC1+1zAXZfUD5ttDGWhLan6trp4
 oB2IUr9NqYHsZ4WXnVa15Bt58Gxo9Kc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-lKKlLGksNzWZzosDwPWESQ-1; Fri, 30 Apr 2021 08:27:30 -0400
X-MC-Unique: lKKlLGksNzWZzosDwPWESQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73863800C7A;
 Fri, 30 Apr 2021 12:27:29 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-68.ams2.redhat.com
 [10.36.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C792060843;
 Fri, 30 Apr 2021 12:27:27 +0000 (UTC)
Subject: Re: [PATCH v3 08/15] docs/devel/testing: add -gdb option to the
 debugging section of QEMU iotests
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-9-eesposit@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <eabf6735-842e-b898-c460-07267cee1627@redhat.com>
Date: Fri, 30 Apr 2021 14:27:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414170352.29927-9-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.04.21 19:03, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   docs/devel/testing.rst | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index b7e2370e7e..2ee77a057b 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -229,6 +229,13 @@ Debugging a test case
>   QEMU iotests offers some options to debug a failing test, that can be
>   given as options to the ``check`` script:
>   
> +* ``-gdb`` wraps ``gdbsever`` to the QEMU binary,
> +  so it is possible to connect to it via gdb.
> +  One way to do so is via ``gdb -iex "target remote $GDB_QEMU"``
> +  The default address is ``localhost:12345``, and can be changed
> +  by setting the ``$GDB_QEMU`` environmental variable.

*environment variable

> +  The final command line will be ``gdbserver $GDB_QEMU $QEMU ...``
> +

I think the order in this explanation is ordered not quite right, 
because it uses $GDB_QEMU before explaining what it is.  (Also, I 
suppose $GDB_QEMU might contain other options than the socket address, 
so "target remote $GDB_QEMU" does not necessarily work.)  I’d 
reorder/change it to:

``-gdb`` wraps every QEMU invocation in a ``gdbserver``, which waits for 
a connection from a gdb client.  The options given to ``gdbserver`` 
(e.g. the address on which to listen for connections) are taken from the 
``$GDB_QEMU`` environment variable.  By default (if ``$GDB_QEMU`` is 
empty), it listens on ``localhost:12345``.
You can connect to it for example with ``gdb -iex "target remote 
$addr"``, where ``$addr`` is the address ``gdbserver`` listens on.

Max

>   * ``-d`` (debug) just increases the logging verbosity, showing
>     for example the QMP commands and answers.
>   
> 


