Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 861AC48FF0B
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 22:17:32 +0100 (CET)
Received: from localhost ([::1]:44104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Cu3-0003hh-Lp
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 16:17:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9Csf-0002Fb-HK
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 16:16:05 -0500
Received: from [2a00:1450:4864:20::52c] (port=46913
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9Csd-00025v-Uc
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 16:16:05 -0500
Received: by mail-ed1-x52c.google.com with SMTP id k15so57206995edk.13
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 13:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6RYKlyN4l/KIAozc5xu7P6tQuzg8viwmBKPjcJ0p5wU=;
 b=VGRm16YqQd7Un5pGIYtRQpkX8lFAlNT+RFouzpDc89OmlSXnRdtH+mYpqHXh5F4/W8
 2uHfobxnNC4aOa0wlFJURBGKzGrh9OF7e15e1tHv+t1S10eJluXqacfPAc5okoEQykMA
 dBKaSn/POFJqifzQGfXD0T/mCHB+DmbMB7ts8Gh04qgsw3iDzVoSjG7Vn168S7hlY8YL
 FOMjNpvzViLSEbX+d2VaIghYkuVX2M9kWo+ud3LFr4Oesfg56qduuuqb68YMbcFCzqQ8
 Qro5JJ7hI1ASHGZhMdRM8NP8G2+rxAN4YKqSBQF/mqoAHzKS8KAA0/R4U38ndyEXJqRE
 EGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6RYKlyN4l/KIAozc5xu7P6tQuzg8viwmBKPjcJ0p5wU=;
 b=VyrOWVgo5+zA+2rUURPUhau4L7m7g4zWGvdLAaSQwqaJ/lR1zjvMA97MoQ3GPBEjQe
 4U6FsdXqKq/VArgcDsL6I/AXIGdGd6TkPFFR5al1zt9Oxn0DUYUXS1XelPblud+pMyQ2
 y60Ikg+t5Uczxo0eZbY1jhYC8AltGZ8kLrhd4ZRgQZyt3D7SGJKTAU8ThpvpYxt1Q0ly
 RkPzsa+m7zuprzf5dhbDSJfO+WXnPTt/0o5NPuhu/gBA/jBoH6hD1zTeBzNJ5nR8K/7F
 c7TuULO6DlhQ/kFQ5E12F7L3pRK6JrLTp6/9jBPtoaxgMw3GyQlXuclSioGtMHUpqUY9
 2QoQ==
X-Gm-Message-State: AOAM530zjF6kTJH0QMVpa+NBH5UPQZTcd+VMoH5HHLwTuoex7/MI9jvi
 ZPX9qxRlF6/EWYA3bB8m27W//Ec4B0hCCCcr
X-Google-Smtp-Source: ABdhPJzE9c0gjXPA+o+WBsnMnAV7iIJTVMyhqjwqbubth7aEYPFbKbMaP4R221/C65OOhhi/TJRY4Q==
X-Received: by 2002:a17:906:7305:: with SMTP id
 di5mr14316571ejc.255.1642367762610; 
 Sun, 16 Jan 2022 13:16:02 -0800 (PST)
Received: from [10.101.1.234] ([185.224.57.167])
 by smtp.gmail.com with ESMTPSA id e4sm3881178ejs.13.2022.01.16.13.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Jan 2022 13:16:02 -0800 (PST)
Message-ID: <7ce4a122-7027-2bc0-9a94-0a19f99d8888@amsat.org>
Date: Sun, 16 Jan 2022 22:15:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 4/5] usb/ohci: Merge ohci_async_cancel_device() into
 ohci_child_detach()
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
References: <cover.1642339238.git.balaton@eik.bme.hu>
 <a207b2537c1547e0983d66afe6d9471245f9230b.1642339238.git.balaton@eik.bme.hu>
In-Reply-To: <a207b2537c1547e0983d66afe6d9471245f9230b.1642339238.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: 26
X-Spam_score: 2.6
X-Spam_bar: ++
X-Spam_report: (2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 16/1/22 14:20, BALATON Zoltan wrote:
> These two do the same and only used once so no need to have two
> functions, simplify by merging them.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/usb/hcd-ohci.c | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

