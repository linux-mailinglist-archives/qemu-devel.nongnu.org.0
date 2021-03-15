Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FA733B4A0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 14:34:08 +0100 (CET)
Received: from localhost ([::1]:40026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLnMF-0001Lz-RC
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 09:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLnK5-0008Tm-Fr
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:31:53 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:34567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLnK3-0006Y8-05
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:31:53 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id g8so7717657qvx.1
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 06:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gtlkcae0oNXb+6CgRU/UcxKfmyHLBPkdbv6FpKJY7Iw=;
 b=PmD1Jr6KW2d55vP/HAJZnFPYfvO+GL7tt32Yxa3HRENEhq7sHQ0qV2MGlPwdjfYjFP
 6q6utivnOZuUE3i+EUzytn8Qf+0j5+f9nE1MkQ1QNy6+57uwJDQSSlcwg8aI+vGAYDCM
 JA/GiRlOG2ZumEY+cME/HIqAiDhCB83zonNP7Ev9bzpwFTEK/HDOKTweXqJRvQcNHQfV
 9WFKhq+GBOh1FEuyVVZnrMsX+0Lf+vmA32YYL0v5zkrwdEE6ZZyGTEUyqoZgczD/sD2K
 Q8Acp58PSvLCewIQ3ySSWN3NfLcqgLWuILtka6y5OqDAa11ufrqxnuVd25aCZX5qYLV8
 chXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gtlkcae0oNXb+6CgRU/UcxKfmyHLBPkdbv6FpKJY7Iw=;
 b=kK4UyIqz6B5J6vKaYtmajuit7eNr+adhXZNxY1kgYOMP5IHEXUvp7gaXKduBeHkCqF
 Q+qRJNytpTksHxvno1w0Y+vL0lf++HKQWAZvULLAHV2qAclfoK+OvIQ3iovxvWmoGkrC
 dEVSN1BPIjiupYnZQN2Z//KD5TLELQy2VQ6WPNofFqStbQ9hR9YcUx30jTWrHdGU8hpX
 /GAR+0Rs7utcBFlWvVDN0953OhQuQ7Vovh0RO+QI5dogg9RNJyMIvwXGyG/qMaz2GN8k
 gcjN1B3AY00dTxS+FPjIDULles23KWUFkqbU36PHzOXwPVtBoR7WQz0VoqMr/wkoRkv9
 Omdg==
X-Gm-Message-State: AOAM531KXZggcbimBqPzp36B6YC0BYREKDJBrY0q33eZuemvjVgoxMuf
 VNIGBxrCh6OsivfZDlCNrVeXLg==
X-Google-Smtp-Source: ABdhPJxS1Gp3d280FjiKhjAC8ie2HWeHtc+s+vjfYXupa5HBlcp24kI13oNeVSgooDuFPcpg0VTsRQ==
X-Received: by 2002:ad4:5ce8:: with SMTP id iv8mr10678675qvb.16.1615815109926; 
 Mon, 15 Mar 2021 06:31:49 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id j2sm11975883qkk.96.2021.03.15.06.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 06:31:49 -0700 (PDT)
Subject: Re: [PATCH v8 29/35] Hexagon (target/hexagon) translation
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-30-git-send-email-tsimpson@quicinc.com>
 <152e99c9-675a-1fc8-c44c-e80d5af8ce70@linaro.org>
 <BYAPR02MB4886C193F014511DDCCDC7EADE6D9@BYAPR02MB4886.namprd02.prod.outlook.com>
 <889ed981-29e6-357d-48ae-6d3bb8f63ff3@linaro.org>
 <BYAPR02MB4886A6D9B6D4D88253B5FC2BDE6C9@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0a46f441-2eb4-5ef9-24f1-181301156fbe@linaro.org>
Date: Mon, 15 Mar 2021 07:31:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB4886A6D9B6D4D88253B5FC2BDE6C9@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/21 9:06 PM, Taylor Simpson wrote:
>> Yes, but DISAS_NORETURN still means we've already exited.
>>
>> Just like calling abort() in C means that we won't reach any following return statement.
> 
> Then I'm missing something because the code emitted here does get executed.

You really are missing the point.

The code emitted here, for the NORETURN case, gets executed?  How do you know? 
  And if so, then *something* is returning when it shouldn't.

The stop hook is for the use of all of the *other* DISAS_* codes, for which we 
have not yet exited.

There should be *nothing* to be done for NORETURN.  We have longjmp'ed away to 
the main loop already.  Anything that needed to be done must have been done 
before that point.


r~

