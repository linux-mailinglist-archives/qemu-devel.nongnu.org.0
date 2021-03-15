Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BAD33C608
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:47:39 +0100 (CET)
Received: from localhost ([::1]:58948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsFe-0007J6-IQ
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lLra4-00035z-5T
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:04:40 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lLra1-00017h-Qj
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:04:39 -0400
Received: by mail-ej1-x62d.google.com with SMTP id ci14so67674197ejc.7
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=RLzpdG5+y0WcLJDX7Om/KLDmZjwjkS7jaZ8vH7EHX6c=;
 b=x31nlNidQFXTEXCsTgNyK/QjvvhL42HIpJP4GqGrpMqWm3m+DuJeBEnGb4NrIHdqlx
 bDn74edl+UTshbuna3v31Pvxzr5pxE9JnorIcB3KNyg9LuqmIVzEjLLu46CDTJ8Z/bQw
 7+H2XUzEYN/Ou0OnKn9/Gx+qNgQkORTrHLIx21eC+gF/dOJc5Wfsvmu5+h+K/GLpcA4P
 o5khDwBoxjpCj7eSPizxmaMx4UrItoKAQ1qpmWXVC528RRmGG3jEtzRUpA5AMUhzsPfV
 l12MDTI7EuaPs/nTwYi17yX2aVOgM3FsqYb8TBRRp35MaRaixyuAbOspfMMdfmVtHxKN
 ws5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=RLzpdG5+y0WcLJDX7Om/KLDmZjwjkS7jaZ8vH7EHX6c=;
 b=LDGa9zc+se230qpqP21/Gd1Vw4dKvMTBP5mja7gdv+W5lylbvVDVE1MIXCHULfalfm
 eSP+B28u3Aoz8K8PRc9cwOVzSPyhTeUubWEL2vN04vSqjIjrHsapD8mrNjf4PqTUl+d4
 rqUtzL9riTJrJeKqsq33Vai7o/Occ4qH9nLZLn87zKDM1s5uccXMszU2OAQ0m+BAjCGk
 GIRGsI3jEseOLvF7mwrbMO/J94tNMDwZNkQkUu4lLyLPZDmqm+iR3H9iYOArjKyOTTxw
 VB5vNFPPZgiMlRKLGG30oJ/c7YxoOP0/b94zrAPeiOtbU0TwcCCCnYYVa+xLJw64TfR+
 tjlw==
X-Gm-Message-State: AOAM530h3p04+cUwxnmoQRwiL8h148qOYPEyjvasTVw8EOblKoCANopA
 T8GrHS3UF4DIwf65+G9cXj5rhe7JASvYRpMO
X-Google-Smtp-Source: ABdhPJxJ7b6MgdHkMeNMeB/gK2hSLMvyIGCOLKndbyjMt1+5TanNSgD86asBUjyzubmW0YoFEcCqTA==
X-Received: by 2002:a17:906:a413:: with SMTP id
 l19mr25232367ejz.421.1615831476329; 
 Mon, 15 Mar 2021 11:04:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j1sm7873659ejt.18.2021.03.15.11.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 11:04:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9459C1FF7E;
 Mon, 15 Mar 2021 18:04:34 +0000 (GMT)
References: <20210312172821.31647-1-alex.bennee@linaro.org>
 <20210312172821.31647-7-alex.bennee@linaro.org>
 <YEux/6mWQYgJCHRC@strawberry.localdomain>
User-agent: mu4e 1.5.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: [PATCH v1 06/14] plugins: expand the callback typedef kernel-docs
Date: Mon, 15 Mar 2021 18:04:20 +0000
In-reply-to: <YEux/6mWQYgJCHRC@strawberry.localdomain>
Message-ID: <87h7lc8f9p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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

> On Mar 12 17:28, Alex Benn=C3=A9e wrote:
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> One nit below, but otherwise:
>
> Reviewed-by: Aaron Lindsay <aaron@os.amperecomputing.com>
>
>> ---
>>  include/qemu/qemu-plugin.h | 25 ++++++++++++++++++++++---
>>  1 file changed, 22 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
>> index ac1bb318da..09b235f0b4 100644
>> --- a/include/qemu/qemu-plugin.h
>> +++ b/include/qemu/qemu-plugin.h
>> @@ -99,17 +99,36 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plug=
in_id_t id,
>>                                             const qemu_info_t *info,
>>                                             int argc, char **argv);
>>=20=20
>> -/*
>> - * Prototypes for the various callback styles we will be registering
>> - * in the following functions.
>> +/**
>> + * typedef qemu_plugin_simple_cb_t - simple callback
>> + * @id: the unique qemu_plugin_id_t
>> + *
>> + * This call-back passes no information aside from the unique @id.
>
> Should we be consistent about always using 'callback' or 'call-back'
> instead of alternating? I tend to use 'callback', but I'm not sure I
> have a solid reason to prefer it.

No you are right we should stick to callback.

>
> -Aaron
>
>>   */
>>  typedef void (*qemu_plugin_simple_cb_t)(qemu_plugin_id_t id);
>>=20=20
>> +/**
>> + * typedef qemu_plugin_udata_cb_t - callback with user data
>> + * @id: the unique qemu_plugin_id_t
>> + * @userdata: a pointer to some user data supplied when the call-back
>> + * was registered.
>> + */
>>  typedef void (*qemu_plugin_udata_cb_t)(qemu_plugin_id_t id, void *userd=
ata);
>>=20=20
>> +/**
>> + * typedef qemu_plugin_vcpu_simple_cb_t - vcpu callback
>> + * @id: the unique qemu_plugin_id_t
>> + * @vcpu_index: the current vcpu context
>> + */
>>  typedef void (*qemu_plugin_vcpu_simple_cb_t)(qemu_plugin_id_t id,
>>                                               unsigned int vcpu_index);
>>=20=20
>> +/**
>> + * typedef qemu_plugin_vcpu_udata_cb_t - vcpu callback
>> + * @vcpu_index: the current vcpu context
>> + * @userdata: a pointer to some user data supplied when the call-back
>> + * was registered.
>> + */
>>  typedef void (*qemu_plugin_vcpu_udata_cb_t)(unsigned int vcpu_index,
>>                                              void *userdata);
>>=20=20
>> --=20
>> 2.20.1
>>=20


--=20
Alex Benn=C3=A9e

