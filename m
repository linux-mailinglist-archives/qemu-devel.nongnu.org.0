Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A408486243
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 10:42:39 +0100 (CET)
Received: from localhost ([::1]:33742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5PI5-0007wq-Or
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 04:42:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5PFX-0005Lc-Hf
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:39:59 -0500
Received: from [2a00:1450:4864:20::32f] (port=53782
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5PFW-0001rT-2D
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:39:59 -0500
Received: by mail-wm1-x32f.google.com with SMTP id l4so1337802wmq.3
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 01:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wLyxWkoiMW49IC9nvrxPS2yZmzp6wiqm+YTEdKcitzU=;
 b=CrdbxAwAHeuQRD5A3S3SfpU2Euqr4z6kPt6ncMb/yRSlwQ2GZm/nO/AZqF7LCafShp
 7HObZahAUEJFAMnKb7Y+sMOcr63AbNhZfMY8EkXmD/MxNROopgYzFaGIY/OnYFKVqNXU
 aC67/K1BR/83Zg4RVW+NaCqDUxzhsW6EiF3nuW3JFOZpPv9gLp80Kzyd9CXbWHnXiqj0
 4MV2oliZcI6qHZv+OW/otL1txXu0+WPIgQRYHf8bf660x9jO4y854vRgWi5bbB0KU8NW
 EPvDJAhO+9mhN4G1HMumiAagKPYcIejjdDkDMPnKPxTNOhmYhR72FdyJOd1mzRcCU9EX
 Mfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wLyxWkoiMW49IC9nvrxPS2yZmzp6wiqm+YTEdKcitzU=;
 b=VFnR0XHHpozTcn2leenpv8vdRQ/xYRtmdx1hrgqPLpRx6Dzbycww1xXQ/MgmdiLczT
 8gvuEC+e0FziX1DTaz5cCHnwOiKvD4BgzUPLohSk0jbX7Ak8OK9hEFqMzl06y1YZ3GUO
 7cLjUS3Rdzrn/mz/dGwuI7VYwppSEEQl+WP1os7bHdS/MpsbtCZNnntDwPO6Qf6Pk8jJ
 t/2weuCCsMINK7+dm3Bv77qHiB8qJAzzvVQywDfj2hu8WzgM5HVbSpfW9tdOUZ7DElX9
 0KhFwIs79fC06c1AHewaj0uq678ynDhlkbL/qrwb+FT9X2XXQsvpdFq/mX2FrVU+jw/9
 ExYg==
X-Gm-Message-State: AOAM530MMZqxYadlIoOT/N40Tq2soZ0kUWru977I7D/8vHCnSWX/C0iB
 79lUUchDPfdlk9kA0+RgqVI=
X-Google-Smtp-Source: ABdhPJyywv0KaOrEk9ONsP26za71T0FFWGUS6/+H38axLX4MHSA6UalhW2KzdgN5Whvm9Gza+fq2tQ==
X-Received: by 2002:a7b:c0c1:: with SMTP id s1mr6194957wmh.176.1641461995703; 
 Thu, 06 Jan 2022 01:39:55 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id ay39sm1257787wmb.29.2022.01.06.01.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 01:39:55 -0800 (PST)
Message-ID: <bec98994-7782-c8ce-cf31-78c553bfcb1d@amsat.org>
Date: Thu, 6 Jan 2022 10:39:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH] MAINTAINERS: Add entry for QEMU Guest Agent Windows
 components
Content-Language: en-US
To: Kostiantyn Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20220105095055.44475-1-kkostiuk@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220105095055.44475-1-kkostiuk@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

On 5/1/22 10:50, Kostiantyn Kostiuk wrote:
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
> ---
>   MAINTAINERS | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

