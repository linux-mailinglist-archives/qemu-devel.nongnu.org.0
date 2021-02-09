Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB443314F88
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 13:55:04 +0100 (CET)
Received: from localhost ([::1]:58636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9SXn-0001rN-Vr
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 07:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l9SWa-0001Hb-3z
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 07:53:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l9SWX-00058G-Tk
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 07:53:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612875224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WwpS+2pCQIXjHbVFCu60vjgdXFr7azijw10ZAHmQbLo=;
 b=AiMbBExOl82luN+0udnXWUzdNnJXwrrTFJVVrVV1lD6zjy5vlpxfBErKvkv+sFViTrynTp
 RaTLDO002p51ViMXackKKoqhJJdUp1Jf6eZvqKLQSk9rp9Z17FlydAhpDT5s0NY55G4CxZ
 A8O45QoEN6CzYXAY0X9/AqIOwNuci3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-UlzWekeqO161qmigxoldlg-1; Tue, 09 Feb 2021 07:53:40 -0500
X-MC-Unique: UlzWekeqO161qmigxoldlg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76F0D107ACC7;
 Tue,  9 Feb 2021 12:53:39 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6EDF171F4;
 Tue,  9 Feb 2021 12:53:35 +0000 (UTC)
Subject: Re: [PATCH v3] travis-ci: Disable C++ optional objects on AArch64
 container
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210207121239.2288530-1-f4bug@amsat.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <ebdddd92-cb51-e8b9-dfc0-fbce35015eb3@redhat.com>
Date: Tue, 9 Feb 2021 09:53:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210207121239.2288530-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/7/21 9:12 AM, Philippe Mathieu-Daudé wrote:
> Travis-CI seems to have enforced memory limit on containers,
> and the 'GCC check-tcg' job started to fail on AArch64 [*]:
>
>    [2041/3679] Compiling C++ object libcommon.fa.p/disas_nanomips.cpp.o
>    FAILED: libcommon.fa.p/disas_nanomips.cpp.o
>    {standard input}: Assembler messages:
>    {standard input}:577781: Warning: end of file not at end of a line; newline inserted
>    {standard input}:577882: Error: unknown pseudo-op: `.lvl35769'
>    {standard input}: Error: open CFI at the end of file; missing .cfi_endproc directive
>    c++: fatal error: Killed signal terminated program cc1plus
>    compilation terminated.
>
> Until we have a replacement for this job on Gitlab-CI, disable
> compilation of C++ files by forcing the c++ compiler to /bin/false
> so Meson build system can not detect it:
>
>    $ ../configure --cxx=/bin/false
>
>    Compilation
>                         C compiler: cc
>                    Host C compiler: cc
>                       C++ compiler: NO
>
> [*] https://travis-ci.org/github/qemu/qemu/jobs/757819402#L3754
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v3: Aarch -> AArch
> v2: Link to first line with error, describe Meson
>
> Supersedes: <20210206200537.2249362-1-f4bug@amsat.org>
> ---
>   .travis.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


Either disable then migrate to gitlab or going straight to the later, 
works for me.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/.travis.yml b/.travis.yml
> index 5f1dea873ec..b4b2d66fa4b 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -261,7 +261,7 @@ jobs:
>             - genisoimage
>         env:
>           - TEST_CMD="make check check-tcg V=1"
> -        - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS}"
> +        - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS} --cxx=/bin/false"
>           - UNRELIABLE=true
>   
>       - name: "[ppc64] GCC check-tcg"


