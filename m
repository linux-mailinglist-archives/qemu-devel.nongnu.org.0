Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65D217F08
	for <lists+qemu-devel@lfdr.de>; Wed,  8 May 2019 19:25:43 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40707 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOQK6-0005D1-Rb
	for lists+qemu-devel@lfdr.de; Wed, 08 May 2019 13:25:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37872)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOQHw-0004HN-P6
	for qemu-devel@nongnu.org; Wed, 08 May 2019 13:23:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOQHv-0005YZ-UA
	for qemu-devel@nongnu.org; Wed, 08 May 2019 13:23:28 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:42097)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hOQHv-0005XX-MC
	for qemu-devel@nongnu.org; Wed, 08 May 2019 13:23:27 -0400
Received: by mail-pl1-x636.google.com with SMTP id x15so10235596pln.9
	for <qemu-devel@nongnu.org>; Wed, 08 May 2019 10:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=W6hn44I4hXuBHBoIxDgow9TLPfl/QepgHWWWchOerKs=;
	b=jRRIYKNSCQecp7dAtbIU9jXLzYDpmZr3BrkT8q2xLwvjNmeJVg6FURd4l0VZ3zkZRb
	+ZUaDf67iiFKy2fLTIYlZEWWn/1cR0j6dytLNQ65GE+03p5XOzeCxgZWtsQDN5m3vKuI
	xeCRdXWpAHqa30Lk1z8KY+TmbghSXrkP3sbFcgWu+1zhu4/Q1dGO+KKU35a4RHjiLgvh
	/Q9DAe/MtSCEhY6WXBpkhMppP0ffKZnbMp4iOilOTkbhwP/eRUOA4YvmRlqciz9qMa2K
	QHKS1+jdMVvcDLAxg4TtiW/XkIL1i7YZ4YXUsPIIIMrT1QPwp+6Z/Okxb9hMTbTsZfsx
	UOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=W6hn44I4hXuBHBoIxDgow9TLPfl/QepgHWWWchOerKs=;
	b=O4eocryLivnrUqyB4+m3ZwmgZD17y9JjpZlAWsCH7Z8NB3StOpELHmDSHgTwTg03K5
	xvJQIGBR3lu3wSoLTgvQyFbuXd7iPpSlv2SBmKM0QxVPgBm9N9hQiA4mKh4+ggQyLPDF
	n73Ap+vRDgSsfpJdn1Fu892NtuCfYsQ4Ko7tV51q2VdJ6IkiecJ/acHeB4M/laYHk4CL
	QhetFOYs0RApK9qn18LnIbWLiLd64zeE/1XyHRW0/L3JfIf6iOxL+/n6ViIV7mIvDmwa
	EzBV33npSfaeZdzejk06MwcXnXEgar3ahvnxK1IPMh/iK3zP3dGPaQGeYAEp/EGqqE2F
	MW4w==
X-Gm-Message-State: APjAAAX3fxqhTGkRdyBgyDtw9IWEpfonHW0Vq3e945XsIM/JzlSMyFxA
	69sYO8l0AQZYFViBF1YP5voiRw==
X-Google-Smtp-Source: APXvYqyligknb6Pj8/SuuBRKtjtZxFuWSFRGa5CFPC9OwqIKD2UCWCSY2ikwvsGXJDmj75MpVVkiNw==
X-Received: by 2002:a17:902:2924:: with SMTP id
	g33mr48830697plb.26.1557336206514; 
	Wed, 08 May 2019 10:23:26 -0700 (PDT)
Received: from [192.168.1.11] (97-113-27-95.tukw.qwest.net. [97.113.27.95])
	by smtp.gmail.com with ESMTPSA id
	n64sm25098750pfb.38.2019.05.08.10.23.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 10:23:25 -0700 (PDT)
To: Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-devel@nongnu.org
References: <20190508145611.107133-1-ysato@users.sourceforge.jp>
	<20190508145611.107133-3-ysato@users.sourceforge.jp>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <805f159b-53fa-b4cd-4983-5912c525c2ec@linaro.org>
Date: Wed, 8 May 2019 10:23:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190508145611.107133-3-ysato@users.sourceforge.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::636
Subject: Re: [Qemu-devel] [PATCH v10 02/13] target/rx: TCG helper
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/8/19 7:56 AM, Yoshinori Sato wrote:
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  target/rx/helper.h    |  31 ++++
>  target/rx/helper.c    | 148 ++++++++++++++++
>  target/rx/op_helper.c | 481 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 660 insertions(+)
>  create mode 100644 target/rx/helper.h
>  create mode 100644 target/rx/helper.c
>  create mode 100644 target/rx/op_helper.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


