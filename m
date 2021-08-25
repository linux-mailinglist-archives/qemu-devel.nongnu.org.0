Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C313F75CE
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:22:42 +0200 (CEST)
Received: from localhost ([::1]:57800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsrZ-0008Ip-Cl
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIspn-0005Dk-SO; Wed, 25 Aug 2021 09:20:51 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIspm-0000gn-8O; Wed, 25 Aug 2021 09:20:51 -0400
Received: by mail-wr1-x42b.google.com with SMTP id h4so6248759wro.7;
 Wed, 25 Aug 2021 06:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/KdQXas9va79JOV4T3BgQ0mUfBENCmT1YqzASFi4ArE=;
 b=cf7pLArjoH4kX3Hmy/1pd0Yv2t+Ykq5wkmoPEvfjK/UhL6DNr8PwVbGho6cJpPT1U2
 xffbCTTyWCgglNqnRRp4KdqmbOF7g2zFsJslfz9A0xQCvZC35TD+6J0AV569CRU+kawx
 Oq8bmhYOoLNimEJYylA5068LxfZcxbLr+Py9XG+DmU0uoFSBeKK/lE4uO4iWuIIl+2us
 +kkXnDg0iuMyofGYcOHvcmxmlrGy51elgGQyJWiOvzqT6PUAIkgwEywfFl0mrWeNfty1
 tfW7FzXJBQYkk5xjJOuwYWk4TVQn4ksRp9VZuv2OWCsRYmU9e1esH29A6O5njbZiJak0
 G9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/KdQXas9va79JOV4T3BgQ0mUfBENCmT1YqzASFi4ArE=;
 b=RECnZLjNe2hoXZ3DI7Qn9E35zb6XBMMCy1pAqNNYOq5tIg0jP+4E58BGlzlsqqkd8e
 PKXl/HJC7mx3kAyUpxBrkirNwSFOZd7ORr2HReo0O6r/auScRSGMMt9ymFV+Y3S3v/Z4
 uzPPNYxfehc/NtYxXgFiLgkWkxwP1JprPMWI3FCEJIyZm2pmMCWLrjQ0MRHUCCopzpl5
 kAhdYdcGtDRgATrmhRQZvFoHQr/oC7ECV3I4dLxhYESfoEijwvA+7RcVBe91Lag2a258
 NR1ALJSFuFsMYNsPxY3WiE7xI1UK6QNzWMHgEM6MB5ApzLc6FuM9eTY2pFCuKG7/b5my
 aAdQ==
X-Gm-Message-State: AOAM531CV9G5TxKZa9lIccGe82xyPVvaXii15++THp6VeyXbmoQvK89X
 ifjuQZyyasEBcjD1JBZMOoA=
X-Google-Smtp-Source: ABdhPJx1avHzX5d5aBnv1vJHpd9oEg7R9Mluu0eA9PNSeqjW1AJ3f7j8VUf1dIzbmROmk2Nb9OOFZQ==
X-Received: by 2002:a5d:634f:: with SMTP id b15mr5179970wrw.220.1629897648468; 
 Wed, 25 Aug 2021 06:20:48 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id f5sm5289572wmb.47.2021.08.25.06.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 06:20:47 -0700 (PDT)
Subject: Re: [PATCH 19/19] target/ppc: Move ddedpd[q], denbcd[q], dscli[q],
 dscri[q] to decodetree
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210824142730.102421-1-luis.pires@eldorado.org.br>
 <20210824142730.102421-20-luis.pires@eldorado.org.br>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <92265fb3-dc67-c505-114a-b9926d907a44@amsat.org>
Date: Wed, 25 Aug 2021 15:20:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824142730.102421-20-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.24,
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
Cc: richard.henderson@linaro.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/21 4:27 PM, Luis Pires wrote:
> Move the following instructions to decodetree:
> ddedpd:  DFP Decode DPD To BCD
> ddedpdq: DFP Decode DPD To BCD Quad
> denbcd:  DFP Encode BCD To DPD
> denbcdq: DFP Encode BCD To DPD Quad
> dscli:   DFP Shift Significand Left Immediate
> dscliq:  DFP Shift Significand Left Immediate Quad
> dscri:   DFP Shift Significand Right Immediate
> dscriq:  DFP Shift Significand Right Immediate Quad
> 
> Also deleted dfp-ops.c.inc, now that all PPC DFP instructions were
> moved to decodetree.
> 
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
> ---
>  target/ppc/dfp_helper.c             | 16 ++++-----
>  target/ppc/helper.h                 | 16 ++++-----
>  target/ppc/insn32.decode            | 28 +++++++++++++++
>  target/ppc/translate.c              |  2 --
>  target/ppc/translate/dfp-impl.c.inc | 54 +++++++++++++----------------
>  target/ppc/translate/dfp-ops.c.inc  | 40 ---------------------
>  6 files changed, 68 insertions(+), 88 deletions(-)
>  delete mode 100644 target/ppc/translate/dfp-ops.c.inc

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

