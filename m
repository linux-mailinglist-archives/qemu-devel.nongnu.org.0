Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0480C4AB139
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 19:30:02 +0100 (CET)
Received: from localhost ([::1]:36554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGmIS-0006Tu-IL
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 13:30:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGmHC-0005od-3G
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 13:28:42 -0500
Received: from [2a00:1450:4864:20::42b] (port=42995
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGmH9-00054d-Pg
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 13:28:41 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h6so2411567wrb.9
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 10:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HnHeUXNsazICCGUky4a/m0/OU+CHFO4VS4a/MwC4bLg=;
 b=Wg1oS6I09m3FD/R6EX+qJ5k5dnUR1iH4VR26oOgvJFRC+EQwHhNc3gY+QnYf1O5C5K
 I74t69X6VnP1JJ+OSxJKQDB/bSBfty9B81vIFOCFsRRLuzSLgLgDIOlcSuTZ3noWwHRV
 gD0WASsE9XmlKX+xiKTFw9vYz1euPM+TB12trcKSrppUP3LwyDhYz9IZlLcEsqkZqKxC
 9fUzyqeg6CMhftoHLi+VA+2P5+3y06+O44J/6lKqAx5FYio1ZwfCBVCnJf47O0OEXqwx
 G2JA8O2vvtXKwpVOxG3Zi+MvCDRnsu58QTOY7CWkvfca5OdRKWBQiHKhgIcm36LCLPxL
 H/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HnHeUXNsazICCGUky4a/m0/OU+CHFO4VS4a/MwC4bLg=;
 b=B4HceGdGn4Mlmm9dyvSaT2r5b4C9G4EeTg0eBL9L3M3DY2JIm2jSTYBtiS7nimEg1e
 mTNCLl6CGJSwwIRAiWcPl0XrmQQoIUtlRtWpdbuUslugnPecba2ZYFhj03jzZMJ9tjmJ
 a7CUDcQ4iAVu6OVfYvwq2MI8W+ngUO5j1tPJ9Z4tlDfDMybx9jadFPQ3R5Wo0jeuyR4a
 3bA2m1v0uH2cq/uFjTCFYIzOtfY+MA57Mf8D+1UFBSSmSm+5qwkLQuZqQxT45TpANHZu
 2l1nJ69L8pA5ASsRb9phKRtFKkOgRWQlXN5iq4GcB7zhQNwmoCfDF52UXBdp3k3wQO+O
 Cg+Q==
X-Gm-Message-State: AOAM531piOG6nUbcxiXbJ4fjqyLSdX2a4iUt8KdOw9Rglf7nSn3sckyy
 7u087+CCsdQq8N8Kt7xVvQ4=
X-Google-Smtp-Source: ABdhPJzFPLwkgRlOFsuz6xb0If5lisbC+W56fFEOi9+DQFYU+WTKspJuyLC+7zsj+PaeHwiKXRxf2w==
X-Received: by 2002:adf:d841:: with SMTP id k1mr7066750wrl.29.1644172117528;
 Sun, 06 Feb 2022 10:28:37 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id z10sm2356506wmi.31.2022.02.06.10.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 10:28:36 -0800 (PST)
Message-ID: <cb82bed1-4baa-8bb3-747d-78affbd8769a@amsat.org>
Date: Sun, 6 Feb 2022 19:28:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] erst: drop cast to long long
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Eric DeVolder <eric.devolder@oracle.com>
References: <20220206093547.1282513-1-mst@redhat.com>
In-Reply-To: <20220206093547.1282513-1-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 6/2/22 10:35, Michael S. Tsirkin wrote:
> The way to print uint64_t is with PRIx64, not with
> a cast to long long.
> 
> Cc: Eric DeVolder <eric.devolder@oracle.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   tests/qtest/erst-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


