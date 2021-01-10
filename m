Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DD82F09E3
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 22:34:12 +0100 (CET)
Received: from localhost ([::1]:58908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyiLj-0005fE-3S
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 16:34:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyiKL-0005Dd-OJ
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 16:32:45 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyiKK-0007hD-1V
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 16:32:45 -0500
Received: by mail-ej1-x635.google.com with SMTP id 6so21983695ejz.5
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 13:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PKV5RMI1CKeXsFFHYvHhc73cpluLNSOIXlDWQoKdMSI=;
 b=n+FFks9xop4F9QCQZJziZqhwwLk4ffar53gt77Bq3JAIm20XkT5yxMnvdeVjCb1fIo
 Nea1igObd+mnol6zPnmTUmmgxq/LqNqXCirOetzTZr8n6xYrqOfUInKyr4v0Lub6JESF
 wT11fsDH/LUk1AY89BcGVB8vg9i7+Dpzt97oloibIIwEkhSQ4bZO54PPL/ryYJ9nDQsh
 iNk7GK0xnaueDx2uVmZ0ZfN8nPXPm6j+jwYdtFVYBE3oGg4cnaGzJw44ukh1pYRO/gPi
 yi9YoVhEUOL5A/l5HgIbpcp4xKqQhHZcvbip7biU1wJA4+/tpmg+uJzW6M3n1+RZd6dX
 cr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PKV5RMI1CKeXsFFHYvHhc73cpluLNSOIXlDWQoKdMSI=;
 b=cMf8AzzQDrS3wiBLqulWN5NRm9kazr7kfUOik5nil5jX6hRb+EepY2PzZuuVfNrlvq
 yrCtm6a+oOTC1M0rRpj/LYoYhh/ZGEq6IcidUoAZf66iY+umJx/MqPLyhfNd2N0QNttd
 SmREPGE72m8HT/86z9TQ+diOOjXhjjhQhBOSVWfnM8fBmlwd1AP1T0N/OcwNMoS3dK4y
 Qceibufy6FYQCnlQp8h6U+2Phi4KcFYSiDK6KMtGeSgd90ci7WnPu8ilmHWqCQWWVsZA
 rwX2CkGKj0RN4FOoyZkcWyzLjBZ0TyQNsDlX6IiavPgne2t4KpjyGisSytU0THvNmWLK
 wjBQ==
X-Gm-Message-State: AOAM530vFNmAL+5faCrErWz0CnxGVRam6euQ9131oh1CzcOh9sdBr4FR
 O3N6FjNkXeyrfC0ZOlCPzd/3E2HaHIs=
X-Google-Smtp-Source: ABdhPJyK4ONJ18ieKhDdAku40beKU5HzsVZ0xYjMs01XYR1+eo+cOqU39voDHsAQY5yUoup7CsLodA==
X-Received: by 2002:a17:906:710b:: with SMTP id
 x11mr9308267ejj.433.1610314362227; 
 Sun, 10 Jan 2021 13:32:42 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id p24sm6702671edr.65.2021.01.10.13.32.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jan 2021 13:32:41 -0800 (PST)
Subject: Re: [PATCH] tcg: Remove unused tcg_out_dupi_vec() stub
To: Richard Henderson <richard.henderson@linaro.org>,
 Wataru Ashihara <wataash@wataash.com>, qemu-devel@nongnu.org
References: <20210110041039.512225-1-wataash@wataash.com>
 <7ee330fa-62e7-353d-333f-cd4ed7a065a5@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b35a3b47-e9d1-3d0a-9142-2f1703c0e115@amsat.org>
Date: Sun, 10 Jan 2021 22:32:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <7ee330fa-62e7-353d-333f-cd4ed7a065a5@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.012,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMS8xMC8yMSA3OjIzIFBNLCBSaWNoYXJkIEhlbmRlcnNvbiB3cm90ZToNCj4gT24gMS85
LzIxIDY6MTAgUE0sIFdhdGFydSBBc2hpaGFyYSB3cm90ZToNCj4+IFRoaXMgZml4ZXMgdGhl
IGJ1aWxkIHdpdGggLS1lbmFibGUtdGNnLWludGVycHJldGVyOg0KPj4NCj4+ICAgY2xhbmcg
LUlsaWJxZW11LWFybS1zb2Z0bW11LmZhLnAgLUkuIC1JLi4gLUl0YXJnZXQvYXJtIC1JLi4v
dGFyZ2V0L2FybSAtSS4uL2R0Yy9saWJmZHQgLUkuLi9jYXBzdG9uZS9pbmNsdWRlL2NhcHN0
b25lIC1JcWFwaSAtSXRyYWNlIC1JdWkgLUl1aS9zaGFkZXIgLUkvdXNyL2luY2x1ZGUvcGl4
bWFuLTEgLUkvdXNyL2luY2x1ZGUvZ2xpYi0yLjAgLUkvdXNyL2xpYi94ODZfNjQtbGludXgt
Z251L2dsaWItMi4wL2luY2x1ZGUgLVhjbGFuZyAtZmNvbG9yLWRpYWdub3N0aWNzIC1waXBl
IC1XYWxsIC1XaW52YWxpZC1wY2ggLVdlcnJvciAtc3RkPWdudTk5IC1nIC1tNjQgLW1jeDE2
IC1EX0dOVV9TT1VSQ0UgLURfRklMRV9PRkZTRVRfQklUUz02NCAtRF9MQVJHRUZJTEVfU09V
UkNFIC1Xc3RyaWN0LXByb3RvdHlwZXMgLVdyZWR1bmRhbnQtZGVjbHMgLVd1bmRlZiAtV3dy
aXRlLXN0cmluZ3MgLVdtaXNzaW5nLXByb3RvdHlwZXMgLWZuby1zdHJpY3QtYWxpYXNpbmcg
LWZuby1jb21tb24gLWZ3cmFwdiAtV29sZC1zdHlsZS1kZWZpbml0aW9uIC1XdHlwZS1saW1p
dHMgLVdmb3JtYXQtc2VjdXJpdHkgLVdmb3JtYXQteTJrIC1XaW5pdC1zZWxmIC1XaWdub3Jl
ZC1xdWFsaWZpZXJzIC1XZW1wdHktYm9keSAtV25lc3RlZC1leHRlcm5zIC1XZW5kaWYtbGFi
ZWxzIC1XZXhwYW5zaW9uLXRvLWRlZmluZWQgLVduby1pbml0aWFsaXplci1vdmVycmlkZXMg
LVduby1taXNzaW5nLWluY2x1ZGUtZGlycyAtV25vLXNoaWZ0LW5lZ2F0aXZlLXZhbHVlIC1X
bm8tc3RyaW5nLXBsdXMtaW50IC1Xbm8tdHlwZWRlZi1yZWRlZmluaXRpb24gLVduby10YXV0
b2xvZ2ljYWwtdHlwZS1saW1pdC1jb21wYXJlIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyAt
aXN5c3RlbSAvaG9tZS93c2gvcWMvcWVtdS9saW51eC1oZWFkZXJzIC1pc3lzdGVtIGxpbnV4
LWhlYWRlcnMgLWlxdW90ZSAvaG9tZS93c2gvcWMvcWVtdS90Y2cvdGNpIC1pcXVvdGUgLiAt
aXF1b3RlIC9ob21lL3dzaC9xYy9xZW11IC1pcXVvdGUgL2hvbWUvd3NoL3FjL3FlbXUvYWNj
ZWwvdGNnIC1pcXVvdGUgL2hvbWUvd3NoL3FjL3FlbXUvaW5jbHVkZSAtaXF1b3RlIC9ob21l
L3dzaC9xYy9xZW11L2Rpc2FzL2xpYnZpeGwgLXB0aHJlYWQgLWZQSUMgLWlzeXN0ZW0uLi9s
aW51eC1oZWFkZXJzIC1pc3lzdGVtbGludXgtaGVhZGVycyAtRE5FRURfQ1BVX0ggJy1EQ09O
RklHX1RBUkdFVD0iYXJtLXNvZnRtbXUtY29uZmlnLXRhcmdldC5oIicgJy1EQ09ORklHX0RF
VklDRVM9ImFybS1zb2Z0bW11LWNvbmZpZy1kZXZpY2VzLmgiJyAtTUQgLU1RIGxpYnFlbXUt
YXJtLXNvZnRtbXUuZmEucC90Y2dfdGNnLmMubyAtTUYgbGlicWVtdS1hcm0tc29mdG1tdS5m
YS5wL3RjZ190Y2cuYy5vLmQgLW8gbGlicWVtdS1hcm0tc29mdG1tdS5mYS5wL3RjZ190Y2cu
Yy5vIC1jIC4uL3RjZy90Y2cuYw0KPj4gICAuLi90Y2cvdGNnLmM6MTM2OjIwOiBlcnJvcjog
dW51c2VkIGZ1bmN0aW9uICd0Y2dfb3V0X2R1cGlfdmVjJyBbLVdlcnJvciwtV3VudXNlZC1m
dW5jdGlvbl0NCj4gDQo+IA0KPiBXaGF0IHZlcnNpb24gb2YgY2xhbmc/DQo+IFdpdGggY2xh
bmcgMTAsIEkgY2FuJ3QgZXZlbiBydW4gY29uZmlndXJlIHdpdGhvdXQgLS1kaXNhYmxlLXdl
cnJvci4NCg0KY2xhbmcgdmVyc2lvbiAxMC4wLjEgKEZlZG9yYSAxMC4wLjEtMy5mYzMyKQ0K
DQpJIHRlc3RlZCB1c2luZzoNCg0KLi4vY29uZmlndXJlICctLWNjPWNsYW5nJyAnLS1jeHg9
Y2xhbmcrKycgXA0KICctLWV4dHJhLWNmbGFncz0tV3VudXNlZC1mdW5jdGlvbicgJy0tZW5h
YmxlLXRjZy1pbnRlcnByZXRlcicgXA0KICctLWRpc2FibGUtdG9vbHMnICctLXRhcmdldC1s
aXN0PWFybS1zb2Z0bW11Jw0K

