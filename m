Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C6D3AE537
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 10:46:51 +0200 (CEST)
Received: from localhost ([::1]:41056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvFZy-00075b-Je
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 04:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lvFYJ-00062V-T4
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:45:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lvFYH-0001Jf-S5
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:45:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624265104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x5pCKafEkrCjbV0CLZMUHAhTxOtF2UJawKrSBT2fO6U=;
 b=hETbgDdKaWYVSUYpAa929/HHBBNt+uW+GPl9EPVFajAfoecxEz+jt21QGw52vfffsZPcDS
 vCVAQW/c9jRqPIBNZnnbf9T5zXSpnRxvHhqMYvfaMOXlAC9EvutvruEplzfSPgc0VWlEk5
 Jk2HFQyTeGAng3YTq26DRQdSGCj2evc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-XEilvpgtN_asWUf_xocrMA-1; Mon, 21 Jun 2021 04:45:01 -0400
X-MC-Unique: XEilvpgtN_asWUf_xocrMA-1
Received: by mail-wm1-f69.google.com with SMTP id
 k16-20020a7bc3100000b02901d849b41038so3194711wmj.7
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 01:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x5pCKafEkrCjbV0CLZMUHAhTxOtF2UJawKrSBT2fO6U=;
 b=q6Vb7ILw22TiYhSWfkFwrHt1U5J/gp0B9fBdm5US6GicfwcJKsWmrYI9e26YAy6U1a
 A7ITmDdTLUbJe0JJf1ULGn1fpik8Bk8U/oruQXdQCKmtr2qTC7x+kD5qbIyChQ86whGJ
 byNmcEv5q1MsW42KxrDhkuhZSA20eB+ZYDW4BiaTlu/RTgyw8S02YQy3Sapozam10MSx
 5qay1k4ofWs4A6tAd3EREd6YPqVtVHqxScp851AlAaToyVAKuM/cLkW8biND+G0lZTFD
 y6R6vhPWIcBPwBmuH0j4NvgkcMQ+QVDDFY4sO3xEejcDu9xwl9K/KUGQAp7/S9DB8Jdu
 TIWA==
X-Gm-Message-State: AOAM533g2jrH7jAYa0/AUF30qr3Wzyb2GqMq4xTba/b9y1XwsQYaizZV
 WNdAKbmpcKDHdHyooVVFZGfvCJ2HRomGbvRiKF7echlgT15IoNcTMbYat3t7qQm4pnrCdHYHiUV
 9wzyd6IbJVyDaEwY=
X-Received: by 2002:adf:f384:: with SMTP id m4mr165474wro.12.1624265100364;
 Mon, 21 Jun 2021 01:45:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/svA9hGzP+0diiV151L18zDmCdeF136PI+dJPBo9Qt496N928XLw3Hk/koJBjtvJUjqOc6w==
X-Received: by 2002:adf:f384:: with SMTP id m4mr165447wro.12.1624265100209;
 Mon, 21 Jun 2021 01:45:00 -0700 (PDT)
Received: from thuth.remote.csb (pd9575fcd.dip0.t-ipconnect.de.
 [217.87.95.205])
 by smtp.gmail.com with ESMTPSA id f13sm17794074wmg.7.2021.06.21.01.44.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 01:44:59 -0700 (PDT)
Subject: Re: [PATCH] x86: add SEV hashing to fw_cfg for kernel/initrd/cmdline
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, James Bottomley <jejb@linux.ibm.com>,
 Connor Kuehl <ckuehl@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210525065931.1628554-1-dovmurik@linux.ibm.com>
 <20210615152033.czhsaz44yxtc5ext@habkost.net>
 <1cff8347-ee38-a0a8-f089-36b28a40b828@redhat.com>
 <06b28ac7-19ed-edd8-a555-2858e976d964@linux.ibm.com>
 <649abfe3-e799-3535-c56a-ad55ca5df947@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <29a0541d-64f2-1c55-ccf2-776d41f09c95@redhat.com>
Date: Mon, 21 Jun 2021 10:44:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <649abfe3-e799-3535-c56a-ad55ca5df947@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Tobin Feldman-Fitzthum <tobin@ibm.com>, qemu-devel@nongnu.org,
 Hubertus Franke <frankeh@us.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/06/2021 17.48, Philippe Mathieu-Daudé wrote:
[...]
> This works, but I'd rather use:
> 
>    if (sev_enabled()) {
>        sev_kernel_loader_calc_cmdline_hash(&sev_loader_context,
>                                            kernel_cmdline);
>    }
> 
> And have sev_enabled() defined as:
> 
> #ifdef CONFIG_SEV
> bool sev_enabled(void);
> #else
> #define sev_enabled() false
> #endif
> 
> So the compiler could elide the statement if SEV is disabled,
> and stub is not necessary.
> 
> But that means we'd need to add "#include CONFIG_DEVICES" in
> a sysemu/ header, which looks like an anti-pattern.
> 
> Thomas / Paolo, what do you think?

I'd only do that if you are very, very sure that the header file is  only 
included from target-specific files. Otherwise this will of course cause 
more trouble than benefit.

  Thomas


