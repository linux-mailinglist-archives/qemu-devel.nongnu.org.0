Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5CB32199F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:01:16 +0100 (CET)
Received: from localhost ([::1]:60146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBm0-0005SJ-25
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:01:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEBkI-0004Xm-TN
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:59:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEBkG-0002gX-CX
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:59:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614002367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GNLm7f6hEDa2tB063EW+msRX5oDuMi/kRpqc6EYJtHg=;
 b=MrPKA7pgfImaT2bW64fEdS61OZG9tKceOQLG0tYH79KqkRLq9tnhYRy9mcDVRMREfyh8/z
 4xPM+IL7AU0MsYwOlmpUODTIPIWfiWKE+bISxYu2+9cVTSSq5UM+KcqnHlgT5CAvGDkNNr
 nJl9Sx83Nq9rDt03ltYa9rqqJ76DSIc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-NasLJ3NNOtGN0OEUu8sU-Q-1; Mon, 22 Feb 2021 08:59:23 -0500
X-MC-Unique: NasLJ3NNOtGN0OEUu8sU-Q-1
Received: by mail-ej1-f71.google.com with SMTP id 3so859296ejx.17
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 05:59:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GNLm7f6hEDa2tB063EW+msRX5oDuMi/kRpqc6EYJtHg=;
 b=snfnlGmQkGGvsKex6P0GWgRjCtBuUZ7BTr6jmhicGjoyz5kkNpc26ANj26/nujjdn2
 bJI9gxhXys1+3MoGdY60EczTOIJL9mYLsU6uItC8wn4MD3UGu6bI7bchyMOt1WLDIsnP
 jKr77fqGwDhvP8TM0vwuWkCDiUfhvg7A25mo0Itx8KYI3XwxoyMX4hxt+4qdMGDv4MJW
 vwMh/v1VoRLSp+X0EHnRUGWbGGz19mbVrQuatUuDLzfotBtRgaiVKgfeCE24PPSbmzGl
 8a5OwlF937YQQNWfzyj/wI1y2tn/GQwMXvlUeu/H1SuvhnTtAjITrj+P/wJV8FsqmJ2m
 BgTg==
X-Gm-Message-State: AOAM5332UYADB948GaHlAJ+CYRC5OLvYH5yrqTl9tlRNG5bR70ukgIjg
 YNf3CPRsQdVzYPGmuFBqR6ks2r+9XR/hT2lMjCVf85rR1/C0Z6ntR+ZijEeWmd3teO3XhiyTLOK
 QVNyEweF2uFG4WCE=
X-Received: by 2002:a05:6402:2690:: with SMTP id
 w16mr22876881edd.304.1614002362377; 
 Mon, 22 Feb 2021 05:59:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzl36dpkIENvTJY/ZEeH3uSOri4pG2T3f85/QqoFmVsDSwLTVx+wh9DBkOc3klJ2dTC//JHKQ==
X-Received: by 2002:a05:6402:2690:: with SMTP id
 w16mr22876871edd.304.1614002362272; 
 Mon, 22 Feb 2021 05:59:22 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id e4sm1565989ejz.4.2021.02.22.05.59.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 05:59:21 -0800 (PST)
Subject: Re: [RFC PATCH v2 1/3] hw/pflash_cfi*: Replace DPRINTF with trace
 events
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20210222090747.2310104-1-david.edmondson@oracle.com>
 <20210222090747.2310104-2-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ca691134-4fdd-a780-e075-872e731d5871@redhat.com>
Date: Mon, 22 Feb 2021 14:59:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222090747.2310104-2-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 10:07 AM, David Edmondson wrote:
> Rather than having a device specific debug implementation in
> pflash_cfi01.c and pflash_cfi02.c, use the standard tracing facility.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>  hw/block/pflash_cfi01.c | 78 +++++++++++++++++------------------------
>  hw/block/pflash_cfi02.c | 75 +++++++++++++++------------------------
>  hw/block/trace-events   | 39 ++++++++++++++++-----
>  3 files changed, 91 insertions(+), 101 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


