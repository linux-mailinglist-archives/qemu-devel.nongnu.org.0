Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2AC312AA0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 07:18:38 +0100 (CET)
Received: from localhost ([::1]:38724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8zsb-0002kJ-QS
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 01:18:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l8zVY-00007l-C7
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 00:54:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l8zVU-0001BP-Cw
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 00:54:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612763683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SJFl36kjUJKScwH6PvNbdJX/X+zYCFUGbPO569wiWhA=;
 b=AqP5lKoADSiCVEsxcJ7IZX/APsLGEyV7a9QBsNnRGr4mWDY7TYVU4NRT47F2ddCgEvRTp0
 I4WAhY/IspW+NTI+js+/pb+5UEJMz+BqY86KFHjQ2kEzxek1EtrHDueUPqwmpgJJnh5uBT
 Hew6MOtRJLXZvJXijk6NNYBZME9mx+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-gRhThgajP-m_69-9Xn6EkQ-1; Mon, 08 Feb 2021 00:54:40 -0500
X-MC-Unique: gRhThgajP-m_69-9Xn6EkQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0018C36492;
 Mon,  8 Feb 2021 05:54:37 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-117.ams2.redhat.com [10.36.112.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8453A6F97E;
 Mon,  8 Feb 2021 05:54:36 +0000 (UTC)
Subject: Re: [PATCH v2] travis-ci: Disable C++ on Aarch64 container
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210206200537.2249362-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <29f38036-9acd-abf4-1a75-5a4ac54273a6@redhat.com>
Date: Mon, 8 Feb 2021 06:54:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210206200537.2249362-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/02/2021 21.05, Philippe Mathieu-Daudé wrote:
> Travis-CI seems to have enforced memory limit on containers,
> and the 'GCC check-tcg' job started to fail [*]:
> 
>    [2041/3679] Compiling C++ object libcommon.fa.p/disas_nanomips.cpp.o
>    FAILED: libcommon.fa.p/disas_nanomips.cpp.o
>    {standard input}: Assembler messages:
>    {standard input}:577781: Warning: end of file not at end of a line; newline inserted
>    {standard input}:577882: Error: unknown pseudo-op: `.lvl35769'
>    {standard input}: Error: open CFI at the end of file; missing .cfi_endproc directive
>    c++: fatal error: Killed signal terminated program cc1plus
>    compilation terminated.

If disabling C++ "fixes" the issue, ok ...
Otherwise, we should maybe rather limit the amount of parallel jobs there 
instead? (i.e. compiling with "make -j1" in the worst case?)

  Thomas


