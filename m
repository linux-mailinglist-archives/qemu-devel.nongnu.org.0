Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2D333D52B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 14:50:50 +0100 (CET)
Received: from localhost ([::1]:50318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMA5x-0003nQ-9n
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 09:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMA4m-0003KH-6i
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:49:36 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:40155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMA4k-0006gq-BY
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:49:35 -0400
Received: by mail-ej1-x634.google.com with SMTP id ci14so72099929ejc.7
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 06:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=bliEo6AsGaYGpQiZfkkwHH5mQXxRMrDUsFRH++MowOA=;
 b=CaUBxFOjfJpynT4Vm9jCI9QbjOJoSaFrJcvUCU6pXQteE8ZUKOAmSjG/OHfbYR3yV9
 I12T8X9RxypglNJ1f4YLFPNYYf+TnESnlfFCM9Uti8zfcAd10OIGqrXp7khU2Apeeu1o
 MCTpdVmWuoB46/Qz+4JKxpEhigJEaEefxmfdjK0CQsrI/+p/+o1Yx3E5lMoYT10S5WAX
 5JuAz0RLPrUnYUqsEcuXzNVbc9Vmgpbwrgb0ifgmJVAKYKS0dTZUETdUqVRxkEOYcUkd
 JJ5E7bm03Tki6Ys798RhnC0X0z3bE1RVOOVLLzJuUueUgE+ugFFwmBiBR55bufOkZihe
 5L0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=bliEo6AsGaYGpQiZfkkwHH5mQXxRMrDUsFRH++MowOA=;
 b=dYzVHC3h25iQuWeml82C81bGGm8PHng38KDxCh9wBzCQ801t7/qV5CD0BR5gy2UYQh
 0UfLHe98v84Arj1Yl+GMLPWmtJsNWQ84Na+8HrlaCHZ+7BI5QD/Ea5lY0EpdbYHE7UqX
 p4d1kBjpNokvc+u2yFl2C1hhnJeDfOgV5H4mX1Y87TCSUzJN7IG7cnOncF96wdUTBge6
 3xssDZK4tbNrnY2YvVkLD2aVAIl4as/y+Sqyvh/bh+kUi+h0aQNX5+rLDaZ5w7W/wG/C
 3P4i7hCIQwbbfuAZYvAH2esc7Wt2RYdCcDDW3AwMPRCkw22kb3/CpnJWv1Ef2iAlzeO6
 DLqA==
X-Gm-Message-State: AOAM530CUHWaJb7QaXVMo9BZs/wWgXwPrT440qaKiQVnsX7JPTA2VR1v
 j4lHveOJPjo2E6/Ek7CE8We3eg==
X-Google-Smtp-Source: ABdhPJxdhbrT5bYfun+vbCApiGmqaqXg5yZvlvu0UJSzJcKbQ0hNi7IUam5Ufs3oge9cpc6MryZz/w==
X-Received: by 2002:a17:906:38da:: with SMTP id
 r26mr30544024ejd.251.1615902572680; 
 Tue, 16 Mar 2021 06:49:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l10sm10462700edr.87.2021.03.16.06.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 06:49:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 09B651FF7E;
 Tue, 16 Mar 2021 13:49:31 +0000 (GMT)
References: <20210312172821.31647-1-alex.bennee@linaro.org>
 <20210312172821.31647-12-alex.bennee@linaro.org>
 <YEu0yfHSph9x33/T@strawberry.localdomain>
User-agent: mu4e 1.5.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: [PATCH  v1 11/14] plugins: expand kernel-doc for instruction
 query and instrumentation
Date: Tue, 16 Mar 2021 13:48:44 +0000
In-reply-to: <YEu0yfHSph9x33/T@strawberry.localdomain>
Message-ID: <878s6n8az9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: kuhn.chenqun@huawei.com, cota@braap.org, qemu-devel@nongnu.org,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> A few clarifications inline:
>
> On Mar 12 17:28, Alex Benn=C3=A9e wrote:
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  include/qemu/qemu-plugin.h | 52 ++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 50 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
>> index dc05fc1932..d4adce730a 100644
>> --- a/include/qemu/qemu-plugin.h
>> +++ b/include/qemu/qemu-plugin.h
>> @@ -327,21 +327,69 @@ void qemu_plugin_register_vcpu_insn_exec_inline(st=
ruct qemu_plugin_insn *insn,
>>                                                  enum qemu_plugin_op op,
>>                                                  void *ptr, uint64_t imm=
);
>>=20=20
>> -/*
>> - * Helpers to query information about the instructions in a block
>> +/**
>> + * qemu_plugin_tb_n_insns() - query helper for number of insns in TB
>> + * @tb: opaque handle to TB passed to callback
>> + *
>> + * Returns: number of instructions in this block
>>   */
>>  size_t qemu_plugin_tb_n_insns(const struct qemu_plugin_tb *tb);
>>=20=20
>> +/**
>> + * qemu_plugin_tb_vaddr() - query helper for vaddr of TB start
>> + * @tb: opaque handle to TB passed to callback
>> + *
>> + * Returns: virtual address of block start
>> + */
>>  uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb);
>>=20=20
>> +/**
>> + * qemu_plugin_tb_get_insn() - retrieve handle for instruction
>> + * @tb: opaque handle to TB passed to callback
>> + * @idx: instruction number, 0 indexed
>> + *
>> + * The returned handle can be used in follow up helper queries as well
>> + * as when instrumenting an instruction. It is only valid for the
>> + * lifetime of the callback.
>> + *
>> + * Returns: opaque handle to instruction
>> + */
>>  struct qemu_plugin_insn *
>>  qemu_plugin_tb_get_insn(const struct qemu_plugin_tb *tb, size_t idx);
>>=20=20
>> +/**
>> + * qemu_plugin_insn_data() - return ptr to instruction data
>> + * @insn: opaque instruction handle from qemu_plugin_tb_get_insn()
>> + *
>> + * Note: data is only valid for duration of callback. See
>> + * qemu_plugin_insn_size() to calculate size of stream.
>> + *
>> + * Returns: pointer to a stream of bytes
>
> Maybe this could be a little more explicit, something like "Returns:
> pointer to a stream of bytes containing the value of this instruction's
> opcode"?
>
>> + */
>>  const void *qemu_plugin_insn_data(const struct qemu_plugin_insn *insn);
>>=20=20
>> +/**
>> + * qemu_plugin_insn_size() - return size of instruction
>> + * @insn: opaque instruction handle from qemu_plugin_tb_get_insn()
>> + *
>> + * Returns: size of instruction
>
> size in bytes?
>
>> + */
>>  size_t qemu_plugin_insn_size(const struct qemu_plugin_insn *insn);
>>=20=20
>> +/**
>> + * qemu_plugin_insn_vaddr() - return vaddr of instruction
>> + * @insn: opaque instruction handle from qemu_plugin_tb_get_insn()
>> + *
>> + * Returns: virtual address of instruction
>> + */
>>  uint64_t qemu_plugin_insn_vaddr(const struct qemu_plugin_insn *insn);
>> +
>> +/**
>> + * qemu_plugin_insn_haddr() - return vaddr of instruction
>
> Copypasta: s/vaddr/haddr/ ?
>
>> + * @insn: opaque instruction handle from qemu_plugin_tb_get_insn()
>> + *
>> + * Returns: hardware (physical) address of instruction
>> + */
>>  void *qemu_plugin_insn_haddr(const struct qemu_plugin_insn *insn);
>
> Is this the physical address of the instruction on the host or target?

target.

>
> -Aaron


--=20
Alex Benn=C3=A9e

