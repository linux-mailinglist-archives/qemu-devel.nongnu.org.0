Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650CB5EBF02
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 11:51:20 +0200 (CEST)
Received: from localhost ([::1]:43290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7FH-0005Yk-H3
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 05:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1od7AB-000165-Mt
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:46:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1od7AA-0006N4-9b
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:46:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664271960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aZiN0icSSJMdRfEF/dFFQX2Msek/+2i3KkinbfOF1qc=;
 b=VxXrRV3nlTj1AxPe3I6C48KoZhOcrYgiHIV5Eje2khzMsq2cLJu1mkWJg6eNIyKx4jW3gj
 e4jxA1+KrUH0fuE9r89hK+HskVMGxsQrTfHFzHCckvOAJp+LDJtqTXjiIpd0jKYC9SMneZ
 vWjIquLhwXrBfgJKGS289LERqoGYTQk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-151-49q8-pZ4M1qoZr8YuAs7JQ-1; Tue, 27 Sep 2022 05:45:49 -0400
X-MC-Unique: 49q8-pZ4M1qoZr8YuAs7JQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 62-20020a1c0241000000b003b4922046e5so5308557wmc.1
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 02:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=aZiN0icSSJMdRfEF/dFFQX2Msek/+2i3KkinbfOF1qc=;
 b=wwnFFzpI1ksbzyhfdHEpIJGIP53RYK5DCltpFFy1FCmCY0RWz15xFOqCPwvbVt2Bu+
 /E8j43zt22jDOef0dPgdwQLIzcxLC+SbeMmeD6oUDrLfnYn0fB1aP01Hbjj+Vub0GL/f
 aUb7gX9RL0qaXrIfEoCdO1Q6mZwJPW0GyGayTJH/Qrun5pmbdcfj+lYlXxPm32KE3Li3
 KrF7Ay8BI0v8UaekSgQ6FOZ9f+VpY8rzo7NrQYAHpn7Nq6qdEFnC67XIxLzpkJSvdNkC
 Q16Yx2OXD8nmLoDde1oNIgMjj5yECus1k5lGw1tZsxP49i/qXYivYXKLxvvnpPme4KVs
 hY0w==
X-Gm-Message-State: ACrzQf3QJZC16BdzU0n7w5JGUdpJra/xxwJGH7COVXdV4Kv8337ld88M
 Wt4V7tOzMSDeFcgDZg2mUICHCRRFCzbl1fUV4zAdT0QOPMBXPVdNAbSD7CNCtgpaUUuUQbXi3hv
 H5rOEXRgZC5NCzcg=
X-Received: by 2002:adf:cd10:0:b0:22c:a109:f51d with SMTP id
 w16-20020adfcd10000000b0022ca109f51dmr7009608wrm.238.1664271947988; 
 Tue, 27 Sep 2022 02:45:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5YQ+xqv4aNkCqSpyDZoU2Z8C5wi9vOVW98JFksGytYmFcaecZGmkSALz+WJDANwy4tGH5GOg==
X-Received: by 2002:adf:cd10:0:b0:22c:a109:f51d with SMTP id
 w16-20020adfcd10000000b0022ca109f51dmr7009590wrm.238.1664271947756; 
 Tue, 27 Sep 2022 02:45:47 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-30.web.vodafone.de.
 [109.43.179.30]) by smtp.gmail.com with ESMTPSA id
 v13-20020a1cf70d000000b003b31c560a0csm1224975wmh.12.2022.09.27.02.45.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 02:45:47 -0700 (PDT)
Message-ID: <574e596a-0016-9f0e-9e8e-12d7ea0b1ecb@redhat.com>
Date: Tue, 27 Sep 2022 11:45:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 04/11] qtest: make read/write operation appear to be
 from CPU
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220926133904.3297263-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/09/2022 15.38, Alex Bennée wrote:
> The point of qtest is to simulate how running code might interact with
> the system. However because it's not a real system we have places in
> the code which especially handle check qtest_enabled() before
> referencing current_cpu. Now we can encode these details in the
> MemTxAttrs lets do that so we can start removing them.

s/lets/let's/

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - use a common macro instead of specific MEMTXATTRS_QTEST
> v3
>    - macro moved to earlier
> ---
>   softmmu/qtest.c | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)

Acked-by: Thomas Huth <thuth@redhat.com>


