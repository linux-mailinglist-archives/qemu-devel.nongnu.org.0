Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2284A53BC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 01:06:04 +0100 (CET)
Received: from localhost ([::1]:48426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEggM-000606-Rr
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 19:06:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEgbd-0004lj-KD
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 19:01:09 -0500
Received: from [2607:f8b0:4864:20::535] (port=46077
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEgbc-0003ms-3Y
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 19:01:09 -0500
Received: by mail-pg1-x535.google.com with SMTP id z131so13702849pgz.12
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 16:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LyoDHdkyc8EIEqH0Fyeb1D4z29vNMsblXqKeW+VEK8M=;
 b=qr/DAXmwKUhnF6Uai9NkBHIqSNtFqvbITHwSOkU+E7kNdzZY3g5VDCw0L6714f0BG7
 j5yDluSNL2wAtNOao3+OUY1IkLrXYBHcHAy7eBMWKoOp6zUHKouNK2+e5hw6IxlUsIm/
 9sTCmK8Ja03xtsckT2xj9n3F31bavjh/FQWNZ+a1ulPH+gABIZPD+k/IcrtiLYiqgjZ6
 /cmvUKXgNyLRLUtB2dlv/gsW3ZDQ55WV4IbjSEC4swblrZyz1vxrsAbRM84C0I558xL6
 acWvB5fCAvr8yG2n+yK2TCJJGfam8GH04G5NEgZjzQe1b74NTYeZuvX8a5M1EkCAgn6a
 Mtcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LyoDHdkyc8EIEqH0Fyeb1D4z29vNMsblXqKeW+VEK8M=;
 b=qbVrTtdLmPFwPpG+J3LQovF5k31tOd4i9+Ex4AKXLcOalYdd1oaa9tcG5+QLk5Vt7K
 N1tslmKkrL6XykD9AK0fqoINWxLZOcTNRWBmSToa+qKnXZ02twu/fe0RqF+jskWwmNAS
 du0wg0wBsVrtVcmVQqEcvaO4ROkCzM5S3iuDBRnyRMIts0SeHuLOyTYjj2e7OZXrR7L+
 XDTs9xCM1BhuPX6H7iGv9uzSdhRuKcMuf8Qe+/Qj0jdPC73Jm/BTbPjZ7ksabwdNgCAg
 RGVF2pR+0rT85pGt0Nx3FZmj2R+nCeiLXmhKr5W/Witgct4caVRM7t1pPSD6EvI6kBiA
 x0bQ==
X-Gm-Message-State: AOAM532dmmg/k4zyp2dr08Jy1rnQDPYl6NRE5XLG8Jgp41V47TGtcJg7
 Lshec513Q87TzS43I+bMtJU=
X-Google-Smtp-Source: ABdhPJzqQgsWsMfqJaOcYtG1DBJsOKjEEk9SaCQVFLPWEQumTiDn7Y3W+R7Vw0RzttjU/Umhv50mrw==
X-Received: by 2002:a63:618d:: with SMTP id v135mr8437420pgb.613.1643673658801; 
 Mon, 31 Jan 2022 16:00:58 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id f5sm6902924pfc.0.2022.01.31.16.00.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 16:00:58 -0800 (PST)
Message-ID: <009e01b5-034d-6161-4c84-8644e4d0d741@amsat.org>
Date: Tue, 1 Feb 2022 01:00:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v2] Use long endian options for ppc64
Content-Language: en-US
To: Miroslav Rezanina <mrezanin@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org
References: <20220131091714.4825-1-mrezanin@redhat.com>
In-Reply-To: <20220131091714.4825-1-mrezanin@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 31/1/22 10:17, Miroslav Rezanina wrote:
> GCC options pairs -mlittle/-mlittle-endian and -mbig/-mbig-endian are
> equivalent on ppc64 architecture. However, Clang supports only long
> version of the options.
> 
> Use longer form in configure to properly support both GCC and Clang
> compiler. In addition, fix this issue in tcg test configure.
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> 
> ---
> This is v2 of configure: Use -mlittle-endian instead of -mlittle for ppc64.
> 
> v2:
>   - handle both -mlittle and -mbig usage
>   - fix tests/tcg/configure.sh
> ---
>   configure              | 4 ++--
>   tests/tcg/configure.sh | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

