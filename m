Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9375946FEA1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 11:20:36 +0100 (CET)
Received: from localhost ([::1]:59448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvd11-00081H-MN
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 05:20:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mvcqz-0006yg-72; Fri, 10 Dec 2021 05:10:13 -0500
Received: from [2a00:1450:4864:20::52f] (port=46871
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mvcqv-0006hS-3s; Fri, 10 Dec 2021 05:10:11 -0500
Received: by mail-ed1-x52f.google.com with SMTP id y13so27884558edd.13;
 Fri, 10 Dec 2021 02:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4P1XPd4qyrGemyYjZkrNHDR5HYwCct/Qr/jTfhRjQy0=;
 b=fReeBN/CfHvhG9kKjR9IKNKAzWCbBemYWpvEyENxN2MYTSfOJPlmg+ldPikSDqZ9LE
 +v3CeYk7GNQPB1udmxyCKi8jXyfKURAR1r0jXdSwCNA/wbmf0WYqnBwmexzhpTxgXnnU
 spm4l9FtnB4zozjntv/I1IXR2ROBsXRi17AXqqemsvbXoQ2TY5dOt5Sjzpl/tel/TjkG
 X+SHIKzx03jDpffjhXTlnU+6ruRQmZ6M3IWMe59IUNNwcXqoNltaQE9MlRqIHcFPlqPC
 gdhhJEftlFgB0WF35m6sAqcGQW4yOcoHEr3mg1KiaA4bJ+1nRfLdatLMmpMGLQTwe4cr
 iDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4P1XPd4qyrGemyYjZkrNHDR5HYwCct/Qr/jTfhRjQy0=;
 b=g6OxkLyUPO1cpRCTuCMes0gDHGeIWgzKaqL8/1PaRLHUQsLS4aw9PySqZoAvOU0jvK
 hyWWWTQwDIobF6BP76xv5FgN6KoeRh+1IT3uod3jvlMY8DfJX0EpJdE80Hj4CQ7F5CE0
 VCOFCKy4kS13CX8LQ/4k8zZMmdz+jrXXwF7WCr/RhbW3C7kWoOn3MGubMJ8Q9g487XDT
 8HUca5UaijuMpgz8w6huZhfwQdp3qeCxnTRekj8GuKIKi4olYDczDP9A+87CXotrnO89
 13ht5s+xjkZ5Tc+oOPIkJK+PSgBtv2Zfze/PrQdNkaqFmDyJann7WhSxXr/d5LoyXvVq
 NnMw==
X-Gm-Message-State: AOAM532EA9AzOyPecLXvvwMfB4e4XertemrXGCkCfkczaNKryGYkcwkV
 WXeyH7D/5tyFZcgR1vxUZBg=
X-Google-Smtp-Source: ABdhPJwxjdsd8wLltC6+9xG+WeYsMbAybpYtkPk8pSlA5LjrrQEP0sdKZ/S76yY/KHejnn62xd0gZQ==
X-Received: by 2002:a17:906:9b8e:: with SMTP id
 dd14mr22654334ejc.337.1639131007158; 
 Fri, 10 Dec 2021 02:10:07 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312::973? ([2001:b07:6468:f312::973])
 by smtp.googlemail.com with ESMTPSA id gs15sm1265870ejc.42.2021.12.10.02.10.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 02:10:06 -0800 (PST)
Message-ID: <73e6f8e1-d30c-6c1b-008f-235f624d08f0@redhat.com>
Date: Fri, 10 Dec 2021 11:10:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/4] Move CONFIG_XFS handling to meson.build
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211028185910.1729744-1-thuth@redhat.com>
 <20211028185910.1729744-4-thuth@redhat.com>
 <e02332c0-7c4e-18a2-5c33-b00e8045f6da@redhat.com>
 <7da70e19-537b-9ca5-125d-f9bcf2d3f6df@redhat.com>
 <aa0b8d39-32ad-b3a0-afff-474de704211f@redhat.com>
 <4ebf08ed-dd35-8347-45f8-18be46fae16f@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <4ebf08ed-dd35-8347-45f8-18be46fae16f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.317,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/21 09:46, Thomas Huth wrote:
>>
>> platform_test_xfs_fd() is only used to decide whether to invoke 
>> XFS_IOC_DIOINFO; but failures of XFS_IOC_DIOINFO are ignored anyway, 
>> so we can get rid of is_xfs in BDRVRawState, too.
> 
> After staring at the code for a while, I wonder why we're not simply 
> using fstat() here instead to get the st_blksize value... wouldn't that 
> be better anyway since it also works with other file system types?

The value that XFS_IOC_DIOINFO returns is the logical sector size of the 
underlying device; it should be 512 or 4096, but more likely 512.  It 
can be smaller than st_blksize, because often it will be if it is 512 
but the st_blksize is usually 4096.

If it is wrong, QEMU will do unnecessary read/modify/write operations 
for disk writes that are not 4K-aligned.

Paolo

