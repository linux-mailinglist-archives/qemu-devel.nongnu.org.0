Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765CC56E98
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jun 2019 18:21:07 +0200 (CEST)
Received: from localhost ([::1]:41762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgAfS-0004wp-Ne
	for lists+qemu-devel@lfdr.de; Wed, 26 Jun 2019 12:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54915)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <laurent@vivier.eu>) id 1hgAbI-0003sp-OE
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 12:16:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1hgAbG-00018m-8y
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 12:16:47 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:41489)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1hgAbF-000171-QZ; Wed, 26 Jun 2019 12:16:46 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MXGSU-1i4zuK0XGQ-00YlmY; Wed, 26 Jun 2019 18:16:38 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: Justin Hibbits <chmeeedalf@gmail.com>, qemu-devel@nongnu.org
References: <20190607135653.6ece685d@titan.knownspace>
 <8676232e-917d-44e2-1149-b25f26698a73@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <92053c9c-e7bf-76cb-9399-987f4ab31bfb@vivier.eu>
Date: Wed, 26 Jun 2019 18:16:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <8676232e-917d-44e2-1149-b25f26698a73@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VY1N/nVZMD2aR+OBSA1YXmOeDIJndErJA6uLaroSNMejhykZMYz
 5i5FdG1dPegKsD+uO7mmywlK3rvxaukUjKswvTAd2Szwi0aS2V+0sdtF1AbjY5w4juBT1aR
 KdlmKQWG2D5KJtjEnVIXjWV3I6RFoj+qMxGb5/8bQNFPbpr9bCRta5vNy0CE50dsPJNj/NL
 1bftQoVnrSXh2c1UL1Nqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:arnd6t4EU5A=:vi39ZWMDGOWmuunzgKTcA7
 m2MoJjSzeF/mkUedT/WkUd+YOO7U7NdA0e6XkjjgrvyQjzSdO2Of1vBuTMngAxbIBgkQQtYAk
 55/QGWyW/9iOXgc9jWrE6ztDy+l6i0DLEuX88SEbZGm6aQlGQ1aJ0A9n9XTXkOTa7x7qYsiRb
 jHYI1FXUdwKpjwBXtbrvZhia1GgbwQZMpV+/d2jjg5ei5CGciTLM0hemIAgal3RQgz9i8hbpS
 z3xfHIkyPh741ejzloUfZbJTUrT48MFMxMdLZccgmZx+vzU6c8orhDWRp8d8XSkJYTEGZ5tNl
 CDP8mWkxXNy236ztCc9YGbd2VhxO2/LXX3yFX05SlZRe/L2Uu3ro/kYRytLH+gYl4OwUpGrcf
 uDLByQgS+u4o4JDy19PRr53mVflA2KWUDLrVfSZAqXe4t1dbMPQTd7N+mADgnHWSl7Is5byYR
 s8KV5FXbutnT6EPkR57gYFD5ETn2wN4FBUd2h+zVBIRbeqS54/FAEs059Evh57sTTMIbVGCYV
 yUWqWpKRqCSsBSQ1M+d9Ip615MgiRVnUXYyt4zUNWfE0QPDOQTCZZ+xVREiNjw9MBBb7RGKeF
 Rgj2u+EXN4LRib3gEqrAjyzRnKLMHhobUqzxCpSI+MnTILmMgMh4hssZ5KSSABZB3TpiRQrGW
 Dc9tICS/kxVC4U0gKlKD2NC6xgi9yiJiOMT0tcwUXGO8hAXh3hDpgVdfy8g01R+1GAA4dAKLh
 aFtr4LNLrcxUDjicLCp0+1nZdzDlfL+53/wihZvEquOMDGNB/jjBZjXnbiI=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: Re: [Qemu-devel] [Qemu-trivial] Fix cacheline size retrieval on
 FreeBSD/PowerPC(64)
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
Cc: qemu-trivial@nongnu.org, "Emilio G. Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/06/2019 à 18:14, Laurent Vivier a écrit :
> Le 07/06/2019 à 20:56, Justin Hibbits a écrit :
>> The attached very trivial patch fixes a startup bug that prevents at
>> least Qemu 3.1 and later from working on FreeBSD/powerpc64.
>>
>> - Justin
>>
> 
> Please don't send a patch in attachment but inlined in the message
> (you may use "git send-email" for that).
> 
> This patch fixes "util: add cacheinfo" that has changed the type from
> unsigned to long.
> 
> You can add the following line in the commit message:
> 
> Fixes: b255b2c8a548 ("util: add cacheinfo")
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> 

CC: author of b255b2c8a548 ("util: add cacheinfo")

Thanks,
Laurent

