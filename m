Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708F261DC48
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:05:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMaU-0007Tm-HL; Sat, 05 Nov 2022 13:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orMaT-0007Tb-BT
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:04:05 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orMaQ-0005a7-P0
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:04:04 -0400
Received: by mail-wr1-x42a.google.com with SMTP id a14so10866450wru.5
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q8ZOXA7WbT+JrPNePoLeRoAg7WgBFc+L5quMpjXNo9s=;
 b=Fa9XaVm6stRBW/UiGpjw6QVQCyv0MkEceez/XIqDH0V6HsGHTSIwhCqCWdRpLSK08/
 rU2Xs6Tc4GNLaJpOX3PsdqAcxBiSrhn4jhjBCCyKAROl+QvYnk4WwU0G1/bADtzQO2v6
 AvimMLAJPWBaLp8PqSoxu1b2tkKSxG0klkWlGym+sPd4qJk4wowJK4XWsexaU9Vf0bo8
 SIrXiNp3sUO57bP0U/edNWQKDGJHMD2qIfLpGUs6JDT56s+cjFJ8088wAe297WywNpeZ
 /uRZAciBqXiKBZyBfYoNdYga4yu6PvsLyZaZjlxv6j+82+Y0EkVy5arEOxstsuKtiAlx
 DwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q8ZOXA7WbT+JrPNePoLeRoAg7WgBFc+L5quMpjXNo9s=;
 b=7SEplAbqL0GgjjZY4ZvGXR5oMNNYHgjkxiXXz3GdroTiMnAf/LNwEOnCBAu1Y+6S/0
 lg6DepAeEyLOjSvJK2GC5A6pK1Ee+jzSN5ywmtNsFuromBpxlQkoEQE9A8HAQ8ybPZd0
 bXK8ZzciEyVBNmEkUkS9UjAjgrC4tfHq9IKUo0RqS/TCIdJtQIQ0OnR+aqIdcDOZUvFW
 FvDCcIBXztMflnzeCncELL3eUVwZI0tpEtDyBKYBuva6yUTwBznzqrvRW7ltFBF1dzI4
 NzHTd82TNzg7wuHmd6fH8hA+8MY1PwhtBwsHB3u1AWKNKOL+ui0I87ugHCCKEftDjtMm
 v6Cg==
X-Gm-Message-State: ACrzQf19issCzWnCvQhkhRyZu2MXxARXgLydJ1j8vI0hjwsR3y0n++Zg
 KDWMXiSdh0tJ/eEROVfYvEdvEw==
X-Google-Smtp-Source: AMsMyM7kGnYCcq4/mOpIdC7Vd+26LppxGL/bGZxjhJImtuck6PR4O9HXzWnj4Al861vdGjT3hCL4yQ==
X-Received: by 2002:adf:a3cf:0:b0:236:5270:7f29 with SMTP id
 m15-20020adfa3cf000000b0023652707f29mr26521708wrb.382.1667667840561; 
 Sat, 05 Nov 2022 10:04:00 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c1c1600b003a6125562e1sm3139200wms.46.2022.11.05.10.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Nov 2022 10:03:59 -0700 (PDT)
Message-ID: <7cd77bd3-2d0a-5d26-7e74-176beafee1ae@linaro.org>
Date: Sat, 5 Nov 2022 18:03:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v3 18/30] qapi net: Elide redundant has_FOO in generated C
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: jsnow@redhat.com, eblake@redhat.com, michael.roth@amd.com,
 Jason Wang <jasowang@redhat.com>
References: <20221104160712.3005652-1-armbru@redhat.com>
 <20221104160712.3005652-19-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221104160712.3005652-19-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/11/22 17:07, Markus Armbruster wrote:
> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> They are also a nuisance to work with.  Recent commit "qapi: Start to
> elide redundant has_FOO in generated C" provided the means to elide
> them step by step.  This is the step for qapi/net.json.
> 
> Said commit explains the transformation in more detail.  The invariant
> violations mentioned there do not occur here.
> 
> Cc: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/net/virtio-net.c    |  3 +--
>   monitor/hmp-cmds.c     |  1 -
>   net/announce.c         |  8 +++----
>   net/hub.c              |  2 +-
>   net/l2tpv3.c           |  2 +-
>   net/net.c              | 25 ++++++++++-----------
>   net/slirp.c            |  4 ++--
>   net/socket.c           | 18 +++++++--------
>   net/tap-win32.c        |  2 +-
>   net/tap.c              | 51 +++++++++++++++++++++---------------------
>   net/vhost-vdpa.c       |  6 ++---
>   scripts/qapi/schema.py |  1 -
>   12 files changed, 59 insertions(+), 64 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


