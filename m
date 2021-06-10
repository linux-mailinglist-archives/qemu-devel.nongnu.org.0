Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC553A2D52
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:45:04 +0200 (CEST)
Received: from localhost ([::1]:46534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKzX-0004v0-Eq
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lrKtX-0001Tg-Vf
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:38:51 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:43872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lrKtU-0007SM-CF
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:38:51 -0400
Received: by mail-qk1-x736.google.com with SMTP id j62so13523282qke.10
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 06:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Fy7rBo7OpuieTwwVTqCUNhaZgsimmmRAdKqjuZMfGhQ=;
 b=BVle4fIX9Kiax4wsFsWkl8i5vAVTsBXrxPOx8168yBokKJfHM2WLgmgm2N+WgJy/+H
 pPlgOTnac+gYPH4qLwCL8OD2P29Xmwmm+dSLjU/RVMalJEhATmDVdBrPOZv++Q828vJS
 ez1oUuGvjQqbcEsLvWZn0Y4eJdAnOXS1NxWCj0ZT9j599hN7qKuVLZ7Ym0YX+3s6C/0e
 jgYgWyHmDmU4iVFql+NqutYrz7rzyOk8CrYen/1BfQwHgayehOuJjGDlE4bIQUhCjclv
 YjwUQXO1klIovBIsCNtuNqyeaNNfXxM/4ix0WbsZAuD4NCjsQ37NBdB0FP8+SU7LqjKh
 1Kww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Fy7rBo7OpuieTwwVTqCUNhaZgsimmmRAdKqjuZMfGhQ=;
 b=PMmFCc4Pwj0FvZ/6fzVmIQoMDe1O8e99AJqDqBS2BaCLMaaQLLZi1Hj+m+KEs122dZ
 lRLdvcLm6+XAliNeuafYrE50jlFliEYZc2Qe7ZglKV53nKhPAhJwiF0Bw/vhtRkpaaS0
 KaWNgTXanAdvIpiXPJkmomwzADaWt1D5014+50Vgt2NTx66MEFC9BnazUOesmboOwEC2
 6dWOeXriFFTHt61la6fobHIVdl3j26qv3sepD9jmeBv7qo+p3ZQjUr6vLpMEhXdCemjq
 l8+GBPVDGVIHzV1aVsRHDZiaQOmZ0rds1Z6XJozsYiJmWx+r5MEct7Oe7IaGhO89D2YJ
 JcZA==
X-Gm-Message-State: AOAM532fWpGBd57t4uNAscqF7mcWGmcu2zG3omqCB3YG6WtSpxJJCQg8
 gltG3Wp1/MTrFmFFoezBp9o=
X-Google-Smtp-Source: ABdhPJxW3x05eKCl67ezxUISdFOnxo791Amgh4tHr+gYHzbNc3IkFnsOTx/2bzvP3PIZoRN6ndeCxQ==
X-Received: by 2002:a37:de13:: with SMTP id h19mr4662278qkj.346.1623332327331; 
 Thu, 10 Jun 2021 06:38:47 -0700 (PDT)
Received: from [192.168.0.6] ([67.149.105.175])
 by smtp.gmail.com with ESMTPSA id 16sm2113142qtt.19.2021.06.10.06.38.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Jun 2021 06:38:46 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: tb_flush() calls causing long Windows XP boot times
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <CAFEAcA-YuyZ9kyivh1dL_chxrtvBF=jOf3L59JuroL2U-e+Xsg@mail.gmail.com>
Date: Thu, 10 Jun 2021 09:38:44 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <898FF8C0-4BE3-4EEE-B471-F4A367CEF19E@gmail.com>
References: <BCB8773B-FC54-4C25-9B60-92C263165D38@gmail.com>
 <CAFEAcA-YuyZ9kyivh1dL_chxrtvBF=jOf3L59JuroL2U-e+Xsg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jun 10, 2021, at 9:14 AM, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> On Thu, 10 Jun 2021 at 14:02, Programmingkid =
<programmingkidx@gmail.com> wrote:
>>=20
>> Hi Richard,
>>=20
>> There is a function called breakpoint_invalidate() in cpu.c that =
calls a function called tb_flush(). I have determined that this call is =
being made over 200,000 times when Windows XP boots. Disabling this =
function makes Windows XP boot way faster than before. The time went =
down from around 3 minutes to 20 seconds when I applied the patch below.
>>=20
>> After I applied the patch I ran several tests in my VM's to see if =
anything broke. I could not find any problems. Here is the list my VM's =
I tested:
>>=20
>> Mac OS 10.8 in qemu-system-x86_64
>> Windows 7 in qemu-system-x86_64
>> Windows XP in qemu-system-i386
>> Mac OS 10.4 in qemu-system-ppc
>>=20
>> I would be happy if the patch below was accepted but I would like to =
know your thoughts.
>=20
>> cpu.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/cpu.c b/cpu.c
>> index bfbe5a66f9..297c2e4281 100644
>> --- a/cpu.c
>> +++ b/cpu.c
>> @@ -253,7 +253,7 @@ static void breakpoint_invalidate(CPUState *cpu, =
target_ulong pc)
>>      * Flush the whole TB cache to force re-translation of such TBs.
>>      * This is heavyweight, but we're debugging anyway.
>>      */
>> -    tb_flush(cpu);
>> +    /* tb_flush(cpu); */
>> }
>> #endif
>=20
> The patch is clearly wrong -- this function is called when a CPU =
breakpoint
> is added or removed, and we *must* drop generated code which either
> (a) includes code to take the breakpoint exception and now should not
> or (b) doesn't include code to take the breakpoint exception and now =
should.
> Otherwise we will incorrectly take/not take a breakpoint exception =
when
> that stale code is executed.
>=20
> As the comment notes, the assumption is that we won't be adding and
> removing breakpoints except when we're debugging and therefore
> performance is not critical. Windows XP is clearly doing something
> we weren't expecting, so we should ideally have a look at whether
> we can be a bit more efficient about not throwing the whole TB
> cache away.
>=20
> thanks
> -- PMM

Thank you for the information. I think there may be additional =
conditions that may need to be considered before calling tb_flush().=20


