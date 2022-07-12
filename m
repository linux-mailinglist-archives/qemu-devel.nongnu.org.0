Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAF4572849
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:13:15 +0200 (CEST)
Received: from localhost ([::1]:43498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBNBy-0004nF-Un
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBN9y-0000gO-MV
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:11:12 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:39466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBN9r-00017J-M9
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:11:09 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 r129-20020a1c4487000000b003a2d053adcbso105022wma.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 14:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=asYrFsiLuS/T+uct/m6Ld+3D3rLjSHXeNK9F7xrlGQM=;
 b=OteorUUmalArS/qj4Dr7BJqHvhz3dQQD6f37GEBU59n7k8Mp4biUkzUcSWwaFzFiSk
 ZOKYLTY6QLwVNFRRjwib7mnrD7oInluxXBso7PGL5J1DfBXudRACZ+emqD7uks2ObpUa
 AzjeK4HR7F2laQLEQBDvQP5K6T6/Cl+tP9Tp5JuOSBT7oK/V+FI6ARq6yjEcvioAZqLy
 NuGddn+haChEX4KjyOdEiHGSYlapyuJVBlZzMEwPbn2mrf0l3twQMoT4QNVlKLFMKRQF
 N7LLKJbPER1ISv3WMl/AYEdntI8+LIcqczM6chEEdARBg7kLpJFKC0O6HZBcyeX5S32r
 My0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=asYrFsiLuS/T+uct/m6Ld+3D3rLjSHXeNK9F7xrlGQM=;
 b=z2MMAXmh93IBenVk++u3fOLaxRKINQFRR+N+MwvPYZlR8BNFyAiUKjNKI+AGh6vZhQ
 iUyH4gEOBaYTo3Siq28dQZYZXZ53Hbn2uyeT0su0h4B35fpPFKbbHyyLXt6htBULmN9+
 PRCoDDX7JADMAh0hQJowuXguCp9IK9Uu8sZ/09823MTNaCjRzIYDR+1gVEPw9UMSZ6vl
 pjVlp+Kz07h6SnoPMKpfgx3QTRtSO5Q6eBBJzB4jkT0Rc1kocqhC6RI3Gr8ikuMp2Vqm
 CYnNm1MePjSPGjvdsCjU4vqceI58sDq4twqB10vzP3DUUMAjGmNuL7V/6Y4pMHyTMPl3
 VkRQ==
X-Gm-Message-State: AJIora/12XtSrXgBaLMfnrBrMb2kFfvSbDo5HMmaKkb97AxcBc9MTEmg
 +CGPuLROleycX32PII0bIDk=
X-Google-Smtp-Source: AGRyM1sluLWlcELiceBeYDph3o85d5K+zwYiOOMXyY/7xOSMQ4PMEjBeGbv3no61sTGQXWh232vadw==
X-Received: by 2002:a7b:cb03:0:b0:39e:e826:ce6d with SMTP id
 u3-20020a7bcb03000000b0039ee826ce6dmr6037706wmj.102.1657660260636; 
 Tue, 12 Jul 2022 14:11:00 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b5-20020adff905000000b0021d64a11727sm9130629wrr.49.2022.07.12.14.10.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 14:10:59 -0700 (PDT)
Message-ID: <9f22d04b-1c8d-f419-6ed6-aefac5e9716f@amsat.org>
Date: Tue, 12 Jul 2022 23:10:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v4] ui/cocoa: Take refresh rate into account
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20220702142519.12188-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220702142519.12188-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 2/7/22 16:25, Akihiko Odaki wrote:
> Retreieve the refresh rate of the display and reflect it with
> dpy_set_ui_info() and update_displaychangelistener(), allowing the
> guest and DisplayChangeListener to consume the information.
> 
> The information will be used as a hint how often the display should
> be updated. For example, when we run 30 Hz physical display updates
> it is pointless for the guest to update the screen at 60Hz
> frequency, the guest can spare some work instead.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>   meson.build |  3 ++-
>   ui/cocoa.m  | 12 ++++++++++++
>   2 files changed, 14 insertions(+), 1 deletion(-)

Thanks, patch queued.

