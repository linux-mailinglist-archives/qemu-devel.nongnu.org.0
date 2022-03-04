Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E869F4CD7E8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:33:43 +0100 (CET)
Received: from localhost ([::1]:38394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9w6-00051b-Tl
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:33:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQ9GC-0005uW-F2
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:50:24 -0500
Received: from [2a00:1450:4864:20::336] (port=38605
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQ9GB-0003D0-2i
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:50:24 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 m42-20020a05600c3b2a00b00382ab337e14so6141486wms.3
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 06:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pnAI5ml+8he8PLGnlkpwRdGqCDtn1ustt0MMVLg5rd0=;
 b=o/8hcKneVhjbUdDda00VsYQInfgeJGeCxnW0AJjFGe4zLZZ8s2ZpSqjzk7wei11Vd0
 0Ir7J9xLu6cQ/ta9UemEB6u7PIMnvA+PuNCm+jflQkuDnlPrxuM0yAymjpgqxP3PXssI
 z7fij6maGLH8XLGc7nAppAB+e/XPX3LIpgFNWCEnyq8vs+tee6iemcJuLYRtXh6Wpep6
 PSHNwkbx7GSk9tiOEssBuGOQHxcSsajhAOo/Ju+6tIA0vQCzha5GWlkoIoS5a7RNl+FW
 N+xLmwgmw+SX8+dQqgYLXHgXohJkT4w+dtr0JJEGEkAx1vM2xpo/DDBZvzMoISuemAh8
 qnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pnAI5ml+8he8PLGnlkpwRdGqCDtn1ustt0MMVLg5rd0=;
 b=BTzHyzUPeR6X752EVBzbO8UKAIID6VOEq1HqKnLxqRLwYlnZUAMpPbq+BW5VUge5qX
 wD+nf271KhKf+P/ZpxsR4Bk+GpwDk3ErI8nZa6oIoK/vql25VWTUiURW2s700MqPjAoA
 l2iCSRukiic5UYJagk5qx1CXDZz1PFj915iusA+V0DKWPZZ958/1j6RHoIQAw+52ILjk
 AbNP8wjuafkRbW00xoq0aBfLELDD/aNm2OszhHokC78l0VFlN5isdJrtj1SiRgfOh/6B
 7vFtU6oRrQtSt1kWV0icpXn7/sK5YzqW/m2JgblQJRemCzSTUYibIIuiHC/qNhqteaWo
 9Xbw==
X-Gm-Message-State: AOAM533L4tHmPwDLzsGnNPTg8ISaqFCi5K2M4v3IMk/36PfvnWPVA79q
 mdKsx8eWqFdCVBE8V2iVN+4=
X-Google-Smtp-Source: ABdhPJzHdbbs/EMbEKzqEcQLjIeAeLxA81H0SiPHC2oqCHM+xOZh+89bm9iFFPJJEQReMC1Vx1tE/g==
X-Received: by 2002:a05:600c:3c9d:b0:37f:a5c3:fccf with SMTP id
 bg29-20020a05600c3c9d00b0037fa5c3fccfmr8164913wmb.13.1646405421726; 
 Fri, 04 Mar 2022 06:50:21 -0800 (PST)
Received: from [192.168.88.252] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a5d6d0f000000b001ef7dca67fasm5509562wrq.114.2022.03.04.06.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 06:50:21 -0800 (PST)
Message-ID: <dc5eabd4-d0fe-6eef-bc52-47565aa4752a@gmail.com>
Date: Fri, 4 Mar 2022 14:54:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 3/4] os-posix: refactor code handling the -chroot argument
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20220304115657.3177925-1-berrange@redhat.com>
 <20220304115657.3177925-4-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220304115657.3177925-4-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, libvir-list@redhat.com,
 Stefan Weil <sw@weilnetz.de>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/3/22 12:56, Daniel P. Berrangé wrote:
> Change the change_root() function so that it takes its input as
> parameters instead of relying on static global variables.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   os-posix.c | 23 +++++++++++------------
>   1 file changed, 11 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

