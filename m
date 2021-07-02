Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D563BA2B7
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 17:23:06 +0200 (CEST)
Received: from localhost ([::1]:37724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzL0S-0003Hk-W0
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 11:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lzKzb-0002br-OY
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 11:22:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lzKzX-000888-S6
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 11:22:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625239325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZDWfm7uXMkz0OfuHWdy9N2BLYUw85MkYgjWgTVXVcLs=;
 b=HwxPaZ/ALEZ98FIlQPGGbMZo144uguWgNxTsvTrxCBqbM/+RPugyGhEslBLCBIY6LrxP0L
 w1W6X2i3aBJmbLXZFGNHmnHro3eXYAdPXFcFz2ZprjfAWTW+5KaXID8wTEh7p+hCCOcVkU
 OakyFyvNJXxtK586WKFeSC+AFLcjmFs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-QHCZRl2xPyqQs4LEeMjmzw-1; Fri, 02 Jul 2021 11:22:04 -0400
X-MC-Unique: QHCZRl2xPyqQs4LEeMjmzw-1
Received: by mail-wm1-f70.google.com with SMTP id
 t12-20020a7bc3cc0000b02901f290c9c44eso3615759wmj.7
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 08:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZDWfm7uXMkz0OfuHWdy9N2BLYUw85MkYgjWgTVXVcLs=;
 b=j1KE7k9nTkDCFjQg0E6ZRNYpYHSuWfiVIVJMtxOOkmZyNvyv+cRCti6Pns9GAvrxyQ
 YZ2G8RunjWgePMtyW1bGy2TjM4ymxPuYVMju4WmQpmC8HqZseYVXnFYhSW//viONgYEl
 b5TWU2WDXEN05Ebd9yujMbK+BXDMfAI8SOlTNHcIvMaUmyceN5hOGoBv1PwXNnwsrkda
 of7u+H9YPOABbiIZq3lhja7FRWjgV7HuGwcq7ZLACtAQulXPZdCAUBZpJf0HTxGhTBlK
 PgY77fIbjsch3crJxO/jX9usnWg6abgnveyceZeJztWTTe9iyf0xbNOrTRjgXtzwTS0l
 1kbQ==
X-Gm-Message-State: AOAM533KAG0OP5q1hWYz7ORiVNzj45DGnydfexBZBDw9f90StjeNr1wt
 71H1HfXqpw0h+lv0D1OkhBitaMQ3ZGmesqIC1n3fEq8nPjT54gbYCM+W+cA3vEbu/oE9cRMzOpj
 ufu5xHb1GsAt6sgU=
X-Received: by 2002:a7b:c402:: with SMTP id k2mr26883wmi.5.1625239323571;
 Fri, 02 Jul 2021 08:22:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrGeP8kHnbMfb9qkfW6bCCGHYh7JCVZNhrFX7NtPpetXJT59g7lo99xhs56fCRAF2Q3pNIgw==
X-Received: by 2002:a7b:c402:: with SMTP id k2mr26865wmi.5.1625239323368;
 Fri, 02 Jul 2021 08:22:03 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id n20sm3208554wmk.12.2021.07.02.08.22.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 08:22:02 -0700 (PDT)
Subject: Re: [PATCH] replay: improve determinism of virtio-net
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <162125666020.1252655.9997723318921206001.stgit@pasha-ThinkPad-X280>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <939915ed-d545-7d91-3ac9-6249399d7115@redhat.com>
Date: Fri, 2 Jul 2021 17:22:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <162125666020.1252655.9997723318921206001.stgit@pasha-ThinkPad-X280>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: pbonzini@redhat.com, jasowang@redhat.com, alex.bennee@linaro.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 3:04 PM, Pavel Dovgalyuk wrote:
> virtio-net device uses bottom halves for callbacks.
> These callbacks should be deterministic, because they affect VM state.
> This patch replaces BH invocations with corresponding replay functions,
> making them deterministic in record/replay mode.

^ This is one change which I'm OK to give a R-b tag.

> This patch also disables guest announce timers for record/replay,
> because they break correct loadvm in deterministic mode.

^ This is another change, can you keep it separately? This
would help in case something need to be reverted.

> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>  hw/net/virtio-net.c |   13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)


