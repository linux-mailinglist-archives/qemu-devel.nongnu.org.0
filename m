Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3978F2EF6E7
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 19:04:00 +0100 (CET)
Received: from localhost ([::1]:41940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxw7C-0008HY-RM
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 13:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxw5i-0007oP-Bd
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:02:26 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxw5g-0000Kq-RJ
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:02:26 -0500
Received: by mail-wr1-x435.google.com with SMTP id 91so9847135wrj.7
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 10:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s9oJWWPGREx+vE1i5dUT2Qev6QMmF4hYr9DKQuog3Es=;
 b=plP4sEDNazoyko2SuysH4vLtsBqFfbRZ5rpatXzBGYQmPI4lTzL0GnBxCWYXmg9YQK
 cseJSrPqaNZdfMl3e5UtdlaHLFYYl6cqVwbtEwmcruyJB/xUBhVA+DKr5mkj/AnHWIU7
 /1AAjEtFBsmfFdDfKHq9FfrdIRQvmYU8bXZDKqKwxt4k+1iaYBs0YnmJzs82YWsG4Kwi
 X+wWKLoONnngn3Dg1GXvt8ogHodMWFMxRp9BzY/hXLXQo0ojlOr6y8Rc8vpB2u+a/srb
 9VsksMzpZUlRTpr0//JH+8ogcd/sTVC2tzdRinfn5viWKwyk+jLXfRkqTwaPYcLv5RGD
 Jk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s9oJWWPGREx+vE1i5dUT2Qev6QMmF4hYr9DKQuog3Es=;
 b=mVRJSyiIPvqbJUWBomTNFAUs4Dj5XUa/QyWj8anGJxEJ+1Du7tloH0QCBkXD6mn4Ml
 jU6kVtCeJafrn1qHlhKqpPB1jeD8PralOj/Ay0gLfEgbDFaz6ebp7uV9rSlEpiQo3qYz
 S+5sOtbB3fjh4iCw8PG4Se39ghml0Q776IqqupNB/V6VbTixacVkHzToafYHLx9DPw82
 osRjFNWZ6duGBrKxfaz7cHj34WiIS6s4Q8sN/j+E/X/uwjgy+JIW6Bnbtz72heuvsfBy
 eqlQ7SJvOli++E7nvmzGgeSfWjje1XhQEzxjNgHErLs+AjjF4XXPs5uVevfGAyYgzFkm
 khbg==
X-Gm-Message-State: AOAM531t3EMgwcxGzzEoO6Ot0uEcQWz59/mFrLR2xv/BO2S+pmW5FVuQ
 rWhmuCp6OKNOXNx4POOWtWQ=
X-Google-Smtp-Source: ABdhPJyD+nsUM8Ln1T8zzTycsI0lrWxDlxqPgpDpywQdxzOvIDPDMx+D3VMFpq4s4k1edg+ffp5ZVQ==
X-Received: by 2002:adf:90e3:: with SMTP id i90mr5021636wri.248.1610128943294; 
 Fri, 08 Jan 2021 10:02:23 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id a65sm13152799wmc.35.2021.01.08.10.02.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 10:02:22 -0800 (PST)
Subject: Re: [PATCH] decodetree: Open files with encoding='utf-8'
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210108151632.277015-1-f4bug@amsat.org>
 <CAFEAcA_5YzU7sGhbVtzP7-=PsaJoe3wMxkCPnO=qdY8q6Bf7rw@mail.gmail.com>
 <9c5d25dd-6b4e-85ac-5e71-36540d1f1525@amsat.org>
 <CAFEAcA87yvTykxUGkPZaDcD0i8LN2-6Yhh_HpSrZc_ZD3dbMqw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c321eb16-5bff-ebb0-0a9f-1a6637d1c36c@amsat.org>
Date: Fri, 8 Jan 2021 19:02:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA87yvTykxUGkPZaDcD0i8LN2-6Yhh_HpSrZc_ZD3dbMqw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.241,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/21 6:14 PM, Peter Maydell wrote:
> On Fri, 8 Jan 2021 at 16:44, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 1/8/21 4:38 PM, Peter Maydell wrote:
>>> Should we also be opening the output file explicitly as
>>> utf-8 ? (How do we say "write to sys.stdout as utf-8" for
>>> the case where we're doing that?)
>>
>> I have been wondering about it, but the content written
>> in the output file is plain C code using only ASCII,
>> which any locale is able to process. But indeed maybe
>> we prefer ignore the user locale... I'm not sure.
> 
> I'm not a python expert so I don't know what the usual thing
> is here, but it seems to me better to insulate our build
> process from what the user's locale happens to be set to,
> even if it happens that we currently only output ASCII.

OK, I'll respin.

