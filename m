Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66ED65288B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 22:49:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7kUI-0001Xx-Vg; Tue, 20 Dec 2022 16:49:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7kUG-0001X3-LE
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 16:49:24 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7kUE-0003Xq-WA
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 16:49:24 -0500
Received: by mail-ej1-x62d.google.com with SMTP id vv4so32522160ejc.2
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 13:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7hfOQHPZNog4jGxrXG6413KKkrf6l19cbyXIWhYc0JI=;
 b=wtpCEZwRUNmbtgLDc5Lrx+HmFimfcFLVin8PMkvDaUNYqLhRdMOFCZjrydUBFOjyx4
 P1/5qE7C7qf9xoVThkKIp9ImGVtY547LR3di4dBPd9xRtH/LVWLnfatGKkjZ9eG+v5Fs
 AdwZ9R8Y2eUXI0iQaUW6YKyE9pVh0wpE+U/UAnhPr0HSIquII9aHna+4N7D3Jbs1BxYb
 MgncBHud2GMMXm1YalpZgA81Is2EHCTygltZX2kIpZtIZlx3LYsw0rpR1kTJpBxinMHy
 Jj4k+Q87wZqMyoV/RV8iKumSIdrfpk6wNM8ibdujkgcU98WidspQSk1mFoyEGQfOkY12
 gKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7hfOQHPZNog4jGxrXG6413KKkrf6l19cbyXIWhYc0JI=;
 b=gFylKhNao5zX4GryU32eH6OZsagb9l2eKnZRaGIzBP5mKtTgZJVRu6Rx8GImNFaCp6
 qI2o1Ojnq3AsOEOo298RW34l0G5AnwGnkoILMH0/9ChU6t6TkDKWpfoK29nxjFn3xD2Q
 K1EQtxyokgkO5Lte0wBuJL7ftuCM+Kv/D4pe8n++hI7UhnuhfBFPwyU3EL/RVchQ+QpJ
 DC/kmeCMVObdROYED+bYjbB2tbYoADW+YDC58kIDXA9JQ6JHIu9ocOIRXGICbXrrzDsw
 Q1yc0WhOoQAOUSFa0dFYijJGspLAwaXAvp9uCV9i1H5e9R2ljL+moZiGF2CaxdGISeWy
 abyg==
X-Gm-Message-State: ANoB5pmRnLQksjwmWvRkrtJUZP+ZpLwgm6Y3D9wHAYEFhsfaGw9BOk+i
 LcslPp0SsuTSpLY1NdwsQxy4mg==
X-Google-Smtp-Source: AA0mqf7Yk4+Zz8zdpMN5g7XhAnGQzwaHA+7jZnaW9lfLnexGYVB/kxj1/UziUAEz3w7moRYyNnCfZw==
X-Received: by 2002:a17:906:d92:b0:7c0:fa2d:9af3 with SMTP id
 m18-20020a1709060d9200b007c0fa2d9af3mr37951078eji.45.1671572961461; 
 Tue, 20 Dec 2022 13:49:21 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o15-20020aa7c7cf000000b0046f77031d40sm6085684eds.10.2022.12.20.13.49.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 13:49:21 -0800 (PST)
Message-ID: <dcde2911-8986-a59c-7ac7-5c68d5a320fa@linaro.org>
Date: Tue, 20 Dec 2022 22:49:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2 05/10] libvhost-user: Declare uffdio_register early to
 make it C90 compliant
Content-Language: en-US
To: Marcel Holtmann <marcel@holtmann.org>, qemu-devel@nongnu.org,
 mst@redhat.com, xieyongji@bytedance.com
References: <cover.1671563795.git.marcel@holtmann.org>
 <13655a4dab546b6df5f2d2622f57c6063cf8b6b6.1671563795.git.marcel@holtmann.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <13655a4dab546b6df5f2d2622f57c6063cf8b6b6.1671563795.git.marcel@holtmann.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/12/22 20:27, Marcel Holtmann wrote:
> When using libvhost-user source in an external project that wants to
> comply with the C90 standard, it is best to declare variables before
> code.
> 
>    CC       libvhost-user.o
> libvhost-user.c: In function ‘generate_faults’:
> libvhost-user.c:683:9: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
>    683 |         struct uffdio_register reg_struct;
>        |         ^~~~~~
> 
> In this case, it is also simple enough and doesn't cause any extra
> ifdef additions.
> 
> Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
> ---
>   subprojects/libvhost-user/libvhost-user.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


