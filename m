Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79327127091
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 23:20:16 +0100 (CET)
Received: from localhost ([::1]:48310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ii49X-0006Zt-3H
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 17:20:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37287)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <brad@comstyle.com>) id 1ii48Y-00066H-K2
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 17:19:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <brad@comstyle.com>) id 1ii48X-0000TY-FI
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 17:19:14 -0500
Received: from speedy.comstyle.com ([206.51.28.2]:43508 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <brad@comstyle.com>) id 1ii48X-0008Jw-5T
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 17:19:13 -0500
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 47f5gJ2Pm4z4glt;
 Thu, 19 Dec 2019 17:11:08 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=subject
 :from:to:cc:references:message-id:date:mime-version:in-reply-to
 :content-type; s=selector1; bh=izCzLK/jCFUstwtvV3SzYgyxqsE=; b=r
 Fp3s7tJ51h1384aA2AUGPgX5EKiP/gmKvy/BDFwPKLCMKEaLFxqZ/Th+UkdXxgZv
 qH0pDV19Rowri4QFnke8M3o4M/Sk5J6AB1T0TKGgXr36Xrc7TMuQWSOR5rbeoIN3
 SOD0b5I5Zi947ldWP27VmRk5CEXPBCmxDvkU0pB3fo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=subject:from
 :to:cc:references:message-id:date:mime-version:in-reply-to
 :content-type; q=dns; s=selector1; b=N1mFxd/78ii8uUErWo0OTx7CclC
 1cBaYdJKfq7TDXcC+4IwGvBWADfWMeDGZjbXl+idHPvG8kHqqjh36B9fT70KERfM
 DdnLcMQ6AX8DMMC7DMRpfk2dy9w083kouBr5/fizLGNwCZGlAazNlBAylCEZtju9
 MGRVW0/daPdivMU0=
Received: from [192.168.100.236]
 (toroon0812w-lp140-02-64-229-180-196.dsl.bell.ca [64.229.180.196])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 47f5gJ15zGz4gls;
 Thu, 19 Dec 2019 17:11:08 -0500 (EST)
Subject: Re: [PATCH] tests/vm: update openbsd to release 6.6
From: Brad Smith <brad@comstyle.com>
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20191018102443.26469-1-kraxel@redhat.com>
 <ca7e9094-bb0b-08f5-7523-778f89c4b333@comstyle.com>
Message-ID: <7dd63098-305e-331a-08c3-63c58366d7f1@comstyle.com>
Date: Thu, 19 Dec 2019 17:11:39 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101
 Thunderbird/72.0
MIME-Version: 1.0
In-Reply-To: <ca7e9094-bb0b-08f5-7523-778f89c4b333@comstyle.com>
Content-Type: multipart/alternative;
 boundary="------------68CC689081D27CE271FB7145"
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 206.51.28.2
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------68CC689081D27CE271FB7145
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

ping.

On 11/13/2019 10:33 PM, Brad Smith wrote:
> Thanks.
>
> Reviewed-by: Brad Smith<brad@comstyle.com>
> On 10/18/2019 6:24 AM, Gerd Hoffmann wrote:
>> Signed-off-by: Gerd Hoffmann<kraxel@redhat.com>
>> ---
>>   tests/vm/openbsd | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/vm/openbsd b/tests/vm/openbsd
>> index b92c39f89a6f..9f82cd459fde 100755
>> --- a/tests/vm/openbsd
>> +++ b/tests/vm/openbsd
>> @@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
>>       name = "openbsd"
>>       arch = "x86_64"
>>   
>> -    link ="https://cdn.openbsd.org/pub/OpenBSD/6.5/amd64/install65.iso"
>> -    csum = "38d1f8cadd502f1c27bf05c5abde6cc505dd28f3f34f8a941048ff9a54f9f608"
>> +    link ="https://cdn.openbsd.org/pub/OpenBSD/6.6/amd64/install66.iso"
>> +    csum = "b22e63df56e6266de6bbeed8e9be0fbe9ee2291551c5bc03f3cc2e4ab9436ee3"
>>       size = "20G"
>>       pkgs = [
>>           # tools

--------------68CC689081D27CE271FB7145
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>ping.<br>
    </p>
    <div class="moz-cite-prefix">On 11/13/2019 10:33 PM, Brad Smith
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ca7e9094-bb0b-08f5-7523-778f89c4b333@comstyle.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <pre>Thanks.

Reviewed-by: Brad Smith <a class="moz-txt-link-rfc2396E" href="mailto:brad@comstyle.com" moz-do-not-send="true">&lt;brad@comstyle.com&gt;</a>
</pre>
      <div class="moz-cite-prefix">On 10/18/2019 6:24 AM, Gerd Hoffmann
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:20191018102443.26469-1-kraxel@redhat.com">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Gerd Hoffmann <a class="moz-txt-link-rfc2396E" href="mailto:kraxel@redhat.com" moz-do-not-send="true">&lt;kraxel@redhat.com&gt;</a>
---
 tests/vm/openbsd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index b92c39f89a6f..9f82cd459fde 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
     name = "openbsd"
     arch = "x86_64"
 
-    link = <a class="moz-txt-link-rfc2396E" href="https://cdn.openbsd.org/pub/OpenBSD/6.5/amd64/install65.iso" moz-do-not-send="true">"https://cdn.openbsd.org/pub/OpenBSD/6.5/amd64/install65.iso"</a>
-    csum = "38d1f8cadd502f1c27bf05c5abde6cc505dd28f3f34f8a941048ff9a54f9f608"
+    link = <a class="moz-txt-link-rfc2396E" href="https://cdn.openbsd.org/pub/OpenBSD/6.6/amd64/install66.iso" moz-do-not-send="true">"https://cdn.openbsd.org/pub/OpenBSD/6.6/amd64/install66.iso"</a>
+    csum = "b22e63df56e6266de6bbeed8e9be0fbe9ee2291551c5bc03f3cc2e4ab9436ee3"
     size = "20G"
     pkgs = [
         # tools
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------68CC689081D27CE271FB7145--

