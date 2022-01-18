Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91386492243
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 10:11:16 +0100 (CET)
Received: from localhost ([::1]:60752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9kWJ-00065f-B9
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 04:11:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9kU8-00058H-Eb
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 04:09:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9kU5-0003pJ-HB
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 04:08:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642496936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f80ToSTeRS2QhHqxBMupOVmqC4E2yi9LdqXCQgyxTq8=;
 b=LsR1/neJWQ4jiw7YdP13IA/wnKPdsgWx7yEnYfn6s8Bpf5XEx5iVvK/uS0VFNm3ljtC4SG
 ZkgyOL6ioRlwZo0iWJ+tSy0tWDr4pR1P7wl5XyMJooMAF/KeJC2AP+4+o50M2GngcIO+gi
 eDWBDq60NP4g2TrNOHszB7XDcMaBCmk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-FwHwzeSIN6q9Yii0n87cHA-1; Tue, 18 Jan 2022 04:08:54 -0500
X-MC-Unique: FwHwzeSIN6q9Yii0n87cHA-1
Received: by mail-wm1-f72.google.com with SMTP id
 j6-20020a05600c1c0600b0034c02775da7so2792416wms.3
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 01:08:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f80ToSTeRS2QhHqxBMupOVmqC4E2yi9LdqXCQgyxTq8=;
 b=3lMhK6apgSbRGvbia8BLS1Ot5+ylZAKALzyGjB57RG41Ky9gHdytBwqGD/aHC/VUiH
 lkngzBQHXke7zXp6MNxKKSUzrMp/LDSvEjakIxeRasHKdHLnf8XNXiAR7xCobU35vM2B
 StpT1rW6pgFwPSqEHwow9/caAQcrbN1wNYyM2DyGeTsg63lpq5izAAGt+n2hG42KK1jO
 nx7em5bCMEQU75P6N54UY9M75UBIm44uhznNsv1T51a0zGvJyFUgcydu3m7QWotk3ff6
 90lrTF/tIY2V/msbEoHz7AzjuS0+eeDeNBwV9j4JTGbc/fi3d6CUY8Wznw6FBM/PGX92
 TK4w==
X-Gm-Message-State: AOAM5311B9SsLh2ws8P1147HMrw+/Gmuwwoap4TZxVVIDyWd1yG+URv0
 hVYRinozDgjpDzLe8uMs2YQDjQtKH7cmv4l/GbeDcljp+wSWvIZjkmzt/G19mQeLe1Hpj3+8Q9U
 9AR3X0027qRyCxWs=
X-Received: by 2002:a05:600c:19d0:: with SMTP id
 u16mr8184961wmq.39.1642496933424; 
 Tue, 18 Jan 2022 01:08:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvFkMkQRbiSSxkGSFp47LmW549QWv9f9uRAYwcLrH6a0zS3dL7sgRziNAa3qTjgRm+Ec3qYw==
X-Received: by 2002:a05:600c:19d0:: with SMTP id
 u16mr8184932wmq.39.1642496933118; 
 Tue, 18 Jan 2022 01:08:53 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id r4sm1816898wmq.33.2022.01.18.01.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 01:08:52 -0800 (PST)
Message-ID: <fbf732e9-02cf-a772-06dd-e673b997efa3@redhat.com>
Date: Tue, 18 Jan 2022 10:08:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 0/5] target/s390x: Fix shift instructions
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <20220112165016.226996-1-iii@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220112165016.226996-1-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/01/2022 17.50, Ilya Leoshkevich wrote:
> v3: https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg02680.html
> v3 -> v4: Simplify cc_calc_sla().
>            Free temporaries.
> 
> v2: https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg02488.html
> v2 -> v3: Unify CC_OP_SLA_32 and CC_OP_SLA_64.
>            Add underscores to test macro parameters.
>            Shift CC in test asm.
>            Add a second SLAG test.
>            Add tags to commit messages.
> 
> v1: https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg02035.html
> v1 -> v2: Fix cc_calc_sla_32().
>            Fix cc_calc_sla_64().
>            Fix SLDA sign bit index.
>            Inline help_l2_shift().
>            Fix wout_r1_D32().
>            Add all shift instructions to the test.
>            Split the series.
> 
> Ilya Leoshkevich (5):
>    target/s390x: Fix SLDA sign bit index
>    target/s390x: Fix SRDA CC calculation
>    target/s390x: Fix cc_calc_sla_64() missing overflows
>    target/s390x: Fix shifting 32-bit values for more than 31 bits
>    tests/tcg/s390x: Test shift instructions
> 
>   target/s390x/cpu-dump.c         |   3 +-
>   target/s390x/s390x-internal.h   |   3 +-
>   target/s390x/tcg/cc_helper.c    |  38 +----
>   target/s390x/tcg/insn-data.def  |  36 ++---
>   target/s390x/tcg/translate.c    |  53 +++----
>   tests/tcg/s390x/Makefile.target |   1 +
>   tests/tcg/s390x/shift.c         | 270 ++++++++++++++++++++++++++++++++
>   7 files changed, 321 insertions(+), 83 deletions(-)
>   create mode 100644 tests/tcg/s390x/shift.c

Thanks, queued to my s390x-next branch now:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas


