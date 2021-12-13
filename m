Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A680247365A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 22:05:51 +0100 (CET)
Received: from localhost ([::1]:53436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwsW6-0000X7-IK
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 16:05:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwsUO-0007gK-Et
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 16:04:04 -0500
Received: from [2607:f8b0:4864:20::42f] (port=42571
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwsUM-0006CZ-JP
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 16:04:04 -0500
Received: by mail-pf1-x42f.google.com with SMTP id u80so16017672pfc.9
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 13:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:from:subject:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=gRjwRtZkB+wzmqm+kJ1cVYJO9EOBFA73Coe5bBxbges=;
 b=qczC+MWFXLmNSt6K0pBFLXms9uBZ8rSSbKEIYyS/LsI28UNzum1PRqz5ObGDnjCIZ6
 LDKI8WkR3gWG5APvvddwFIN+4KO+wCm569cZkeAlk6Os2ulJ+/AT0waLI17KXFc3lShc
 x9+Tdjp+m3TV5P6Nk/Yw4yTJxCMVHI+ix9JZX02C10SWwBIiKyj3eKB0/Gq45rPvT9lm
 o6BC1yFdLl1jtVCgaK05ddtMvkbBf5sYorG5Q/72ogNYoNm5IrPvlVqI4W3n6mxdrvnU
 dQ7ByJJd3Ly95jL9Y1vYBR9bkDh5zr/GyGm7y3NFBhch+qny55CxDdsRAlADgY6/Sd4X
 LtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:from:subject:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=gRjwRtZkB+wzmqm+kJ1cVYJO9EOBFA73Coe5bBxbges=;
 b=7oqOofoV0TtHuRChxIZvoUAkFSSNWUm0CaVDo9PgUcnX6jMwDCdNiS4YnQ40zhNuhQ
 /oMS/iSysbnW+NsINGT68JrTvbkzjl3Ao+9BMNopaBWxxYHm6VU7Zgw+fZdWob2zxg4U
 WD12VI0/K7qJIB95PYWzxZVg55EUt4H20V+2jIQ1VZkwozEpSwF1ZFt+eYELk4GKVLEC
 0WA0xq0exZVEdH1FC595Zt5IlvND6MS9VZ3ACmkZ6qzoRqkOCq/cNgrl84SpEPJ0/nym
 gDQ++4nkUOI4TdGirS1HbDA2dBCMvBWjDUYrNxbhEcvS3vpZEhu+fHnMXPJuOtPoh4yi
 LKOQ==
X-Gm-Message-State: AOAM532D5+jEwY9XdeXE0HDjdfsfPIxdZhzlK9lhX4+kv37Fo7+tHUvp
 LiONgBKsrpcMdwENMBgG8DyiRPa3OCrKoQ==
X-Google-Smtp-Source: ABdhPJyTC4fcuQ8ZvntAS+1/EtI50kAFxh2jGK8YzL2q42OYuL/JjzdGzJ6qBoFXCOT4vGxeq+N5vg==
X-Received: by 2002:a62:7803:0:b0:494:64ef:7bd7 with SMTP id
 t3-20020a627803000000b0049464ef7bd7mr479189pfc.85.1639429441037; 
 Mon, 13 Dec 2021 13:04:01 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id l21sm44207pjt.24.2021.12.13.13.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 13:04:00 -0800 (PST)
To: Taylor Simpson <tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Subject: update hexagon float ref files
Message-ID: <c54f6905-5826-23c3-c619-a19eca3a4c86@linaro.org>
Date: Mon, 13 Dec 2021 13:03:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Happy holidays, Taylor,

I've located a bug in tests/multiarch/float_*, which means that the hexagon *.ref files 
are out of date.

At your convenience, would you please check out

https://gitlab.com/rth7680/qemu/-/commits/fix-sfp-test

and re-generate the files for me?  I'll squash the diff into my patch for bisection.


r~

