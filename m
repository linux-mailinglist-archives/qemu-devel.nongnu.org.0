Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A1A372798
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:53:13 +0200 (CEST)
Received: from localhost ([::1]:52532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqno-000719-Pg
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1ldqll-0004Me-ON; Tue, 04 May 2021 04:51:06 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1ldqli-0003xp-Hr; Tue, 04 May 2021 04:51:05 -0400
Received: by mail-pl1-x629.google.com with SMTP id n16so4371467plf.7;
 Tue, 04 May 2021 01:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=GwOWE3+oTM/pZH6kslaRO3/ZPeYaBX9lIAQmHNvIVlQ=;
 b=p/zNvF95q1Tix9RoEhKnrMJ3+8rD7lKID5L8kYcvuNXibKTXw6vT4V2euIbMAs9BTg
 dACzm2inX9YFUUrLF9poMBA+YS3OifrQ69HBK8PGWEgqf8BuIMIgskUSpnom+Ml/fGEU
 /z2bx7DVEPTK3GeJyxAv9fsOblpinDRCsVkm5dX+ClP0mkf1uAVPLpeMRyhuUle+cM8K
 mvF8bcqLVkZ+ytV6K36E2zA0Zpudl8ptNNxcNreaBtNrU2cxwxASlCF79Z+TVFLaMbYb
 cwnPbtrWo1V/lOF7TcsODf87kI69XLOTPI+Hid0/98iAEdhvngbaywe8sjTxmZWbEMF1
 OZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=GwOWE3+oTM/pZH6kslaRO3/ZPeYaBX9lIAQmHNvIVlQ=;
 b=aMk5EfH6ukQO4YtCWQlkG+VcM7X+yezaLXmuVg+sWEZfqLplIooel1wMYhszmssfOO
 ItZSDpKWWR9O9Ba5yYNs6UgAfZLQtglZwNQW7fxwXdZiYsZcw6oTilyf+iUng7qNKTVD
 5TIHpt+wPTyoyggG+HJsOdbqDmEhNprKtM7LxQH/D8+3brkJamVEbisOUgRS2w0RJlMn
 THcjXWHSPePM7g9dQsYpoba6kZ6ijLHQpRXiLnhwUth+wwFE1lA/5qcALcon+unDhBBD
 YLF/G5rDaPDCgl7lsvIhS3VD7oiapMJ89wPzda4YDv1v0xH8aEQaIP2qVWeqOLlO9GM9
 iyBw==
X-Gm-Message-State: AOAM532zyPXVptuW+GmMADu0pIhtmmokDDlHfyQRRrSl6FD/Y7YbD8Xv
 u8xvK8TuEsIQAHbjkRrocyvjFKWw8TE=
X-Google-Smtp-Source: ABdhPJxTAxwVUxtBGCXtSlNkmU9SX5kysp+gS9mHf7n9lFx2DGkufDWU759FmIxDA2BklXSaF/EP7g==
X-Received: by 2002:a17:903:18b:b029:ee:d430:6c4d with SMTP id
 z11-20020a170903018bb02900eed4306c4dmr10617292plg.34.1620118260741; 
 Tue, 04 May 2021 01:51:00 -0700 (PDT)
Received: from localhost ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id d63sm2837861pjk.10.2021.05.04.01.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 01:51:00 -0700 (PDT)
Date: Tue, 04 May 2021 18:50:54 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] target/ppc/spapr: Update H_GET_CPU_CHARACTERISTICS bits
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210503125833.891752-1-npiggin@gmail.com>
 <YJCYKBF2YgEl8AEA@yekko>
In-Reply-To: <YJCYKBF2YgEl8AEA@yekko>
MIME-Version: 1.0
Message-Id: <1620117371.82b83ry366.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x629.google.com
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from David Gibson's message of May 4, 2021 10:41 am:
> On Mon, May 03, 2021 at 10:58:33PM +1000, Nicholas Piggin wrote:
>> There are several new bits added to the hcall which reflect new issues
>> found and new hardware mitigations.
>>=20
>> This adds the link stack flush behaviour, link stack flush accelerated
>> instruction capability, and several L1D flush type behaviours (which are
>> now being specified as negative in order to simplify patched kernel
>> compatibility with older firmware).
>=20
> So, to clarify here, the bits your adding aren't advertising any new
> behaviour on qemu/KVM's part, they're just new ways of advertising the
> same behaviour?

I... think so. "Behaviour" is in context of the hcall that advertises
how the processor behaves (or what the guest must do for security).

The new NO_ bits added are for processors that don't require a particular
flush. The FLUSH_LINK_STACK was basically always required but I think
Linux just keyed off the count cache flush and did both at once.

The new LINK_FLUSH_ASSIST is a new processor feature the guest will use
to implement link stack flushing, so maybe that does need a cap?

>=20
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  hw/ppc/spapr_hcall.c   | 5 +++++
>>  include/hw/ppc/spapr.h | 6 ++++++
>>  2 files changed, 11 insertions(+)
>>=20
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index 7275d0bba1..f656620232 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
>> @@ -1878,6 +1878,9 @@ static target_ulong h_get_cpu_characteristics(Powe=
rPCCPU *cpu,
>>          behaviour |=3D H_CPU_BEHAV_L1D_FLUSH_PR;
>>          break;
>>      case SPAPR_CAP_FIXED:
>> +        behaviour |=3D H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY;
>> +        behaviour |=3D H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS;
>> +        behaviour |=3D H_CPU_BEHAV_NO_STF_BARRIER;
>>          break;
>>      default: /* broken */
>>          assert(safe_cache =3D=3D SPAPR_CAP_BROKEN);
>> @@ -1909,9 +1912,11 @@ static target_ulong h_get_cpu_characteristics(Pow=
erPCCPU *cpu,
>>          break;
>>      case SPAPR_CAP_WORKAROUND:
>>          behaviour |=3D H_CPU_BEHAV_FLUSH_COUNT_CACHE;
>> +        behaviour |=3D H_CPU_BEHAV_FLUSH_LINK_STACK;
>>          if (count_cache_flush_assist) {
>>              characteristics |=3D H_CPU_CHAR_BCCTR_FLUSH_ASSIST;
>>          }
>> +        /* Should have a way to enable BCCTR_LINK_FLUSH_ASSIST */
>=20
> Do we need a new spapr capability for this link flush thing?

It is independent of the FLUSH_COUNT_CACHE capability, so it seems like
it should I think? Should that be added as a following patch?

Thanks,
Nick

