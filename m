Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAD01810CB
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 07:34:07 +0100 (CET)
Received: from localhost ([::1]:45364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBuwQ-0000qU-Ho
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 02:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55158)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jBuuj-0007xm-8A
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 02:32:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jBuui-00068H-A6
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 02:32:21 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:54987)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jBuui-00066z-3X
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 02:32:20 -0400
Received: by mail-pj1-x1041.google.com with SMTP id np16so460507pjb.4
 for <qemu-devel@nongnu.org>; Tue, 10 Mar 2020 23:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ac76EYfa8I/ofFRcs2KP/3MRq6YXoE2EhLLyf3SpKns=;
 b=QsYcRI8dgap3Yy/jXCZIJPyXBTRzjH058w3wlSkraZ7NHSA3hZ8GBFQSFxlamw1EF0
 WnsloYKUMjGxsMEaThCXXxvuuk6BG3fXyyhvUEhO+xEmV7bfTbn24ST1VTf3Kv6dmWY5
 zE6pfcqnTZQ93LveLbMpxhqnZlXF76/9HKHcr7+lfM0KnmTsId0RqlSncVX06IL64xDW
 ynOJtd3/htCp4Ig2nWIPLH2Y2MYUbNtF0IuxeszQSedUkE6xpd0eswj78afpMH96dRqX
 WEodgbXdqh/uC8zWbk2j8nESDawJkDEADYi74+rhZdsMHqDnmWQaFDOEOechKnAVrj8k
 f0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ac76EYfa8I/ofFRcs2KP/3MRq6YXoE2EhLLyf3SpKns=;
 b=gjLV05d2fqW9CXzZLcaJnYSbwWxzjnjyMD3OfGjMsLMrwdIg59T3QUupR3JBEXplmO
 lBe25HEq2i8yikwtSplc5OyKpXDVEhCkw2jmYqGU5XcbQcD815S0RyC0+RPkDhcDRlcK
 CWb30PZGia6G5X1+RQEPzVnSTy1mDZZtuvSopdiLgbrI55rrrfVC4z34Cs8CHlDgqy+t
 AOwmc2bAWclTVNSFSrSaLy6RTse8y8nAs3NtgRMjpfi8p7z++24erp+nckW3kLZOATTv
 WyW2qMEwid9YG1hppclE+63n8JbMU7dFe06i3N/9e2jBaTCZGEBGoiwuWvs4vs/uYs7i
 dtiA==
X-Gm-Message-State: ANhLgQ3E89/oQPy8NkyYCqp7yeFpm5E4njO5khuBc40Bitg0UzalbLOU
 l50y0LimPiAITNJYJpQ9DaBiLg==
X-Google-Smtp-Source: ADFU+vtgxNGt1rMwafVgCEpgY5CGWL/H16si12DbtRFP6uG+J+86ErrxBNey/U1um0rwe9J1M2inRQ==
X-Received: by 2002:a17:902:6bcb:: with SMTP id
 m11mr1745455plt.10.1583908339251; 
 Tue, 10 Mar 2020 23:32:19 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 ce13sm4299326pjb.1.2020.03.10.23.32.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2020 23:32:18 -0700 (PDT)
Subject: Re: [PATCH v4 18/18] Remove texinfo dependency from docker and CI
 configs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20200309154405.13548-1-peter.maydell@linaro.org>
 <20200309154405.13548-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c3dee39d-bcd5-3e23-8149-be4f8b03050c@linaro.org>
Date: Tue, 10 Mar 2020 23:32:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200309154405.13548-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
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
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/20 8:44 AM, Peter Maydell wrote:
> We don't need texinfo to build the docs any more, so we can
> drop that dependency from our docker and other CI configs.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  .travis.yml                                | 1 -
>  tests/docker/dockerfiles/debian10.docker   | 1 -
>  tests/docker/dockerfiles/debian9.docker    | 1 -
>  tests/docker/dockerfiles/fedora.docker     | 1 -
>  tests/docker/dockerfiles/ubuntu.docker     | 1 -
>  tests/docker/dockerfiles/ubuntu1804.docker | 1 -
>  6 files changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

