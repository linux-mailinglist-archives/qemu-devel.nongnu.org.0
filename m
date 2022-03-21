Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE3F4E32A3
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 23:29:07 +0100 (CET)
Received: from localhost ([::1]:43284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWQWQ-0000cD-7R
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 18:29:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQVL-0008ME-Tw
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:28:01 -0400
Received: from [2a00:1450:4864:20::432] (port=36432
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQVJ-0001LJ-O8
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:27:59 -0400
Received: by mail-wr1-x432.google.com with SMTP id r10so22629597wrp.3
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 15:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4cgW4U8ITpr8xl01FZhR66S3GEP6d9Ku/vbe89riB7s=;
 b=L5sAL10kHjjqhHcNm1/GD9nBUdXY1AeQthGB2xApkfn936+Ki6RjHYRSLgkZLyhTQ/
 sM8XEvGsfF64vDOHFwBsyfAw/cX0nt/EBIVAk/rep8Kh5tnZprvDYByVT1mdY9RLOX5a
 9slEGIGJL1tN4lEghXZjSIMGB2mcHUCkeHCd46PFi9Vsv6UD7vdYdurbqAHQA1Tdc51p
 FwLX8y5Rgf4/65uvIUF6RPTL0enjB4/K5FGLYnZjIzXlDOjV+UQtCKWQe6r7CtjdFoAu
 ckVaAYS4LJIWfFk75KJHlrPE6cmOQZIvnvVP5PbUiVI9n4QjOADEzD/Ep9TWki0aVVL9
 S24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4cgW4U8ITpr8xl01FZhR66S3GEP6d9Ku/vbe89riB7s=;
 b=LKz1bI/lBHOYxP/yHDoR3aRbExD1Wu8X6k7Xt9tnGSE0WJvRrb9gDVzRiSM19xFcVq
 AM4uCzDaWJwY2DMR6zm5LsyKV75MIIAZnlB00r4IP9gtolZfNNEPMIbVidBimJt5fheX
 D4XHa5WOxMcUmtMl470Js21JZGh6dVij36Okj4w/Cwma+/cEnbk4rDzYIwOBxoQG9a/s
 SSeTijrhDSq8/I7TNXGqQmUTxtMhA3iO6aCe4vj8qIUvRnaNnyD9KI4wPrzNjbbpFXeU
 UjNiksa/86uYweF+HvVIM9GJ3DJ8/6o/i54T3Bz8CIN2asP1fGzOhV8oadJwsikll4r+
 koKQ==
X-Gm-Message-State: AOAM533AvazeXtwZ3Q9TMAGI6pKs+HhjHFykVxJYR7lefS+JnPuwzBrP
 FnTyyIAYroNi38pEWUZTbdA=
X-Google-Smtp-Source: ABdhPJyqD+r1EsDermd3wujp6Gv9SfuLIGDnE73qG0icvaEk2ysSA/b+FyIEOGTR8CbUFC9SqGxjuw==
X-Received: by 2002:a5d:4a0f:0:b0:1ed:d377:288a with SMTP id
 m15-20020a5d4a0f000000b001edd377288amr19377223wrq.3.1647901675842; 
 Mon, 21 Mar 2022 15:27:55 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 n23-20020a05600c3b9700b0038b7c4c0803sm596103wms.30.2022.03.21.15.27.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 15:27:55 -0700 (PDT)
Message-ID: <676212de-2519-02fe-6a13-2df9d58e0e58@gmail.com>
Date: Mon, 21 Mar 2022 23:27:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v1 01/13] hw/virtio: move virtio-pci.h into shared include
 space
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
 <20220321153037.3622127-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220321153037.3622127-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: slp@redhat.com, mathieu.poirier@linaro.org,
 David Hildenbrand <david@redhat.com>, viresh.kumar@linaro.org, mst@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "open list:virtiofs" <virtio-fs@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, stefanha@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/3/22 16:30, Alex Bennée wrote:
> This allows other device classes that will be exposed via PCI to be
> able to do so in the appropriate hw/ directory. I resisted the
> temptation to re-order headers to be more aesthetically pleasing.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20200925125147.26943-4-alex.bennee@linaro.org>
> 
> ---
> v2
>    - add i2c/rng device to changes
> ---
>   {hw => include/hw}/virtio/virtio-pci.h | 0
>   hw/virtio/vhost-scsi-pci.c             | 2 +-
>   hw/virtio/vhost-user-blk-pci.c         | 2 +-
>   hw/virtio/vhost-user-fs-pci.c          | 2 +-
>   hw/virtio/vhost-user-i2c-pci.c         | 2 +-
>   hw/virtio/vhost-user-input-pci.c       | 2 +-
>   hw/virtio/vhost-user-rng-pci.c         | 2 +-
>   hw/virtio/vhost-user-scsi-pci.c        | 2 +-
>   hw/virtio/vhost-user-vsock-pci.c       | 2 +-
>   hw/virtio/vhost-vsock-pci.c            | 2 +-
>   hw/virtio/virtio-9p-pci.c              | 2 +-
>   hw/virtio/virtio-balloon-pci.c         | 2 +-
>   hw/virtio/virtio-blk-pci.c             | 2 +-
>   hw/virtio/virtio-input-host-pci.c      | 2 +-
>   hw/virtio/virtio-input-pci.c           | 2 +-
>   hw/virtio/virtio-iommu-pci.c           | 2 +-
>   hw/virtio/virtio-net-pci.c             | 2 +-
>   hw/virtio/virtio-pci.c                 | 2 +-
>   hw/virtio/virtio-rng-pci.c             | 2 +-
>   hw/virtio/virtio-scsi-pci.c            | 2 +-
>   hw/virtio/virtio-serial-pci.c          | 2 +-
>   21 files changed, 20 insertions(+), 20 deletions(-)
>   rename {hw => include/hw}/virtio/virtio-pci.h (100%)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

