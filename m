Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A7E4937D3
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:58:04 +0100 (CET)
Received: from localhost ([::1]:49942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA7j9-0007zw-5R
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:58:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA7cm-0002FG-HF; Wed, 19 Jan 2022 04:51:28 -0500
Received: from [2a00:1450:4864:20::332] (port=40674
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA7cl-0006I6-1d; Wed, 19 Jan 2022 04:51:28 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so13059960wmo.5; 
 Wed, 19 Jan 2022 01:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gHddcaos8VkDSKGXhJXNM5C9+VyZ/ysPCkeemc0goss=;
 b=MjWYfNI7KOoEJ05VRiGEK85pSxz3qLlQURB8zrFeR9J3QBegCSIRHtmHr6gT2uSFUh
 fEGZFAxu0XY/4PC2Dv5MQJF8I4tBKnlZLyRkpR+8ehQHQRNer0UdmLadlfHunReGVfRl
 9u8w7PiVSsmFI7m4UxfpPfGn7VBC76QEKUumee+OJyFc/i4Qai8mtXxvA7td2XTYmzuj
 fMQkJ9xASYISuvSJ0l8I1Yy/paZR/bVG3AKij6VF1Py6ijWkLgkgewGdkcU3oRrp63lp
 dLuERr9MTSQlUun1W7soh4HtAU2auVLfG+30EFOkFucl+9atz1MEXIRE9/fGfOXSQWv9
 R4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gHddcaos8VkDSKGXhJXNM5C9+VyZ/ysPCkeemc0goss=;
 b=OnE/wqcvfbFXAaejs8dkL0DXYQJj5gH6JiWBi27jPyBv/qi5GUpVcV9OQ1bGnDQ9jw
 qWC+GfNpawHplsfx6QU1nEcwjqNm5fQx/D/FvTfEYCdNiBpX/YDRCAjawV+8Boq9nJpY
 HwJhZVJ1lATMkrPaQ/Kv1BJMd3bgRhA1BwjqR7ftCCci5sJ5+2LScqMeY7/+emMdUym0
 jFq9A/5c+Ziqlh9mty/eaUhugHQdyBwYswjvHyS6T1ybtAtvKXwobc4ZlLMT9Wi1az2M
 6S+iUz4UFrx/nMGZSpleo97jV+sLAcLZDn7GpCWynx49P6ajw9xaZPx/c1dNXcSXNWDd
 OO+Q==
X-Gm-Message-State: AOAM5323qrjBvWdx03EaoRLxH1VqmSgRZIxo21KrVyr9NB2Y2zKtSHQU
 auu0gQu3+pcd9mhO5MzpDqs=
X-Google-Smtp-Source: ABdhPJwkePxgS6mpM8KIIcOEhdX7227xABA5Jrx5EYAnEHteJ0J0ungzbmMHJP77TraDFpXQeXo2iQ==
X-Received: by 2002:a05:600c:4e4d:: with SMTP id
 e13mr2602878wmq.101.1642585885380; 
 Wed, 19 Jan 2022 01:51:25 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id f15sm3813914wrd.45.2022.01.19.01.51.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 01:51:24 -0800 (PST)
Message-ID: <a325d37c-e1d0-f723-211a-4b52a8d18a22@redhat.com>
Date: Wed, 19 Jan 2022 10:51:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 00/12] Removal of Aiocontext lock through drains: protect
 bdrv_replace_child_noperm.
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220118162738.1366281-1-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220118162738.1366281-1-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/22 17:27, Emanuele Giuseppe Esposito wrote:
> * Finally fully enable assert_bdrv_graph_writable(), checking also for the
>    drains, in patch 11.

Wow, this is definitely not just moving code around!  It's great that 
you could pull this off.  It gives me a lot more confidence that the 
locking model and the graph/IO split are correct, and also a lot more 
confidence about the logic to move the drains back and forth.

It does add a lot more complication to the API with all the _unlocked 
variants, but I think we're getting closer and closer to the endgame for 
the AioContext lock.

Paolo

