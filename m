Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2853E4671E9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 07:31:58 +0100 (CET)
Received: from localhost ([::1]:47660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt26u-0008Io-MP
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 01:31:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mt25S-0007dn-EC
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 01:30:26 -0500
Received: from [2607:f8b0:4864:20::1035] (port=42771
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mt25P-000518-Qe
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 01:30:25 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so1675646pjb.1
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 22:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4jONKXOMunkyiqT3MSB3vxLJydEqjGHgihDnQVNcsRQ=;
 b=QPmElWqoZ+MJiFyCMnTLFiMlQuodXv8Km3uWYdG/hnBz3izi/mQJKvQDJL00NkwoZF
 ZkAIvIefp7eiPcO0jCpFZIa23DsjiEKj7+ipeTEkI6IfLUphy/AVFWbHXUH8TN8BrFqS
 QfpnWoTajhUkq+6b4j9HiWP43Fgj3z0+XbaWgKUaYvWQ6xhW2QCyq10d908HjzkcEsMR
 DSX9cwzJ6zaWS2yKqLZXlDJ+Q1DmxpB7b9wHdubngmvqFxbjWPvNSV6JUxr5CXCOglXZ
 kb2kPhbPiArcSIgLYMufoqUqjln8oWx5agqubOYRkY7TLcOMG8lDtGxuvTkWt/mn6sVf
 Xz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4jONKXOMunkyiqT3MSB3vxLJydEqjGHgihDnQVNcsRQ=;
 b=u1CRD2d6QN6I+bOPqBNXyec7cQMXWTywsNt/lTywzFuMmsE/gzYhNpHIhvOZ+1cNre
 MhWHTBV2L/+SFrsL9q1HZ2clenroZn7JemPqtIQO2gvErBhYFvp8974qv3Cufh6fyYa3
 iB8H4fTJOlqhEZs6ZtpsYBDsBPk4RPYSIK+V82Nz2eGsjQ1WSswE2wW36EVY+92kXzA+
 j/+AfQJHTbc1iVxyrqWhlwdTzhuoYbuscABNk39e6FS2H1Ftaojs3hVVVPZbXFAOMRIs
 iRjtBQr1DBpBLlYES+qmAd9s6sODhm/+3Ficjh/0mB1ViSFmxh/JJNPU0suErKJnxKQg
 c/EA==
X-Gm-Message-State: AOAM533CNaA1lcK0c5roJWJh+WViZozK75kfMkCw36TCyd1VvGLyKnXm
 6qt6arIi2yx0qUiGfpqZq2Wa6g==
X-Google-Smtp-Source: ABdhPJxg+cEH/zua/TC+w0qO2+fNPiJcNmOUT16L9sTRDb2q5qjjJY7v3c/63N6FOvaKHq318Thkcw==
X-Received: by 2002:a17:902:c643:b0:141:cf6b:6999 with SMTP id
 s3-20020a170902c64300b00141cf6b6999mr20821735pls.80.1638513021354; 
 Thu, 02 Dec 2021 22:30:21 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id p124sm1757886pfg.110.2021.12.02.22.30.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 22:30:20 -0800 (PST)
Subject: Re: Suggestions for TCG performance improvements
To: Emilio Cota <cota@braap.org>, Vasilev Oleg <vasilev.oleg@huawei.com>
References: <c76bde31-8f3b-2d03-b7c7-9e026d4b5873@huawei.com>
 <CAJY1Aq7-J+nnf1k_HdbUnc3mJvua0VHYPNMokCKeitG1ZbH91g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <abd0ca8a-6272-cf5a-f841-272c40d7f654@linaro.org>
Date: Thu, 2 Dec 2021 22:30:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJY1Aq7-J+nnf1k_HdbUnc3mJvua0VHYPNMokCKeitG1ZbH91g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.938,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Konobeev Vladimir <konobeev.vladimir@huawei.com>, "Chengen \(William,
 FixNet\)" <chengen@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Andrey Shinkevich <andrey.shinkevich@huawei.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Plotnik Nikolay <plotnik.nikolay@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/21 9:21 PM, Emilio Cota wrote:
> On Thu, Dec 2, 2021 at 4:47 AM Vasilev Oleg <vasilev.oleg@huawei.com> wrote:
>> The mentioned paper[4] also describes other possible improvements.
>> Some of those are already implemented (such as victim TLB and dynamic
>> size for TLB), but others are not (e.g. TLB lookup uninlining and
>> set-associative TLB layer). Do you think those improvements
>> worth trying?
> 
> I cannot find the emails, but I do remember that Richard wrote tcg-i386 patches
> for uninlining TLB lookups. Unfortunately they resulted in a slowdown on
> modern machines.

That code is still around at
https://github.com/rth7680/qemu/tree/tcg-softmmu-ool


r~

