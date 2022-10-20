Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5BC606650
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 18:54:31 +0200 (CEST)
Received: from localhost ([::1]:52344 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYo0-0004uE-4H
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:54:04 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYnu-0005r8-R9
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olXwG-0001TV-TX
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:58:34 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olXwD-00073Z-Ub
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:58:32 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 r8-20020a1c4408000000b003c47d5fd475so2717123wma.3
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 08:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ylWCfcWJcpzDmFO7yGuWXMU3WKB5IKdt2yl1GqWr44g=;
 b=Q75rfmRtG4QTg+oMSdO9Gyja83ygUqD2AHt/Cb+7+a50i6jmShraJBh9nc19YScd6J
 FIe0BNB2x7Xtm1ZEUPCwd1UP0UFaNtd2TsQLOOAqvbYGB3n6S2KoPCfIoeUklmtIaq0T
 ugIeZ2nlPDrdMyWyZ8a9nT3wgm6Sii4NIeQlEM9AP2OeBNUeel1Rx5+qfQmwG3IJczq9
 W4IQvKhihzRDob3UKqLna1DTGggFPjsRZ/o8ZGvZwvi3JTt9iP6t/HvpQfm8r8qzS3vZ
 0/ocXf3r5cEDx3KdwDxvdWYSH1OMVNvy85hYTpk5uEpT7+1PVckdQjOjwIEuc8zQ+rBj
 FYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ylWCfcWJcpzDmFO7yGuWXMU3WKB5IKdt2yl1GqWr44g=;
 b=PbBzUB8RUORE/eKxw32BpAumKaLHBmte5vshnzrsgzinmjB8bUVFAgut+mU/nxsiMb
 RXQas/r65l2ReC9Q5TOMHr4QO/dbmGRdHivigA+vETvX26eZXqBjyKEAR20d+sr2e4Rq
 rvX9bXxq1i3eX8UIaid7vrXKpUeN6RAt/QBrhr7Z/hxsRjQHrD054dyfwm5bDCqaGuR1
 0HlXZMLRSpk4nOTq61wAPNpuns9xdNSeaOr92le1CbQOZENAbh0XYuvjjLseN5TcH5ou
 PemgJeGZd+txxcMEJbOVLt4S00CFWY6Us/j4OqhxtCMEbNpNgzyDGz2HOljvmntY+FSu
 xncw==
X-Gm-Message-State: ACrzQf3w+OkrSRK4Lw1K3rOGqdqI3f7Yft4/tYbvT8RCt6XKczBdDgNh
 h+jG26IyufC/7Fu45wHsbXqVSA==
X-Google-Smtp-Source: AMsMyM4jbF9rBCNBcCPQYLpbPhSmsIQG32X82NlCQ9gwYs2o5/j4g+jOimxrIuReWxrU/eHnEci8HQ==
X-Received: by 2002:a05:600c:1549:b0:3b4:8fd7:af4 with SMTP id
 f9-20020a05600c154900b003b48fd70af4mr9622763wmg.100.1666281508392; 
 Thu, 20 Oct 2022 08:58:28 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a05600c19c900b003a3442f1229sm198609wmq.29.2022.10.20.08.58.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 08:58:27 -0700 (PDT)
Message-ID: <9a971ceb-4164-a0e7-3984-68cfc805ad8a@linaro.org>
Date: Thu, 20 Oct 2022 17:58:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 11/26] util/qemu-sockets: Use g_get_tmp_dir() to get
 the directory for temporary files
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-12-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020115209.1761864-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/22 13:51, Alex Bennée wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Replace the existing logic to get the directory for temporary files
> with g_get_tmp_dir(), which works for win32 too.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20221006151927.2079583-4-bmeng.cn@gmail.com>
> ---
>   util/qemu-sockets.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 83f4bd6fd2..0c41ca9e42 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -919,9 +919,8 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
>       if (saddr->path[0] || abstract) {
>           path = saddr->path;
>       } else {
> -        const char *tmpdir = getenv("TMPDIR");
> -        tmpdir = tmpdir ? tmpdir : "/tmp";
> -        path = pathbuf = g_strdup_printf("%s/qemu-socket-XXXXXX", tmpdir);
> +        path = pathbuf = g_strdup_printf("%s/qemu-socket-XXXXXX",
> +                                         g_get_tmp_dir());

IIUC this code is not reachable on win32; anyhow using g_get_tmp_dir()
is a good cleanup for the codebase.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


