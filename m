Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA71C65F2B5
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:31:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDU10-0002Q2-3N; Thu, 05 Jan 2023 12:26:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDU0r-0002Mu-3i
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:26:46 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDU0p-00006R-5i
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:26:44 -0500
Received: by mail-wm1-x32a.google.com with SMTP id m3so19642916wmq.0
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 09:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YJ9R9RXtjscsZqJEnjO20+62buuIfhCqeryuH+omc1U=;
 b=x2O4i4Yvt+VOEEhJTeqBAX2ZZH9HOGHi9BCYO2B50iDwu9plmEH/dXFX7RX+6DkTQZ
 LG/Rc2Zh7NiQ67BpEaQLXVD/0HqDo0LN/+1tuXesvbunNeSDxpZgWqziHbRUpAYw1Zbp
 7BxZYB2X1PrHDUnPCTvLWG4B+R/AcJDXcectJ4H7LlEqKsn8SScgsjr11E8F/dGwtA1y
 YfwiKIVHokOgU2rIdBnkExAT7D9hLv0+73nBMzwJItqTHF6qHApQgIqxszEBFWL8tYZ/
 YPWxlQNSmnmgUMtu9hcJm80mt/FbwQYL0hT0cPRf4nhnPJiPw1fHxud3TLtCz3S84qYQ
 6Y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YJ9R9RXtjscsZqJEnjO20+62buuIfhCqeryuH+omc1U=;
 b=yTcPmtOTJLgVs+W4Ebdps/W29sKjbK8KT/BlN3bfRcCnKjo9EtFcRXvi4U+2GhruKt
 jxR7sW9KZ8BFj/A+US8CC1qveSEQoft5KxpFAJx3q/QtRFpvh8IC2kfKiXz6goDaJcUt
 xdBAQL8wg4q81MboMKSOzkIxa12VWX+clriEtMmO5o0QxtfT4CLOn9jAjxNdVjP8lChQ
 SYDvnE8YQDhTCtStGf29gxqw8mDSRiJyD7PyEdeKp02hAXFlt94zA2rlZb01gMWUFwGh
 P19Af2XmRhYPXfV1ldAYcrHT7JCSWW1xf34zPCg1N2R4KymdGsGv91bjdhKeXWRkGEWx
 HBmw==
X-Gm-Message-State: AFqh2kqprxUO90/lzHgc//kKZm8NaZMzLhSJ/cDDM0DzcZmWr0nChpmy
 TqUW2c78mj4JwmfYJd448JvbiQ==
X-Google-Smtp-Source: AMrXdXt4tXUQ+WgtBP8T0TQkuq3QEoOCebVqsYx3qjzPi4ZeiOLcHp/FfaFFQkJQIJhddq/US5ii7g==
X-Received: by 2002:a05:600c:d1:b0:3d3:4d21:704d with SMTP id
 u17-20020a05600c00d100b003d34d21704dmr37046020wmm.14.1672939601883; 
 Thu, 05 Jan 2023 09:26:41 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c2caa00b003cfd58409desm3158151wmc.13.2023.01.05.09.26.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 09:26:41 -0800 (PST)
Message-ID: <bdb3339f-e753-7911-6767-98b1279d311a@linaro.org>
Date: Thu, 5 Jan 2023 18:26:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 17/21] gdbstub: fix address type of gdb_set_cpu_pc
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, alex.bennee@gmail.com
Cc: David Hildenbrand <david@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Greg Kurz
 <groug@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bin Meng <bin.meng@windriver.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-18-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230105164320.2164095-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 5/1/23 17:43, Alex Bennée wrote:
> The underlying call uses vaddr and the comms API uses unsigned long
> long which will always fit. We don't need to deal in target_ulong
> here.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/gdbstub.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Yay \o/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



