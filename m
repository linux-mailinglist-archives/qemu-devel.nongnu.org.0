Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8551D2F6027
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 12:38:02 +0100 (CET)
Received: from localhost ([::1]:33292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l00wz-0002GG-KC
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 06:38:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l00un-0000iW-DR
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:35:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l00ul-0001SN-Mz
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:35:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610624143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Dnv8RgGDyFS/r9W+oIiqDJvcKmXh15wK8wW7gxH3nM=;
 b=BXjCYK9KobpCvOTKxHZIxmoF1KOe/HlDL5hwKrS9muvalYoKFnmpbSOFKDVT5UPMBLE6NW
 uEcFWbepV5F2h7qGiqnihaHERVsxK+0Hi0cmOahbBNxmv17im2e53BL3Y7pTr7yLc1q7QK
 4sXq57GhUQWtry55eisO8CDGXXF4UZM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-9nkeU6uWMjWGgdDKK7tGzw-1; Thu, 14 Jan 2021 06:35:41 -0500
X-MC-Unique: 9nkeU6uWMjWGgdDKK7tGzw-1
Received: by mail-wr1-f69.google.com with SMTP id l10so2064847wry.16
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 03:35:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+Dnv8RgGDyFS/r9W+oIiqDJvcKmXh15wK8wW7gxH3nM=;
 b=ITbmInt82PasqapKunelV8EwbSjhBRsoaWS+gsRSuGggfJCPCQFJuAKHibrJB1Yh+b
 iTPM35C5MuiftzkbR9H12CaR+mGUxVN1wOrOJHbzrdJK5OMVZRDEVpVYn/QVHETAh4kl
 rYCtBgMMtPabeZgDC6KcIvGlsOrwaWhmjIBE1JyLu49nE+NoceMU6EGhQ5PaRrEQG47U
 CRCd7R0G23ikNrq4EetBBSWg1/Wbk8qik7jHy0CZpGsKON65EE4v2ROUG8+YrYyjyhpf
 YX5cNmI3rou8cR+2ThjMfh2OQeEQn9/Dr68YaMHusaYCYckGTWvhAS996ynTIy5T5JtU
 Pevw==
X-Gm-Message-State: AOAM5308yNKmzrslrFJXvNVGNmlaThYQClqdGzzvRUKSpflSPD3rFyyI
 NFnT95NGRBNcYHpFpP2KvxzqzRjPHu3U1Vepkwhx+E+AXfPFnB+GpKqBP3/THaDNVnq3gD1pjac
 RMB6yr/b/ZWCuZGEA3kXrZQ0fMmvhe0mQ58iz81wWYCErUxkZ8WrHbah5peVTsYPm
X-Received: by 2002:a1c:4b10:: with SMTP id y16mr3598372wma.73.1610624140529; 
 Thu, 14 Jan 2021 03:35:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1EpvQ0pGVtA7VZcLBY+WujKGrQBtb1G9oq0rLbqhXIrx5g8my9A0WpBJi2BLPZ2IOi9MCwg==
X-Received: by 2002:a1c:4b10:: with SMTP id y16mr3598345wma.73.1610624140182; 
 Thu, 14 Jan 2021 03:35:40 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id p8sm9693282wru.50.2021.01.14.03.35.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 03:35:39 -0800 (PST)
Subject: Re: [PATCH 7/9] net: Remove assignment in if condition
To: Zhang Han <zhanghan64@huawei.com>, jasowang@redhat.com
References: <20201222082340.67405-1-zhanghan64@huawei.com>
 <20201222082340.67405-8-zhanghan64@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5426b47e-cd7c-de59-bd70-b74c69ba4904@redhat.com>
Date: Thu, 14 Jan 2021 12:35:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201222082340.67405-8-zhanghan64@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: alex.chen@huawei.com, hunongda@huawei.com, qemu-trivial@nongnu.org,
 hang.zhanghailiang@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/20 9:23 AM, Zhang Han wrote:
> Put the assignment before the if condition
> 
> Signed-off-by: Zhang Han <zhanghan64@huawei.com>
> ---
>  net/tap-bsd.c     | 3 ++-
>  net/tap-solaris.c | 9 ++++++---
>  2 files changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


