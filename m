Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A92430AB7
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Oct 2021 18:26:21 +0200 (CEST)
Received: from localhost ([::1]:38044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mc8zM-0000gy-Ne
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 12:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mc8ve-0006BU-0G
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 12:22:30 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mc8vb-0006fe-L4
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 12:22:29 -0400
Received: by mail-wr1-x42e.google.com with SMTP id o20so36659338wro.3
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 09:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s9NtwtayWLEpVUGYuUtLCFdMB0zfBP3KY87YX7Cf+BU=;
 b=ZmCLz7TRWV10fEfmJpgWbpDzQKSZiNGl6g+2E4ZpvvvMfS6sDQ/R/p46B2x74m/2jq
 aq/EOySHh3eInn1ySJILLzkK2wAxaASxFOzZKlrbpl6nDewO7yauJdDOd+Hb5fqZrV9Q
 diZm4YWUPGv23F1KViBnOIa4SXQBfLXG1nubAnfHtoWpVPnS2FwP/JrC0BVXq0HFHpm7
 sh/SsruY5O3a2DdAAMi510DHJMikRyZ7xdHOJlN7mNbG64s31UlqgKoU2mmY37dFvLEV
 5hTsxk44swkXmD7wJQR0MVpSpXm80qA+LgHFaeXU37/ix6j+bhs06XDOHJCdpnXRcwXQ
 BLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s9NtwtayWLEpVUGYuUtLCFdMB0zfBP3KY87YX7Cf+BU=;
 b=OZif4OKGc30U3az6sk3ivkvektKNSlJo18W6xq8UDZeWP85AIgKCrM5pjwBHd7ykLd
 CKDSJ0+TFddq0pxOXUOV2uMvzLqZ8ANaoxvATqEL6tscI74oDsKgi9Xczsv3U6o1OO+M
 vk5NjvELfiluIgkBocMy/dpONJuqBRCzFqn3IAlMmLRn4AJ2Ym0FfpADXLBxfZzmRAeh
 8OFffweTGUF4EgWLlXEchtgW0NeiMnxsxlkwAi+vT71Bgz0C9U/hXcaHh8IRpi9NCSPZ
 x1u5ETjN6O4KdSmeWDAoM8hxDyGfuIBD7lN48INz6HR7eEoLX4rQ/+4+1EyBA7j5/PSC
 HZzA==
X-Gm-Message-State: AOAM530IrFXst2EmySfRq5XEVIlaMJl9b81my//9yP9qUlv+6u2Rznqh
 hRjLD9xhKa/LX7AwuC4suxo=
X-Google-Smtp-Source: ABdhPJzooeS8vRnvZJgS11LSPJJMq2qqI9+Xi4XD2sea0RaYbDLngc0VSjuEvr+oJzjPpkhLSDy3cA==
X-Received: by 2002:adf:a2d4:: with SMTP id t20mr28888181wra.229.1634487746280; 
 Sun, 17 Oct 2021 09:22:26 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id z135sm5109554wmc.45.2021.10.17.09.22.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 09:22:25 -0700 (PDT)
Message-ID: <d17fcc21-dca8-4f69-800f-6fccb213d81e@amsat.org>
Date: Sun, 17 Oct 2021 18:22:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/4] vt82c686: Move common code to via_isa_realize
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1634259980.git.balaton@eik.bme.hu>
 <7cb7a16ff4daf8f48d576246255bea1fd355207c.1634259980.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <7cb7a16ff4daf8f48d576246255bea1fd355207c.1634259980.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 03:06, BALATON Zoltan wrote:
> The vt82c686b_realize and vt8231_realize methods are almost identical,
> factor out the common parts to a via_isa_realize function to avoid
> code duplication.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c | 67 ++++++++++++++++++++---------------------------
>  1 file changed, 29 insertions(+), 38 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

