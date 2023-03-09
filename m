Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6946B2597
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 14:39:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paGU0-0001zU-0i; Thu, 09 Mar 2023 08:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paGTv-0001xZ-T6
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:38:56 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paGTu-0005XZ-B6
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:38:55 -0500
Received: by mail-wr1-x433.google.com with SMTP id q16so1910548wrw.2
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 05:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678369132;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eXuN6lscBrnnC4ny/4L9yghUqGupT83SU6WEdMl5QtY=;
 b=ETgxunHjpaqg5vr/TNpQYsv6w3zjeDLChINidwScLzflG4mnXltQ/Jb+btpXjLjBJx
 IupDXUe5HCGt2NlhumISJUfnrI6GmmJjC2ELcudH/MRB4IFAPBbRRT4+sDTHSz40kxT6
 37DSHBh1P50oC0iU7szUmUyGvm/3drbg9I6/9uZdhfitJV1af7JXPqZ94JfOQoACb5jE
 7Q4KDQE8yOHGksY0RTznj2q5H9rtnn8knhjBL4Fm068KCdcwdkLwvqfegoohYDtb1HEX
 0/x0jZufr/zzR2RmvxdawixntLOjfVyvlRzUt85uPOxj5g8LdCxSd1coHa2bzQlfMXzD
 VHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678369132;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eXuN6lscBrnnC4ny/4L9yghUqGupT83SU6WEdMl5QtY=;
 b=rwpJrd1U3eP6mpy/PBQ7BjPCZK6wX1FQRB+9A2c3xOUMxOUZ0oaHpGdFk/rcQ3Vpgi
 U8NVRnZdtBHXaQOC9+4Q/TvC7MwvUQr6nOcX1dGKqrt5FbY/qcR/1JbVGGdWgS6QZ4GL
 5tKrS+KWwTAqeqDllKgp0mMGU7+RnLvBJx6nnYQ9FygoqnGdGfHPH3zbLY3perqqUs5s
 80CsovT69FHz0eVbe/d8/PyBzMyh+ChsF2Tl5WL7CQIFhmHvy3tWFzK4YRno2+za3D3k
 5xBDjApZ8lDh5v3nnWeBqk1nOUYEXAWTNbUv7NSsKN2LGQUF/9waI9I+pW6MhktG6tZ2
 9btQ==
X-Gm-Message-State: AO0yUKXFfOmUwwqeyD6gPtDFCfrVhoLk0E8MzYziEXR4Fm+vlwhwaTHe
 Ei5elgNd8i2dkUj/aSyAfAoWNQ==
X-Google-Smtp-Source: AK7set+oRr41F/3JBo84PV2tuvjH2hadsk4fifPfczC8cAfudGGfoDz/OlKhU9qKFFpSxsXnhvPceQ==
X-Received: by 2002:adf:fd07:0:b0:2c9:8a3c:9fc5 with SMTP id
 e7-20020adffd07000000b002c98a3c9fc5mr14772644wrr.41.1678369132664; 
 Thu, 09 Mar 2023 05:38:52 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z6-20020adfd0c6000000b002c55efa9cbesm17735040wrh.39.2023.03.09.05.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 05:38:52 -0800 (PST)
Message-ID: <b2770c5a-c798-2565-ce5f-5431769d3f5d@linaro.org>
Date: Thu, 9 Mar 2023 14:38:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 0/3] MIPS Virt machine
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
Cc: balaton@eik.bme.hu
References: <20230202132138.30945-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230202132138.30945-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

> Jiaxun Yang (3):
>    docs/system: Remove "mips" board from target-mips.rst
Patch 1 merged as commit abe45a859b.

