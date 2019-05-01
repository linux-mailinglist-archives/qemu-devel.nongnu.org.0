Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0265F10CBD
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 20:37:31 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38254 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLu6k-0002S7-47
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 14:37:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLu4t-0000qW-Rx
	for qemu-devel@nongnu.org; Wed, 01 May 2019 14:35:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLu4t-0001Bb-1z
	for qemu-devel@nongnu.org; Wed, 01 May 2019 14:35:35 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:42428)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hLu4s-0001BA-Sr
	for qemu-devel@nongnu.org; Wed, 01 May 2019 14:35:34 -0400
Received: by mail-pl1-x641.google.com with SMTP id x15so8540324pln.9
	for <qemu-devel@nongnu.org>; Wed, 01 May 2019 11:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=/sComUGv87sauQhT7gaTU1Nhjwr3oZnxQdW/a7IN+KE=;
	b=h9IH//8w/lZ/Xp4zLI9gSESVuVsS7Ijv4ftGWZd5LR2YmCs9VDM/zRvS3pdQHooIRZ
	xgbPToo5SSpIifF5/BYOqHLnbE8xvUS3yXhKAO4XIoAMNhjH30dNoxRaNA3TkQbn05vm
	wV6WDZviLnN0/dfQJtBqcco0q8lOBuc/2fQP+kNT/AKYyaCn0B4tfsJUjeIvDK46Y1OA
	jt5C5tZ3DUKQKh38RiJNKDoce1uKbbqeK9z+xxk8FvnuEnkL1AFzg/MvRVAMVnbdx2sG
	GJNqDuwZsMnfx9DVhMTtGnX92TUoXCq5sMMUcXqVec8dtuLANSa56MU1btgVg2qjLdad
	BbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/sComUGv87sauQhT7gaTU1Nhjwr3oZnxQdW/a7IN+KE=;
	b=mhDTP6TdeXM5CQj8ni9K659KV7p5ldkAb4Jnx+HiwpsmIN6k+KCTH69l06x5Bvrv3M
	v2CSkNqPMMnUCa30knay+OgRufMd5EB9D5cOmnEY5Jia8ynUPBdlc+LjdGP+vkUc09ge
	KgkcSgSQybodWOnzsn3bFq/cqKiIFgQ5m6luyY85NaDnCp6269qFSmfQpaGKjTMiGgXu
	wVPK7o+FAZOy6+Uh2OIUj+wYQpF2AW9EDt6Mefhs6BDyV6+hvP1LkG123izifM5jb3LM
	+/HNtbV09hso20N5TltvwrA79o1LEY0jsnteAhqd/zrGM66xvJTKSubG4Cl2/lu6ewNp
	mzDQ==
X-Gm-Message-State: APjAAAWeDS35K0P0LNxX405zQVHI4HbqUNQpzR4oBToxKpDJCaj1McUv
	Vf+C4Gt8woOGATL66XZs1BnwKA==
X-Google-Smtp-Source: APXvYqy7PLLE6DgMd+d1PKCY+sVkEku0f0QpX8cH9UoYCkRKASvNXEOGpO5lrQlob+Vrv4eNFPXGWQ==
X-Received: by 2002:a17:902:968c:: with SMTP id
	n12mr33436801plp.105.1556735733635; 
	Wed, 01 May 2019 11:35:33 -0700 (PDT)
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
	by smtp.gmail.com with ESMTPSA id
	p27sm10523470pgb.94.2019.05.01.11.35.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 11:35:32 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
References: <20190430165234.32272-1-alex.bennee@linaro.org>
	<20190430165234.32272-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d4fc9a25-f382-8008-5e42-09269fd39c08@linaro.org>
Date: Wed, 1 May 2019 11:35:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430165234.32272-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-devel] [PATCH v5 02/15] tests/tcg/multiarch: add hello
 world system test
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
Cc: qemu-arm@nongnu.org, mark.cave-ayland@ilande.co.uk, cota@braap.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/19 9:52 AM, Alex Bennée wrote:
> This is not really i386 only, we can have the same test for all
> architectures supporting system tests.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/i386/Makefile.softmmu-target       | 2 +-
>  tests/tcg/{i386 => multiarch}/system/hello.c | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename tests/tcg/{i386 => multiarch}/system/hello.c (100%)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



