Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF63316A23
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 16:28:25 +0100 (CET)
Received: from localhost ([::1]:47904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9rPj-0002rt-Np
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 10:28:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9rOy-0002T6-Dg
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:27:36 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9rOw-0007qe-1P
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:27:36 -0500
Received: by mail-wm1-x32a.google.com with SMTP id a16so3946997wmm.0
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 07:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=0HxX8Wi6EERTBtGktCimgjhRoUOqB89blJJoTGyYKRY=;
 b=UePKtEFHkw3n4uTjAjzb4NBkLs+1UqeKUXwNlkQiixBw8BBY+YMEZbAsyqiethGtSy
 cf06CgvQrLhT85kUbEiYGCYtOOBnfcnPfLYQADQF/CimUCNwKsCud71DBIK9ynXZjef9
 uF7HgubSq44s8icZ8YLsLzbJwTF0CZGD2ACeQHwiMIBp7nHkCkLJD2sKewCz6NTM7gs1
 jaafVyiTWBw19aU24P7lLgXPls3mWC0x7P+LQBGHF3yEBmvd5E51QrTPgMNJo+9GyPFQ
 s1sMQJ7lw3Kx0NHCrBgPq4IcU02D1HJ78NtHzLfUYwWNQWH3svRqm7hyTKmpT3T2y/+I
 iSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=0HxX8Wi6EERTBtGktCimgjhRoUOqB89blJJoTGyYKRY=;
 b=P8TP/neBY5bCEnpHRKn9gS5V4MP+zM0piipFFhygQUvl18+2/qRxpo9nhNjbBvLjy3
 oSdAkRsBdG8WyYZ3rFeCrnUvXQWfnNBGDhAWxiiWiOmOzRr8KQTFINjO/tgKfh4eLwZw
 DdXfPf3h4nGJrjswdAAc9e4DGACL8EDozpXbKtD07GrHOJ10wBOGpxct7wXUhObV2yRJ
 9dFW6j8pa1CxNghDo6bwIkWDKdXwjuUdCxcnfG+YGl/t6dcQMDPc6FU9ORvu+1ym5mi4
 rzjcAoCamG2G3rv5CoITef0/5S8lyFjLKk19xdGfcqA4mn1SOY0buHbGyUTfw7fWrn/3
 lLXw==
X-Gm-Message-State: AOAM532ID8zyYh1j6XsOdVE/rUDDCPOzVCyxi/cm6yCa/deCd6GcHh7D
 +Lp0iW9WSaBLm7/EWE9l9+UlMQ==
X-Google-Smtp-Source: ABdhPJzpLMMONpF9QzSuR5LeqN2V/1q6lMc37dx+0D96RAsmxyMX6NvINrBZROegOUtir/v7Wb4zBQ==
X-Received: by 2002:a05:600c:8a2:: with SMTP id
 l34mr3476870wmp.4.1612970851932; 
 Wed, 10 Feb 2021 07:27:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g1sm3570798wrq.30.2021.02.10.07.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 07:27:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B6D821FF7E;
 Wed, 10 Feb 2021 15:27:27 +0000 (GMT)
References: <20201001163429.1348-1-luoyonggang@gmail.com>
 <87pn5v1tag.fsf@linaro.org>
 <CAE2XoE9CgA3MvV9MJnM8bx6JQ0+DU69mqSD0jOFLCvAu5kwwcg@mail.gmail.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: luoyonggang@gmail.com
Subject: Re: [PATCH v3 0/6] Enable plugin support on msys2/mingw
Date: Wed, 10 Feb 2021 15:10:17 +0000
In-reply-to: <CAE2XoE9CgA3MvV9MJnM8bx6JQ0+DU69mqSD0jOFLCvAu5kwwcg@mail.gmail.com>
Message-ID: <87eehovt7k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Emilio G . Cota" <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


=E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo) <luoyonggang@gmail.com> writes:

> Hi alex, when does plugins/next getting PR

Sorry for the delay. I should be cooking up a pre-PR series this week
once the recent icount/io_recompile fix has been tested and reviewed.
You can see the current state of the tree here:

  https://github.com/stsquad/qemu/tree/plugins/next

I'm afraid I've dropped the ball on your plugin patches... I can't seem
to find the v5 series referenced.

>
> On Tue, Oct 6, 2020 at 7:35 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
>>
>> Yonggang Luo <luoyonggang@gmail.com> writes:
>>
>> > V2-V3
>> > Split following patches out
>> >
>> > V1-V2
>> > 1. Fixes review comments
>> > 2. Increase QEMU_PLUGIN_VERSION to 1 for compat  QEMU_PLUGIN_VERSION 0
>> > 3. Revise the loader to support for version 0 and 1
>> > 4. By export function qemu_plugin_initialize in plugin, and call it in
>> loader=3D
>> > , so
>> >   we have no need call it in every plugin. And also provide a standard
>> implem=3D
>> > entation,
>> >   anyway, use can also override it.
>> >
>> > Add this feature on msys2/mingw by using glib provided cross-platform
>> dlsym f=3D
>> > unctional.
>>
>> I've grabbed the first two fixes into plugins/next for now. Aside from
>> fixing the review comments I'd like to have an indication that the
>> proposed change to the API linking doesn't adversely affect the
>> performance of the plugins.
>>
>> It might be worth enabling a --enable-plugins build for mingw gitlab as
>> Cirrus
>> seems a bit broken at the moment.
>>
>> Thanks,
>>
>>
>> --
>> Alex Benn=C3=A9e
>>


--=20
Alex Benn=C3=A9e

