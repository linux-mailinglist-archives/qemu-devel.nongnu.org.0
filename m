Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0025E4024C1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 09:55:20 +0200 (CEST)
Received: from localhost ([::1]:44900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNVwu-0004iR-3E
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 03:55:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNVw2-0003yn-3j
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 03:54:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNVvz-0005jp-Os
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 03:54:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631001261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b3c7AktJFJmniT2Bl3lHt7EjwrSVW/T3AhayHIFnDYY=;
 b=iyeEUEIzMVStVzetALeGbSvmWq7dI8nFOjsDLAkLC+i8j7tDzxDhbkgdFDYKSCuK471lim
 GO18dsvLeeh3y1jMX0PIlpI+XemqoUlAXlZQROppYxz8JY+vmeJiz7U2jiD1dez3VjBI7f
 uTWkVr3npXWhV7es5MX+FhAWfsQcAtg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-VrVdGwD6MaqnH-t8F2fnTg-1; Tue, 07 Sep 2021 03:54:21 -0400
X-MC-Unique: VrVdGwD6MaqnH-t8F2fnTg-1
Received: by mail-wm1-f72.google.com with SMTP id
 w25-20020a1cf6190000b0290252505ddd56so3075825wmc.3
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 00:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b3c7AktJFJmniT2Bl3lHt7EjwrSVW/T3AhayHIFnDYY=;
 b=j03P7zqgMKHLG0o+rErEaPhRCleClcQwsHoQSWp5F3gaTTFbPrxslGwV2gzRXuZaN/
 0e/juk4WqfVsfdZwHAYIrL+XR0x9NIfN7hxB5lKWq7tRRpYhb5/smKKOBZxnEw+PtPGo
 MNFRZrfI18BKQ3re2qsnkKZkSnWobxnk4DG6ap3s+w4yer0lPaX+Xxl9beQWykHocN0L
 qy4lvR7tSUpvi7ypIeIsIBD4HefuMXNDxHkD0M/DP8BWm5TBAi7jvZxHBXYy+SGVbUqv
 xyTCxeceRMDzyiiv2OsI/Oi5SMcStxZZ2vnLLIoavUquBIOAG9QXQf9JcDIyc6fyGn+h
 kVjQ==
X-Gm-Message-State: AOAM533Bi22xA9G1s1UoT4mmvhszOrCP4UdA88Cr5ls24kzjxGx2p5qF
 vj5zx6qvvfZyN5UOKgxVwQvX8tcNcbUTJR+KjQPPdcHw83VfhQVQH2BGI5oki8alvhbwiA9dHmO
 QRcap+Eb4SVQSGs4=
X-Received: by 2002:adf:8102:: with SMTP id 2mr17430268wrm.89.1631001259916;
 Tue, 07 Sep 2021 00:54:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPII8hvLCyoAewWfeCPa0mtQm70wmrdcY75cdtV9VCU8Wlpt832AWspl1oIxLc+HJWUIawQg==
X-Received: by 2002:adf:8102:: with SMTP id 2mr17430235wrm.89.1631001259660;
 Tue, 07 Sep 2021 00:54:19 -0700 (PDT)
Received: from thuth.remote.csb (pd9e8396c.dip0.t-ipconnect.de.
 [217.232.57.108])
 by smtp.gmail.com with ESMTPSA id g11sm9992481wrx.30.2021.09.07.00.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 00:54:19 -0700 (PDT)
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
References: <1626975764-22131-1-git-send-email-pmorel@linux.ibm.com>
 <1626975764-22131-5-git-send-email-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 4/5] s390x: topology: Topology list entries and SYSIB
 15.x.x
Message-ID: <ffcf733a-1e72-3437-9ece-58767629c5fb@redhat.com>
Date: Tue, 7 Sep 2021 09:54:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1626975764-22131-5-git-send-email-pmorel@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/07/2021 19.42, Pierre Morel wrote:
> We define the CPU type Topology List Entry and the
> Container type Topology List Entry to implement SYSIB 15.1.x
> 
> This patch will be squatched with the next patch.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   target/s390x/cpu.h | 44 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 44 insertions(+)
> 
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index b26ae8fff2..d573ba205e 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -564,6 +564,50 @@ typedef union SysIB {
>   } SysIB;
>   QEMU_BUILD_BUG_ON(sizeof(SysIB) != 4096);
>   
> +/* CPU type Topology List Entry */
> +typedef struct SysIBTl_cpu {
> +        uint8_t nl;
> +        uint8_t reserved0[3];
> +        uint8_t reserved1:5;
> +        uint8_t dedicated:1;
> +        uint8_t polarity:2;
> +        uint8_t type;
> +        uint16_t origin;
> +        uint64_t mask;
> +} QEMU_PACKED SysIBTl_cpu;
> +
> +/* Container type Topology List Entry */
> +typedef struct SysIBTl_container {
> +        uint8_t nl;
> +        uint8_t reserved[6];
> +        uint8_t id;
> +} QEMU_PACKED SysIBTl_container;

Any chance that you could drop the PACKED from th above two structs and use 
QEMU_BUILD_BUG_ON to check the size instead?
... PACKED was causing some build issues on other architectures in the past 
already, so we should try to avoid it if possible.

  Thomas


