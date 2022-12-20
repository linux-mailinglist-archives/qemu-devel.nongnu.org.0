Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0CB65288A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 22:49:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7kTH-0000zX-V8; Tue, 20 Dec 2022 16:48:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7kTF-0000zI-4o
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 16:48:21 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7kTD-0003Tx-Et
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 16:48:20 -0500
Received: by mail-ej1-x62c.google.com with SMTP id gh17so32481615ejb.6
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 13:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0+iqOIblPxwVB9sNs4mkCQdy5lAqhEn2eD9X4zNWwpg=;
 b=mjDdssgIznrTeqPnxf6V4KIKsjNk+hiWWoqlbga0pmekl1y3QDMB61PZFc+quWV2oD
 xYgdroC86ImGPpse77igtuuU1zVIlqYPyfe6Pc29vSnYS5gZnjUEky2bz7BTlyHaRetQ
 ni2t1nag8GrVjh3fESmvfITfNuQPATW5RmFeF8/oJsOjXbaPRsq/4iDqD/28eTcx+/cy
 b3nMqkmMtD2iaGDF9PQ2whzSJu1mvUzfb/cpx9RQN935p4lP1/RNdUsk+ACIlWN5Us/L
 2CSoDH8sY7MGh6/AMO7ATAD6uZzwYvwzMoP7G3NVK1TEwU0rOJ6tjmWRHee2Cr6EBrwt
 ySDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0+iqOIblPxwVB9sNs4mkCQdy5lAqhEn2eD9X4zNWwpg=;
 b=OhVFD9+4uUOK5ut/xEEn+38yjRoWO5V7lUomrHrreqPXB+AtqUdBrWypEcJgEDdBzZ
 KSXH4a23oGtrRr3JjTA7LrgfM/SD71amG02JtwWRPGsDtJ9HVsQONFhyRMqKDYnLxNGX
 05rBV1WxHcj5221Fd84hVAqjGOgDGZ/OFVhWgZV/V2jL33w6qXrqjd0lI4s1RrcIS7NR
 g1rbkWasRikfyd1iR6G/Gb8hN3nlGAHpAUhhIv35J94gIhK5wKkegxNsH0vdb1xyIzVr
 ag9Mdf0lpzNz51voP0npBu1wvOZ0RS7N7DeruL3huJVYH0t0LKpEIRMxpzMqUEazWkkK
 o4Zw==
X-Gm-Message-State: AFqh2krNJ1/bM3nm6908qNTVpW0/LbGFm0Br7EO5gaGYqrDeCy4WC+Bk
 3s226R855vaDMb8IiTxOTV3qYw==
X-Google-Smtp-Source: AMrXdXs66/rO7ms8tki3d8asWaNFG+3jKJItet5q/TurqnpBKEseeH3lzlTcqF1ETVstg788s8Ii/A==
X-Received: by 2002:a17:907:8d7:b0:83c:7308:b2ed with SMTP id
 zu23-20020a17090708d700b0083c7308b2edmr301843ejb.17.1671572897156; 
 Tue, 20 Dec 2022 13:48:17 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 lb15-20020a170907784f00b007c0f217aadbsm6147342ejc.24.2022.12.20.13.48.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 13:48:16 -0800 (PST)
Message-ID: <a50d0983-b81e-9206-3e66-2d2cd3016990@linaro.org>
Date: Tue, 20 Dec 2022 22:48:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2 02/10] libvhost-user: Replace typeof with __typeof__
Content-Language: en-US
To: Marcel Holtmann <marcel@holtmann.org>, qemu-devel@nongnu.org,
 mst@redhat.com, xieyongji@bytedance.com
References: <cover.1671563795.git.marcel@holtmann.org>
 <02a920e8501b0f63e799b8dd4f22528efe73f544.1671563795.git.marcel@holtmann.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <02a920e8501b0f63e799b8dd4f22528efe73f544.1671563795.git.marcel@holtmann.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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
> Strictly speaking only -std=gnu99 support the usage of typeof and for
> easier inclusion in external projects, it is better to use __typeof__.
> 
>    CC       libvhost-user.o
> libvhost-user.c: In function ‘vu_log_queue_fill’:
> libvhost-user.c:86:13: error: implicit declaration of function ‘typeof’ [-Werror=implicit-function-declaration]
>     86 |             typeof(x) _min1 = (x);              \
>        |             ^~~~~~
> 
> Changing these two users of typeof makes the compiler happy and no extra
> flags or pragmas need to be provided.
> 
> Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
> ---
>   subprojects/libvhost-user/libvhost-user.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


