Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D0165F235
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:07:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTd5-0002wc-9S; Thu, 05 Jan 2023 12:02:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDTd1-0002sB-AX
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:02:07 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDTcz-0008TM-EC
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:02:07 -0500
Received: by mail-wr1-x434.google.com with SMTP id t15so27882813wro.9
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 09:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0GYhmgdRruksUinNg+3lSzOFg5akOTHADIBNQCPungA=;
 b=Jd0/GvHZQptN5WltMd9h0lxTOUiCssddUQ4fDrdFH+b3EXCpVsPso3elUPWIxyTor9
 W6UN1GLRRCVfU6IXTvxktVItawfnOrArY9J8Ml07H8g5WKCIOgpJUs19vDtmO5ZBs0MW
 KrX5zMOiJyhp8u+fRYjWurjUDFLgg630zGOVg7HS1rnQGi10valfWdCIqjDK0+z4n+x8
 qo3a23a8OFwSoEVK2ibYfEaXnExGRvH0fl0mU0IdbC+JkHBfkan1iZyAHUFwexbW1Axa
 fy5J8pEjbVExCmIEndfFUqdN9wfDI+QSY8kywzOtPqXQqv4HmGLpE/hld2qtyWJbS7xh
 tywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0GYhmgdRruksUinNg+3lSzOFg5akOTHADIBNQCPungA=;
 b=vf6HTRsrRO7BvOxwCFUanpqQttqVorcy9JDN6otBLPgyZUkGzBORJjga1xv/B/0lPX
 /aspX5EtxPyJuxSzK5uKfKAbOI3F98/XBrGRfEsWGrXa6WsUmRBzWR5h7UwdqaYWBr8M
 X3zvtL/QMsCBGoPvXuZMr63H8SqZ+Ks1KVVLXCybEt2kk5DDLBP2PC3rRkRw0w5rQ5DW
 IRhns3ZfAcmu+lCX4+Xc7I2MDyDI5rsWsRYx3A9ig9ySzg7Qa/Xr2haXEa9XZPJ4dQ/d
 eVl3T4uHlmVNUHVIcWlGSunWpc1XF34wBoKoWDD8MvpBW5AH0glfEUXrs+gnDb5GCO18
 DErQ==
X-Gm-Message-State: AFqh2koM9dfgoXw9ohTgxDZd+aDyua7Iv+KV1b4hi6toI+/apxIY1zce
 tD5kFgxxKnaddnxMrA22fCSLWA==
X-Google-Smtp-Source: AMrXdXvt25x4deo5wqJl8w3m7diY3MrHsOmt56qfKXfvGUcICWj3Ifn7KCpAyzMrDmqWJi9IyJ36sQ==
X-Received: by 2002:a5d:6a43:0:b0:242:13bf:29de with SMTP id
 t3-20020a5d6a43000000b0024213bf29demr31623073wrw.52.1672938123918; 
 Thu, 05 Jan 2023 09:02:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e27-20020adf9bdb000000b00272c0767b4asm37074669wrc.109.2023.01.05.09.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 09:02:03 -0800 (PST)
Message-ID: <4db2557b-4c5b-6ef0-e40f-10bf1f8b02ce@linaro.org>
Date: Thu, 5 Jan 2023 18:01:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/21] gdbstub/internals.h: clean up include guard
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
 <20230105164320.2164095-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230105164320.2164095-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Use something more specific to avoid name clashes.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/internals.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


