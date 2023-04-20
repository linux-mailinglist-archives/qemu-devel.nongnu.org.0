Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AEB6E8C89
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 10:18:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppPU8-0007c6-Cq; Thu, 20 Apr 2023 04:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppPU6-0007bk-Ts
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:17:42 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppPU0-00045O-Tb
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:17:42 -0400
Received: by mail-wm1-x32a.google.com with SMTP id he13so823154wmb.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 01:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681978654; x=1684570654;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f13MQ93ddq/Nd75N1ll36Z5zAz1KfuOg0cGpRV2ear0=;
 b=Dctjjv3Her1C+F0+KW0Qt046ZCEeDgZkO8003lMWpMr0cRK2zh6yCL6RYOmwdiFB6B
 zmVyNkKHCVk8PWYN3iSJuDcg/Hz/2pl7O56QaaORZ062381fPJidzo9qZzw2LJo4+PWS
 yU+r2fu7RH06XYw+XmjTlXFB3H5PlhyY4vJRDzWOIcLPu6vIoNpwcPWZDMmpOjjGIrrP
 Zx2XXZBP/gitGY/tqxUfd5jSGImn2wm+RiPX2kUPGke3B0mUvaeCM1+R6PUZNgtS1js4
 kDoD9FFhmx9jmoJroTu5BK21cqrW4TfUQjOAIvDyUfNtZJk3wnMEwpE+HJreU0YNXdnO
 e14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681978654; x=1684570654;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f13MQ93ddq/Nd75N1ll36Z5zAz1KfuOg0cGpRV2ear0=;
 b=evbbOOaYdf+MlkQm4Dvp6ugHElcw/qRcjekl3IkKikkiHKSurUg+FWfTUnLyZpQmSi
 Yl5CNj3A1+vnH3EbTVWpz7Gc8GmLrMM0Nx+3+Z4WbOWEEDhFBpQG1TtUgIe+5xlhbucw
 8122bp/YF5DyogCDWsjRTWSuGuK3e4uy6jLaOwe2lx5HUekwuUslIr5fQ57YpbU0LJ9P
 ddOZLSToED/An4PoDVH4r0lbVXA/XoglH6rQ6pCuL+6UbQpOVd8bAZmtSYHUPqDC+BiY
 Svra6cOpll8wZs5/wZXlNHWczUm58e+wl515ETAyowI8GJB8KMbOJdZx2AEu7Om1v+4p
 jpiQ==
X-Gm-Message-State: AAQBX9eXL2u2sKfZ5VJLDTzvAhjzhSVi/kHVqFmlPgWBEE5c/ZZnaMIl
 pJIyyNuX/pptZcTI0IotUyvAHg==
X-Google-Smtp-Source: AKy350a+S7Bo5cgeIITonHrFz17ZzQ14J39mXHJXktyn9+4RrBlds2+14MAKJinCJiahV/R/tP2QIA==
X-Received: by 2002:a05:600c:2183:b0:3f1:7848:6740 with SMTP id
 e3-20020a05600c218300b003f178486740mr647559wme.8.1681978654594; 
 Thu, 20 Apr 2023 01:17:34 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5246000000b002fe87e0706bsm1247834wrc.97.2023.04.20.01.17.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 01:17:33 -0700 (PDT)
Message-ID: <cd8bb8f9-5d4f-76ba-1783-aebabb66a896@linaro.org>
Date: Thu, 20 Apr 2023 10:17:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 01/16] hw/qdev: introduce qdev_is_realized() helper
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Fam Zheng <fam@euphon.net>,
 Julia Suvorova <jusual@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Paul Durrant <paul@xen.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Lieven <pl@kamp.de>,
 eesposit@redhat.com, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <20230419172817.272758-1-stefanha@redhat.com>
 <20230419172817.272758-2-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230419172817.272758-2-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 19/4/23 19:28, Stefan Hajnoczi wrote:
> Add a helper function to check whether the device is realized without
> requiring the Big QEMU Lock. The next patch adds a second caller. The
> goal is to avoid spreading DeviceState field accesses throughout the
> code.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/hw/qdev-core.h | 17 ++++++++++++++---
>   hw/scsi/scsi-bus.c     |  3 +--
>   2 files changed, 15 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thank you!


