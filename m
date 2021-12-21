Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5FA47C9A6
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 00:22:21 +0100 (CET)
Received: from localhost ([::1]:34124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzoSa-0003kW-Ji
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 18:22:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzoQV-0002H2-R3
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:20:11 -0500
Received: from [2607:f8b0:4864:20::1032] (port=53031
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzoQU-0007Uw-8t
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:20:11 -0500
Received: by mail-pj1-x1032.google.com with SMTP id co15so618257pjb.2
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 15:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=97WAQ7FvQeo5v43oLi8wZKHV2L2dj99tlfrDBZtYCwo=;
 b=UwZBw08LE7ows1HJFDdfwWN2UwpENB41M4b8HcT48/4z8mqXwPjElYif1L/CTOF1cH
 R0b2xF8Dt8FQ+JBuhp+OlRkB2W3RR7gkScVI2/YPky2tmHkWn0+iU4g5K+vRgjp0pA18
 vw/2J4s/NDrK/cHMtuqECCgb/HF2g5JBaZtpb3MIrr3h0WuHsbFcvK/P1pdqeLjA1H9S
 JgkBjxgIExD7+lM9ntYT9O7B6RGlZNwGWvs+noWNeBDxYib1b8bfIMBNmiQjoyoNb7k1
 iGlTr+yswug/n7F4aRFyPHcxB92BOnRjDtUlAqN5GY2nAJrr56ChKD4QMJGfzdbLSS7h
 4W0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=97WAQ7FvQeo5v43oLi8wZKHV2L2dj99tlfrDBZtYCwo=;
 b=WO8nCQiNOqkQjrDgr+k+J3/0Mg9U9jiJPt4j6Om/XAPzObuy2y1czr0HySMdNYjCqg
 Psc7LuvaaAhPLu/u3+E0PYtLVTMt+USFQ+Bx2gUFYirc5eYYj1bpxFsrUdgCVXJFWflb
 ZiPn2cIiTbEvd1Yd1tPYDfIHE7rjfxgbFVAQU0qnaIo7AWBVVpyXvLksOacG0zYeaiJy
 P+9Mfd91rlkJufRtplHSBaYCVwebFPxnWM26TcH8ozpbfD3+Z3HFaYOaRVm6Aaq/kXhu
 MS3oIUaCnV7HrHHJUto/oinBaHYCiUZPTopbARXhF5uQ/Riaxyjl1A9PK+U4WKlvFSeu
 uErQ==
X-Gm-Message-State: AOAM531J178g4+Y4DFEwukO0OeHGvW4Wl/tk27/oiTnl+xPOIgmjk57d
 csb3XSwX82T5TMN21sG4O6tN3DbcbdI30g==
X-Google-Smtp-Source: ABdhPJySK/8eBULLzMBzPwjf6rEkH3qexoloir5yPA2e9qwEXdYL9d8aODfRD7AtS6+McYdbNPNw4Q==
X-Received: by 2002:a17:902:d284:b0:148:d723:ba98 with SMTP id
 t4-20020a170902d28400b00148d723ba98mr342121plc.154.1640128808742; 
 Tue, 21 Dec 2021 15:20:08 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id s24sm154357pfm.100.2021.12.21.15.20.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 15:20:08 -0800 (PST)
Subject: Re: [PATCH 1/3] linux-user: netlink: update IFLA entries
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211219154514.2165728-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a99e26a0-0d85-f670-e734-fcdf6c5a3073@linaro.org>
Date: Tue, 21 Dec 2021 15:20:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211219154514.2165728-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/19/21 7:45 AM, Laurent Vivier wrote:
> Add IFLA_PHYS_PORT_ID, IFLA_PARENT_DEV_NAME, IFLA_PARENT_DEV_BUS_NAME
> 
>    # QEMU_LOG=unimp ip a
>    Unknown host QEMU_IFLA type: 56
>    Unknown host QEMU_IFLA type: 57
>    Unknown host QEMU_IFLA type: 34
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   linux-user/fd-trans.c | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

