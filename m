Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1974B5D86
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 23:17:29 +0100 (CET)
Received: from localhost ([::1]:33238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJjey-0003w4-39
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 17:17:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJjcP-0002aD-4Q; Mon, 14 Feb 2022 17:14:49 -0500
Received: from [2607:f8b0:4864:20::1035] (port=53907
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJjcM-0005jH-3z; Mon, 14 Feb 2022 17:14:48 -0500
Received: by mail-pj1-x1035.google.com with SMTP id qe15so15799448pjb.3;
 Mon, 14 Feb 2022 14:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cFdcSty7VoVDb7EduO4tbI6EzqzKILqqMKStMsiCKZQ=;
 b=Ck2tGWNOIwySXQhinn312IkcO0TfvYDp3ItUj3zSTsuKjHmGc2KmMgSMBehav+h8QC
 ecn/TyeDnWU2kNlgMXZcMdU18RL5sEOxRsxULbtzX9dCckIySRQqL/cUeN+uqYudNp/q
 Bi61BQPzGQLXMeV0pHGK0t/aK/Kvhe+bdMZKeGiKDI1enojZio8Pg0Gqfa28oU54FZkO
 8xZjFuRgpibBjnnJPgV6pvb5Pf2XueHTYbbuEm27glrgKVBxLbQC07IOa+KcDHIHUVx5
 vnJZB3gPE0XrcuV9R/3a7XKSd9qGHKddW+sNmbbhTP1+Etq0cG2OQH6niHDkQSZHjVJx
 BCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cFdcSty7VoVDb7EduO4tbI6EzqzKILqqMKStMsiCKZQ=;
 b=Y9keyC4Ipa0N6Cd8VKD7D3amkfBwuiVTl8h30Hc09DlvreyqD9ljEXpWeINrby7od5
 h9zfwEj6Ba6cetZYRFrQVe0eKH9/hiLSY4Le8V74a2+reaUm/xaR3Iz5X89D/WvHz3Th
 7H8fKIuQ6BYIX8oXRsd2e/JhynvktCYtm9TThoDwIzr1gsddFE4aJ40ntmwSSiNbBYZQ
 eqjRAs6Ys/2lHSEIcbUJGcnbBPem7oLmZpBBZKBMrjJzZz/zylqe/k49jR+B2GlH8HBr
 A317bGJ1HmXBeCDu2jESfmeCD0AeT3/HzBl4r+9aZ/0lNtQIJBXC7J9NO2xocYJKKAiR
 or+w==
X-Gm-Message-State: AOAM533jb/RJ2TOgARurk8C/8/zVaxCspnDENJ3Bi82jv46rER5FUuD3
 18CRLFKGG3HT+RYCxCwPDgY=
X-Google-Smtp-Source: ABdhPJwyhtpJZQpTXrji6NwcLYY2/nTK4PQCu1pX+cNZIH4Bcw7sGhJbrRgWRgLxMZ40SU7TmqN1CA==
X-Received: by 2002:a17:902:7788:: with SMTP id
 o8mr1043457pll.27.1644876883849; 
 Mon, 14 Feb 2022 14:14:43 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id h18sm37024415pfh.51.2022.02.14.14.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 14:14:43 -0800 (PST)
Message-ID: <11af7e55-560e-a46f-e923-c9baebd461be@amsat.org>
Date: Mon, 14 Feb 2022 23:14:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 1/1] vdpa: Make ncs autofree
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220214193415.1606752-1-eperezma@redhat.com>
 <20220214193415.1606752-2-eperezma@redhat.com>
In-Reply-To: <20220214193415.1606752-2-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On 14/2/22 20:34, Eugenio Pérez wrote:
> Simplifying memory management.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   net/vhost-vdpa.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


