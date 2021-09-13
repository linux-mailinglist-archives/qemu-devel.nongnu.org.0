Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 257E34088D3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 12:13:59 +0200 (CEST)
Received: from localhost ([::1]:59428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPiyM-00013k-67
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 06:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mPivb-0006ah-O1
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 06:11:07 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mPivP-0006nB-Iw
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 06:11:06 -0400
Received: by mail-wr1-x432.google.com with SMTP id u16so13770676wrn.5
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 03:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=0AEDjCx+BSkf4ELOkTD02j+5tWPTNw088KZbwHCKXPI=;
 b=t+XoFkqs/862JXzT/Rc+k9GdZtETE//ncd4DQp5WcD2oU8oogegpGWJiWNApvrlJmC
 iT2vCOYJ3kCw5ubOLOuqIsxYVIsWwWsT77+uXwtT/aKNeWNiVQjMybx21N89bRVjaJ/G
 fjnSbWH6RWN9nxuzSwY1lFb79r54UxNOhzg6dJgpjPV0mQHTFARZXEKjpKHituLCMeNQ
 EC/o1MW+7kQ+/2IOXi2GCA7BNT61GDurL9rgeuF5r2JEgVBJR2oz/NdGrV401PGCvtJC
 APSJZHnFCUc70xTYW4l0qw6WRPt511qmLZVa/bNzkP55CjREf/wQaFi7QGpaxaG4L8IB
 Bw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=0AEDjCx+BSkf4ELOkTD02j+5tWPTNw088KZbwHCKXPI=;
 b=UjU/n2UOESZN8teeD62HVfRmDQNiIjrmiFH6pkCQQPOMfeVIHYGUH1uWdkgs+Y3oLa
 UoAx2TV1RXaldql7LzuunreCExcpmHW8en0HneP6nF8YLCxcwxL0mAOXDhpZzMJ4MMJm
 2TBJ3IEhPSbxpzXPxQLDEpSuiBCUI5XWZo9K+v2DspQw3fss3zb7iIsAvIR3oV2w9fCB
 JLtkQkNZdbdl0bnnKI4/RmRpsUbvvTLnkNn4B7W/kYizttTJEiv81voDUicehvXlPTIW
 /xWRsoCaBUwCdiJ7YAu6brnRmA3vj0E2tYQzIbw4d9SmMOF/G8kLrokcmfrElzu6LQ98
 GlNg==
X-Gm-Message-State: AOAM530JeCAZbd1UxyT2xnM1HF8NG3Kb+hfIngIo/bOOiyDc95r5PJLI
 PizHhur1YUC9S76w4CRWob/RQg==
X-Google-Smtp-Source: ABdhPJxM1fFfl9Pj9D+RSyj2554Y8wZ+ONNuUgEw5/AuJ91GueeKDCGNUkVqnfCU6Og0+QUugZkkhQ==
X-Received: by 2002:a05:6000:1b82:: with SMTP id
 r2mr10175238wru.113.1631527851025; 
 Mon, 13 Sep 2021 03:10:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j17sm6910737wrh.67.2021.09.13.03.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 03:10:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 08E9F1FF96;
 Mon, 13 Sep 2021 11:10:49 +0100 (BST)
References: <20210903145938.1321571-1-alex.bennee@linaro.org>
 <36bc7691-c0d9-9e18-dade-4d95405dcd62@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] accel/tcg: assert insn_idx will always be valid before
 plugin_inject_cb
Date: Mon, 13 Sep 2021 11:06:39 +0100
In-reply-to: <36bc7691-c0d9-9e18-dade-4d95405dcd62@linaro.org>
Message-ID: <871r5swztj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 9/3/21 7:59 AM, Alex Benn=C3=A9e wrote:
>> Coverity doesn't know enough about how we have arranged our plugin TCG
>> ops to know we will always have incremented insn_idx before injecting
>> the callback. Let us assert it for the benefit of Coverity and protect
>> ourselves from accidentally breaking the assumption and triggering
>> harder to grok errors deeper in the code if we attempt a negative
>> indexed array lookup.
>> Fixes: Coverity 1459509
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   accel/tcg/plugin-gen.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>> diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
>> index 88e25c6df9..b38aa1bb36 100644
>> --- a/accel/tcg/plugin-gen.c
>> +++ b/accel/tcg/plugin-gen.c
>> @@ -820,10 +820,9 @@ static void pr_ops(void)
>>   static void plugin_gen_inject(const struct qemu_plugin_tb *plugin_tb)
>>   {
>>       TCGOp *op;
>> -    int insn_idx;
>> +    int insn_idx =3D -1;
>>         pr_ops();
>> -    insn_idx =3D -1;
>>       QSIMPLEQ_FOREACH(op, &tcg_ctx->plugin_ops, plugin_link) {
>>           enum plugin_gen_from from =3D op->args[0];
>>           enum plugin_gen_cb type =3D op->args[1];
>> @@ -834,6 +833,7 @@ static void plugin_gen_inject(const struct qemu_plug=
in_tb *plugin_tb)
>>               type =3D=3D PLUGIN_GEN_ENABLE_MEM_HELPER) {
>>               insn_idx++;
>>           }
>> +        g_assert(from =3D=3D PLUGIN_GEN_FROM_TB || insn_idx >=3D 0);
>>           plugin_inject_cb(plugin_tb, op, insn_idx);
>
> Hmm.  This is the single caller of plugin_inject_cb.
>
> I think we could simplify all of this by inlining it, so that we can
> put these blocks into their proper place within the switch.

I guess. This was the simplest form for calming coverity but I can
experiment with more refactoring.

> Also, existing strageness in insn_idx being incremented for non-insns?

It shouldn't be - it's just using the presence of the memory
instrumentation as a proxy for the start of a instruction and dealing
with the slightly different start of block boundary.=20

> Should it be named something else?  I haven't looked at how it's
> really used in the end.

We need the insn idx to find the registered callbacks for a given
instruction later. We could maybe embed a metadata TCGOp that could
track this for us but that might make TCG a bit more confusing as it
doesn't really need that information?

>
>
> r~


--=20
Alex Benn=C3=A9e

