Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B352D3667
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:44:45 +0100 (CET)
Received: from localhost ([::1]:49624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmliu-0001t4-A3
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:44:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmlD1-0005zJ-AJ
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:11:47 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmlCy-0005kh-H0
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:11:47 -0500
Received: by mail-ot1-x342.google.com with SMTP id x13so255293oto.8
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 14:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b2C+HWDM43GOsU1SRUMnDSewUrX0ur8On93MW/ehQ2s=;
 b=AcjOBK/rmhGFw8hp5XO1ilO86Pt7OUam1wVa/jIeRSpLmwc1ZKmGTi5hGesRj9b1ra
 jyTR265P3Uu9xwydMd2HvJaP47ZHp4OmtU20U6XQ4Znm3ZzJgXgV9lSXLZFlbf8zpKCb
 vIFlYik0Lv2h2FC2tpy52LQ/fNfP4m6UReBDXjDf2SX9zzRI2PXQJXpxiHPb269apekq
 wjuD+rVnMYhP/2RgqKZStxUqJ3vooypyftjoEGHbrs3PVg26Ly1O1O6AzaIxJUwU+SGq
 AE5qGuYu/CAK3lBmHxisyyB+KcH1Vwq/DFXGG0QFCs7JCj+Q4MIsQvS86a02SuwMSsdF
 PTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b2C+HWDM43GOsU1SRUMnDSewUrX0ur8On93MW/ehQ2s=;
 b=mWLdqNxOVCqPqZHFCCLNozPDhVZrDn6rz05MWonF3GSWnLZ4kp8HQP0YJPtanoyq/O
 pk+OB8+DIinxBf7mnWtcEC6fl7VOwcKgGFFg+qEg1Euld1ZPG6tXXsnszZ6cdXpq9Gfp
 Tym5uM8D8tne2/4hqPU8bPI7g3c8TNQRlHVD3nYF51LUj3TEgJnEoglsXGNewCwI4J0Y
 Tf322MC4akitObVelkD/qK8LuCoo/y4ptddi/ANM/35yeQ0HHoP3SWrfpFuzVIeu3xh+
 dzw/GVUQusEwJbesFbj2dbQKGn+o0jlHeSFnTH4wfqNKMb5BDJWk4G4rESaREJ+D8fED
 Xk5g==
X-Gm-Message-State: AOAM532iou6RMa+OMy7tURs77x7zX3ju+lNFPGoP1uyrKjvlu6bsWONz
 dzkhrgHbUad3Hmuvc0e1LRwlZw==
X-Google-Smtp-Source: ABdhPJxkEDlh4O1scIg1AjQvG5hEe0Xiqb+MWnH5kdFDAGyeJYI/qHa9N9rZ75RDIWv5GZHERR1zpg==
X-Received: by 2002:a05:6830:1352:: with SMTP id
 r18mr153887otq.73.1607465503236; 
 Tue, 08 Dec 2020 14:11:43 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t203sm20829oib.34.2020.12.08.14.11.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 14:11:42 -0800 (PST)
Subject: Re: [PATCH 13/19] target/mips: Fix code style for checkpatch.pl
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-14-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ba22f3db-9afb-b4e1-5c19-1d9f5ff000fd@linaro.org>
Date: Tue, 8 Dec 2020 16:11:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201206233949.3783184-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 5:39 PM, Philippe Mathieu-Daudé wrote:
> We are going to move this code, fix its style first.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate_init.c.inc | 36 ++++++++++++++++----------------
>  1 file changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

