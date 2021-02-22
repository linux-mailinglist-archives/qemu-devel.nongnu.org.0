Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABAC321C8F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 17:15:03 +0100 (CET)
Received: from localhost ([::1]:35824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEDrS-0005bK-ND
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 11:15:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEDl0-0000Aw-SX
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:08:22 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:35648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEDkz-0001EA-8G
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:08:22 -0500
Received: by mail-pj1-x102a.google.com with SMTP id e9so9381751pjj.0
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 08:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/5VoDrk935gUYrCSK+DLafccl+QITcM2kqEirTrV8Gk=;
 b=zd5V2/wnnQkDGeRetFzus0vTUhtxpNs525olu8paQLdfLVlMuqZ4G+Qnh6wzUFJRlt
 WDv+LoIEV1U94vlRWQS405RA0f6JZyY9FQS/cnHfamMEOlBfawth6o6z5JLSPbAqxfHo
 0VsUgpGUKeVRo2UF/D4ApzxAK6gW86z5u4s2tJzNIa2eNvFNcrEuIHxblpU9L0kbTnE7
 VlHve7TfWfdQGfnRI/SB7srD1+YwsyxZuPy7qbis43ijqt0LfE/kTTZzN/POX1WE5h96
 wD249+nMM3QCilF/BjIlNTx5UmnONvJjkdNy7BXB2/QaxJ7os6662k+ZtmT4M6Df/loE
 o8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/5VoDrk935gUYrCSK+DLafccl+QITcM2kqEirTrV8Gk=;
 b=GQ1fU2Nhq5E/uuPgeozyQbPHYFEiRRte+7j7rnCPwOFQJN0V+0W0b5LL91p89atiPT
 WSgdG7VvE8WmgEECJrRUUQOCBDM/sm/iGg4dvoS0w6vG151WBHLMP5UCzjqBUKq7e6Vu
 zJzhWQ369eSgvmQlGEkaYtsJfAvVWJZVP7llVoUqeka1nlPlqlJ7TpreE4507XhZQia0
 wbevHe+LzCBl8O2pa8cfngAiHozLRqFznNQg/mOSKlI59HEDu7k4dNQ3Bx9nAClc0Dvh
 p3kM0zsy9uyzktlq7Y8rD6pn9y9l9BMKgnjZb1syg3c0sca5Oo71YWpNk9dWZcGgjUVb
 z1HQ==
X-Gm-Message-State: AOAM532Y3u/c6WHQow2ZhsIqzFcWEv6Vv8AvwmKK61Lbn8h2zDd1Uu1D
 54wYASilo0jdm6JgKI69xL0IeDJbsv3A4g==
X-Google-Smtp-Source: ABdhPJwB43v4B99+0c7jtl4yFE8i4xKZ/LjfBsSzpnwUSfcSizrxXihCl2hOKRBucP+m2iMHzrc/ew==
X-Received: by 2002:a17:90b:1bd2:: with SMTP id
 oa18mr23592251pjb.80.1614010099661; 
 Mon, 22 Feb 2021 08:08:19 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id y72sm7037882pfg.126.2021.02.22.08.08.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 08:08:19 -0800 (PST)
Subject: Re: [RFC v1 00/38] arm cleanup experiment for kvm-only build
To: Claudio Fontana <cfontana@suse.de>
References: <20210221092449.7545-1-cfontana@suse.de>
 <80a645c4-866c-2791-ac9c-91118018a44c@linaro.org>
 <1ae56383-7664-c2df-9402-97844cfbeade@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <16621e3a-bf32-8032-501e-f1aa3c37aff4@linaro.org>
Date: Mon, 22 Feb 2021 08:08:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1ae56383-7664-c2df-9402-97844cfbeade@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 12:43 AM, Claudio Fontana wrote:
> Regarding terminology, I think the mismatch is throughout the code right?

Yes, e.g. the top-level softmmu/.


> So many of the existing "softmmu" files and directories should actually be
> called "system", or "sysemu" to match include/sysemu right?
Yes, please.  Let's not add new mistakes.

> Maybe it would be good to have clear documentation about this in devel/ to
> use as a reference and end-goal, and then we could do a pass of the whole
> code to fix the discrepancies in the use of the terms?
I suppose.  Where do you suggest adding those couple of sentences?


r~

