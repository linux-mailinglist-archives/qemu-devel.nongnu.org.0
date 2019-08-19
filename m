Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8D194F74
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 22:58:40 +0200 (CEST)
Received: from localhost ([::1]:57770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzojf-0004x3-Ud
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 16:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52372)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzoip-0004Ga-SQ
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 16:57:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzoio-0004q3-Tv
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 16:57:47 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:36337)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzoio-0004pe-P8
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 16:57:46 -0400
Received: by mail-pg1-x541.google.com with SMTP id l21so1882503pgm.3
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 13:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RUzK/Wclbs99519uI08/CfvKpahY2PoKPEWzRLrbAFw=;
 b=rTKUyQZRLSimzQnEmE/5d+GBlUzisSZ52LiNK5ss8IQGzoU3TN9nbi/68pxXO6TDxy
 icizW3W+kwDQTCIS9qLlL13yPF3Crk0FpC1ot5HJ3OfBtfjYO+l2qW0FLzCKprgRpX4Q
 eQw9+v6OrJ695NzXakuut0kJwOaomfZ0Agh4PFy/2xBx3zZMZ1pZ7lzRpcFbSwvzmd96
 ZEubGT478nE6J/qRrgDs11C5vm6bOf2gvrD4UNCYI7ky3uqQkCVS9KRaS7s0mTK2KE/C
 ZVuCpO+V/tmfqTa8uvg2Sa4lzBuJu6nLnqeILeGf/9CF2RDsU2s+HnqdH5Pq3rPPSFkx
 U2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RUzK/Wclbs99519uI08/CfvKpahY2PoKPEWzRLrbAFw=;
 b=p5q3r00gfDAcEzHAm/PHjC6NSTeDdCroV57QyiNnNvX7OCyu52A/gmqsyCchU+PaKQ
 YbFb4WPtsvTskKLjf1PIXi2oB7MrMZdCuIDtZcqxpdebjpuFkFVyTabu2t/XBTrw3yt3
 BowWy7tocj9kcmyf8lI3Ossb2IeGNrwWFI0i1VElPA24EBy3usC8bV1axUQ6ZAcZMNHg
 8ZtQH+dfzdUHQlAv7bFHGjc8EMFaTooRJYSNrrNgTFn082kYo1pM6VuxF7zvde/xXKkL
 Or1x8EhJa36nvMgvxk2qqeM1+RxJVgPOU0VvvSicdRsnS0mdpyGyzqKqIHC98pTkLH7k
 zYfg==
X-Gm-Message-State: APjAAAVzN+n3inyLxmLlabRNjQTsniHGbrhVrSP78f2F7erdNeVOIykO
 Jp+CQKcGCOQ7HlUBpWb3ozHLs2Ty9Jo=
X-Google-Smtp-Source: APXvYqzjNBPxX88zpUTir4OAdI2iin8ZvcTSnyTKmUSqnFDpJWqEHfCbJeqV2g8Qd5y+vT82LMXhxQ==
X-Received: by 2002:a63:6f8f:: with SMTP id k137mr21673105pgc.90.1566248265306; 
 Mon, 19 Aug 2019 13:57:45 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id w11sm17768994pfi.105.2019.08.19.13.57.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Aug 2019 13:57:44 -0700 (PDT)
To: "Paul A. Clarke" <pc@us.ibm.com>, david@gibson.dropbear.id.au
References: <1566242388-9244-1-git-send-email-pc@us.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5973dc51-ccd2-6b7e-5382-527686f9803a@linaro.org>
Date: Mon, 19 Aug 2019 13:57:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566242388-9244-1-git-send-email-pc@us.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-devel] [PATCH] ppc: Fix emulated INFINITY and NAN
 conversions
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/19 12:19 PM, Paul A. Clarke wrote:
> From: "Paul A. Clarke" <pc@us.ibm.com>
> 
> helper_todouble() was not properly converting INFINITY from 32 bit
> float to 64 bit double.
> 
> (Normalized operand conversion is unchanged, other than indentation.)
> 
> Signed-off-by: Paul A. Clarke <pc@us.ibm.com>
> ---
>  target/ppc/fpu_helper.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

