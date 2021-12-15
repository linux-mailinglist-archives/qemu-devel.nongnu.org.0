Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F0B475A99
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 15:21:42 +0100 (CET)
Received: from localhost ([::1]:49900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxVA5-0002lY-87
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 09:21:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxV1d-0005Zo-1x
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:12:57 -0500
Received: from [2a00:1450:4864:20::434] (port=37429
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxV1a-0008QJ-BP
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:12:56 -0500
Received: by mail-wr1-x434.google.com with SMTP id t26so2132969wrb.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 06:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mWeSBg9QxU4Ow+a4rElZmeqPRfkyiKLc2vQ1bz0eixI=;
 b=G8UZ3RMyyOc7wgMB1Rxy8zjO240AiHC51ZGs2Xv7ofnYEGuwJEYaqmQ1XBqJRsoWhp
 n0x6jsDEL1XjV2xWKaRQPI6CErCw6jFyDciuHfF4KlESavVktEc7slK0jI3m3DMbY6eW
 4heVaHiDvhj/eiK4iq0hoDrQYfthbTqHSvqfe4JyN51F0QzpOzS/XRajz9i8WpPZd2du
 ZzotEMSJEg7tCKuGpKAAz90E8yeHA2pPvUMzxTCIrse2g9G8ZlzAE8pUBeOzV+DAQB4q
 kcX1Vf3IH7g5duRQVJwOGaYRPei7v9uJq/ZUuWKePCkgv+BZblqyENdtNtJxWjs345ze
 TcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mWeSBg9QxU4Ow+a4rElZmeqPRfkyiKLc2vQ1bz0eixI=;
 b=jnL88vxl1i6V1Dk/zBmUwzgkUn/4PRCONa19cdJt4IVJK4BXj70c4VlJ8o70/CPv9Y
 Q5cIaCNnr11OULpeFtU3Syu5T/rFBp6SNkBnx0NTv4jbOb6IHRCuMgRGELvpDlVLw4zR
 yNWrLPnJ0aa5v3zvuO+KaIOO/QWF64ByR5F2OF1rdMx5qB3s3Kspb8ECnhFzlNXodA/s
 ZJoSIXuTA5A8Jk6yS/ksd3y4KCrez2UY4kCE21R94TJyxx0CuUnL+Pv9LKjJEBcgRpk9
 DjsmlXBRKYYPs7384/o0ThUXFJovYrlqg502ZKZ4AHBx0r/IpDrZQA9dhPjSK39TNNdC
 AaWQ==
X-Gm-Message-State: AOAM532DH8OOmgwQrgIwWdPTmm5CX3CA3fcVIniW5xVse3h4LC9QPylr
 aq1tuJH1H4Leh9Vi5NwwM4k=
X-Google-Smtp-Source: ABdhPJzgO0oOxG5n836RVaY/w1RWKu44oubvQKMTdGkimAkaOjKYABUsvunDcdtPynKRGCl3KFdu7A==
X-Received: by 2002:adf:e949:: with SMTP id m9mr4561445wrn.145.1639577572935; 
 Wed, 15 Dec 2021 06:12:52 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id g5sm3117395wri.45.2021.12.15.06.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 06:12:52 -0800 (PST)
Message-ID: <cb684dac-95e5-693e-0d59-d6b511387e1b@amsat.org>
Date: Wed, 15 Dec 2021 15:12:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3] monitor: move x-query-profile into accel/tcg to fix
 build
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211215140454.1725364-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211215140454.1725364-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/21 15:04, Alex Bennée wrote:
> As --enable-profiler isn't defended in CI we missed this breakage.
> Move the qmp handler into accel/tcg so we have access to the helpers
> we need. While we are at it ensure we gate the feature on CONFIG_TCG.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: 37087fde0e ("qapi: introduce x-query-profile QMP command")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/773
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20211214195048.1438209-1-alex.bennee@linaro.org>
> 
> ---
> v3
>   - also add #ifdef CONFIG_TCG to hmp-commands-info.hx
> ---
>  qapi/machine.json    |  1 +
>  accel/tcg/cpu-exec.c | 31 +++++++++++++++++++++++++++++++
>  monitor/qmp-cmds.c   | 31 -------------------------------
>  hmp-commands-info.hx |  2 ++
>  4 files changed, 34 insertions(+), 31 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


