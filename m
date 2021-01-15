Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1282F7E92
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:49:45 +0100 (CET)
Received: from localhost ([::1]:48796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0QQ4-0004z9-Jt
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:49:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0QP1-0004QP-3J
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 09:48:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0QOz-00078g-Oo
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 09:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610722117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rA5Z4rzoS9ZtY7l2NyGBpF4DaRiucrFn+QgQtN61KdM=;
 b=XUql/061sQTnpOmZz/uquwCD+Q3mJKRykVElZ94NpSSlb25v8PJFfUeqCHk8QB8/Cw0Ygr
 j5pyUQYuMtTawqbpw5fmYzkmMS7G7Znh09x82xuIQ56jqeRZkClXDTM8s1DcDox8mTLvOh
 WA5u/EnIied7FJhyl0av2AUitxgpkqQ=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-egyvWQobPwqP3hYibyUqhg-1; Fri, 15 Jan 2021 09:48:35 -0500
X-MC-Unique: egyvWQobPwqP3hYibyUqhg-1
Received: by mail-vk1-f200.google.com with SMTP id l125so4185214vkh.13
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 06:48:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rA5Z4rzoS9ZtY7l2NyGBpF4DaRiucrFn+QgQtN61KdM=;
 b=WxkRM/gF4gO7YalbqIavEd7N3AQnKJ7JWAVfW6/OQrVk+CJTa3l0FtScPUUw86YaQY
 xLj4j6Dqb3/Q6YTYnUq6Wz7pc3OmkppzVHplqGe2GSFx/4StgITLI2lwkSWC37TbmYkO
 jjg/EX5zJc99ZmVOA8VWnYr3fK1ksOcZZzL6x52Ad0A2Hi6vsFg1l9RrPwUPmhKB3pYT
 eJ7/Ob40k2FDO4aHWFkZW3Hhqqr1c8DMkNRX5ztz3yZXtipk5h9IaEI+HMFBK2CeH+KT
 Vwx0r5IqgC3bxaerpPFy0ZDeQ4OjYTkDMMvniJYXNpgbIhpoa/8LxhdV9v8f/hl7SCwK
 1Plw==
X-Gm-Message-State: AOAM531NqSzscNhLeUUK6BJD1/uP/PTUA353M6hgRAXx/ZwpHfrGze2s
 hSneRQY/aULRkXRYgrysqi2zSrKSRkt6GyrDJ/9NV9E4Euify2S0lwvpxSHM6uHv7AZRoNxOQBk
 KXxavrivdNNjqql9ei+t2i8iQf42GseY=
X-Received: by 2002:a67:f910:: with SMTP id t16mr4589014vsq.50.1610722113835; 
 Fri, 15 Jan 2021 06:48:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfv+PpdRDc79E6Qwqqp4EktaDSv2nKM35xZfG+aJtIcsQU3aMoMLff0n+mMKqDIDmdDq3HDOZaW6cQVuvmULM=
X-Received: by 2002:a67:f910:: with SMTP id t16mr4588998vsq.50.1610722113633; 
 Fri, 15 Jan 2021 06:48:33 -0800 (PST)
MIME-Version: 1.0
References: <20210114170304.87507-1-mreitz@redhat.com>
 <20210114170304.87507-5-mreitz@redhat.com>
In-Reply-To: <20210114170304.87507-5-mreitz@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 15 Jan 2021 11:48:07 -0300
Message-ID: <CAKJDGDbSZpLLz+C2X9FAKq+csUNrXsLaET4dSzOBepskhrWj0g@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] iotests/129: Remove test images in tearDown()
To: Max Reitz <mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 2:29 PM Max Reitz <mreitz@redhat.com> wrote:
>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  tests/qemu-iotests/129 | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


