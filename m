Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C34F400753
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 23:13:38 +0200 (CEST)
Received: from localhost ([::1]:56420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMGVF-0000um-4V
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 17:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMGRG-0002wf-EU
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:09:30 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMGRE-0007Up-Q0
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:09:30 -0400
Received: by mail-wr1-x436.google.com with SMTP id q11so453939wrr.9
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 14:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CKcIzD33qBNeDPZDAeW9DI/mcYmGACzSR1xegh9QXSk=;
 b=MJwGDDLUR/+g4APyl8+iJNufTWjIPXui5Kzv9hwZ7sM4ee9DrdhiJQt8dkhV1xHyuW
 VzH8ITcUoDMB3GR/mn2iaAPWVxMRtZhPd/JXwFStlu3pV1W1lfsYYpWNs/FuODDtQyvM
 sj7rDe4dWxrhUbHfB+B6xvdU9RyLNO5LyPAjEpWHfG3xbcGwhFr9ohoG4H8zhwYkIGuj
 wXiWO95ckYPqEQmuckdLTS3PDnEBXqwms35UyRKgh9hUgiaBjJ2BVORL6GsTeJ73UGVx
 d3ZY/RnhUJxxs9F1KIpVE/PXdgzyvjrHagNWqqWdHBtJ13golbTQofqa/1m9catFa2BM
 4O4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CKcIzD33qBNeDPZDAeW9DI/mcYmGACzSR1xegh9QXSk=;
 b=cGlSt0rTxASc16DAwdpS6PFQzEAJQ/qhJ8ZEaXibuXctiFOfVSQngjKwf8bKrom9vg
 mmPnJ32xIb74ORiw5I1mYYuEqGiBkW4hxnBPmAT+s32Eq8rEMf1epoYo0buyxi1V9Lob
 LIakU1K03o4Uy9VhoPi8OJKkdWQVPH0APAg4SQi6TKQpowbX4cD8fBUrIb6g+wSl3i/j
 tKvo6OJhj6/CSxgQKxi4VSp9lH2bjZhqQxgztMBLdsyxMSkq/A86CAaNd2UyhZs1Ruzx
 H/pu0eV9yWLkkwW1hrwY7L0cOybQTxmSSC1NWID5JjQmVb4VE505zDEbQ9z8iw3wavSP
 j8ZQ==
X-Gm-Message-State: AOAM531ZdmaDFiHsxCbFeS4O4JdMtM4oQHq69/s9wiCtoAnTv/ePbdga
 OLhWeSM5XcT1nnZpGuuaDtyOOw==
X-Google-Smtp-Source: ABdhPJzgriFwRW1fLFrkKWjb0iVgEgdfuyRZK0Xw8+2wSk49Q7zYYpp2kstResCHLoLtXrOkyE+ItA==
X-Received: by 2002:a05:6000:160c:: with SMTP id
 u12mr989850wrb.100.1630703365819; 
 Fri, 03 Sep 2021 14:09:25 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id 19sm398374wmo.39.2021.09.03.14.09.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 14:09:25 -0700 (PDT)
Subject: Re: [PATCH v2 04/19] host-utils: add 128-bit quotient support to
 divu128/divs128
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
 <20210831164007.297781-5-luis.pires@eldorado.org.br>
 <c6a29b77-1187-a06b-6c2e-ede5dc8a1037@linaro.org>
 <CP2PR80MB36682CDF56098C1E9DE99437DACE9@CP2PR80MB3668.lamprd80.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3bcc33e9-7076-e3ba-df86-1950cd1caa36@linaro.org>
Date: Fri, 3 Sep 2021 23:09:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CP2PR80MB36682CDF56098C1E9DE99437DACE9@CP2PR80MB3668.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: "groug@kaod.org" <groug@kaod.org>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 11:07 PM, Luis Fernando Fujita Pires wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
>> Hmm.  I'll note that we have a better divmod primitive in tree, but we aren't
>> using it
>> here: udiv_qrnnd in include/fpu/softfloat-macros.h.
> 
> Good to know! I'll change to a (much simpler) implementation using udiv_qrnnd.
> Any pointers on what would be a good place to put udiv_qrnnd, so it can be used by softloat.c and host-utils.c? Would host-utils.h be ok?

Yeah, that should be fine.

Note that udiv_qrnnd requires that the divisor be normalization, i.e. the msb of the 
denominator must be set.  So:

     int sh = clz64(den);
     uint64_t q, r;

     q = udiv_qrnnd(&r, num_hi, num_lo, den << sh);
     q <<= sh;
     r >>= sh;

IIRC.  You'll probably want to have a look at gmp source, from which this comes for best 
practice in implementing a larger division.


r~

