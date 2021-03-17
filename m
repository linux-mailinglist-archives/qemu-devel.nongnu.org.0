Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D6F33F013
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 13:17:47 +0100 (CET)
Received: from localhost ([::1]:46510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMV7R-0002DY-4q
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 08:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMV4c-0001QQ-Ar
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:14:50 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMV4a-0006ba-Mq
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:14:50 -0400
Received: by mail-wr1-x434.google.com with SMTP id x16so1589370wrn.4
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 05:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JDFLtTI8bPD6/+tQ8AfPnAcBAtgKfCclnMD6i1ELNnc=;
 b=tOASovp9NOQmtzPi8fNzrspLvwjWpadvkLDHmI4VC5/4fmKxDCtdDsuMTTs05PqGzb
 XXCxph74T29BiNHFSgrvVzjsL/Najv+soYuAz2vpekGn1bWiEp4R7PWujD4Q09ow47AM
 vNKUyErt4x9xTqSSMNs0q0qIMSvVHCekE+3IJYgZVnjRWDFrFLNQJdbX342phYCfBTtC
 iYdX7RbRPcOYD95yYcA4pMSFOMJzcfk7AAWgVOAB7HceVWh68sdjhtvGYtSwk5aetUTV
 Zvj3Zdtrz7HLC6P1SQ0gJb+o2IZKbBu4mLiBORIHP3BEwoT3xNPRz7nMgN1ldRSBmr3x
 X1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JDFLtTI8bPD6/+tQ8AfPnAcBAtgKfCclnMD6i1ELNnc=;
 b=XuF0pxlIjzi3rrk1CoBARVc1oncim6XvqJKHnqVn2YjM9HXb7STsevBFQAQPxj1pBc
 CONyQ3wxE3fvVcHI5WeVZ0Cegxmp8fG2FTeVNK63rqxkmTwKJ/5lkyj/pAiD3pS25XXq
 XqjaDF28f20W1OOGV0HgVMPQSCh+47wNCO02hiPFXwxEMb3ouc6tXC9x39j+79G8e6Wv
 SRfwpYXQGPuL1kjWVXJa4uDw4RXF1xfqGdFC2aOfhBlxLQJJ4qz6uz8a8B7XXEySDhWs
 TCiwnv5Vl07dmLtI+fB9S8IJmozflb3kv/E52uQP5xX3mZxcIF/qeVFwQnPWdw0CxwQA
 jVhA==
X-Gm-Message-State: AOAM531OVt9EF+jaB5aUN/iwIUd1BgwLVI4vP0ha7OJr7K06kbE2kfDs
 uZN038g7NDuLkTMUU1kbDUY=
X-Google-Smtp-Source: ABdhPJx0RUe1I8sBe45Ff6+oSw7BUYGsU6mgBQ9ocFEwu/aip7nIl1JZ0W2mJRDlfyXG8P6OfmGbAg==
X-Received: by 2002:a05:6000:245:: with SMTP id
 m5mr4221420wrz.284.1615983287207; 
 Wed, 17 Mar 2021 05:14:47 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u2sm2984055wmm.5.2021.03.17.05.14.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 05:14:46 -0700 (PDT)
Subject: Re: [PATCH v2] target/mips: Deprecate Trap-and-Emul KVM support
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210317011235.7425-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4594b1c4-144d-856e-3966-f8854709b6d7@amsat.org>
Date: Wed, 17 Mar 2021 13:14:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317011235.7425-1-jiaxun.yang@flygoat.com>
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
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 2:12 AM, Jiaxun Yang wrote:
> Upstream kernel had removed both host[1] and guest[2] support.
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=45c7e8af4a5e3f0bea4ac209eea34118dd57ac64
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=a1515ec7204edca770c07929df8538fcdb03ad46
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v2: Fix up tittle and sphinx format (f4bug)
> Lost in the sea of emails :-)
> ---
>  docs/system/deprecated.rst | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

