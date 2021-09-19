Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AE0410CF8
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 20:54:12 +0200 (CEST)
Received: from localhost ([::1]:36838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS1x5-0003cB-72
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 14:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mS1wC-0002y4-Fs
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:53:16 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:36382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mS1wA-0007fL-L7
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:53:16 -0400
Received: by mail-il1-x135.google.com with SMTP id v16so16255039ilg.3
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=sender:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=LOOEjDZ/JmQ1IioshLRJYzKDv/5JpqOGtzQFKTBOliA=;
 b=JUiiM0C2n1ZbxmSZbQr+WAflDYtdo662+ZkCCSlwZq4kJp4HGUu71euTLazJ3fTmqS
 /NKEUUgSMCeqEmNwZdb8g0/e78pqf3LUEkDARNCwtslE/w6ckaaBcaJz9wjf0GDOVnAI
 OIVmqbqkdd/odqOgaV1FEIMXsyJ2T+ZFn4gxXTNnkxUq1Osjh7qmDknLYVRPBC5/5BxU
 hGoDsFI5+9axvBy2+aor5p4MLgJCxOEAdMhomYcn4NNWHQRov8fx6ZuWhFGFbZb0+GBA
 +VJgzJIW8KZ5RkMTGCpgfQMorfrJoPzbqYuNjouKoCLaIg0kvnZaavKfgsCEnaEy9qnM
 H6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:mime-version:subject:in-reply-to
 :date:cc:content-transfer-encoding:message-id:references:to;
 bh=LOOEjDZ/JmQ1IioshLRJYzKDv/5JpqOGtzQFKTBOliA=;
 b=YkTQGRhuq/YRKBTSVTlH+SQSzMprQYi3JQyum7lM3/UL0PJ7ZJRN0vc68xFEi54sBC
 85kRkcVHfzKD5xtVRH3Wb0cjJ8LEk8Pkrpoyw8+hTAwkUbZYYl17d6sHCizDQANxXKu2
 rvRM1xxaNaJbQQJ+YkQKKuREOJjEy0oNHZlnaKXvkoyjms2e7izYjr6n7lTa4DqjdtVF
 zEWn1L4rfSsDOEE+y5QO0Jd5wxmGSIle/rPxvySu5ogxpYvZuDo9o8c1C9tCtwjW5NQ5
 PRRJNP1TmLqw5hgIJ3ejWiodSBxFQC09eSfq0WJQDnz++4RptXMd4c5K9hhmEzgls01I
 eGUw==
X-Gm-Message-State: AOAM530eR+YxOm5KHA7IX3tjeje2CWkxnpVvbEHJPpxiNeZ5jC5EGnL+
 Dey2/UVmWlBJaec/4fNmV+hokQ==
X-Google-Smtp-Source: ABdhPJw6+fvXOiWwpItk60WTSODeBeGJTzLOeOACEnoQqtWmnbLXkJ+HFFkKoQ8ThLJU9os0RlxoDA==
X-Received: by 2002:a05:6e02:106:: with SMTP id
 t6mr14791807ilm.185.1632077592941; 
 Sun, 19 Sep 2021 11:53:12 -0700 (PDT)
Received: from macbook.nflx.bsdimp.com
 (50-253-99-174-static.hfc.comcastbusiness.net. [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id y30sm1643415iox.54.2021.09.19.11.53.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 Sep 2021 11:53:12 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
X-Google-Original-From: Warner Losh <bsdimp@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH v2 20/41] linux-user: Add raise_sigsegv
In-Reply-To: <30b30a40-8edc-92a4-7140-cf7e37fa5ab6@amsat.org>
Date: Sun, 19 Sep 2021 12:53:11 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <E7EEB976-693D-4DF7-87D0-A1D50ADF578C@gmail.com>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-21-richard.henderson@linaro.org>
 <425a941d-5f7f-e875-dc62-24d8973c4a23@linaro.org>
 <30b30a40-8edc-92a4-7140-cf7e37fa5ab6@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=wlosh@bsdimp.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Sep 19, 2021, at 12:43 PM, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>=20
> On 9/19/21 20:35, Richard Henderson wrote:
>> On 9/18/21 11:45 AM, Richard Henderson wrote:
>>> +/**
>>> + * raise_sigsegv:
>>> + * @cpu: the cpu context
>>> + * @addr: the guest address of the fault
>>> + * @access_type: access was read/write/execute
>>> + * @maperr: true for invalid page, false for permission fault
>>> + * @ra: host pc for unwinding
>>> + *
>>> + * Use the TCGCPUOps hook to record cpu state, do guest operating =
system
>>> + * specific things to raise SIGSEGV, and jump to the main cpu loop.
>>> + */
>>> +void QEMU_NORETURN raise_sigsegv(CPUState *cpu, target_ulong addr,
>>> +                                 MMUAccessType access_type,
>>> +                                 bool maperr, uintptr_t ra);
>>=20
>> FYI, something to bikeshed here is the name of the function.  Should =
it
>> in fact be cpu_loop_exit_raise_sigsegv?
>=20
> That or cpu_loop_exit_segv() which is explicit enough IMO.

That name works for me=E2=80=A6

Also, and this is a stretch so consider it maybe a bit weak=E2=80=A6

Reviewed by: Warner Losh <imp@bsdimp.com>


> Because it can't be used outside of the running cpu context.  (E.g.
>>=20
>> there are a couple of instances where it's tempting to use this from
>> within cpu_loop itself, processing pseudo-syscalls.)
>>=20
>>=20
>> r~
>>=20
>=20
>=20


