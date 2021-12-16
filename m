Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0BC476D11
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:12:33 +0100 (CET)
Received: from localhost ([::1]:34700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmoR-0001zJ-2p
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:12:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxmmJ-0000xX-4Q
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:10:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxmmE-0006rf-JF
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:10:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639645812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FhMCr8DZXbiHqVYReC78EUfVNmnC3/12FeTN+Sr4B3I=;
 b=gGhj/uVdBf+Y2XCy8JMZS133hY1msjo3dqKUfcPmuWpi6tYEehwWaYBzpiRKcTIPPZtPIy
 2v8LFNh9PF/DClLAPHc3jwwh5AJ23/SOkn24UX3RSAMwit6qT3IWBbsS09/eY7VMgYOq3D
 HPdMiIgdkDxHJ6dpuxTD+eRb+KcfzFs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-YfP5spZ6NieNlARwbLlYzA-1; Thu, 16 Dec 2021 04:10:11 -0500
X-MC-Unique: YfP5spZ6NieNlARwbLlYzA-1
Received: by mail-wm1-f72.google.com with SMTP id
 b83-20020a1c1b56000000b0033283ea5facso749753wmb.1
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 01:10:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FhMCr8DZXbiHqVYReC78EUfVNmnC3/12FeTN+Sr4B3I=;
 b=4HoUvhRTwlYTfo3q8n9FmD/MPZawK7pUoeKaKrnLpUPn/mjTDoWmzezjNUkUS6ejaQ
 c46puIwEXR5HH1sbCgzB0jo2rlnfsfxwpCrChL1vJbVrU1nJSjqxnHRd/WktEh5mA4E8
 PlzjDWKA1xMjwBQsvCWImgxlwpkskxtybcGsDa1XYQSWyVPnHb62jRWRMoj/rU1aNBki
 ejgr5GpawywCc6D1qiLU4f9W+AJ7UuItxezjDP0M2TgYTPpmamZumtSvk0Hpgl0Ljb9p
 YX7wjij61rmQLSj6IufdZzZnxYhtGTAGspCWPj07S4AGWJLL6LWfAgP70H2Sogjn2RYl
 tsPw==
X-Gm-Message-State: AOAM533R2NqdwbKJnCuCkmzfncKbN1FW8mV16XVMQ0ZAW6/a8t6fJ6D0
 U49w5amIe1AcUkgk3KR/yHdnDzPKFnAEmmGhrENo0g8Zw9s5i+sYtjIv81Ml/1pruU2tlderY/v
 83xfCdvXuvofkdLg=
X-Received: by 2002:a05:600c:2295:: with SMTP id
 21mr4085741wmf.187.1639645810165; 
 Thu, 16 Dec 2021 01:10:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOzNVVQiY5pA9U0RRHEaEQbNWeAQo4Ibti1g5PIXEr98hNtx0fZKCDA/QHY5ILzLnjIEcKBQ==
X-Received: by 2002:a05:600c:2295:: with SMTP id
 21mr4085726wmf.187.1639645809980; 
 Thu, 16 Dec 2021 01:10:09 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id m15sm1953842wrw.27.2021.12.16.01.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 01:10:09 -0800 (PST)
Message-ID: <92c807dc-8608-5afe-d4c4-04876beea4d7@redhat.com>
Date: Thu, 16 Dec 2021 10:10:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 07/10] configure: unify x86_64 and x32
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211216085139.99682-1-pbonzini@redhat.com>
 <20211216085139.99682-8-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211216085139.99682-8-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/16/21 09:51, Paolo Bonzini wrote:
> The only difference between the two, as far as either configure or
> Meson are concerned, is in the multilib flags passed to the compiler.
> 
> For QEMU, this fixes the handling of TYPE_OLDDEVT in
> include/exec/user/thunk.h and enables testing of dirty ring buffer,
> because both are using HOST_X86_64.
> 
> For tests/tcg, this means that on a hypothetical x32 host the
> cross compiler will not be used to build the tests.

Why not add the cross compiler definitions to tests/tcg?

+: ${cross_cc_x32="$cross_cc_x86_64"}
+: ${cross_cc_cflags_x32="-mx32"}

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure   | 6 ++----
>  meson.build | 3 +--
>  2 files changed, 3 insertions(+), 6 deletions(-)


