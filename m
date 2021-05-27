Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5CE3936AA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 21:52:18 +0200 (CEST)
Received: from localhost ([::1]:46826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmM3E-0006jJ-Rf
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 15:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lmM2B-000645-Po
 for qemu-devel@nongnu.org; Thu, 27 May 2021 15:51:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lmM29-0002J4-7Y
 for qemu-devel@nongnu.org; Thu, 27 May 2021 15:51:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622145068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fZLbWS6nIanWtzTeG6NCxkam3VCHWAJu6HqcDFaD8Ws=;
 b=U9jDmtuPu7qfwTsR1Qx1SWjFw5OsedzVXCRMC1LjHDAg72sAU/+J0xogKj4atlsKjLVtYQ
 flahulzTisdimi3lhahZfZt5wsUDAeo8UGs+0q+eJVD6Y06BWjzJH5qqf2xHXEy69th7hh
 7FHoYuGsXSi5v31kz5HiDWdPFBDOFF4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-D8MgCTBIOJa4m0jMZEGZWg-1; Thu, 27 May 2021 15:51:04 -0400
X-MC-Unique: D8MgCTBIOJa4m0jMZEGZWg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 921C08042A6;
 Thu, 27 May 2021 19:51:02 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-187.gru2.redhat.com
 [10.97.116.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D32C1349A;
 Thu, 27 May 2021 19:50:56 +0000 (UTC)
Subject: Re: [PATCH 1/2] tests/acceptance: Ignore binary data sent on serial
 console
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210515134555.307404-1-f4bug@amsat.org>
 <20210515134555.307404-2-f4bug@amsat.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <069856a3-96ce-6bdf-5d9b-bef6d93c46a5@redhat.com>
Date: Thu, 27 May 2021 16:50:53 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210515134555.307404-2-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 5/15/21 10:45 AM, Philippe Mathieu-Daudé wrote:
> If a guest sends binary data on the serial console, we get:
>
>   File "tests/acceptance/avocado_qemu/__init__.py", line 92,
>     in _console_interaction msg = console.readline().strip()
>   File "/usr/lib64/python3.8/codecs.py", line 322,
>     in decode (result, consumed) = self._buffer_decode(data, self.errors, final)
>   UnicodeDecodeError: 'utf-8' codec can't decode byte 0xa9 in position 2: invalid start byte


Good catch!


>
> Since we use the console with readline(), fix it the easiest
> way possible: ignore binary data (all current tests compare
> text string anyway).
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 83b1741ec85..b55578e1cca 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -82,14 +82,17 @@ def _console_interaction(test, success_message, failure_message,
>       assert not keep_sending or send_string
>       if vm is None:
>           vm = test.vm
> -    console = vm.console_socket.makefile()
> +    console = vm.console_socket.makefile(mode='rb', encoding='utf-8')
>       console_logger = logging.getLogger('console')
>       while True:
>           if send_string:
>               vm.console_socket.sendall(send_string.encode())
>               if not keep_sending:
>                   send_string = None # send only once
> -        msg = console.readline().strip()
> +        try:
> +            msg = console.readline().decode().strip()
> +        except UnicodeDecodeError:
> +            msg = None
>           if not msg:
>               continue
>           console_logger.debug(msg)


