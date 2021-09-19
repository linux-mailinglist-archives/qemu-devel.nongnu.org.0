Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C329410CD0
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 20:12:10 +0200 (CEST)
Received: from localhost ([::1]:57002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS1IP-0001YN-HR
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 14:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1FQ-0006xd-L5
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:09:06 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1FO-0002s3-Jh
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:09:03 -0400
Received: by mail-wr1-x42c.google.com with SMTP id w17so16401463wrv.10
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3f0NbC1+F9SOfs1hon5PCIvkndaZeHhYfFIue3Et/do=;
 b=VF3JkxZ4s0lWPNErxN9/p+fD6HVcsTeCCXEBUN4Xk54H6ml+4R166b3Fs03IIRFXhU
 w0TNXvRFmTs8mp/7KGpBtSBnTTOQ7Yc43HN7WKh0rfxZIvErpSzy06yQsh7JdRUUqFlp
 lA/E9UyEkUeG/kM1w+qv/XRauLm2vQn0Fa8NdoH74+Kjkyu8AkPDoVvmOqYqQHwBCgRZ
 ovC6IP+7AQUiab0ZhMC2SaWB0Ib8AqrDFAZUVX9UpPDGp0l9OLLrVkElmDCJrPV5g8wR
 Hk+QcIkzhcI/k2eYa6JSyYW5nE6jjn60g5X2GoM0v7BR1ySHOy5Xvh1uM8LRK3JPhOhE
 WgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3f0NbC1+F9SOfs1hon5PCIvkndaZeHhYfFIue3Et/do=;
 b=g75YlbY/8Xq7uqpKlsfT2hZuIxjOnW+s1Z2oZExlL9kEvyHtSbVw7h+TxCjuVpyQAB
 qMk64IspVt1Ot59YGTy5KnUf3fsk/llN89bnBXL9H70xUqbIc2uCbTqrCyHXDURinf5J
 zbd1Ur5QZbyrIiKM3l0wf1CdHkt92CvODOh1TMTKrGm3UtTt9Dq5JYEZjRekRWOvYOgC
 m+ZG/kJDndgGVBaRkBjAD1GsWDGMp+WF5kLFKEVkeovr0Rsg1VMsOpz8faDkfXBNASz6
 Ijj/vmJWeUopBbQeZYns8iGcz9HxZDibHc5zoLHTsCWuFy5CIbwSwCCCB9XEchngLTOc
 RmTQ==
X-Gm-Message-State: AOAM533hg/BGBStd6C5N85lfCPv8bcLYu7I5KbZB0K+ouNsE41X/m3Vs
 nwWSl4yGCQ0ugP5s4VdCjyiTLNE+2TM=
X-Google-Smtp-Source: ABdhPJwPAyBd8XkYqaSK3r7zHyx+kH7o4lruFxd+4hKcIeiiHg8dWi2weBtkpuFBUWeH/G5BeYq4FQ==
X-Received: by 2002:adf:fe0e:: with SMTP id n14mr24181096wrr.236.1632074941072; 
 Sun, 19 Sep 2021 11:09:01 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id r27sm13466315wrr.70.2021.09.19.11.09.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 11:09:00 -0700 (PDT)
Message-ID: <a34e4fe1-4ee4-db3b-4d95-f83b191493c8@amsat.org>
Date: Sun, 19 Sep 2021 20:08:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 14/41] linux-user/host/mips: Populate host_signal.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210918184527.408540-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/18/21 20:45, Richard Henderson wrote:
> Split host_signal_pc and host_signal_write out of user-exec.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/host/mips/host-signal.h | 62 +++++++++++++++++++++++++++++-
>  accel/tcg/user-exec.c              | 52 +------------------------
>  2 files changed, 62 insertions(+), 52 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

