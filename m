Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 266AF3DF062
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:36:37 +0200 (CEST)
Received: from localhost ([::1]:45512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAvX2-0006I1-7u
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mAvUB-0003pw-T7
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:33:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mAvU9-0007H2-6c
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:33:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628001216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R471ZjtBLrDqZSPryU9RLiOfSlSJd1v0EEFe87el/uo=;
 b=gG7C2zKDdJIbYlVVAM/joO2JG3vbp5W+cv6dxSbqy6LDtoxCqvXh1/RDaQI+T4th7WDfPn
 5Q+XAGjKbbycOTZs+8Bfj0Z5wip1kTrP9RohP6jBmCffoxcauvA7lBwWO5f9TxzljtxWie
 Vt198BrjxFG4Tl4LrSelorN2djc3Tdw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-Ak7Rrhx_ON690LMxlL9fng-1; Tue, 03 Aug 2021 10:33:34 -0400
X-MC-Unique: Ak7Rrhx_ON690LMxlL9fng-1
Received: by mail-wm1-f70.google.com with SMTP id
 n17-20020a7bc5d10000b0290228d7e174f1so3963426wmk.0
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 07:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R471ZjtBLrDqZSPryU9RLiOfSlSJd1v0EEFe87el/uo=;
 b=klSrkxlg8EwP8eIczBywarnlAaMh/08E3RX7g7d7y+YDMhR8us31ABI0MXO8V4B9V+
 +HdPY9Q/inmvjUh/OaotC+CIHySQxn0ESdE9CxZyYOzAgzaqpbAMnDPOF/+sIXfgu45E
 fFJPogVbqaCQy09Yxn9P3xVJbjDQWi3rDe9EhuMYCxBTmeYFeQzhWjzQmvu+uHglfeyh
 0fA/xmxD9UfXkglj26GMAfe3r29pbaE74qTuKsLRtWXFFb/avMheFOCzBPpVV3cKC57e
 jtniSFToNkm3adFJzbSSBSCMtaIC3MNBa9u2VFUDJyFpBYFLWjbakJWe5IJfm1H2GFct
 MWyw==
X-Gm-Message-State: AOAM531HFQbRIkA5gVg+77HPux5cpKHR8jeGXbSkgfA5aZ+HKNMPKdac
 yc7HDug4oEmQMCaxI+j1s3iWaxgJBPoLtq9xT2m+Gl+YtWWhus/nfXrZppR656cw5Bt4u3RbY6V
 f2HOlm/N/Qgr1Av0=
X-Received: by 2002:a5d:6102:: with SMTP id v2mr22742743wrt.223.1628001213337; 
 Tue, 03 Aug 2021 07:33:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0UVpogB8D3PpHyEYAbW6mHyKl3bavyECk2T9S3woy7/nt3JCgVd4of46E8fX1IDcQmTxPEA==
X-Received: by 2002:a5d:6102:: with SMTP id v2mr22742717wrt.223.1628001213133; 
 Tue, 03 Aug 2021 07:33:33 -0700 (PDT)
Received: from thuth.remote.csb (p5791d8a3.dip0.t-ipconnect.de.
 [87.145.216.163])
 by smtp.gmail.com with ESMTPSA id x16sm15085413wru.40.2021.08.03.07.33.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 07:33:32 -0700 (PDT)
Subject: Re: [PATCH v6 2/2] tests/tcg/s390x: Test SIGILL and SIGSEGV handling
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Cornelia Huck <cohuck@redhat.com>
References: <20210705210434.45824-1-iii@linux.ibm.com>
 <20210705210434.45824-3-iii@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <dd3171d3-6bd0-8c99-82e5-3d554f77902d@redhat.com>
Date: Tue, 3 Aug 2021 16:33:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210705210434.45824-3-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "jonathan . albrecht" <jonathan.albrecht@linux.vnet.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/07/2021 23.04, Ilya Leoshkevich wrote:
> Verify that s390x-specific uc_mcontext.psw.addr is reported correctly
> and that signal handling interacts properly with debugging.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   tests/tcg/s390x/Makefile.target               |  18 +-
>   tests/tcg/s390x/gdbstub/test-signals-s390x.py |  76 ++++++++
>   tests/tcg/s390x/signals-s390x.c               | 165 ++++++++++++++++++
>   3 files changed, 258 insertions(+), 1 deletion(-)
>   create mode 100644 tests/tcg/s390x/gdbstub/test-signals-s390x.py
>   create mode 100644 tests/tcg/s390x/signals-s390x.c
> 
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index 0036b8a505..0a5b25c156 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -1,4 +1,5 @@
> -VPATH+=$(SRC_PATH)/tests/tcg/s390x
> +S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
> +VPATH+=$(S390X_SRC)
>   CFLAGS+=-march=zEC12 -m64
>   TESTS+=hello-s390x
>   TESTS+=csst
> @@ -12,3 +13,18 @@ TESTS+=mvc
>   # This triggers failures on s390x hosts about 4% of the time
>   run-signals: signals
>   	$(call skip-test, $<, "BROKEN awaiting sigframe clean-ups")
> +
> +TESTS+=signals-s390x
> +
> +ifneq ($(HAVE_GDB_BIN),)
> +GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
> +
> +run-gdbstub-signals-s390x: signals-s390x
> +	$(call run-test, $@, $(GDB_SCRIPT) \
> +		--gdb $(HAVE_GDB_BIN) \
> +		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
> +		--bin $< --test $(S390X_SRC)/gdbstub/test-signals-s390x.py, \
> +	"mixing signals and debugging on s390x")
> +
> +EXTRA_RUNS += run-gdbstub-signals-s390x
> +endif

  Hi Ilya,

FYI, I've put patch 1/2 into a pull request today, but this testing patch 
has a non-trivial conflict with commit eba61056e4cc ... could you please 
check how to get this enabled properly again
and then respin this patch 2/2 here? Thanks!

  Thomas


