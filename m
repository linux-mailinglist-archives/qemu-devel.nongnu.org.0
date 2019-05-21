Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 394F825089
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 15:36:05 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53989 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hT4w0-0003gG-CI
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 09:36:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hT4t1-0001f9-KP
	for qemu-devel@nongnu.org; Tue, 21 May 2019 09:33:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hT4t0-0007BU-RZ
	for qemu-devel@nongnu.org; Tue, 21 May 2019 09:32:59 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:38883)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hT4t0-0007Ah-L4
	for qemu-devel@nongnu.org; Tue, 21 May 2019 09:32:58 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id x7so2934563ybg.5
	for <qemu-devel@nongnu.org>; Tue, 21 May 2019 06:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=lfPw/jqfqI1MOHgOT3/ZT38Vvjh74mn4kpYF0uEBCrY=;
	b=IhPUjMbLKQi1lUuBUP8p4uSfiAfKjdRGBjY6RAS950cgMBJxn3yobL+wKnNkTxTdK3
	YcunpbWrLfKkaaZJGECdiYmL2iSmqfP4b22FAPmgiEbrKM8mgTxq1qRqoOz67kHWQ73C
	eZdqfZzRW3FYJh5dhEKR52zrL2j7N5g5+iMVw5f3errF8DT4mCJTj6I7pr2JS+FFIjif
	FqXfaBqIOGcGpPQvpG1kF5TwQY1LMil2M0E6sYH2l6Uz7XGWM1v1Jz3PD+aGdmRO0+Sk
	2xncfu0gGQeixN6sOP4wqCOfe/1X43QbfF1nrEkNQ0brkWsDjWVPGgTX8idua1nHyZK3
	PleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lfPw/jqfqI1MOHgOT3/ZT38Vvjh74mn4kpYF0uEBCrY=;
	b=P01vpUi+q28SVlXGvT2Iv/G4ha7MEf4JUBAzwwMABoId0rqKLUZcsrwtcX31ea5L10
	VdTSoH6nF3KhMIaN/Kcu1K1M4JPqGUQSEV6VldT/QFpDYcAZL49rCOHJ4ORuQ3bcydd7
	SxeOMvzWUcAiAFEAnPKbS62sv39xrLAisdCtvTsKTe3qedXPnLk9zTrj7WyXl/uadRu9
	dWDtcwhujSlO94xmXdhSd3XWoSsaoaVvx6extHbSvXK14NH+uILJAHrCr64qadOtPFZ1
	9YTT2A/mpKaX8MEWEiqaEU1MjJuqnSK5cFsB3SLs/4Einc4oy6pzr6HABb0MpYq7iywi
	Y44A==
X-Gm-Message-State: APjAAAV6trQvyT82zcDdpyPeoRDVqESWOEqr+yWrwGeHNVvvnB+2puQ6
	9LbFOS8RkxRee5J3miJCLKcnTFMlRgI=
X-Google-Smtp-Source: APXvYqx9otgzL1u3X1Zq9mYHiyfchtxqVsFghBJGS9aCeg/LE05iflkSgugpxhduDgblRC7MjectUA==
X-Received: by 2002:a25:9b87:: with SMTP id v7mr6283533ybo.336.1558445577630; 
	Tue, 21 May 2019 06:32:57 -0700 (PDT)
Received: from [10.240.180.184] ([71.46.56.58])
	by smtp.gmail.com with ESMTPSA id
	q22sm5822709ywa.46.2019.05.21.06.32.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 06:32:56 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190517224450.15566-1-jan.bobek@gmail.com>
	<20190517224450.15566-8-jan.bobek@gmail.com>
	<87zhnhgw1c.fsf@zen.linaroharston>
	<CAFXwXrkiShudOkAKks7VwB5-tUskeY1pfSeftvS8n=ez8Zgeog@mail.gmail.com>
	<87h89ogoo0.fsf@zen.linaroharston>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <eb8797f0-c615-e60d-0bb4-990e08901883@linaro.org>
Date: Tue, 21 May 2019 09:32:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87h89ogoo0.fsf@zen.linaroharston>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::b2d
Subject: Re: [Qemu-devel] [RISU v2 07/11] test_i386: change syntax from nasm
 to gas
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
Cc: Jan Bobek <jan.bobek@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/19 5:08 AM, Alex Bennée wrote:
>>> We probably need to zero or reset the xmm regs both in the test and when
>>> risugen dumps it's preamble.
>>>
>>
>> That gets fixed later in the series.
> 
> So it does, but I'm still seeing the test fail when played back :-/

Um, no, I mean this test is extended in patch 9, exactly how you suggest.  Are
you trying to run the test as seen in patch 7 against the final series?


r~


