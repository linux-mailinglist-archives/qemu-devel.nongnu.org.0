Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2202DFC9A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 15:12:55 +0100 (CET)
Received: from localhost ([::1]:52640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krLvi-0004Yi-C9
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 09:12:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1krLuA-00046p-Ip
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:11:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1krLu7-0004Db-8W
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:11:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608559873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p/SBGWpFzjgFYUWZY68eKICGGitNV9rREsKvaX+VDRc=;
 b=CU2GxOrenwtVOVSKyxmpsy5AOkaa7gwUgQjg4AP1/jyg7EZWppYvcTg8KFoQFw2iMBdtHS
 Hc6ONn4BsPeQVAr9UHdFja3PLd0tsCr9rRWlkvWXzakDWBJmGqIpj/h12sqCenj24OiNA1
 kfZdcO538iuHA4BZPeBgEs9oryNTUg8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-mZu40U6kMl6G5aksr2yBjw-1; Mon, 21 Dec 2020 09:11:05 -0500
X-MC-Unique: mZu40U6kMl6G5aksr2yBjw-1
Received: by mail-wr1-f71.google.com with SMTP id j5so8684513wro.12
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:11:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p/SBGWpFzjgFYUWZY68eKICGGitNV9rREsKvaX+VDRc=;
 b=dqZe2bUkXGUf2rzYKHUw5ZoJFRkiKE/Cy+DL/b4XH9wZMaSUcO2qgT9EoUDo0DtC1U
 i3aFnDFrqskpc6ezc/XvqNzibbmNy9Wcwx2fv+EbVlm1r7PyM3dPba4WGbJNuPzJnuMd
 EjKip6OOOvhHysYzo8JUdv+E8Rip1ZvMGCvdbIFVaPoQjFH93Nm6tuOy6S3CBJ/40zx5
 cQ4zNunULyIRQLQIjMwNyR9ORwtBinXw4f1KqblfwSuExi55nLLmXBAnQ9SvuZLEPJtF
 3zU4iWAIXL4fW+vu3h9sEzqnC0xxBlcqY74f7ZFx23SDO0TCKVt/8UMF4z/crp9+Xipn
 zdWw==
X-Gm-Message-State: AOAM5320fZjAei0cKLIDTCi7HaeLrT1E1r2qz3sU6uj3M/hRsiyr+SQE
 +4zN2x4vtbbHsyD5nJF5qmu7lEX2qg6D46KdeNsDcv9R67JfQG5CsNt1j3jZ7MSNEnzKgS5RkAZ
 VwPJk5MQAeGEKJj7iHuC0c1/TCsfukL9Oqp0HSwTVckuZNWuqpN7jj4u/3Wb/+4GC
X-Received: by 2002:a05:600c:2188:: with SMTP id
 e8mr16931617wme.99.1608559864476; 
 Mon, 21 Dec 2020 06:11:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3GqoLCjKjcGNupnsikMBbEL5tZf1SehGv1t3HmOzX1/SJjwcLp6IUzH6ViLxuqscqDKri3Q==
X-Received: by 2002:a05:600c:2188:: with SMTP id
 e8mr16931585wme.99.1608559864209; 
 Mon, 21 Dec 2020 06:11:04 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id c190sm22682549wme.19.2020.12.21.06.11.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 06:11:03 -0800 (PST)
Subject: Re: Dropped/disabled NVME support in qemu
To: Guenter Roeck <linux@roeck-us.net>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>
References: <bcf1a98d-e86b-7b34-e384-b4b7e0e22747@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <77d714a6-9922-1541-9f32-6ccb6ff9ea0f@redhat.com>
Date: Mon, 21 Dec 2020 15:11:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <bcf1a98d-e86b-7b34-e384-b4b7e0e22747@roeck-us.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.233, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing NVMe emulation maintainers.

On 12/21/20 6:12 AM, Guenter Roeck wrote:
> Hi all,
> 
> since qemu v5.1, nvme support has been dropped from several architectures.
> Well, it was not exactly dropped, but disabled.
> 
> On those architectures, trying to boot from an nvme drive now results
> in the following or a similar error message.
> 
> qemu-system-alpha: -device nvme,serial=foo,drive=d0: MSI-X is not supported by interrupt controller
> 
> This is the result of the following two commits.
> 
> fbf2e5375e ("hw/block/nvme: Verify msix_vector_use() returned value")
> 1c0c2163aa ("hw/block/nvme: verify msix_init_exclusive_bar() return value")
> 
> Affected architectures are alpha, parisc, ppc, sh, and sparc, and every other
> architecture/platform where the interrupt controller does not support MSI-X.
> After reverting above patches, I can boot from nvme again.
> 
> This does not really matter for me - I run my own versions of qemu anyway,
> and don't mind carrying reverts if I have to. However, for my education,
> I would like to understand why nvme support was disabled, especially since
> it seemed to work for me just fine for years. Can someone please explain ?
> 
> Thanks,
> Guenter
> 


