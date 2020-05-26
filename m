Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4821CE25A
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 20:13:17 +0200 (CEST)
Received: from localhost ([::1]:41838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYCvU-0008D1-Mw
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 14:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYCtt-0006Sw-BA
 for qemu-devel@nongnu.org; Mon, 11 May 2020 14:11:37 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:37542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYCts-0005HR-Aw
 for qemu-devel@nongnu.org; Mon, 11 May 2020 14:11:36 -0400
Received: by mail-pg1-x542.google.com with SMTP id f23so4248037pgj.4
 for <qemu-devel@nongnu.org>; Mon, 11 May 2020 11:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DBEeLc+TWXFV320JdoAR6LHAocj5llAZ2FB8duCvyvk=;
 b=GrsglkuVZDd3qRH/Gmi8Ptf6Cl1Lh1DhUK0gwhTtgRPkIhp134WI039EQRVbdJEzdk
 UNlDLiOR+xqEWrJFdPvux9uQc+2wGRTcMaxRf6IUxoYPn1hPPRKhfgxrjEc2YjayDHLm
 EIzzm040IRFCyEBm1As5HlrEMhlW6BYD78VIbelKV6odLJtmiEhi8bQpL1IfAn8X/2g/
 SUgvjNLRBz6oyeM4++R94rs9kdWaPu7lbG98FXzqWgfcBqfXD5hyR4e1H4Cbr7JX7Qx6
 zwC27BpMl3ACSBTx+Vb5IVsJYt0BMJRixi7E9kXr00Kz5cibdQdmXFT6Dxh1GWeBfLmw
 FjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DBEeLc+TWXFV320JdoAR6LHAocj5llAZ2FB8duCvyvk=;
 b=E0V8uWida6SeXDI+lFzbbqsLqpOO67gyiY9MO2iDJthZQ+7svLxjXd+BKSt2Oi6M01
 eInnWkirt9bqfMDp2gth1TGmpAKWQ+6BWq+WwWjIA5MW9Q39EA5Ay8HqJACOYxud/96T
 sOQsRpfMbKABtb7xFOnXDtCktYVA/cxkVJ4VNp+lYWSsxUcWubPLbdNRdDebs/5u07Uu
 SPNJgsfRJRBcJKhMZkmHb4fq/PQkQQla2gvDd9Cf3ePbAJMVgZoH7r2OPw9qfXullotb
 Hb6qZtkKhtfZcuKFDwfODNjeMXqtRY1rB6ufOzrWVlOcVSbuLZHHx2rUW2jhlIF0JByj
 s2nA==
X-Gm-Message-State: AGi0PuYdiY+OECYJbUZp8/dDigzHVHz4eg/b5ONaYWyW0oCvcS/t7quT
 g3vTzo3X2sRZtgr6lmc6X5FuYA==
X-Google-Smtp-Source: APiQypJlOXIoG6hmYTcQsqGoLjkFyAolRMbqRGuUJLoDVgUxFVbN7XvG185FedjYwPRm013W1iFDGg==
X-Received: by 2002:aa7:8e8b:: with SMTP id a11mr16673537pfr.62.1589220694606; 
 Mon, 11 May 2020 11:11:34 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id d184sm9571351pfc.130.2020.05.11.11.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 11:11:33 -0700 (PDT)
Subject: Re: [RFC PATCH 8/8] riscv: Add RV64F instructions description
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, peter.maydell@linaro.org
References: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
 <20200430072139.4602-9-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <99fa418c-9a2e-d806-b164-3a08fecd74e8@linaro.org>
Date: Mon, 11 May 2020 11:11:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430072139.4602-9-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, wxy194768@alibaba-inc.com,
 wenmeng_zhang@c-sky.com, palmer@dabbelt.com, alistair23@gmail.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/20 12:21 AM, LIU Zhiwei wrote:
> +FCVT_L_S RISCV 1100000 00010 rs1:5 rm:3 rd:5 1010011 \
> +!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rm != 6 && $rm != 5 }
> +
> +FCVT_LU_S RISCV 1100000 00011 rs1:5 rm:3 rd:5 1010011 \
> +!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rm != 6 && $rm != 5 }
> +
> +FCVT_S_L RISCV 1101000 00010 rs1:5 rm:3 rd:5 1010011 \
> +!constraints { $rs1 != 2 && $rm != 6 && $rm != 5 }
> +
> +FCVT_S_LU RISCV 1101000 00011 rs1:5 rm:3 rd:5 1010011 \
> +!constraints { $rs1 != 2 && $rm != 6 && $rm != 5 }

Interesting question here: Do we really want to avoid the reserved rounding
modes, or do we want to verify that we raise an invalid operand exception?

I guess I'm fine with it either way.


r~

