Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 933824DC503
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 12:47:32 +0100 (CET)
Received: from localhost ([::1]:39852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUobL-0006T3-Ax
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 07:47:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUoAN-0007Me-Qm
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:19:39 -0400
Received: from [2607:f8b0:4864:20::62a] (port=46729
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUoAM-0007bq-8I
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:19:39 -0400
Received: by mail-pl1-x62a.google.com with SMTP id w4so4150396ply.13
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 04:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Q8OELpFAAuWZBjx75SaFlPXOfxaNl/KZyd1iQh741/k=;
 b=K/096p4J81IbTMglZbUqKv+202wrG61TKfhaek9pXta2mX/C/si64cfwF2t4qEwybY
 5DpP0pgDjxAB/YUQzc+BX6+idqn8m/kRk4xuyyz1sJVKAK24oLqePG4sjassqSkG9Wql
 8T5F+h6xCEWwENKTKPyG4/JaHylQxETUCJFqg24Kh2+gxJjuMyEItNJsel6U6lPsfMiq
 b4/PwSCLL5wnQ3kwaP16TYStCWhod/EDpbgO8X2+cMgkHdhivtiQjNQCWRpDowAP8bHH
 R+FhElIm1mcsvM3aj8KVD1GxOYsAhVLbJ8TOjNcEmTYFi5ua2CJqWsAg3dwHu2zEHuca
 8ZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q8OELpFAAuWZBjx75SaFlPXOfxaNl/KZyd1iQh741/k=;
 b=EWY/+irQsJv099U1UYlRXSpbY27b3iekdO2q8KGE+n1wZ9wBSdqAlS8uacP1I7ZqGb
 6SLMveYLHYJPxTggyHXQNtvJ7xbSs/elX0EOHL2I7Lv/5jULD91h0uJGX5oJe1urCJU/
 XmOwcCzMazVNPxeGxiNfpYDSg82KbchXehh2/ENS71lR5LjNjKsBJPPWdfcAW9/QmNUx
 Wpwgs/mZ6cG7sG1gOprmh8c0WN/LlQdSOtGNA3Td95KUErve52sTrrCFTqzCLsW9p8wi
 N1Y/8PzkZ1FmyHAIbWM23W7DgVlYMuZzfzRNytT3QWEVfm93EhUPPdqo15N1f2GIvd/Q
 rzbQ==
X-Gm-Message-State: AOAM533Y5fXCHJuHUFIAeRgaOaLhK5WO2zzENjhY7m81plaGq347i0jc
 IIYpFGjBWOxFNJ/y68S7ON0=
X-Google-Smtp-Source: ABdhPJws1hvnNdnB7UJ5j6mWv02fU6rc/rowgf8wtFyfv1J6GITJ/PdFfMOVuix+NO96YGOPmKUVLA==
X-Received: by 2002:a17:90a:af88:b0:1bd:6b5d:4251 with SMTP id
 w8-20020a17090aaf8800b001bd6b5d4251mr4701350pjq.134.1647515976868; 
 Thu, 17 Mar 2022 04:19:36 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a17090a280b00b001bf23a472c7sm5539274pjd.17.2022.03.17.04.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 04:19:36 -0700 (PDT)
Message-ID: <cceefe62-2836-a364-b19f-a63f750f5de9@gmail.com>
Date: Thu, 17 Mar 2022 12:19:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/3] hw/display: Allow vga_common_init() to return
 errors
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220317083027.16688-1-thuth@redhat.com>
 <20220317083027.16688-3-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220317083027.16688-3-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/3/22 09:30, Thomas Huth wrote:
> The vga_common_init() function currently cannot report errors to its
> caller. But in the following patch, we'd need this possibility, so
> let's change it to take an "Error **" as parameter for this.

Thanks for updating to return a boolean.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/display/vga_int.h        |  2 +-
>   hw/display/ati.c            |  4 +++-
>   hw/display/cirrus_vga.c     |  4 +++-
>   hw/display/cirrus_vga_isa.c |  4 +++-
>   hw/display/qxl.c            |  6 +++++-
>   hw/display/vga-isa.c        |  5 ++++-
>   hw/display/vga-mmio.c       |  5 ++++-
>   hw/display/vga-pci.c        |  8 ++++++--
>   hw/display/vga.c            | 11 +++++++++--
>   hw/display/virtio-vga.c     |  4 +++-
>   hw/display/vmware_vga.c     |  2 +-
>   11 files changed, 42 insertions(+), 13 deletions(-)


