Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC163390F2
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 16:15:39 +0100 (CET)
Received: from localhost ([::1]:56480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKjVq-0008Ce-KJ
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 10:15:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKjQo-00034v-IH
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:10:28 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKjQm-0006wH-ON
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:10:26 -0500
Received: by mail-wr1-x434.google.com with SMTP id d15so5000587wrv.5
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 07:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eqvzIFsMhCwpru8NaLQWYSctOoWczpdqXoyz98aeHns=;
 b=rf5GFMK05VhfaMW+2Lh5wLGwPKDQisJO541UPuk9kQl1xQN77YQybN1IXd6UN1WwE/
 r2U8QecR+vcNnVSCTGoHm+1erzsB93U7R+ZjWN50hNTwVSgBRlKw9NqUvmB5Cpz/Ihwq
 kh6fQOMrfpFPk3WV+/QtkSfN3ACysD4kAKo5Lmup8g9uHBJzVGvuVXm+SPNPydnL5wJm
 SQgNi2VXt2u4z/rv2kr74N0KEQymVDF7BRPn31wLh1OU6fbmRGSHXZwQA6yZ1+y0EOiR
 w3N/8uNSwvsLt96wTYkBacCz70BNCNd+83+8GAamlS/PwpIF5C5pBXnCmKR6fhs/WeGv
 0Nug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eqvzIFsMhCwpru8NaLQWYSctOoWczpdqXoyz98aeHns=;
 b=IyVj/ZTKd7WB6R07pDr2A76MYeZwLYVXgAr2DYf+pbhxYRYR8WeDjGmxRrkSwZsaDs
 k6pZjB3BPPdOTGS4UtvzbCRLXjYH2sTIc9710K9juQ1ZmUwGy3XtVf37a8HrXsPriwQ8
 kaLRHd+PMYBYGuCPoBtKWkKbZ1zjZU5pUrQYGJ3q3HiHFtBcNObacQw4vK9Wangdpo+k
 ANTV6t3qTM+O8L/R5DHiai8+Nb8UqKb75Ppb9PNTBEGi7z/lPCu6f3oQX/bL6VskTOyV
 NHRn220RYgjFYa0XsoqhtLjabtnj10UuHe0lfBRATxWPYV3j09Q6LAQ6cKu4ywttWurH
 D4zg==
X-Gm-Message-State: AOAM530ezriaVSEjgYnIo59Lh7Wa02+MY0qIG+Ca2kB02AF876hO6tRg
 BptRXOrCuBsuFuFCb5r7jkc=
X-Google-Smtp-Source: ABdhPJypf5v6vnGPDNGJk4a4DK2hrJhYsJJ1qe7BqIqMoqKecEbU4KaNuPXM16i6fOAfSxTNG0/Zow==
X-Received: by 2002:adf:c64a:: with SMTP id u10mr14474092wrg.412.1615561822120; 
 Fri, 12 Mar 2021 07:10:22 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id v7sm2383102wme.47.2021.03.12.07.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 07:10:20 -0800 (PST)
Subject: Re: [RFC PATCH 32/42] docker: Add gentoo-mipsr5900el-cross image
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Fredrik Noring <noring@nocrew.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-33-f4bug@amsat.org>
 <20210215115957.GG1542881@redhat.com> <YCp7Ce6ELbLFvRXZ@sx9>
 <ebbdecd9-e599-1a4b-60e8-3464afa4a20e@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <21217ef4-91d8-6877-5d78-bb78e00773d8@amsat.org>
Date: Fri, 12 Mar 2021 16:10:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <ebbdecd9-e599-1a4b-60e8-3464afa4a20e@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/20/21 9:01 PM, Philippe Mathieu-Daudé wrote:
> On 2/15/21 2:45 PM, Fredrik Noring wrote:
>> On Mon, Feb 15, 2021 at 11:59:57AM +0000, Daniel P. Berrangé wrote:
>>> On Sun, Feb 14, 2021 at 06:59:02PM +0100, Philippe Mathieu-Daudé wrote:
>>>> Add a Docker image providing cross toolchain for the MIPS R5900 CPU
>>>> (used on the Sony PS2).
>>>>
>>>> This image is based on Gentoo and the toolchain is built using crossdev.
>>>
>>> Is there any way we can do this with a distro that isn't Gentoo
>>> so that we can get a container build that is fast enough to be
>>> useful for CI ?

Using the Debian cross image I get:

/home/phil/source/qemu/tests/docker/docker.py --engine auto cc --cc
mips64el-linux-gnuabi64-gcc -i qemu/debian-mips64el-cross -s
/home/phil/source/qemu --   -Wall -Werror -O0 -g -fno-strict-aliasing
-mabi=n32 -march=r5900
/home/phil/source/qemu/tests/tcg/mips/test-r5900-dmult.c -o
test-r5900-dmult  -static
cc1: error: unsupported combination: -march=r5900 -mhard-float
-mdouble-float

No clue what is setting '-mhard-float -mdouble-float' yet.

>>
>> Is it necessary to rebuild the toolchain every time?
> 
> No.
> 
>> Also, perhaps a
>> generic MIPS suite can be used; it shouldn't to necessary to have one
>> specifically made for the R5900 (except libc, if needed, I guess).
> 
> We want it to build TCG tests. If we can link them, that should be OK.
> 
>> As an alternative, TobiX at Github made an R5900 Docker image last year
>> <https://github.com/frno7/linux/issues/33#issuecomment-632284209>,
>> perhaps it could be useful somehow?
> 
> Thanks, I'll have a look.
> 
> Regards,
> 
> Phil.
> 


