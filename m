Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4BD4DB220
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 15:04:02 +0100 (CET)
Received: from localhost ([::1]:56866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUUFt-0003FV-6m
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 10:04:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTlh-0003Fo-59
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:32:49 -0400
Received: from [2a00:1450:4864:20::42b] (port=43757
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTlf-0005bW-EP
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:32:48 -0400
Received: by mail-wr1-x42b.google.com with SMTP id a1so1614299wrh.10
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 06:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=R4AMhmNhfiRrZh6EYkfNsaytIMWd603aS1bUKH95OIM=;
 b=Wadu9C6Tab+BHxMXeIbw6aOHcfAZPYajVQL3Q9nFImpnw5NIG0M1wRoeI0ECAVeLXK
 IwbZahwP0izqnicUgTw04Cpjx+ov1OGCglPF5+b76lkOCp1rKbY7qLTiutZO6nyAtLt6
 l0tles66KQd6CKBlQoEpHf0RqxTlV/7nAP2t29lk4irOECxIW7r5jVoCcHDRfrKZPT1w
 L43Ui/klNeR/WLhRzkjDuAysGehyJwXlGP0GrwM/OWg9CbaU4w1KezRW24MCedna10Ab
 IdCvQu5/CKXx0IvUnRJORfmOr0JgR1zuTt59Lq9oVUQN+UI+SNW4RsivjpRDLngbHqJK
 +V2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R4AMhmNhfiRrZh6EYkfNsaytIMWd603aS1bUKH95OIM=;
 b=wzGnl9rzOsOBjrUr3BPXH2jL7TJm3G+tPAw9gkVzSE4L+8wyATchNXqObKA/OoE0Fv
 L7kfPD6aGubvfJhgClv1vT+uIOlv/PYhSOIotZ8kt5B19mnIvT0ybx9qORoegIB23gTv
 QumHJv+vcaddi6WkAUyKikzbTuscIMKEsrVzObXwQOnpNPitrR7xh2jIiYZneOvUNKNk
 tK6PgyduOpPb81LP/rpBL6x6ZYYd/4SSebcGbfQxDl/LwIYaPnNQCp5vjPSvAViodcAS
 RlrOKWI1xWa/dCtq5EERANrjDEVHmDHfKqtMe400aB3ND6HeSIRH2/4fxpqQi6rOISd/
 CJdQ==
X-Gm-Message-State: AOAM532Bfh7wKReYk085/LFwi4NOhhds5Hv+u70MrrqqFZCS2hPrzGGa
 +WmsxvQka8PGjGMbsnNVQ8w=
X-Google-Smtp-Source: ABdhPJw5UiBdREFfTySjlKnJbEs+1VW+CwpQHGb4z2qsZ9smVoLe9c2VMzjtZnmVCwnADir57myFQg==
X-Received: by 2002:a5d:6da8:0:b0:1f1:fa31:e7f7 with SMTP id
 u8-20020a5d6da8000000b001f1fa31e7f7mr25248619wrs.389.1647437565680; 
 Wed, 16 Mar 2022 06:32:45 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a5d4010000000b001f07772457csm1634618wrp.101.2022.03.16.06.32.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 06:32:45 -0700 (PDT)
Message-ID: <64353530-4488-8820-c58c-a5e104e93b4b@gmail.com>
Date: Wed, 16 Mar 2022 14:32:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 2/3] hw/display: Allow vga_common_init() to return errors
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220316132402.1190346-1-thuth@redhat.com>
 <20220316132402.1190346-3-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220316132402.1190346-3-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/3/22 14:24, Thomas Huth wrote:
> The vga_common_init() function currently cannot report errors to its
> caller. But in the following patch, we'd need this possibility, so
> let's change it to take an "Error **" as parameter for this.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/display/ati.c            |  7 ++++++-
>   hw/display/cirrus_vga.c     |  7 ++++++-
>   hw/display/cirrus_vga_isa.c |  7 ++++++-
>   hw/display/qxl.c            |  6 +++++-
>   hw/display/vga-isa.c        |  9 ++++++++-
>   hw/display/vga-mmio.c       |  8 +++++++-
>   hw/display/vga-pci.c        | 15 +++++++++++++--
>   hw/display/vga.c            |  9 +++++++--
>   hw/display/vga_int.h        |  2 +-
>   hw/display/virtio-vga.c     |  7 ++++++-
>   hw/display/vmware_vga.c     |  2 +-
>   11 files changed, 66 insertions(+), 13 deletions(-)

Please setup scripts/git.orderfile :)

> diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
> index 847e784ca6..3e8892df28 100644
> --- a/hw/display/vga_int.h
> +++ b/hw/display/vga_int.h
> @@ -156,7 +156,7 @@ static inline int c6_to_8(int v)
>       return (v << 2) | (b << 1) | b;
>   }
>   
> -void vga_common_init(VGACommonState *s, Object *obj);
> +void vga_common_init(VGACommonState *s, Object *obj, Error **errp);

Can we also return a boolean value? IIUC Markus recommended to check
a boolean return value rather than Error* handle.

