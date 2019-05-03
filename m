Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8E813399
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 20:26:54 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45685 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMctZ-0007YC-0z
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 14:26:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hMcsY-0006b8-Mu
	for qemu-devel@nongnu.org; Fri, 03 May 2019 14:25:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hMcsX-000662-Sw
	for qemu-devel@nongnu.org; Fri, 03 May 2019 14:25:50 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40702)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hMcsX-00064z-LL
	for qemu-devel@nongnu.org; Fri, 03 May 2019 14:25:49 -0400
Received: by mail-pl1-x633.google.com with SMTP id b3so3063990plr.7
	for <qemu-devel@nongnu.org>; Fri, 03 May 2019 11:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=sCwywVi3yGdsFSAfyNVUzaGB0Irs0J3T8M/r2b67L7A=;
	b=SfbhWUe5F7/dOTCn+Tj7pe+7hfxUOmVfqWkeDi+G8KZIymReTIFwH0IfS2NkfQQ9bl
	x6C02RAHdXInginJUSvNgnJ12TkYQAjPLDRZqNaEgm6mhILoTJwGm2wqWzcZyNq0ARPO
	7LC9k+xMS/JAjdtut62Jjf0CXR54F0p8CsmZm7UTMJd00NoKthi7/1HzyXkGA0K8+JcD
	MSngKRtL/YosB6PJcsWMxxUCjjMUZQ8nZysKwuN1KgrZU7WbY4FiYtz3pMLQbWFWx+fC
	4XhPLKmsQELU5JeouhVB73TbeHcmAVRt/UjtDNQFy13RccB9g1NTsWgD6X7wlOuy57C3
	UwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=sCwywVi3yGdsFSAfyNVUzaGB0Irs0J3T8M/r2b67L7A=;
	b=uFpKTz+1nwV671hAqNPJoi+b62LynAxBaZcfrxoEw/3lDk1/6r47/Z/JUlPGnzxdlm
	rVEEOCyH407cDI5V1tB3VEyWYu4N8wQBgrpL2DjJu/TeVTentStp4KuCYqvTyFV+Hl5v
	lK/r6um1wt61lJjl7FFAaZl5B7DLGAOc0jIFatiwtRPQhFvLIYa5sw34fLE+j2DyB7AP
	nh6qUpwuxD+7IYs9jSnJqE5osQcBiN2/6Sd7bpkG813Xy+2MR340/MOTje7bWZAQu5dC
	t0LQLY9xiJPW0kGKFtKoMccRUSZQMYutT0P83w/uCZpm74RYffylT7OLo9CHnWD4MXxQ
	kl4g==
X-Gm-Message-State: APjAAAVf35R6mVHZ9KEGfR3mTMNxWFb+si+V68he7u91+9AAZr8g8gQD
	Ig27qIQbC/iel/pb9oab2PgKuQ==
X-Google-Smtp-Source: APXvYqxusPEuGo/FM07jLXYEnI5ug6KeGTjC/UjzFGBDdpGQLzYN+6bswJzcUkV6H3kErZkBzY0+QQ==
X-Received: by 2002:a17:902:9693:: with SMTP id
	n19mr12284358plp.92.1556907948206; 
	Fri, 03 May 2019 11:25:48 -0700 (PDT)
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
	by smtp.gmail.com with ESMTPSA id
	z127sm6428982pfb.53.2019.05.03.11.25.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 May 2019 11:25:47 -0700 (PDT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190502141019.6385-1-david@redhat.com>
	<20190502141019.6385-37-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e513e687-0f14-9afc-a717-99c2e969248d@linaro.org>
Date: Fri, 3 May 2019 11:25:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502141019.6385-37-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::633
Subject: Re: [Qemu-devel] [PATCH v3 36/40] s390x/tcg: Implement VECTOR
 SUBTRACT WITH BORROW COMPUTE BORROW INDICATION
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/2/19 7:10 AM, David Hildenbrand wrote:
> Mostly courtesy of Richard H.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/insn-data.def      |  2 ++
>  target/s390x/translate_vx.inc.c | 34 +++++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

