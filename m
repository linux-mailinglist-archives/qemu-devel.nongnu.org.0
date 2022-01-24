Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190C9497C88
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 10:59:24 +0100 (CET)
Received: from localhost ([::1]:56198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBw8A-0002Nj-PW
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 04:59:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nBw4m-0008Rg-5e; Mon, 24 Jan 2022 04:55:52 -0500
Received: from [2a00:1450:4864:20::529] (port=40717
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nBw4k-000333-Ci; Mon, 24 Jan 2022 04:55:51 -0500
Received: by mail-ed1-x529.google.com with SMTP id a18so55407974edj.7;
 Mon, 24 Jan 2022 01:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/o9x/ZJ9Su4yV4ZawzCBiT2aQv2M0GsSDuAtSeAsqhk=;
 b=cS2drQSNBurNdxORkKshgk3/L4mSQZW84RdYSFSk3gxTIqbv8me8yBlF+K4JU6SFIh
 5KXbTGArR4kXeO5sKys+MrLpU4uNS1zIVnd7M7HDsJnC4fdihtTejpppjwMB7BR8o4ip
 pisvwSWuLunNHsU1K0zuXhZiMY/1M5h/yYIEHvwFyNQJigto0uJ/ceSO2jQc3HzBG3sH
 8xAf9OTIyCMIbAd9UJlH4ACf3U8lXX4fZgsIjCjYXyk93SAl0TA1axrpFWt4RTPxVb3h
 VzANWQrf5qW/fFpONehdiq3SxYYNinFBcPBUNOYbVZyre8zahp98hhkb8LOhw6lZyHuZ
 3DeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/o9x/ZJ9Su4yV4ZawzCBiT2aQv2M0GsSDuAtSeAsqhk=;
 b=Kn1J85aNq1zo4c8Fc2qbhKTLg2Ho2T+xZHGhqf0Oh97NYilCak+DagQrE7Huac+PxR
 2ACn7T6i9qjSHhx5u88EoXrvJOPp612FO7UFYere6dglLWXxy1mJi+fQYAtLpj3rnDNL
 acewkPzZci6/gnVw99R3rP4ugPa9HT3axextmWQ4VvH3g65YEn9GOcNEMTxWbr2rbDti
 ZJdzW1+fSxzzGQXRMLoRG58dneuGuzZmW56WwlZf3dHkne72F/natOpszs+j05R+/a3l
 9njPfzuNNPjP8rbcO0UJe5x8syztKZJAfNt8i1TfOCxW54EuU9ifPKOdMC0V3UbUSyxL
 YI1A==
X-Gm-Message-State: AOAM533cQd0glOoIpZ3tKX4pklSYCCq0cne+JoyQappNNvLU90B1ps24
 5ZA92R2JX51Le6X9JZyGGjI=
X-Google-Smtp-Source: ABdhPJwz8rhsavxeJV4ZRCzkRwgsCR+KoGEiT/KpLsOgQ7nmhjw3+JZu2njkqedw84js7S0h76hHHg==
X-Received: by 2002:a05:6402:2687:: with SMTP id
 w7mr8520191edd.381.1643018148275; 
 Mon, 24 Jan 2022 01:55:48 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id j15sm4709950ejb.9.2022.01.24.01.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 01:55:47 -0800 (PST)
Message-ID: <b77340fc-5d98-e506-7fce-0d5cc45d71fe@redhat.com>
Date: Mon, 24 Jan 2022 10:55:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] ide: Increment BB in-flight counter for TRIM BH
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20220120142259.120189-1-hreitz@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220120142259.120189-1-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/22 15:22, Hanna Reitz wrote:
> 
> Buglink:https://bugzilla.redhat.com/show_bug.cgi?id=2029980
> Suggested-by: Paolo Bonzini<pbonzini@redhat.com>
> Signed-off-by: Hanna Reitz<hreitz@redhat.com>
> ---
> v1:
> https://lists.nongnu.org/archive/html/qemu-block/2022-01/msg00024.html
> 
> v2:
> - Increment BB’s in-flight counter while the BH is active so that
>    blk_drain() will poll until the BH is done, as suggested by Paolo
> 
> (No git-backport-diff, because this patch was basically completely
> rewritten, so it wouldn’t be worth it.)

FWIW you can put a

Supersedes: <20220105111337.10366-1-hreitz@redhat.com>

anywhere in the message, and patchew will gladly produce the crossdiff 
link 
https://patchew.org/QEMU/20220105111337.10366-1-hreitz@redhat.com/diff/20220120142259.120189-1-hreitz@redhat.com/ 
for disbelievers---or for those who want to compare the commit messages.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

