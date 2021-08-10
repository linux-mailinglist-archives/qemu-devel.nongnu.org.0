Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F13F3E8699
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 01:37:50 +0200 (CEST)
Received: from localhost ([::1]:57250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDbJd-0007QY-2W
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 19:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDbI6-0005uR-56
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 19:36:14 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:45856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDbI4-00022q-Hb
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 19:36:13 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 m24-20020a17090a7f98b0290178b1a81700so1652760pjl.4
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 16:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H98/eqpTwHMkhUZG8NVyFTPgltSMl2x1eRmP6fBm8r8=;
 b=MI8ps7Mbs0s5oI9LAY8l2lFluGuZpxeTF0uCv+XcC5NfhDKyqn8m6E6yMkhxi7Ku/n
 szl6Byby5rQ8pUtdG+ZdxkPbVnzd3TD/6xkzmTNeglHvqhVnF430CQeHuQXEQXJNo62M
 BzRQ5Mbe06vqwng0mKVfMJuULKrFS9xJg+3/wnmuo6yUE7cI9AtNGEGPp8imDSCqUkCx
 nqtBhPJlJGLkNfC6OXSWogSCHLxet856j83XNFHCBy/cJgG1UKwHRXFRZkKMJF7Pu/jK
 FN+9q2p9dO5NCXWGC62tjgqOHFO1s65/sRLPrRK6Mg3xxEi/o70IRlSemqkWUbo17G83
 37nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H98/eqpTwHMkhUZG8NVyFTPgltSMl2x1eRmP6fBm8r8=;
 b=hU8FjuVj2aDIKJvAadrIN2Cw2LBkC/GxLFX/gqbDSJEFfpBokBkU5PDvbGOzN31SpG
 bXfHSyy6oTQ4vJlOichJ2V/LoGAFXp9pTqBMFbV6ExQKgl3lNGTgoEZtiJ4V5IExRnP8
 rAUwoxIQAzGjptImuIczUvVOulfHZmVXMtExejk5Y4loDdF8zmLw2gB4xYIoXikp6KNb
 c4ppaKl1itZYJil19CJUPVCoiVyCGo3202878rJl1kFg2hyk9cboNEZaMbhm+jQVboYJ
 QZaD7GapNvtDjgOFL8J2uS9hDRwdBtbMbL+6MfGfPv+EreLEjuBiGrrJ7nvmUuwHnDgp
 AZWQ==
X-Gm-Message-State: AOAM533krqiUVHC231OQE9mMpWIXXY2QMjEvUmu0zTL1JEx5TohJCLRw
 xLamMfxuAxYFSs8n/bZc18JIEg==
X-Google-Smtp-Source: ABdhPJx2UBCw62Td4gW2hppsp0cxmQUV5V+yxuSbkCHZnwukrGsXPUsb5l8yWFFvZF2qEjQ+jMZJWw==
X-Received: by 2002:a17:902:e745:b029:12d:603b:5e27 with SMTP id
 p5-20020a170902e745b029012d603b5e27mr1095019plf.72.1628638570899; 
 Tue, 10 Aug 2021 16:36:10 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id y13sm4229279pjn.34.2021.08.10.16.36.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 16:36:09 -0700 (PDT)
Subject: Re: [PATCH for 6.2 37/49] bsd-user: update debugging in mmap.c
To: Warner Losh <imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-38-imp@bsdimp.com>
 <426c50f9-0f17-ab31-0964-a8a6461bbd92@linaro.org>
 <CANCZdfo80jhQw4BOK=5nfZtyer+G0tp=_fyPM_GeW2YGNYwBmA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1cfa572f-0107-7f7f-ef8a-fafcec0661bc@linaro.org>
Date: Tue, 10 Aug 2021 13:36:02 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CANCZdfo80jhQw4BOK=5nfZtyer+G0tp=_fyPM_GeW2YGNYwBmA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Sean Bruno <sbruno@freebsd.org>,
 Warner Losh <imp@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Mika=c3=abl_Urankar?= <mikael.urankar@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/21 12:34 PM, Warner Losh wrote:
>     For the to-do list: convert to qemu_log_mask or tracepoints.
> 
> 
> Will do. Should I create a bsd-user/TODO file with all these in it (or rather, should I
> upstream the one I've already created)?

Could do.  Dunno if its easier or not, but we also have a set of Issues with the "Bite 
Sized" tag for small cleanups like this.


r~

