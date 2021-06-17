Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E9A3AB753
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 17:21:59 +0200 (CEST)
Received: from localhost ([::1]:55360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lttqA-0001ep-71
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 11:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lttoU-00008U-Gp
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:20:14 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lttoQ-0005p0-Vf
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:20:14 -0400
Received: by mail-wr1-x431.google.com with SMTP id r9so7217809wrz.10
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 08:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4IvQwMymFSYXNN4J8g9bqYhsm1vjmIRJ0XQ9vu8v/nA=;
 b=wvRIYq+2PCf8oSP4Xas9YSKXqHAT7NO0Hd7WhwHfUU8AJLvTMJjyCLK252PwyIC6pr
 2vzh5TBC8tmNbQYWR67Xt4l4lfkUDFVa7nASVdiMjRmh9rp9wlpqIjp0etpcsRNt+p6Y
 mqh/XHr8FlkMP43dPizd/Mu92ieKqVW+ktu31KaLviXxmwvdezpDQcvDfjmc9z3WCpTe
 +oBNVhmwyBNgkqn7pjnVb/b8pYwHgs5SlG17HjBOAbeMgZjakWHCOrsmXh+hgay/1OWn
 T0B0pcOhkAm8cQ9W/ibUkBd5ssAWT8TpnhIMEyJTw2QyttTfbyqR7jJUOcfmc9U5MOhH
 t/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4IvQwMymFSYXNN4J8g9bqYhsm1vjmIRJ0XQ9vu8v/nA=;
 b=N7ZSBqU6rcTOSJqbIZnQ/nH9jzPgQIoSW8F9akEXyIhOWTHgg3YBL25t1nMIsaddmj
 +eyy45+D9v70es9H+2ROQYROypIXZorfBSQZ1OF9y+1NLc3rinEUN4sPgrZtuJLnU7UB
 NRUJi6Ynk8vvRyZGI6esVS5dLXCa5uiUACy0PLVt4LzP+r/TgEpeEXGd3TJFdqzth4sJ
 CEaYKK0/E/AnImkwMurTZoc1kcLB+Lmvm2A99dNWq38tMSc1AnW0BTWq2wumlurS23uU
 gVzlLSmnuFcNifE2jqY/HRGsM3NPYjr+TMhL8gyQprEeqHyzqoLhEPiuoGb7+1br/tXH
 ma0Q==
X-Gm-Message-State: AOAM531/D/m6gcs1y4JgCmOac2aCStTFSXJXqbo66C6uKPyxWpXtvLcG
 +DuFk16Dxos/KQ6ajMI9cRRiUQ==
X-Google-Smtp-Source: ABdhPJx3d+zWCsBnFl5B/hPhaDVhy2FZQ5KNdAG2nPkrxHvqUYxn1OVJTF2sVMIcvV5eflKTSDrl2g==
X-Received: by 2002:a5d:6849:: with SMTP id o9mr6270080wrw.44.1623943209287;
 Thu, 17 Jun 2021 08:20:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w8sm5352956wmi.45.2021.06.17.08.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:20:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A5F871FF7E;
 Thu, 17 Jun 2021 16:20:07 +0100 (BST)
References: <20210325144846.17520-1-hi@alyssa.is> <87sg4a1dzl.fsf@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alyssa Ross <hi@alyssa.is>
Subject: Re: [PATCH RESEND] docs: clarify absence of set_features in vhost-user
Date: Thu, 17 Jun 2021 16:19:26 +0100
In-reply-to: <87sg4a1dzl.fsf@linaro.org>
Message-ID: <87y2b8ecwo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Alyssa Ross <hi@alyssa.is> writes:
>
>> The previous wording was (at least to me) ambiguous about whether a
>> backend should enable features immediately after they were set using
>> VHOST_USER_SET_PROTOCOL_FEATURES, or wait for support for protocol
>> features to be acknowledged if it hasn't been yet before enabling
>> those features.
>>
>> This patch attempts to make it clearer that
>> VHOST_USER_SET_PROTOCOL_FEATURES should immediately enable features,
>> even if support for protocol features has not yet been acknowledged,
>> while still also making clear that the frontend SHOULD acknowledge
>> support for protocol features.
>>
>> Previous discussion begins here:
>> <https://lore.kernel.org/qemu-devel/87sgd1ktx9.fsf@alyssa.is/>
>
> I totally missed this when I posted a similar attempt at clarification:
>
>   Subject: [PATCH v2] vhost-user.rst: add clarifying language about proto=
col negotiation
>   Date: Wed,  3 Mar 2021 14:50:11 +0000
>   Message-Id: <20210303145011.14547-1-alex.bennee@linaro.org>
>
>>
>> Cc: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Alyssa Ross <hi@alyssa.is>
>> ---
>>  docs/interop/vhost-user.rst | 14 +++++++++-----
>>  1 file changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
>> index d6085f7045..c42150331d 100644
>> --- a/docs/interop/vhost-user.rst
>> +++ b/docs/interop/vhost-user.rst
>> @@ -871,9 +871,9 @@ Master message types
>>    ``VHOST_USER_GET_FEATURES``.
>>=20=20
>>  .. Note::
>> -   Slave that reported ``VHOST_USER_F_PROTOCOL_FEATURES`` must
>> -   support this message even before ``VHOST_USER_SET_FEATURES`` was
>> -   called.
>> +   While QEMU should acknowledge ``VHOST_USER_F_PROTOCOL_FEATURES``, a
>> +   backend must allow ``VHOST_USER_GET_PROTOCOL_FEATURES`` even if
>> +   ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been acknowledged yet.
>>=20=20
>>  ``VHOST_USER_SET_PROTOCOL_FEATURES``
>>    :id: 16
>> @@ -886,8 +886,12 @@ Master message types
>>    ``VHOST_USER_GET_FEATURES``.
>>=20=20
>>  .. Note::
>> -   Slave that reported ``VHOST_USER_F_PROTOCOL_FEATURES`` must support
>> -   this message even before ``VHOST_USER_SET_FEATURES`` was called.
>> +   While QEMU should acknowledge ``VHOST_USER_F_PROTOCOL_FEATURES``, a
>> +   backend must allow ``VHOST_USER_SET_PROTOCOL_FEATURES`` even if
>> +   ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been acknowledged yet.
>> +   The backend must not wait for ``VHOST_USER_SET_FEATURES`` before
>> +   enabling protocol features requested with
>> +   ``VHOST_USER_SET_PROTOCOL_FEATURES``.
>
> I think this is perfectly fine clarification although I think there
> might be a patch in flight which changes some of the master slave
> terminology so with that resolved:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> However there is still the edge case of what happens after the vhost
> pair have negotiated protocol features like REPLY_ACK should
> VHOST_USER_F_PROTOCOL_FEATURES still be acknowledged by
> VHOST_USER_SET_FEATURES.
>
> Stefan's proposed wording which I incorporated in my patch made it clear
> that VHOST_USER_F_PROTOCOL_FEATURES is never exposed to the guest by the
> VMM due to it's UNUSED status. I would just like it explicit if it needs
> to be preserved between the two sides of the VHOST_USER_*_FEATURES for
> the negotiated protocol features to remain valid.
>
> Perhaps you could incorporate some wording for that?
>
>>=20=20
>>  ``VHOST_USER_SET_OWNER``
>>    :id: 3

General ping to the vhost-user spec maintainers. This was also mentioned
while merging:

  https://github.com/rust-vmm/vhost/pull/24

--=20
Alex Benn=C3=A9e

