Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FE1590936
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 01:36:13 +0200 (CEST)
Received: from localhost ([::1]:54694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMHim-0001To-Q7
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 19:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oMHhM-0008SH-8x
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 19:34:44 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:43897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oMHhK-0004gI-R3
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 19:34:43 -0400
Received: by mail-pg1-x529.google.com with SMTP id h132so18397372pgc.10
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 16:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=K7iz4G/GeF5tLFNDrkTgvZRn18qFE6Er1TP+g5d7D48=;
 b=QZzEp+k1ciCK4zscCAA92a3IHsuKzpQBrkYBNTj61k983F8vig+FOcI7CW8hXX4P/K
 /lWyYxOM06n1mim/n11v5x8ZPhD2SFM8qJ+HRAjt4/kxtglJJC71kM23BzQeCSsxLFHc
 YF2BQ2KmYc/2n45L+lr2ZQV8bzLcUSMNS9mgR8eYfs5Vl9rjehDWE9g8Kh9Rn2TgOuT0
 CdRpbaalOYB1dJMWo5hVb1nYL9B5+jSrIK5Z/oyANxkxBafq8Wjmmf7ZPsPMDrSjIHni
 0UX75cAQpaKzFov7x1+rRtQX/41dIxmAdw2oLpHPQa1fxDguzpddyIt64gHzuB/p24sw
 EFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=K7iz4G/GeF5tLFNDrkTgvZRn18qFE6Er1TP+g5d7D48=;
 b=EKwcDshNIcxZAi6+rY2RFKwLqwKnigWMtFADdHeqcusqsCi2PQmhT85AtzsK8V/jC/
 jmHVLJieq5jyE1IouEiFrn5C/OZvFfZRMhLb2fgt0bH76CGrXMLXgJItlHBSR9Qxb9Rv
 qFaGaYLMZsow2TCwXhQHsEmw19Ahv6LdyEDcsaHkmD7ZPY9noW9SD0JWZRL5j+RY2tIS
 yICq3Vo/nDbwc+2GLxDxOVWDQx6v6ocJyny/IcTboGuDfZ5QvN8Ktxc/EvMZwirgXM2V
 ovL8/n/oWZrtZntLnxEoQvZXbTTXNrKJbgVrIyWQvnUCYpUXKw+FGk/M2laGdfpZVocB
 ii4A==
X-Gm-Message-State: ACgBeo3/zN8NenGZTrJmj0HHw43Pwbk+kdwt9gpwNvkFTqfQiZgFbSI6
 HrqwC/kLni7A+ocyLCA5E7Q=
X-Google-Smtp-Source: AA6agR4wM8YYQs5W+iV/nV4A382J0T4Dzmqh6XXLSwcJhuowDo7Rgh3FpYUpd1TLSr+IF07CjBG7Rg==
X-Received: by 2002:a63:210f:0:b0:41c:650c:aea4 with SMTP id
 h15-20020a63210f000000b0041c650caea4mr994963pgh.267.1660260881204; 
 Thu, 11 Aug 2022 16:34:41 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ix15-20020a170902f80f00b00171311470eesm244385plb.8.2022.08.11.16.34.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 16:34:40 -0700 (PDT)
Message-ID: <a2c919f2-514e-834b-3271-2d7a46aeb4ac@amsat.org>
Date: Fri, 12 Aug 2022 01:34:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: Missing dll
Content-Language: en-US
To: Peter Butler <peter-butler@comcast.net>, qemu-devel@nongnu.org
References: <Mailbird-b8b59964-b286-46fb-a5ce-ad43ad8c76d0@comcast.net>
Cc: Stefan Weil <sw@weilnetz.de>, Yonggang Luo <luoyonggang@gmail.com>
In-Reply-To: <Mailbird-b8b59964-b286-46fb-a5ce-ad43ad8c76d0@comcast.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x529.google.com
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

Cc'ing qemu-windows@ team

On 10/8/22 23:42, Peter Butler wrote:
> In x64 win10 I today I d/l QEMU into new directory. Then navigated to 
> that dir and…
> 
> qemu-system-aarch64 -boot d -cdrom 
> f:\Downloads\debian-11.4.0-arm64-netinst.iso -m 2048
> 
> Error message:…libncursesw6.dll not found…
> 
> Please help
> Thank you
> 


