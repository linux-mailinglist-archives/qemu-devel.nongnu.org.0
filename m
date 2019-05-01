Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88051099F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 16:52:15 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60259 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLqak-0006ud-Rx
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 10:52:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLqYh-00054X-G3
	for qemu-devel@nongnu.org; Wed, 01 May 2019 10:50:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLqYd-0003OG-OL
	for qemu-devel@nongnu.org; Wed, 01 May 2019 10:50:07 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:38898)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hLqYa-0003Mm-9E
	for qemu-devel@nongnu.org; Wed, 01 May 2019 10:50:01 -0400
Received: by mail-pf1-x441.google.com with SMTP id 10so8712541pfo.5
	for <qemu-devel@nongnu.org>; Wed, 01 May 2019 07:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=vngxxiBuBCpR8wMkrsvBxUI/lFGOTOf4+7dk9kWqZQc=;
	b=UImnQXBm7N5q7nXsAeg520vVFv+Sk7qSeHxl/g5mjLrrVTbUXpVoCNneipBA0Q4t2g
	KzPOxa/kojbZlSJOOlnd6syoPRMV0DCaRZaIMl7qBQOUS6V4/SPC7XMS4Q5u6SiULLna
	lQBunzBbh3uEmsKE3AGg64yNnGVjE4DThxdjkWVK8ic0nMJGMUp81Jg6IBxC/ehPAGmE
	orRTE9qOKxMMvZt+PVY5I8nfMn4wY8ARMoGL2/9tNcQh9/TNwX8EaPtGRB4zD818aQDA
	CUe6z3m6fzREhPgewUxUIOGqaNBeCvn9GK6Yszp9t/TTVGudvjecLFu2AharKXwt815w
	KlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vngxxiBuBCpR8wMkrsvBxUI/lFGOTOf4+7dk9kWqZQc=;
	b=S07dCgHrDiT94bM1ofYuwW4zQqxXkiz/6hS6V9xQfGweEvMsaNVE7RB4biJdK1h7sk
	IF9XycdYvMqjk1zkMDfI6hKAel29jRnx4b9NSEt9gV1zG4UvgIcLPK+vVF2awkEgSGmz
	IX/Vy5Ucn0JB8h5jVz9ix5FJfH6Ux4eX9seqfjBqacBUzPB6ITH3IBfvJY+z8F+cXX/l
	vJYhWrBfLgej1sQ+1nkfPIVfoUNrISbQTJ4w+btemuC4biQi7fNHcgTpHgji65r6KNwj
	051BzOTMlC6a5YNyBf7W8lfp1z/2+KvHfG2ld28KPiczSyQXG7+M7IJ5ovs888kFRm1E
	wOng==
X-Gm-Message-State: APjAAAVOacpBCgP+dctCcG4nYGUUbp4gDqAw3mOU7MVVYzjPPfrEz7Uw
	cbHaHvg8bv9CCMJYsMRQs9U/zQ==
X-Google-Smtp-Source: APXvYqwPavvf3K4moSXgWk8WmwNq1WelGFYOmAc9JSaavLw34VhnALfXcLuVk9Q6PsRl7tu7nmbOlQ==
X-Received: by 2002:a63:b507:: with SMTP id y7mr41602648pge.237.1556722198922; 
	Wed, 01 May 2019 07:49:58 -0700 (PDT)
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
	by smtp.gmail.com with ESMTPSA id
	10sm52496247pfh.14.2019.05.01.07.49.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 07:49:58 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
References: <20190430165234.32272-1-alex.bennee@linaro.org>
	<20190430165234.32272-15-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6b54a7c9-c455-c1d5-371a-de67ad517c9f@linaro.org>
Date: Wed, 1 May 2019 07:49:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430165234.32272-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-devel] [PATCH v5 14/15] Makefile: include per-target
 build directories in coverage report
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
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


