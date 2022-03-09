Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3B34D3517
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 18:07:30 +0100 (CET)
Received: from localhost ([::1]:54664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRzma-0003n5-Je
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 12:07:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRzk8-0002Bs-KD; Wed, 09 Mar 2022 12:04:56 -0500
Received: from [2607:f8b0:4864:20::52e] (port=40462
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRzk3-0001EA-Dy; Wed, 09 Mar 2022 12:04:56 -0500
Received: by mail-pg1-x52e.google.com with SMTP id q29so1504074pgn.7;
 Wed, 09 Mar 2022 09:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7HPHWv5oAERz9dzMHyqBAcuESdGe8qnLjBk3T9oRTnU=;
 b=MBSGiKc17qqwtp6B6uZ1Hd5pKFfhP2VsIVZrAPbTXZ93U5zLFRB8RluMeLKCIU9LHS
 evTQlMsHkt7/s6nZ1/tJw9Fw0GmgfBE5KwD/NXnjwWx0RzVggkdL56vSy6Dwp7n/dIVg
 xi/b+GdF5LV1Nbt6yntQTjvsuTfErrjifcRI858aWy1D6BVNv8Du4lPkwqHjPJ4sHO6L
 GftsxBTjaa/LWHJx9RD66NcglLeGEj0+vNbz/sFe8wKlq+ESeeCNjzNlBZc1RxFcBEqO
 +JEfu7bmeT4S1S1f5WmtE0GweTE986gGIsm2sC8LzZpCdBf5gXMCGiyrUOlq1HFV2cr7
 jt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7HPHWv5oAERz9dzMHyqBAcuESdGe8qnLjBk3T9oRTnU=;
 b=wDGPHIf2sSQeu0UGlkr55X6hwi2b1vH5GgMPF81hpfh8AAbiott36K7FF3t7icydzz
 x8RFhGAluuKwCmYhaGTItJ2nJw+VDEiKcNZIX0f2sDUntLPd+hbSsnFB+FHiVTmor6qd
 5mB/iJo82Q0RXuZ3LrOSgD8qEraNvev9yLqgxRnfyKgc9c829DW0RKhYrtG5wVziwsUJ
 G0uXDPAte/z3kqRff87JJEbd5AczB6utq7sziQIU6kGyi7w61DPczjvL1UAwqGPrzJdy
 oDW0s6u7oa2HBYaaLtQDrSNCYM20XtK5CiS2KsKi3WJwP0zRPN1BLZOubjdpVntgrSAd
 BAug==
X-Gm-Message-State: AOAM531JTZKJFFkSeCHjvBRBBIcUSe/vAaay++tR0tUDNHYfRgQ4yNLt
 AK7teSj39D9M5t57T7Hw5kg=
X-Google-Smtp-Source: ABdhPJxZ8tCNhx5VPlrk0UB1HuuN1224YLsruWVveO/gRi7tGByTz86IKVIXvn7o1mwNwaWRhlfYoQ==
X-Received: by 2002:a05:6a00:21c5:b0:4f7:2e26:d142 with SMTP id
 t5-20020a056a0021c500b004f72e26d142mr654973pfj.83.1646845489773; 
 Wed, 09 Mar 2022 09:04:49 -0800 (PST)
Received: from [192.168.1.34] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 b62-20020a633441000000b0037c794cb68fsm2878280pga.9.2022.03.09.09.04.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 09:04:49 -0800 (PST)
Message-ID: <077efd4c-570e-155e-811a-433c4f201df7@gmail.com>
Date: Wed, 9 Mar 2022 18:04:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] tests/qemu-iotests: Use GNU sed in two more spots where
 it is necessary
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
References: <20220309101626.637836-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220309101626.637836-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52e.google.com
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
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/22 11:16, Thomas Huth wrote:
> These two spots have been missed in commit 9086c7639822 ("Rework the
> checks and spots using GNU sed") - they need GNU sed, too, since they
> are using the "+" address form.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qemu-iotests/common.filter | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

