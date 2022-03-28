Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C464EA324
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:43:24 +0200 (CEST)
Received: from localhost ([::1]:57676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYy55-0004Zi-AA
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:43:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYy21-0002Kj-Qd; Mon, 28 Mar 2022 18:40:16 -0400
Received: from [2607:f8b0:4864:20::102d] (port=42805
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYy20-0007kn-G3; Mon, 28 Mar 2022 18:40:13 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 o3-20020a17090a3d4300b001c6bc749227so904523pjf.1; 
 Mon, 28 Mar 2022 15:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5f08lrK2wrk1QE2cEOHbw92XZ93/BagAWRMrcUYlX6c=;
 b=MPamJEzKaJIZENzA4f9409cYBP/+TAAXn83PQlA1ASRyben7omfjUK7fWy9QbCTO/a
 R8OOVDA5q/U8PW+TIm2FRzJC6wZlMMGmmmMspeCw9nzo5NT/BFJjk3+jvaadSLTreOJl
 hPuCmFhDBZSxhk4E22eYSgw7ViljSx5evunSEZEnKKQS+539RZTmFLU+zQG19F2CMugG
 ak/5pT0xGX2g4T3f1V6Y6cdrWj9etge0PQbWnfnheTOWfFR3Uq8S2sYQW99xhP195blP
 y5iIxQ1mPZOWqoZoo83Qbdq0PKV7BYkgMuoamaS22iYgid1BfCTlcYeQQBuyl24FyGnl
 MUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5f08lrK2wrk1QE2cEOHbw92XZ93/BagAWRMrcUYlX6c=;
 b=hQNVmv1LCrxQ3pMdjTGfJMBPr+oVDCX0ugPY8cfUCAQE4sOHvTcTcF1Cho4Cks65wa
 xwQAZrT+7eTZgnFb5VL0LB17O138yNGpqhnE5JiGC7pxmgItAddvswkM8KQFDPNXNZMn
 /8K0W4VOpNN6G2/rSFtlGlTWz+MaHHUO8x1caNaFR1q/0x63YVWJyNGA2TTZsqTAlcr8
 9KpyHKvP9HZNd2xTMUFv4FCqMq+VbFvAUfUx76Zo2g30gd0PlVJh9foa/5zqWVEQWQGR
 VYH1Bpc5Gt9/OyHv0K2QDX3+QN91Kk5xLs3XwBRb5le/QQtUr2vaWza2QPy8G0Ch5M7j
 tf7A==
X-Gm-Message-State: AOAM530PZGwQqeTwNBB9hyszHJjFKHYFsTH71tmsZvsansOuu4EcX/Fe
 9gTVX6xSt9g/XfZ+iUVoief9eOSzsnk7Ww==
X-Google-Smtp-Source: ABdhPJxlPENaPkXyN26gg7tsETISOb+FGtnyChR/pS66obCJ7ekWM1OnV3af262pU9p0jiiKYq145Q==
X-Received: by 2002:a17:902:9f98:b0:154:a809:7f0f with SMTP id
 g24-20020a1709029f9800b00154a8097f0fmr27478208plq.118.1648507208918; 
 Mon, 28 Mar 2022 15:40:08 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:3c84:1cd:456b:b750?
 ([2600:70ff:f07f:0:3c84:1cd:456b:b750])
 by smtp.gmail.com with ESMTPSA id
 f30-20020a63755e000000b00381f6b7ef30sm13858995pgn.54.2022.03.28.15.40.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 15:40:08 -0700 (PDT)
Message-ID: <f82759fb-ba6c-4920-23c3-8d4ff8d0b81d@gmail.com>
Date: Tue, 29 Mar 2022 00:40:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] vhost-vdpa: fix typo in a comment
Content-Language: en-US
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
References: <20220328152022.73245-1-sgarzare@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220328152022.73245-1-sgarzare@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
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
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/3/22 17:20, Stefano Garzarella wrote:
> Replace vpda with vdpa.
> 
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


