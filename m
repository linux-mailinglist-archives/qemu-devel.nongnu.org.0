Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 501D3410CCF
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 20:10:55 +0200 (CEST)
Received: from localhost ([::1]:54376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS1HC-00081T-AD
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 14:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1E0-0003rB-RR
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:07:37 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1Dz-0001za-HY
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:07:36 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d6so24491684wrc.11
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LaoO92JAbaOuI4vNI92whDnNrdyiPpfhm9y4K7pTJjY=;
 b=FnGoMvnzLjHT+7+gAAu2mmdwEWLONzg6vBn9Idq5Hw7WCi7Xy8N2oMn3aykT6SMS0B
 prM+XMveJ9nMOVG+4prUJyE5ofQx02yZY3v5piM4QaTm+xtb7KGCoT84EzOdw4UD9qDt
 1YtpvrfW89/YtHEVs1xCWthvBskj3XEvMo+Cp2sN/Jzj5s/ExL4uV971fgkobm2JdszD
 d/sDohKSKKBmluu3FmCM6WsES5UB7reJNVpN0cnadbg8M2QwesBEWKmo1aToelEQqgzZ
 T1fTe4UBiEv5RjPIsKz7yQxPYnUd8M8DqNjK5MrdJvlDdpdtxJDdfZNcrZaavISZaMDu
 2+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LaoO92JAbaOuI4vNI92whDnNrdyiPpfhm9y4K7pTJjY=;
 b=1Eu/ZBjlHNMQQXfQ+cgS+HaoDJCI534qL8EUoVcRus7YYyHwRvXPZiEvFfS85jnF/F
 kYWlgpjAM/OsYSHMyYBK+bGFuDZ4oxP3a39h1yQe2Bjcshui84DFAztZqc0bjku7f5r/
 CUjVwcv1y0VQA1+gWnbXD3aRk7AVIQr6niL4H6671bEoeKn14GfuekMA++YiB2tQfHs4
 TO7BphJ6cMe8OctAgqdXd2Z3QR0WUSZr+JZZdtF22cIltcl8hcYxUCqu1WWTk1lIZRuF
 Bu8eW3O2BOLQxntGURhOaGV/zOZQ5gtlZseCNikm+Obk4XEYxyZ+x72VKYQRtN5hPdby
 Qr/A==
X-Gm-Message-State: AOAM532x3VnQyY3Zco6QGg/2Xosvz6N7rlwz12NL5nOL2VRxF13lXhbn
 I7NCvaCEaAbYh/6YIBEX9RZdvjdEOKo=
X-Google-Smtp-Source: ABdhPJxFYLZgxU4kqaKdylw+PJDZP9i3Q45HVNUMlfY6jxGefQj5hO0oJZOLElx0Z/r8m4hpfoBweg==
X-Received: by 2002:adf:c7d1:: with SMTP id y17mr23623634wrg.214.1632074854322; 
 Sun, 19 Sep 2021 11:07:34 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id l19sm13537728wrc.16.2021.09.19.11.07.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 11:07:33 -0700 (PDT)
Message-ID: <35182efc-dd46-7225-fa57-385887251405@amsat.org>
Date: Sun, 19 Sep 2021 20:07:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 13/41] linux-user/host/s390: Populate host_signal.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210918184527.408540-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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

On 9/18/21 20:44, Richard Henderson wrote:
> Split host_signal_pc and host_signal_write out of user-exec.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/host/s390/host-signal.h  | 93 ++++++++++++++++++++++++++++-
>  linux-user/host/s390x/host-signal.h |  2 +-
>  accel/tcg/user-exec.c               | 88 +--------------------------
>  3 files changed, 94 insertions(+), 89 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

