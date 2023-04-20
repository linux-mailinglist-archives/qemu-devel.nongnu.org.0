Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C756E8C8B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 10:19:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppPVF-0008Ip-26; Thu, 20 Apr 2023 04:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppPVD-0008IX-Oe
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:18:51 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppPVC-0004K1-99
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:18:51 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f1763ee8f8so3207055e9.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 01:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681978728; x=1684570728;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LudFVx/kmb9nhOnpzQ2miKh295xVDuQ1UuHNRlYF5E8=;
 b=ZKvH4ZcWBUH/wCLtBz693lPtHcwRTD4bd932yhoiieRpluJcdneoiyJ88m2vBBZFoN
 Ijbn7atjnwH4cst2NNEcbt9dzwzAUuIW8O+bb6EQRkrSTAB+5khMOWc5rCA3mCcsUtf8
 fKK65BEau5W2824TUa1Ohd/Vqc3GcW1njv56LvA0yJKYWLuW5foU9kMfBeIi/BSkZlAw
 LpYyY1gY7MNisFs3dAqsjnyFMEPW5iJ0MISjV1Qlc5W+lr7/Zt2KeDvoY+13nPVkhVkf
 tkV82da0HgJE7NiRM4gmM+V9odZbEFTdRG9U30ZqqnGnkWLIxL06qACDZsly3QMLsh+y
 gZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681978728; x=1684570728;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LudFVx/kmb9nhOnpzQ2miKh295xVDuQ1UuHNRlYF5E8=;
 b=OxZ41lZx9Es8sKFVi0w//6MOqxVaCODAEyrxHEaMWOAsSc6pFib4SAb7KSr9Y2Qw+u
 jXhOzph+AemrJqzxy6BuQWL58sBn9STM5lvwyi2IPPT+1MOsaYfN4wHZkvqFq5GkVPsu
 R+2szawoJyFEek1pP8U9EO0zoeJ0Z0b7Fst7ZdghDXslNAM19/b34hpQEY93PTn0qvA0
 oZXP1ggF6eAuzuZtbZXeLLBFnXuecpeaoq0tFP+FPtTuYkAR1SnCshoVoREViypCk0ZH
 WNVnP3msfR5RSKKHaSzCQqO/15hUqmBw42YWyhcrdZwl1oAdFpAg9A4lc6d3LWeomMs4
 Neqw==
X-Gm-Message-State: AAQBX9fgbzCnQulJDF9XCTaknLKuy8LYZNdp38jNuZbQfmMotlSGIFZZ
 tA09CNL1xbGTastHcL+IGvpAiw==
X-Google-Smtp-Source: AKy350YVxN5lhmruZ0zTbMvn34EXb83NU6+ImB/xmwIw6S7TfcXRxCS0cGTACE75Tjyv4xAwd3Bvkw==
X-Received: by 2002:a5d:6592:0:b0:2e5:56f8:61fc with SMTP id
 q18-20020a5d6592000000b002e556f861fcmr578070wru.15.1681978728456; 
 Thu, 20 Apr 2023 01:18:48 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d18-20020a5d4f92000000b002c7163660a9sm1252678wru.105.2023.04.20.01.18.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 01:18:47 -0700 (PDT)
Message-ID: <f25c43d7-2924-b739-ec65-a10523d4e566@linaro.org>
Date: Thu, 20 Apr 2023 10:18:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 05/16] util/vhost-user-server: rename refcount to
 in_flight counter
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
 <20230419172817.272758-6-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230419172817.272758-6-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> The VuServer object has a refcount field and ref/unref APIs. The name is
> confusing because it's actually an in-flight request counter instead of
> a refcount.
> 
> Normally a refcount destroys the object upon reaching zero. The VuServer
> counter is used to wake up the vhost-user coroutine when there are no
> more requests.
> 
> Avoid confusing by renaming refcount and ref/unref to in_flight and
> inc/dec.
> 
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/qemu/vhost-user-server.h     |  6 +++---
>   block/export/vhost-user-blk-server.c | 11 +++++++----
>   util/vhost-user-server.c             | 14 +++++++-------
>   3 files changed, 17 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


