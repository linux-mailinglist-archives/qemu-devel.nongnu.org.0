Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EE7461A1
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 16:51:44 +0200 (CEST)
Received: from localhost ([::1]:52282 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbnYO-0000q7-0l
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 10:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58409)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hbn1J-000831-D6
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 10:17:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hbn1H-0008OW-2M
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 10:17:33 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38507)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hbn1G-0008Nw-QX
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 10:17:30 -0400
Received: by mail-wm1-f65.google.com with SMTP id s15so2510768wmj.3
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 07:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AHSsfG1MI2exuaXmxSiORiepqBdmQk8eefC0kK5yLx4=;
 b=OzS8aRIfihBXnzTY5MZAYAkD/9201psUiNyf8Hj4d4SQvLQKsMkI1e56U9/wwlO1en
 eZIJRViz25+DANLfk9HVMBkaZ+p5kiuUXF8gLMXSphIO0QNVIaXvJvVQgl5Zl8CCsawW
 PoY1osYWQicLJ/EIrQnPQ1zWgngF2wovgA4t9I2Dxp64TVMIssMncJxkd+cYFL7doY4k
 SN6/GT6YPh+Sf5/oyKVjH0EGNI7CIlrq01y5L2WJ/mNugc/GQ3PKCa1lsgFirvaXQPdh
 c4IJFoHvDO+gnRa3n4J9XcnJwI0ABMxZTW5EjO55XfwkxRyi31eeNp3VWVYepzZXk3o8
 4kDA==
X-Gm-Message-State: APjAAAUrh09nThEuj9QU0ZcloAbQshyh258PBpvxXn9ItYVOUjFOy6l2
 K982yqdl1jSXouWp15/OVs0J5A==
X-Google-Smtp-Source: APXvYqx2izJPsnCTkUx7+vm6658fjTRAt4FLuWrMXyZ2o1wAGAxRwp5RbauYQbv3NT84bJ3IotMakQ==
X-Received: by 2002:a1c:f018:: with SMTP id a24mr7998755wmb.66.1560521849833; 
 Fri, 14 Jun 2019 07:17:29 -0700 (PDT)
Received: from [192.168.1.103] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id t6sm4688532wmb.29.2019.06.14.07.17.29
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 07:17:29 -0700 (PDT)
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20190607152223.9467-1-crosa@redhat.com>
 <20190607152223.9467-4-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <d8a66c6a-8a98-760b-f538-f919c66c14ea@redhat.com>
Date: Fri, 14 Jun 2019 16:17:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190607152223.9467-4-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-devel] [PATCH 3/8] Acceptance tests: drop left over usage
 of ":avocado: enable"
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/19 5:22 PM, Cleber Rosa wrote:
> Commit 9531d26c10 removed all of ":avocado: enable" tags, but then
> a new entry was added with the introduction of migration.py.
> 
> Let's remove it for consistency.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/migration.py | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/tests/acceptance/migration.py b/tests/acceptance/migration.py
> index 6115cf6c24..a44c1ae58f 100644
> --- a/tests/acceptance/migration.py
> +++ b/tests/acceptance/migration.py
> @@ -17,9 +17,6 @@ from avocado.utils import wait
>  
>  
>  class Migration(Test):
> -    """
> -    :avocado: enable
> -    """
>  
>      timeout = 10
>  
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

