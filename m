Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1176845974A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 23:22:07 +0100 (CET)
Received: from localhost ([::1]:41608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpHhN-0002sQ-Mv
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 17:22:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpHgX-0002AP-7U
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 17:21:13 -0500
Received: from [2a00:1450:4864:20::331] (port=45966
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpHgT-00031H-84
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 17:21:11 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so986784wme.4
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 14:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=mf1qN6nTnJJWGgAJ+25p7C5OH1axyjSiHUS94dC3ydI=;
 b=wxUv8uThFm0YGnN0EPB8ne5d7GzYtfLhoC8O3EKbdsJIsAAyXcFq4aN429iWb/7pv8
 2QTn80Aq15gFWw0tL/O+1h/GGQ7DSMW8EMAeOJqwt2y2OTdQyx+7I2wkQ2JI3GUxHwvp
 1wijjLlpDj6mHgfYpDTpOgb7n48EyUoGv6KuQqMhCNsi6keU3n/vvRfJMihIvC2RWF7C
 UtkTj0Z9KIOQ/hbnxQkfV1/7jyvOzmgM2v820HBdnEUlxt80CJI6gquyFqYSaI3D/ovG
 8t7AiKu4kVS4auqb1h74PbCvzafcSRwBNtaiwAq5MMD4tqshikZDTR/F9AsnBsWMzx5m
 u/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mf1qN6nTnJJWGgAJ+25p7C5OH1axyjSiHUS94dC3ydI=;
 b=I7s8kgwwdLryyOe0auSYlDq1UvYNqTxI9XSIi3CZVz1jjTgH1AGn4eDvz9x+DOF2Pf
 B+JrgP9DNp4xpFEqin8anpaF8BVky9IGoeHQAZuXJRSyCn/jNYqYQS2S52rnE80GgW5A
 XhlHrwNcd/d6wJIG+CwmELbnXmPZKVLFDns5oodxzUbZ7GfNnEchwm+abp8AnCC03z8U
 5f31TJFzGln9193LTyioyj1f/JUrUNzIKuA05LK63UYSXJ9k+D4KI/S4FAEmcidKmmf0
 uzCfH4pOfs0OUc0g0sfzm1zJaXW1+QOMW4VvxHyPY12nmtdbxnqUZbbFh6vg5rPLwwsr
 fW6Q==
X-Gm-Message-State: AOAM533Ftd1NzdJ4/l6PmAYEcrW9aqGdkgkKQZ3ITnCmAUfv+sRIKvfZ
 VO2HbpAAT0oVG20Pc1/oqadpPLxssGqN7FSgXYI=
X-Google-Smtp-Source: ABdhPJyDZDmYZXQAmcBkClZG/gu5R+JsIVdkpSfJiEEuFnBY2yovNs9zXPw+BOMdknJ2KBISgMcyGw==
X-Received: by 2002:a05:600c:1c13:: with SMTP id
 j19mr34549058wms.175.1637619667647; 
 Mon, 22 Nov 2021 14:21:07 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id z12sm10017550wrv.78.2021.11.22.14.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 14:21:07 -0800 (PST)
Subject: Re: [PULL 0/2] NBD patches for 6.2-rc2, 2021-11-22
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20211122140212.1511814-1-eblake@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f7e526af-7531-df55-eea6-a17633215861@linaro.org>
Date: Mon, 22 Nov 2021 23:21:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211122140212.1511814-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/22/21 3:02 PM, Eric Blake wrote:
> The following changes since commit 49aaac3548bc5a4632a14de939d5312b28dc1ba2:
> 
>    Merge tag 'linux-user-for-6.2-pull-request' of git://github.com/vivier/qemu into staging (2021-11-22 10:33:13 +0100)
> 
> are available in the Git repository at:
> 
>    https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-11-22
> 
> for you to fetch changes up to e35574226a63f29e32eda8da5cc14832f19850e2:
> 
>    nbd/server: Simplify zero and trim (2021-11-22 07:37:15 -0600)
> 
> ----------------------------------------------------------------
> nbd patches for 2021-11-22
> 
> - Eric Blake: Avoid uninitialized memory on client hard disconnect
> - Eric Blake: Take advantage of block layer 64-bit zero/trim
> 
> ----------------------------------------------------------------
> Eric Blake (2):
>        nbd/server: Don't complain on certain client disconnects
>        nbd/server: Simplify zero and trim
> 
>   nbd/server.c | 26 ++++++--------------------
>   1 file changed, 6 insertions(+), 20 deletions(-)

Applied, thanks.

r~


