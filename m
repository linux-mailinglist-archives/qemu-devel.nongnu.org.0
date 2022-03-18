Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDB84DDB70
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 15:19:48 +0100 (CET)
Received: from localhost ([::1]:44960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVDSF-0008QC-JJ
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 10:19:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVDJ9-0003Zt-Bb; Fri, 18 Mar 2022 10:10:25 -0400
Received: from [2607:f8b0:4864:20::530] (port=44914
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVDJ4-0001e0-49; Fri, 18 Mar 2022 10:10:22 -0400
Received: by mail-pg1-x530.google.com with SMTP id c11so5148308pgu.11;
 Fri, 18 Mar 2022 07:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+UHtT7RZRz40ub4V7ChbjlGTEDzYhWpzavpEeq20t34=;
 b=jvnjexbGsWElCmRV5s9wXAJ8UlpMJiAKzO7iU9i+SwRrCmOuQEokB5hGejEJFzhw3G
 qk1pTU4sQ/uWIXIxDej8xWGQhyBhaWjlpVGZdeTI0qKNFEUJLKG15WSk6gpG/dK/d4iv
 +64i0fFtEa7cNWY7dnINP0jlMXIC2en00jIHSg1UtH+87CvWa0fEnTXywu9h6GQxMLxj
 qJ5uiZGr2qx03Yph9yh8FMzYrvIKsrmpxWoHhfn9k369bSDAEOqMtqzW7bPPhTZCJfjN
 RLeMT9izD/zVrH0fPR5NtxeJapKFjPfZcBo2anh6Xi3C9vRSRemF1mEtB1CqXLj6VXN2
 6DhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+UHtT7RZRz40ub4V7ChbjlGTEDzYhWpzavpEeq20t34=;
 b=XvM/mJmc78iiKd4OYRfgBn36gq/OZwfePgYCp+AomwTYlPYWcJaH0bdUUvJKnibrWD
 oS2AZI25jfpvQi2/al4eiFiKltDisxHzo0KZZVVcw958PF6x3aRE7V+f6UQb1qC0yX7j
 LRADVBKrP3V1g3tYT6GDHPbEr4CRFBu+ScSyvml7MQ7Y8ZT9UrJoqNViyQqgE+54tGLV
 wVL3BPUuiECjVs9IJond7yFQh4ZvFsWtnTPy6PHyb81LfOVCTUht+esw5TDo/ApjhaIB
 1OqKYH6fZaZ0k3JpkkXM41/BQj2AeicJfUg5WVcpTLSLMCDrL4uO5QiK9ZkgrrJwCxho
 wSHA==
X-Gm-Message-State: AOAM5322crvjz31L/nCXO2Cg0pY3aukErDhq4Nw1INfbSix2a/wIXoSV
 CzsjJ0lEqz2SQaPx5mf2pYQUZP+rhZE=
X-Google-Smtp-Source: ABdhPJx6WG8WozE7CbxMpmGvceZK+BwQWlTblTcIIDUme9fx0O3XQxKbJdq7TBrlD9cmWCzyE+98xQ==
X-Received: by 2002:a65:6d8b:0:b0:376:bfb9:1f3b with SMTP id
 bc11-20020a656d8b000000b00376bfb91f3bmr7985900pgb.427.1647612615617; 
 Fri, 18 Mar 2022 07:10:15 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 67-20020a630846000000b00372782a65d0sm8163012pgi.60.2022.03.18.07.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 07:10:15 -0700 (PDT)
Message-ID: <62dbdfcf-771e-7c84-ab8b-b02a61112f86@gmail.com>
Date: Fri, 18 Mar 2022 15:10:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] gitattributes: Cover Objective-C source files
Content-Language: en-US
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20220317130326.39188-1-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220317130326.39188-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+qemu-trivial@

On 17/3/22 14:03, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> See comments in commit 29cf16db23 ("buildsys: Help git-diff
> adding .gitattributes config file") for details.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   .gitattributes | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/.gitattributes b/.gitattributes
> index 07f430e944..a217cb7bfe 100644
> --- a/.gitattributes
> +++ b/.gitattributes
> @@ -1,3 +1,4 @@
>   *.c.inc         diff=c
>   *.h.inc         diff=c
> +*.m             diff=objc
>   *.py            diff=python


