Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA39B2B43F2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:48:06 +0100 (CET)
Received: from localhost ([::1]:37998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedvR-000378-PW
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:48:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kedt5-0001Ga-Bp; Mon, 16 Nov 2020 07:45:39 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:35072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kedt3-0002DC-21; Mon, 16 Nov 2020 07:45:38 -0500
Received: by mail-wr1-x441.google.com with SMTP id k2so18586225wrx.2;
 Mon, 16 Nov 2020 04:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dNkWLDdgG92y9ToMxg0tVYSpOCp8Nn6HaIlYVrE2taU=;
 b=S6mW42jn/XfF3m8gWPc7poyCYkxbaRrS3L9Qly/q6gArpuevyZrGuiZOqs6Y0bv+CQ
 x6rxsV/2OBWr0N0WKfkGESQC1a4DpJKe8WmEX9BMnvpp6E6fFNYdcY1AClcp3qEMDekB
 4YwSho/VD5io5HW6Vc8DZF2WhsttHADzHF+fDbMWWS5UDXqiXa8+zQyCVvyxABw2xOdR
 hTBGP+Bkev6rWSzMf9MI0l2mIPQAje4gXYx6pspvxCbzoB1SixthSz7Hcmi/ad2PG2vf
 COLLzkoZmYxpsm4GThn/J3cEkLHUIok3C9/ISu+fR9urkGf6a19CBtTgYwfBA4b25uwk
 vvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dNkWLDdgG92y9ToMxg0tVYSpOCp8Nn6HaIlYVrE2taU=;
 b=Vs3ta1YjCBmfpCDbIi7MM4o+ng/BAaCat5Jo2DYjFbFPoMo80qsiSn4XKiIU5PJmsh
 saHdalcYpsMFyZGwi8BD3awZGzggKwvSTTooUimwQtuLPBYnUaYkMUZ93xRLhqJyDcFa
 jYKCdgjrs9ElviZeVZStWh4xRuSF88l9mIGNcM8frbt5p9/fO9INxzGfddeyP4UYXKgX
 JpIY3VYPYj4ym9jMseRAjknUSWOn6uU3Holg81BxJ/ZEgo4foCb2L/AA2ntp+mnRlpoE
 1pq2XZkPUsWtgo2sFK1S5iLJzk7hzrgyh6ST3pI9+E/TrSETjJBd93mQIgNs4OPEsaZn
 AVyQ==
X-Gm-Message-State: AOAM531SHqVnGls2k1TWoYXN/x77X6j4IiBcZ9kJG6TT1kDMQXCDhiUI
 LCXRDB/H//IVlPJZrJ1UY9Q=
X-Google-Smtp-Source: ABdhPJwbHPC9sxbLzq+5iwbRNJVOb0K2MkFbjgM61DKxJ4Os722Go/gE6B65LQ5TkFx6MyQ2PXLzMg==
X-Received: by 2002:adf:9e4c:: with SMTP id v12mr18566385wre.22.1605530735080; 
 Mon, 16 Nov 2020 04:45:35 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 60sm20132308wrs.69.2020.11.16.04.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 04:45:34 -0800 (PST)
Subject: Re: [PATCH v3 1/4] ssd0323: put it into the 'display' category
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201112125824.763182-1-ganqixin@huawei.com>
 <20201112125824.763182-2-ganqixin@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a8f523e3-0b94-fb22-94d9-799d1274bccd@amsat.org>
Date: Mon, 16 Nov 2020 13:45:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201112125824.763182-2-ganqixin@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: thuth@redhat.com, zhang.zhanghailiang@huawei.com, mst@redhat.com,
 laurent@vivier.eu, armbru@redhat.com, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/20 1:58 PM, Gan Qixin wrote:
> The category of the ssd0323 device is not set, put it into the 'display'
> category.
> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/display/ssd0323.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

