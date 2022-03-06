Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5781F4CEE13
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 23:02:52 +0100 (CET)
Received: from localhost ([::1]:47428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQyxm-0001z4-VX
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 17:02:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQywh-0001Jv-5G
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 17:01:43 -0500
Received: from [2a00:1450:4864:20::435] (port=33611
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQywf-00056j-Nc
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 17:01:42 -0500
Received: by mail-wr1-x435.google.com with SMTP id j17so20594102wrc.0
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 14:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5DeqxXOkukouROpoulrBBdh1HVyotEOihaNuS7anEu8=;
 b=ALyW+eLBDw/fK3cHeiubbpRaSbqqHnzYfzqaO2PVKUbNmVRzxbolAz8G/JDSt2pfvH
 O9tFgFEUUWm6MWWc5+CDtM3Oa7a1/I2fiZ6JjRnvczG2aXIVLK9nzNMzsILl/PYVnWA4
 6xzzbnZXp0USoy9soU395rfSjQ/Gg5PAcYm1ir9eymTLcsRqcB7HSDHiRG5qQbZNq/HG
 gxVUhk30ZA/+2K5huY8BPoTQp63GwZ+sOj71Mvzk9KWipdGUl/jw/Coyp1z/Yz8gRln7
 fQJlxWTqsOFKzWciHPNl14aT9+AkypbUdfJLQjlq8iVUfBOoY/O5znDnfETwkjJww43z
 qHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5DeqxXOkukouROpoulrBBdh1HVyotEOihaNuS7anEu8=;
 b=c2ulkuSn8+2iumC+7qKtEY7IakgfDYmzCG8eEt9ELsczMvhgLX4DLKuFCsNxsb3Swu
 jvJOJXvPD/8i68U2tasI2/4B+/2CS2jeiIIqU0Xyt4iRPh6yeN097M4oprz1IFbq4pYd
 F2FkdKrIyUdQAlJkVh2WoKsvNoVS4UIz/9JG6VtxH9bs6gtTahFMLaY53EbEa1bmf+7P
 xsVD5XCU2+iWvM4CTzRE9yJfIDsMlfMXCYtZuq9rVjlPIg9DeBWI2dbNuMQUwVrAXX1v
 r2SvZlnSInTQNtF3/8b2mDhxHx437VOVjShY90jM/OkaVPFU8P3zMl6PKo6jOtmLblMU
 rQiA==
X-Gm-Message-State: AOAM532z48TcxrkwAaxy9qgPc8UtP3pdIcfBv5YXJua0N5e3BlRASCyl
 LS0gS1hUSAjbwg1ElVMqvgk=
X-Google-Smtp-Source: ABdhPJwkHyKVjW8CXVqr00HI+nXyKc0lfoyv2iHRYRQZjkj/Oc34EkRWxE6ytt5ponGKW2ZlRUIlhQ==
X-Received: by 2002:a05:6000:11d0:b0:1f1:f6ea:f9a with SMTP id
 i16-20020a05600011d000b001f1f6ea0f9amr2201758wrx.40.1646604097315; 
 Sun, 06 Mar 2022 14:01:37 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d18-20020adff2d2000000b001f025ea3a20sm15932211wrp.0.2022.03.06.14.01.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 14:01:36 -0800 (PST)
Message-ID: <eb847aa8-805e-1236-ed33-bd5379a689ca@gmail.com>
Date: Sun, 6 Mar 2022 23:01:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] audio: Log context for audio bug
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20220306063202.27331-1-akihiko.odaki@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220306063202.27331-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/22 07:32, Akihiko Odaki wrote:
> Without this change audio_bug aborts when the bug condition is met,
> which discards following useful logs. Call abort after such logs.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>   audio/audio.c          | 25 ++++++++++++-------------
>   audio/audio_template.h | 27 ++++++++++++---------------
>   2 files changed, 24 insertions(+), 28 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

