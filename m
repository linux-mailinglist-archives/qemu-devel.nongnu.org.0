Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD20B486EBA
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 01:24:45 +0100 (CET)
Received: from localhost ([::1]:45982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5d3k-0006YY-KS
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 19:24:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5d1g-0004WI-Na
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:22:36 -0500
Received: from [2607:f8b0:4864:20::532] (port=33368
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5d1f-0004tN-8Y
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:22:36 -0500
Received: by mail-pg1-x532.google.com with SMTP id i30so4037042pgl.0
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 16:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jLJgXE0LvUzJc/0Lpc8gfd8Szq/AsFM8QoxCh4YrVM4=;
 b=cYaiu1OvSLJhxNwZokRFGECVJ5ElwsdBQpo7/vLGH3pDSbxQvwfnK6M72E0QzM+/wk
 nvtmXI7iFtdt9FTNviUHoaikqCJNXrl+EeTIPYmFDQDsIZvbo1UK8ItrV+v6hRnni4iw
 pYaof+Z0IEmPSamCzZovdpLODuo4HxbxvKLtE88QK0n1wi4qQeyTGS6N16mfMOToQmuZ
 dtBRZJ5QLDT3F4KBtkMY7W7BqXmxcwDwgz67GjsqNWZridYnvgHZbw/Qpaaz2bT2sjNJ
 QObgc/tYnUj5USLmKNJbbdEGDbGOLwGbTtlQP9WGGsunJLCmR0JhW2POfRWdIdxyzqbG
 jlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jLJgXE0LvUzJc/0Lpc8gfd8Szq/AsFM8QoxCh4YrVM4=;
 b=URwDJT+pyqzz/vbrFSZYCirrA8C3goIjUdA3GZ71LM96UuGNpzf3F64rQ5ulP2Pmi5
 WmGNHuuddXTC0hLIB7WaCgtA0fGvZND74+tvTIwPB2lFVvXdxlU0nAPAS7RH0nPNZt8O
 22N74ssrHof4SyeKJurNZKu+PtNXYQ9ym3FutgOm5GinTLX0B9y1kmscZi37m+x/zZ4i
 2ZNjuM4wLh0ZfmZKVxhnUI+pvZbK1mpb7gdnam2iGP6npDpIHUWqYSwmArrsYY1D7dcW
 C/XfpBKNP7R+ndj13QhHjum26E6MHo4bKR7xoOIlIcx5sk/p7a0hIdN2J8L9uIAdXaVp
 eqsw==
X-Gm-Message-State: AOAM531n5uvD9SqoLcOQf8kiYqplJ6/+ACG6Hf1v8l/rFXAfDngnMLVq
 iLNI8WunSjPY4VdzGHs4PfjaZg==
X-Google-Smtp-Source: ABdhPJwQ6etOPHXplPnYoEJWCRYC/knEjO405f4iIQaoAF0QtlpX2tk0NUkYTI3JRexB5FLcBUmQmA==
X-Received: by 2002:a63:af08:: with SMTP id w8mr26913195pge.70.1641514953987; 
 Thu, 06 Jan 2022 16:22:33 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id o11sm3802638pfu.150.2022.01.06.16.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 16:22:33 -0800 (PST)
Subject: Re: [PATCH v2 6/9] hw/scsi: Rename SCSIRequest::resid as 'residual'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220104085431.2122999-1-f4bug@amsat.org>
 <20220104085431.2122999-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0e5e9784-4853-41cd-b2e6-bc50c8003356@linaro.org>
Date: Thu, 6 Jan 2022 16:22:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220104085431.2122999-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 12:54 AM, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> The 'resid' field is slightly confusing and could be
> interpreted as some ID. Rename it as 'residual' which
> is clearer to review. No logical change.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/scsi/scsi.h |  4 ++--
>   hw/scsi/megasas.c      | 42 +++++++++++++++++++++++++-----------------
>   hw/scsi/scsi-bus.c     | 10 +++++-----
>   hw/scsi/scsi-disk.c    |  4 ++--
>   softmmu/dma-helpers.c  | 26 +++++++++++++-------------
>   5 files changed, 47 insertions(+), 39 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

