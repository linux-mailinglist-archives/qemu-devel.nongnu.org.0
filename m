Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9470437C3E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 20:28:18 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36581 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYx7Z-0001g0-Pl
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 14:28:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hYx6F-0000s1-Cm
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 14:26:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hYx6E-0001Hi-EE
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 14:26:55 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:36309)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hYx6E-0001Gb-6X
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 14:26:54 -0400
Received: by mail-ot1-x344.google.com with SMTP id c3so2909192otr.3
	for <qemu-devel@nongnu.org>; Thu, 06 Jun 2019 11:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Hg7nri5sLFlYSsOE8u0Xsq3JfI2XPsTAHW/jCoW/UpE=;
	b=uIk5iw4ktXLl2DgOEx74VYYA18dM89eHmutT7yyavXY9AJIw/o4RXOphbTUn88n1wm
	I22R2YgR9giHLCzyZt4xKm3ICsfd4Vv2qudLmgFXPtgISOuZ4rFFGRKrH39Ro3Utr8sA
	Qc6nmLTaxTx950/Q6/sQq2aehOkAFHv6slTY/vfkljmD42sDUSA8C1Th76i5ex/SR310
	nByNr+RBOZoDDKegWiYMBB9iQaPmcStol7Pkb2ruzNLRmga2UFy+4VV4AzrKP9qD59Kb
	WuZoEmfu+ZxpYqh3dwr9wf/9+H+Lvji5lo62ENHOOkEecwjIwIfLyozWFLxiseuAyN5z
	Guiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Hg7nri5sLFlYSsOE8u0Xsq3JfI2XPsTAHW/jCoW/UpE=;
	b=Nt/VhKTfL17byHuN2SP0C6XGUjwYUNsNxlHQQXYHMXlo87C5KmmLN5Z7kCyOQl1vhN
	eYCRKGUEUAFtppk37NsebMdnPxaY/PdjcKlCa73EAEX3dAwoBvgr1P07ybIlHZOxuAcp
	XXxYL2sacfvCtSkm5vDzD20p1RGi5YESqgRdkmp5vE/uqj1ucZ/T/6PgrUGe6jD3wp7p
	z6GKrkrUbljokhNZ+MM2e55+qo0mf2PpnI82RZ8G+ZO2iVEe3j1eKk2BNTlRGK2N6N5d
	02Biyj5qJIf/8ES4Su4vthNJGRog8RAmOHbTYXOhhjH6QHnYjGXp6mR1TPC5/pMC/d3N
	0+Dw==
X-Gm-Message-State: APjAAAXbsXaca6u0krN4JGd8aMxffTC3y7PAgsGQExLMIJhfNx5Kowox
	5+GjNRyjZEOde1sh55glV75QlijrTTN0DA==
X-Google-Smtp-Source: APXvYqy0wGkk3pYGloTxLa2i0X6KF1WZ3LeK8vTXmg7FlWt8gGhZior2FXH68UwJuNPT3wAzFZ62DQ==
X-Received: by 2002:a9d:2f26:: with SMTP id h35mr16455210otb.183.1559845611862;
	Thu, 06 Jun 2019 11:26:51 -0700 (PDT)
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx.
	[200.56.192.86])
	by smtp.gmail.com with ESMTPSA id 3sm854117otl.42.2019.06.06.11.26.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 11:26:51 -0700 (PDT)
To: Stefan Brankovic <stefan.brankovic@rt-rk.com>, qemu-devel@nongnu.org
References: <1559816130-17113-1-git-send-email-stefan.brankovic@rt-rk.com>
	<1559816130-17113-6-git-send-email-stefan.brankovic@rt-rk.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7d2b10c1-8c47-99d7-3b86-76b8d93aac3b@linaro.org>
Date: Thu, 6 Jun 2019 13:26:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1559816130-17113-6-git-send-email-stefan.brankovic@rt-rk.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH 5/8] target/ppc: Optimize emulation of
 vclzd instruction
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
Cc: david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/6/19 5:15 AM, Stefan Brankovic wrote:
> Optimize Altivec instruction vclzd (Vector Count Leading Zeros Doubleword).
> This instruction counts the number of leading zeros of each doubleword element
> in source register and places result in the appropriate doubleword element of
> destination register.
> 
> Using tcg-s count leading zeros instruction two times(once for each
> doubleword element of source register vB) and placing result in
> appropriate doubleword element of destination register vD.
> 
> Signed-off-by: Stefan Brankovic <stefan.brankovic@rt-rk.com>
> ---
>  target/ppc/translate/vmx-impl.inc.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)

Once the vclzd helper is removed,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

