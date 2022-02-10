Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98A64B04C8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 06:15:22 +0100 (CET)
Received: from localhost ([::1]:34868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI1nb-0005pi-Kv
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 00:15:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1nI1lR-000577-Ap
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 00:13:05 -0500
Received: from [2607:f8b0:4864:20::42e] (port=41619
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1nI1lN-0006RQ-TE
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 00:13:03 -0500
Received: by mail-pf1-x42e.google.com with SMTP id i30so8189778pfk.8
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 21:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gtBtby/pghoaFFABadNuRTmTwxrKf0aMu1wbCrBqq9c=;
 b=m3xzyiSFiV2KmU+mwC6biICYK4nvQfeM/iEwP2BjXJpQWu/L1oQ4KyF/Bi5zV/y6F7
 PuRwTeahDXcPmAs+iORiDcmAF+RBUY2GwF75Tukzzyi7Qg+IY0OQTQhmXJVcMz4psVtC
 lL3kEoy3DjFvuq1n6S/4eDWF9j4m1wP+T2ZjOzQUbQXtpdLwFlMr3DTPocwkyykoiash
 FE/LfTKm0qDc7b2XBikcIpMdp5/orvEyBD9RSHtJu1pwbXlplwx7AU3NaD0+gwCY6Jp8
 /o8D0GaDnck52+KB14EFDsuiA5lsS/U0eZL9stSYkzDF7FC6PMTg4tbqD1fnbAxj1L7d
 /M7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gtBtby/pghoaFFABadNuRTmTwxrKf0aMu1wbCrBqq9c=;
 b=yIuIissVWzdiRAL6GYXbnZ5AYn6Unspdu861jBr2bZkHgenWpYKX86424XZIkaFexh
 6aCDAGjyCfQ5z4hmjV5wTcSazCpC2Ocf+16U8JstdjfKitXIqW0Udj4qeQJEs0qjfZBo
 IQL7qDqkyagDniqn+03MZBFNvVfuyGXJrTqR63OaRA+VxlKBDIavnZJFC30LfjPGJyMm
 NAFDVKdl15rLb1i172hXmnEB5qrGtWc0T7iXyTrwiVxHMZ3GTCdYS2t4P+H+HZISOt8P
 YN9VTFvRKHgdEcz4ZQ2sJBzpJh0K0hhqcrlfxgHOj9TKx2Suw7ZlWV+NcPlL/T+oeKd5
 7l7A==
X-Gm-Message-State: AOAM532bHQB6cJZQdD5DJyCtNpDtF4+/S/6PK/EnUhh0ZnHOKWgG8lTG
 ui7BBEXWRgpc8psmTjkToaeZxbmoTnYUmg==
X-Google-Smtp-Source: ABdhPJyidlI56liQ/+JxDLJpRYgTmfxdaBMe2L5H5/0kPZFn3W7ByVAuz2QR1gseRDPnHZzwIa+tfA==
X-Received: by 2002:a63:cc05:: with SMTP id x5mr4877886pgf.163.1644469979240; 
 Wed, 09 Feb 2022 21:12:59 -0800 (PST)
Received: from localhost ([136.185.132.167])
 by smtp.gmail.com with ESMTPSA id y30sm1145374pfq.142.2022.02.09.21.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 21:12:58 -0800 (PST)
Date: Thu, 10 Feb 2022 10:42:56 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] hw/vhost-user-i2c: Add support for
 VIRTIO_I2C_F_ZERO_LENGTH_REQUEST
Message-ID: <20220210051256.mgwjj7svg3hb2ioe@vireshk-i7>
References: <4f8de2059fc963bb67920a1a2f8481f969a35eec.1641912994.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f8de2059fc963bb67920a1a2f8481f969a35eec.1641912994.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11-01-22, 20:28, Viresh Kumar wrote:
> VIRTIO_I2C_F_ZERO_LENGTH_REQUEST is a mandatory feature, that must be
> implemented by everyone. Add its support.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  hw/virtio/vhost-user-i2c.c         | 10 ++++++++--
>  include/hw/virtio/vhost-user-i2c.h |  3 +++
>  2 files changed, 11 insertions(+), 2 deletions(-)

Ping.

-- 
viresh

