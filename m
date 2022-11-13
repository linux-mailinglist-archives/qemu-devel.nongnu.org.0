Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46CC627244
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Nov 2022 20:44:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouIu4-0006lv-VV; Sun, 13 Nov 2022 14:44:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouIu0-0006ld-As
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 14:44:24 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouIty-0001sr-JV
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 14:44:23 -0500
Received: by mail-wm1-x329.google.com with SMTP id p16so6022470wmc.3
 for <qemu-devel@nongnu.org>; Sun, 13 Nov 2022 11:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1niK+oBSOHhMhQpNm9t/6+16c88vmBlIDlymL25OZM4=;
 b=VSnQtg6mOgzmqz6PFeCoGz9BgEedTeoJyRcUfI3L3jXXjjvIg9/Dk3RaUwByDbLSRl
 CPeYJmfwVKjniZ4dreFa3oiaIhRxtHoCJHdn5s5Dj9TNzfJGQNVw/pck1AMBaHD2iIcA
 Ukma5GScjG0qrkGVkIeGJiiCIAd6iX/ilgequbkiU1wC/2Xfu8E+m4NXgs+F6Q5kJHlb
 M7x15r1k/eUqWw4LiHfxc/zsBce0xHw5mWKHtQGcrm/MBLXZrcD44FqJ41N1dhORWV/+
 CfE0mtWZvC3sGySd7bRSnp8x2nV9/X3x4R1tiL8uxEzP6I+iA5FnFlMNPZmjjRKCchvV
 P5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1niK+oBSOHhMhQpNm9t/6+16c88vmBlIDlymL25OZM4=;
 b=c8bkH9Wts5XWdiTOWmA4Fl/wngBGZuN9AIAwnndd26wzKmXB5dGc4PbzbAC0Tvw3QT
 txJ2J6deIR+M0EuBX6+f3mO6pWNi4wz1VNP4sQlIM14A7zogHF7cQuoEIpXu4HQPaME1
 Yg5UiQGD1LQTUF/I1ala30QExT2RFgx9r+3OrVsLA84U4Z20f6/4/1NUhW3lnsxzsQle
 qWkjON9CF2TAvzVtVw74zKkbRMdlzWGHlXlVBZf/CN41xREJ8KgP2xu9HA0l0UYNmRy1
 URddRdeDibepy767oi702oeVAW0MARlOUxZ6KWxC7501aWUpy9JjvCAonDug75jcC/dz
 VaMA==
X-Gm-Message-State: ANoB5pkn/2Bgvb8Tbr+JwLYqm09bHH+lrAGK58G0UrE5+pO5WH3pHVDT
 7NI/aKLuOGVOQdIH+YzmfzaNUA==
X-Google-Smtp-Source: AA0mqf4SFFskAqmS7EkJsKaYRee0dATqmtxXPe4e8kSj2+99rKQYl6kcGv/y213iGHVdTlg9Rz9Ftw==
X-Received: by 2002:a7b:cd12:0:b0:3c8:353b:2553 with SMTP id
 f18-20020a7bcd12000000b003c8353b2553mr6171163wmj.18.1668368660003; 
 Sun, 13 Nov 2022 11:44:20 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c468900b003cf75213bb9sm16788350wmo.8.2022.11.13.11.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Nov 2022 11:44:19 -0800 (PST)
Message-ID: <d8e746af-c533-01a8-0cd7-c6d8cee153a3@linaro.org>
Date: Sun, 13 Nov 2022 20:44:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v5 10/20] target/microblaze: initialise MemTxAttrs for CPU
 access
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-11-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221111182535.64844-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/11/22 19:25, Alex Bennée wrote:
> Both of these functions deal with CPU based access (as is evidenced by
> the secure check straight after). Use the new MEMTXATTRS_CPU
> constructor to ensure the correct CPU id is filled in should it ever
> be needed by any devices later.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/microblaze/helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


