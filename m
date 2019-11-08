Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBCFF5107
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 17:25:50 +0100 (CET)
Received: from localhost ([::1]:57212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT753-0002PY-9r
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 11:25:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60911)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iT73i-0001Xu-6Y
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 11:24:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iT73g-0005KV-R7
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 11:24:25 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:44724)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iT73g-0005JU-KA
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 11:24:24 -0500
Received: by mail-wr1-x441.google.com with SMTP id f2so7663981wrs.11
 for <qemu-devel@nongnu.org>; Fri, 08 Nov 2019 08:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=PTm34Cee9fPx8B4vdX4KhIB2vraN0Xl78QhfV69LmiQ=;
 b=MV+OFNJwwYS+Ccld018FcQw1yDTLrc1L3hXqDh4lkOa0U7ALJW2DqQrM9Yn9A7ZLus
 KpGyvzaZ5XUy9NQbdG/unvCZyV+B/WnjK8KJpIGMbyBAp/9Cs7QKlcRyR01tySsceYCp
 DzV2onyN+OLJcBI55AJpVm7va6eqGnRVsGDebQvn1FrgdWCBSvMOyPE4PGe8FpAF9DeO
 OptuFHGnpcFmFkvjKzAAgwnZ4afnZs02pTI87IcSfQzAGLj7S9Ezy6V4B7s2DSmXqe4s
 6JhOKc9JnObFPOv/5RSHcbHeIGlNrRy+bCukve6BTrA4Ok8s9YL/DPujEGP+OLjOFIB/
 nQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=PTm34Cee9fPx8B4vdX4KhIB2vraN0Xl78QhfV69LmiQ=;
 b=XjDWCTKCDbsGRQwxSlBr78fTUKM7g3nkTIQChji/4jsQv2BnNmRJa+4SE3Yj1fWqbA
 lo+y+1bX9A8KGls9304hMK4I7BtVeUsHltzW6sMC4w9LomfrloVGmk7TVW7NSJ+9G5vf
 kwQc/ii7lrFKp4o1ZSuTm2RmqGrlXv6GYLfd+VtemJYFM9UDvvG/HJ1hz4u1X4xmwiTr
 tZXknb78Bbilzpnd5Y5H8KE/v/F6PktDuaaP/6LxoclDnEEOvVbPxUny+K4o670RxBDu
 6F8/WG5qVaIK1YjpqhO/0p/Mdjds57NGYZKQIcjiKhnkXg/314A1QKf11jaKJFXsgn99
 VZTw==
X-Gm-Message-State: APjAAAWHC3qA1Xsy+KusvOerSRnmiHwQ2a8qLaXVain8T582WAyGtH0f
 erVBkkytPANclWTphIsJRbCGIw==
X-Google-Smtp-Source: APXvYqz/F7wHzdP7GCFJ3DEKGz5d5gvJsIqGWg6mF/QBd39kMim+dpfhL04yOu8P0pEgGBBvofq/kg==
X-Received: by 2002:adf:a553:: with SMTP id j19mr4683988wrb.184.1573230263284; 
 Fri, 08 Nov 2019 08:24:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x7sm12605616wrg.63.2019.11.08.08.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 08:24:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 91A341FF87;
 Fri,  8 Nov 2019 16:24:21 +0000 (GMT)
References: <20191104131836.12566-1-alex.bennee@linaro.org>
 <CAFEAcA-42Fg-ihBm3JVET41SJ1Mot7m-i1ZGt+Y1afOY1wZ0Ow@mail.gmail.com>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] tcg plugins: expose an API version concept
In-reply-to: <CAFEAcA-42Fg-ihBm3JVET41SJ1Mot7m-i1ZGt+Y1afOY1wZ0Ow@mail.gmail.com>
Date: Fri, 08 Nov 2019 16:24:21 +0000
Message-ID: <874kzegwui.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: "Emilio G. Cota" <cota@braap.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 4 Nov 2019 at 13:18, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> This is a very simple versioning API which allows the plugin
>> infrastructure to check the API a plugin was built against. We also
>> expose a min/cur API version to the plugin via the info block in case
>> it wants to avoid using old deprecated APIs in the future.
>
> I think the general idea here is fine, and I want to see
> us get the version-check into 4.2, because I don't think
> we should release a QEMU which doesn't do a basic version
> sanity check. I have some minor comments below.
>
>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  include/qemu/qemu-plugin.h | 19 +++++++++++++++++++
>>  plugins/loader.c           | 15 +++++++++++++++
>>  plugins/plugin.h           |  2 ++
>>  tests/plugin/bb.c          |  2 ++
>>  tests/plugin/empty.c       |  2 ++
>>  tests/plugin/hotpages.c    |  2 ++
>>  tests/plugin/howvec.c      |  2 ++
>>  tests/plugin/insn.c        |  2 ++
>>  tests/plugin/mem.c         |  2 ++
>>  9 files changed, 48 insertions(+)
>>
>> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
>> index a00a7deb461..5502e112c81 100644
>> --- a/include/qemu/qemu-plugin.h
>> +++ b/include/qemu/qemu-plugin.h
>
> As an aside, is this the header file used for building
> the plugins? It seems a bit odd to have put it
> in include/qemu, which is for headers used when building
> QEMU itself.

It's also included by the internal plugin header. We could put it
somewhere else. include/api/? Where do the QMP specs end up?

I'll make the other changes in v2.

--
Alex Benn=C3=A9e

