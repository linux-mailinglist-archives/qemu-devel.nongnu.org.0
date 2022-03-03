Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F9D4CC0D3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:10:10 +0100 (CET)
Received: from localhost ([::1]:41486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPn5l-0004vp-Td
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:10:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPn0V-000781-42
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:04:43 -0500
Received: from [2607:f8b0:4864:20::1035] (port=47016
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPn0T-0001xL-M5
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:04:42 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 15-20020a17090a098f00b001bef0376d5cso5072402pjo.5
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 07:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EpjH5lVYd6uo0J3Na8pijheOkb8JZmQAm8RXaLNGjZA=;
 b=R+GpQBbRiotSsru34x8cMyQYTXT5/2X7OUEItx4H8n48SQpBcURdSpBbBex/is331F
 IKUNRCkPiZVoO4iGCc+gHTL3As8UKL4PVFib1HEYQe7/H64OOHEBAgPXzcHs2UP6d5yq
 /D9I+MHjRtq5gPNnJIHwm4SujJarr0e3kg96jlEHqDN2F01YS6se8eik2PdyxJF4BBf+
 czsO/wF//Dt+LnMP9Uwa06lgz91ehKFKVvUGywF3jpQxYiarxlA7PGxlZzp3jzKgqjvq
 0oyTg3Oo8CMJrxDPYLMzZfUaCu3goKJpOE8XHzJZ7tFektsaDgioWSFCBe20b+0lyeDG
 XSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EpjH5lVYd6uo0J3Na8pijheOkb8JZmQAm8RXaLNGjZA=;
 b=kMJyjFSxMZbyT5eZ6rVnG+wFPwKpENAm/CVDoRKrA1qG212sEqWhkv/2E8phl7y6Ni
 IjVoETAVO6QwcgwT5LuTrdaics9RAzHfh2ePXXwyKXroFWLQkLBg9MEXHevjKicWn7dz
 KVc33AgX4ZMJ/KncI1GUgas8+YCCWCC+SP7R3evvvwR+TyYCjVI6n7Owb1/Rerh/pB/o
 JZS9TUgqdo5YVpwf1jONqtUjf6B5bqo9OxhSTAc4gwHlJLLgOJA7OOsN9v/op+3rCgk4
 PMqnrroOiua6p8/6f0pNGdZFe7SyRZ/Wycps3CNxvwJvHzdZFEuROVR4Xw3R7Qys+B4U
 OxsA==
X-Gm-Message-State: AOAM530eErxJAJ3PyPhA81csEgznegwgXnaRJmH74AHea77lYDff9lvj
 DRJzksujL+oR+VNuIvir6fc=
X-Google-Smtp-Source: ABdhPJwS42WyCDzqLPyA2cFRrH+tDJfDcl9i60wkM3NrMyjMdW/4mM/mJnVWBYm3BFQMgckDxxrLng==
X-Received: by 2002:a17:902:da91:b0:151:8e79:8307 with SMTP id
 j17-20020a170902da9100b001518e798307mr11381104plx.8.1646319879577; 
 Thu, 03 Mar 2022 07:04:39 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 m6-20020a62f206000000b004e152bc0527sm2903488pfh.153.2022.03.03.07.04.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 07:04:39 -0800 (PST)
Message-ID: <3f267514-14f2-4602-f238-1a6f44aa95f6@gmail.com>
Date: Thu, 3 Mar 2022 16:04:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v4 04/14] qapi/device_add: compute is_hotplug flag
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org,
 mark.burton@greensocs.com, edgari@xilinx.com
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-5-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220223090706.4888-5-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1035.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/2/22 10:06, Damien Hedde wrote:
> Instead of checking the phase everytime, just store the result
> in a flag. We will use more of it in the following commit.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>   softmmu/qdev-monitor.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

