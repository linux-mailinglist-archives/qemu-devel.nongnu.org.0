Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F844AE71F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 03:43:01 +0100 (CET)
Received: from localhost ([::1]:53844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHcwe-0007y5-Dh
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 21:43:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1nHctk-0006SM-M6
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 21:40:00 -0500
Received: from [2607:f8b0:4864:20::d29] (port=44863
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1nHcte-0005OP-Pw
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 21:40:00 -0500
Received: by mail-io1-xd29.google.com with SMTP id p63so1445109iod.11
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 18:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AHiNmxlNENYcBRLQ7iNcYEktPAIAg/SJM+F80bwgQNo=;
 b=c2AXqFE/EAeCvNwFTr+oYl07Xsog7CtNlsFUhdtGjnkeTzCvCPVRIrQnKGY0PR6y7J
 fMQMTvmZZm15vbR4UDNXpOG1uwnLV9joOmKfvlIyAaESoYtYbBE+emlC0SKanWzLEcGY
 38OzlxoVyIboVJv9SREijbIn8oXrc8prgmHvPAz0jNKfUfvv2CRtDbF6RyJLsXphIJfG
 WvHARZ3UfAMfTYacprpWWL+LbEGrpa19se6nRvIyL58IF6Q7in3kbc52eYFD7QtLHPGi
 YmqHDqEseJ+0oWYNDyldPOH58wJnEwZQMBSMl18oyuEzgnHRFFaCXIUvVqo9FAjy8MgT
 Shcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AHiNmxlNENYcBRLQ7iNcYEktPAIAg/SJM+F80bwgQNo=;
 b=zc4CDoHycV93tenTHBnaXlJVlJtucGEL3lCi63CDzH2GB0cpvescLc6Vm/X4gMw72x
 g+57lrgYxuqUxSqwmGlH5mq8fYAlN3jqQsMU0OROMpgrybmBNGBev6dRxULA9IXHgYN2
 8CbF65rJTt228h0uuVdLT1ZDxBuFZKRJwnYZOBiDjC/FWt3XKRYJZ1rFjRM7SQ9/cVmt
 pv/MThrgiGBnR5czzmp/zNSk4XcJBA95d5KnX8w/YiNZdMbRk+XOea8ZZ03TNsMULjTM
 HxfkYjABhlLs4vTJvbjEr7wC5XsuKNgE/81xbDZHF8rH8iXS5vizq22g2S3wQG6e1gCL
 kSlA==
X-Gm-Message-State: AOAM5331IqksdJhxG/xTDKtWkjdy3MOTnTJBsYMP9omhJ+YF+uzpl4Bs
 i7593ztK32DYnKP4UC23ya8eOo7VOY5cp+zTUzgvfA==
X-Google-Smtp-Source: ABdhPJw73v9m+8P40bUM84b8PVBpYrBOcnY3YrZ73A5+D4dvlXohtks3FUaJvK9LG6Pdh9KblQWyAlRUYlfWfJpK3H8=
X-Received: by 2002:a05:6602:21cb:: with SMTP id
 c11mr132450ioc.73.1644374386866; 
 Tue, 08 Feb 2022 18:39:46 -0800 (PST)
MIME-Version: 1.0
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
 <20220204204335.1689602-24-alex.bennee@linaro.org>
In-Reply-To: <20220204204335.1689602-24-alex.bennee@linaro.org>
From: Emilio Cota <cota@braap.org>
Date: Tue, 8 Feb 2022 21:39:36 -0500
Message-ID: <CAJY1Aq7VfUDfGRVJGZxk-sPpTQu6g4KV6BFd5A2SAWoieKnjJg@mail.gmail.com>
Subject: Re: [PATCH v3 23/26] tests/plugin: allow libinsn.so per-CPU counts
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: softfail client-ip=2607:f8b0:4864:20::d29;
 envelope-from=cota@braap.org; helo=mail-io1-xd29.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, berrange@redhat.com, Luke.Craig@ll.mit.edu,
 kuhn.chenqun@huawei.com, aaron@os.amperecomputing.com,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Robert Henry <robhenry@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 Stefan Hajnoczi <stefanha@redhat.com>, crosa@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Sorry if this comes out garbled, I'm on a web editor not a proper email cl=
ient)

On Fri, Feb 4, 2022 at 3:49 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
> +typedef struct {
> +    uint64_t last_pc;
> +    uint64_t insn_count;
> +} InstructionCount;

This will need padding to take up a cache line.

> +static InstructionCount counts[MAX_CPUS];

And this will need alignment so that it begins on a cache line as well
(although if the struct is aligned that might be enough).
See examples of QEMU_ALIGNED, e.g. in struct qht_bucket.

Doing this will avoid cache line ping-pong across vCPU threads
and therefore improve scalability.

+static bool do_frequency;

AFAICT is unused.

Thanks,
    Emilio

