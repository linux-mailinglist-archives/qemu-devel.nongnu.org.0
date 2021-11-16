Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E7F453260
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 13:46:49 +0100 (CET)
Received: from localhost ([::1]:46324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmxrM-00010N-Ks
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 07:46:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmxo1-0007f6-Gn
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:43:21 -0500
Received: from [2a00:1450:4864:20::32b] (port=51717
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmxnz-0002nM-VL
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:43:21 -0500
Received: by mail-wm1-x32b.google.com with SMTP id z200so16820090wmc.1
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 04:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yEX741W0+YVawkmoKpCoFIOegCWWHpQdIyKSI6m2/iU=;
 b=oni7iWz3QR46n4qrlh4FeqZ/lpKZpO1RPprpU94QsX80qwUAf3qumYXZRSO6CoiM4o
 HAtgCNRxDwsjMPlZGwemZeSRP2FHqWtWV2izblTSCWeVDwd5ZwTE0UOkyzOmVtv1KwO0
 N49/yvKxN3z09upuF7fJEcMGfIMIfbfWBcXhPIqmLoUKm4ychFhpTUKr6yMSNT6/EHUW
 Sr/NMsKQPFBJZN7cEcfdGXPTMRY+OHXD5AIRlbevA6b21NR8ncTryi4qg/Wdv0G29eRY
 mAAztU6q+sFYoCpJthIVc+1kWYVE+KElkR45/Zu2XQpnRt2PQXvzj16BeW30VdCaSfIT
 AKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yEX741W0+YVawkmoKpCoFIOegCWWHpQdIyKSI6m2/iU=;
 b=7q9mxuMXgXMjjpPaBscD6jzG5DnWBbC/Gze4IqCpV3AfxsV8TcDEZqaAw6fcZ0c533
 reB8AkFuEEIpmDD1NuAm58rI+O/4Ob6C9vG2N7QJEoKWn5Pn1Kx+x3aUe775QuFFq24X
 CLgCv0nDnbqcX98nl1KmuI+dBQQfC0KcJ9zeCrNYfxNJ2peSXuGLZBnkwSMLN7mAaoAc
 L7wM40eqWkzCw0rG1470bOnSWzSKRLGFolewSKYW0ZR+E36ZwSA9HsPobVLD3ZFkSHWS
 HmJK+gIHhJ97/ZwcMPqhhAS2WuSpTHhArq4x64yIRSWh/2yq+l78sBuRr1LrW0ArQPO2
 NN3A==
X-Gm-Message-State: AOAM533vsiag9idwBBtbqfrHQttUTWDY6esmSmQLa8x3H/x9XdrBulLl
 j3tDghO4wFxbPjfty/QhBpg=
X-Google-Smtp-Source: ABdhPJyocl0Oow5pC+hezjf5SZ2OHmglYu5IdizbMCeFtrSuYRA43LILiKEnKiiOxgNYfgdxkOdCVw==
X-Received: by 2002:a7b:c8d5:: with SMTP id f21mr70251299wml.146.1637066596579; 
 Tue, 16 Nov 2021 04:43:16 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id y12sm17135889wrn.73.2021.11.16.04.43.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 04:43:16 -0800 (PST)
Message-ID: <8238c593-b874-3a68-6c78-71e51c6966e7@amsat.org>
Date: Tue, 16 Nov 2021 13:43:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 1/6] tests/docker: force NOUSER=1 for base images
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211115142915.3797652-1-alex.bennee@linaro.org>
 <20211115142915.3797652-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211115142915.3797652-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.446,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/21 15:29, Alex Bennée wrote:
> As base images are often used to build further images like toolchains
> ensure we don't add the local user by accident. The local user should
> only exist on local images and not anything that gets pushed up to the
> public registry.
> 
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20211103171339.721910-1-alex.bennee@linaro.org>
> ---
>  tests/docker/Makefile.include | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

