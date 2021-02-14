Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3908431B376
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 00:45:06 +0100 (CET)
Received: from localhost ([::1]:37758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBR4X-0003Ns-FJ
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 18:45:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBR0n-0000Pa-Hf
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 18:41:09 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBR0m-0004AF-2D
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 18:41:09 -0500
Received: by mail-pj1-x1029.google.com with SMTP id e9so2848071pjj.0
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 15:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NzxiDIQ+O1V6+mulwZknEw9G0MAm3c7+XsbIPffsDnY=;
 b=TNQjFSVegaAIoWaNWS7y3oBQHGExIZIKlExq0VY9Tm3D4kk0UGfS1wjs+HRg+GukRn
 UVGJpXvldTyVT7TeDBv8ngxCz711pFfo67daZzK5fQ3/vCWE9v3s7nAV949DaXqJrMts
 EhCOGugzrKYddH1TjynYZe9f9T9+tyuC1SSrfo0cT8QyWK9h4/d5zI1P/L/UlPPd8PTy
 Dx21QWDkoDWFUhLdOmeiIwYxum045HOmYuAwp9SCTpp4ey4/URsmeGzcUMc/n36xE5f/
 c9huB6Xve011YoOxLrJgVa2pSGARD3jSZDQqCkcHcfRynEax/YPfjMQ/rdbhlXS8SVTV
 sL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NzxiDIQ+O1V6+mulwZknEw9G0MAm3c7+XsbIPffsDnY=;
 b=nofm456B57gY7uU1BwMLnTqpPGbnyRFhreMJ90Mc6MJCwAb2e4o8LUSymqt8iXaJ3l
 iu4JU4YoAA6ngzI8yPK045WFzDnd7e3B4m493RZt3Ka2e29jcbiZYXy7pXNxZAzeMHb1
 1chdqOq1AY5w5Qswh1zhz45i4eTOIrkUf8x3G6cVIa0wyP7tcgG9X+ykJcjVlQR8sAgF
 f+svKnZ2+cGJIyIJK0Ii9Wpungs4qO2+SL6uGClrKbvwZL4jwdVCtxePYjJboJzIrpoe
 izrV8CQziGJM0a6T+exY1YBAKbvsjrnxT25V92oNldW2He2GACFr2GARJqUA3DIo0kb9
 /kXQ==
X-Gm-Message-State: AOAM531MWdmcBwtbINbd099NNUNyzFkJKhHblqsCjfPUOUVnq7aceEl8
 2baB7s97GU7T5hOLjzyp+5YTgw==
X-Google-Smtp-Source: ABdhPJyfpxTIedyZ3LyeQzAfMHDSWy04qpw8N4spmmnsHxlpkv+yctvk73mvd8apZA7Qbv2rinn09g==
X-Received: by 2002:a17:90a:2f06:: with SMTP id
 s6mr8800224pjd.76.1613346066467; 
 Sun, 14 Feb 2021 15:41:06 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 d13sm14478658pjz.3.2021.02.14.15.41.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 15:41:06 -0800 (PST)
Subject: Re: [PATCH v8 25/35] Hexagon (target/hexagon) instruction classes
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-26-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3d366d6a-b278-cda0-f822-5c8aa7ba67dc@linaro.org>
Date: Sun, 14 Feb 2021 15:41:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-26-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ale@rev.ng, alex.bennee@linaro.org, philmd@redhat.com, laurent@vivier.eu,
 bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 9:46 PM, Taylor Simpson wrote:
> +    } else if ((itype == ICLASS_V2LDST) && (GET_ATTRIB(opcode, A_STORE))) {
> +        return SLOTS_01;
> +    } else if ((itype == ICLASS_V2LDST) && (!GET_ATTRIB(opcode, A_STORE))) {
> +        return SLOTS_01;

What's the point of this?  Between the two all ICLASS_V2LDST use SLOTS_01.  Why
can't it be done in

> +        return iclass_info[itype];

here?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

