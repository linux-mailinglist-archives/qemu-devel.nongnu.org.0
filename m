Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C13F12BFDC
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Dec 2019 02:27:10 +0100 (CET)
Received: from localhost ([::1]:48302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ilNML-0003iy-Gj
	for lists+qemu-devel@lfdr.de; Sat, 28 Dec 2019 20:27:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52720)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ilNL5-0002lU-5H
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 20:25:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ilNL4-00082t-76
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 20:25:51 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:44873)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ilNL3-0007yl-Vf
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 20:25:50 -0500
Received: by mail-pl1-x641.google.com with SMTP id az3so13273677plb.11
 for <qemu-devel@nongnu.org>; Sat, 28 Dec 2019 17:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=HCvUrXNYhxa+o9ymlStx96bUUJ7vpoTgPn84LIc8P50=;
 b=Hy/wNzKY7Ago7pCMhpOQWubNGSOs2Rh6UGWoVuFsxofhGb+Q0C/NNLUPUE0VL2cdrn
 N7XBtuVeqQsu7V4pcPRGsbmZEfj1ylOol46klisylY8iF6On+cpW2NTJzouF6iiQJf/C
 Hj/VAm6ZQ90vSB357LC2ETGJuDqGWYLQ9Ze4sLogtOTQdPhYdbCSzeZSvVt0uTcyIn9p
 4czk6FwqdYzJr6+/S9/UaS8G+3pzsfqC6+nD+zaX9TWBpUaa5Hx3678pjbqSkUeAdztJ
 l1aks/MCEg2V9RyhAx7J3+JetM2PxJSill81UiufVPtbyhkfmOyyn00eRnAiuKRolT5r
 ag6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HCvUrXNYhxa+o9ymlStx96bUUJ7vpoTgPn84LIc8P50=;
 b=AT+7HJ0QC9qGdX2252GK9RoNl4K216RPhhfBix969NQMaQG5ehUba52uyBYDz39J82
 VEwOkPW5mlkVYdeHru2ZTmLXppb0C19dtM+ZIdFcuLloJ+oNeCZoipNXNsWqF9Uc35Os
 MW4PFy9O0Lgs3qXr53tm/xlbdyjU8GKsyGerI7l8JU5se6MZF6P+q6kwTZhUHl5eErzk
 TxPjRhjDzFkEWSBBHGjcs3uk0aoz2zRwuMP8G0p1rLsUtRL4JU5546o4DYiRBxzuBhDc
 vZ0AndKBMdYjgx1Nbk7STOgdvAztlDgClqij/Ed4nMYMWa5w4JE+FIc/49RDaj7AyLOL
 /75w==
X-Gm-Message-State: APjAAAUJ/jG9EO0Tk/j9Dmh3VBxXxF2uU2zmOCFT/vV1viAceAMp41cq
 nH98pTgOOLoGzeu1FaD3+tfP3Azi8tw=
X-Google-Smtp-Source: APXvYqwhIS9iKAtgc/LxVZnMyNP9VCOUYvkXIDsOpQHj4Jg9wy+tfQJJq43Dx6J0PwPJzcDP9T1g1w==
X-Received: by 2002:a17:902:5ace:: with SMTP id
 g14mr59091947plm.311.1577582748512; 
 Sat, 28 Dec 2019 17:25:48 -0800 (PST)
Received: from [192.168.1.118] (194-223-58-9.tpgi.com.au. [194.223.58.9])
 by smtp.gmail.com with ESMTPSA id d27sm42119163pgm.53.2019.12.28.17.25.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Dec 2019 17:25:47 -0800 (PST)
Subject: Re: [PATCH 1/2] hppa: Do not enable artist graphics with -nographic
 option
To: Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>,
 Richard Henderson <rth@twiddle.net>, qemu-devel@nongnu.org
References: <20191220211512.3289-1-svens@stackframe.org>
 <20191221222205.GA27749@ls3530.fritz.box>
 <20191221222402.GA27803@ls3530.fritz.box>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1a1a781e-6e5e-dca7-4cdb-118d448ccc04@linaro.org>
Date: Sun, 29 Dec 2019 12:25:43 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191221222402.GA27803@ls3530.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/19 9:24 AM, Helge Deller wrote:
> When qemu was started with the -nographic option, do not enable the
> artist graphic card emulation.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>

Squashed into Sven's patch.


r~

