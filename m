Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD4248BAB9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 23:24:27 +0100 (CET)
Received: from localhost ([::1]:48980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7PZ4-0007D0-N2
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 17:24:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7PWC-0005gU-V6
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 17:21:29 -0500
Received: from [2607:f8b0:4864:20::102d] (port=35406
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7PWB-0004Mz-KO
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 17:21:28 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 r16-20020a17090a0ad000b001b276aa3aabso8080992pje.0
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 14:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QmUhk1XfC/YPUdfNlSS9rEWYXal/Wey6hcydWcymV6g=;
 b=qDSiERWWA9820NtaafjxRRyO3bIYHZ4zR7U03CObuAAQu5h58AUUoq2Ba5tRnDCGrl
 zG1KGf7u6Euxc/Dna+e7fDviRDBJwmy/pdsrf5jEK51Fu3zZxm04gTZQp/bTDjylPH4h
 mAy5R/TjApL/e2GrMjAxQQHFLWo/akB8JjUUYEt7ZA95Enjtd/xd4sZOQP2jxQcVgJMV
 QFhmvn3lCteAKBR9Z0O3s4MDME5qxWneD6Nb0jOol7iZvM2mSbVrU0qkxq+kqL59N6Mc
 gqQchQFsVVoCWiN2haZrWtAnedg6vCY6LAe8dbeSborhkJOzaRmIJF5m0/zhx+/qA8rV
 jczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QmUhk1XfC/YPUdfNlSS9rEWYXal/Wey6hcydWcymV6g=;
 b=XCEnnBt5vvhNCme/Ta1XXAEe/5UIlx0VhEbpJZ7e5b5aa+lmahxbHzvzpL6ZvyywxC
 UfWCwC6q0NOFR8Mk97XkdzN7aOxB4GvAULeABVBSLO/a47SasWg+LVbWPDVV1IDVQgu/
 7MObtk+i3RpeUTellF+/xiy/y9OA+O+0K71AoAJUviqW9sVb2uhlpkTlhJXg6Ox1ds4w
 FWf33bmYd+VMy3EqrGC5DwpIIWyXiOfT6010+O+gORfQoil5G0lSUyYUjYeLyJ5aDzBt
 Hy7Yd/HYDR8hK2KIhE2Lxt5kCxMYbZZY0XdeN7cGrxOWhpL1+Ggm2FjaanLBUs1HqnZq
 xowA==
X-Gm-Message-State: AOAM530qVmNN0qNvhcYTvEMWcmj0cmnrYuMsewZb0rMZicZ08vTCa71v
 +FKX45qfAeIbK7BrDqwqWFaUrLc8dyZyEQ==
X-Google-Smtp-Source: ABdhPJz3QpsDgPVUanQ4y3ZEzrlwbVsu77aa7KNvotQqECdE3ptdta86Eh1hm4kd0uHPVkXomh2P0g==
X-Received: by 2002:a63:8f18:: with SMTP id n24mr2573232pgd.132.1641939686189; 
 Tue, 11 Jan 2022 14:21:26 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id c24sm331224pgj.57.2022.01.11.14.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 14:21:25 -0800 (PST)
Message-ID: <843749ac-677f-4bb5-0428-295fbb114e60@amsat.org>
Date: Tue, 11 Jan 2022 23:21:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH 3/4] tests/qtest/cdrom-test: Check whether devices are
 available before using them
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>
References: <20211220081054.151515-1-thuth@redhat.com>
 <20211220081054.151515-4-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211220081054.151515-4-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/12/21 09:10, Thomas Huth wrote:
> Downstream users might want to disable legacy devices in their binaries,
> so we should not blindly assume that they are available. Add some proper
> checks before using them.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qtest/cdrom-test.c | 60 ++++++++++++++++++++++++++--------------
>   1 file changed, 39 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

