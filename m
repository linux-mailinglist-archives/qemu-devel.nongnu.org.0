Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA3064462
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 11:30:28 +0200 (CEST)
Received: from localhost ([::1]:59328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hl8vj-0004V7-7Q
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 05:30:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48279)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hl8s4-0002TR-Vi
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 05:26:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hl8s2-0002re-TA
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 05:26:40 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54019)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hl8s2-0002nY-L3
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 05:26:38 -0400
Received: by mail-wm1-f67.google.com with SMTP id x15so1496236wmj.3
 for <qemu-devel@nongnu.org>; Wed, 10 Jul 2019 02:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dNd9IqHwvKh2lczcoe8k89Usd+GyWaShWWIlbeyQ7Rw=;
 b=inDeQApqMPOlhCTfq3ZOZShOkmBWOiYaPqTeld5FUb1lUgWZCPRV3dl/KgKk9EC1wv
 iuWufqGtn1beUI0hp73d8fIf5Pi6m0BRpcm6Ezqk4l3/l213eHp0ubMfo+n7XCTnpcc4
 7kclWVf3GNyawzb5Oqxe5XvvYGSZjNOthiAMcqbs8rNOfgZgv3qIiAm4+dT8b5LaDlPc
 DRY2nv1IqHs0vJY5c2dGKxvnNdysubhqVjvk1unF/+zzLMWWXSPbCsOuSC2/kW2bwQEW
 4apVp1/gyhp45FjfqTPasa9mO7486nOlNp9eZRQJ5IK2/ixAgQG31+p57abgjFjNqtrF
 xJWA==
X-Gm-Message-State: APjAAAWEe47/b1MUGds8JsXr55KpHqb0Eq02TSIvQcAO9RHJPKdcKk39
 0+dWgJ2Manf0W3FKYpCNpPJqJAK1RSw=
X-Google-Smtp-Source: APXvYqyNfAy9jbFiScn1zBPjpr2zi04cdJTlGY9NJjOtYKEGmocacI233J9lF1to+N5JSRvD44665w==
X-Received: by 2002:a05:600c:218d:: with SMTP id
 e13mr4394626wme.29.1562750795008; 
 Wed, 10 Jul 2019 02:26:35 -0700 (PDT)
Received: from [10.32.224.100] (red-hat-inc.vlan560.asr1.mad1.gblx.net.
 [159.63.51.90])
 by smtp.gmail.com with ESMTPSA id v18sm1689965wrs.80.2019.07.10.02.26.34
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 02:26:34 -0700 (PDT)
To: =?UTF-8?Q?Carlo_Marcelo_Arenas_Bel=c3=b3n?= <carenas@gmail.com>,
 qemu-devel@nongnu.org
References: <20190709234330.89699-1-carenas@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <dee323d7-ac1c-2aee-915b-2889ea72e3fe@redhat.com>
Date: Wed, 10 Jul 2019 11:26:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190709234330.89699-1-carenas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-devel] [PATCH] configure: remove obsoleted $sparc_cpu
 variable
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
Cc: qemu-trivial@nongnu.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/10/19 1:43 AM, Carlo Marcelo Arenas Belón wrote:
> 9b9c37c364 ("tcg-sparc: Assume v9 cpu always, i.e. force v8plus in
> 32-bit mode.", 2012-09-21) removed the need for this variable and
> most of the references to it, but this one.
> 
> Remove defunct code, no effect or functionality change expected.
> 
> Signed-off-by: Carlo Marcelo Arenas Belón <carenas@gmail.com>
> ---
>  configure | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/configure b/configure
> index 4983c8b533..7518f201ab 100755
> --- a/configure
> +++ b/configure
> @@ -6378,9 +6378,6 @@ if test "$vnc" = "yes" ; then
>      echo "VNC JPEG support  $vnc_jpeg"
>      echo "VNC PNG support   $vnc_png"
>  fi
> -if test -n "$sparc_cpu"; then
> -    echo "Target Sparc Arch $sparc_cpu"
> -fi
>  echo "xen support       $xen"
>  if test "$xen" = "yes" ; then
>    echo "xen ctrl version  $xen_ctrl_version"
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

