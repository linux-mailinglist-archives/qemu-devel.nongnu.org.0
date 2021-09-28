Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663F741B12C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:51:10 +0200 (CEST)
Received: from localhost ([::1]:45882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVDVl-00006d-EM
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mVDRg-0005Lb-7U
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:46:56 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:37466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mVDRd-0007Be-T9
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:46:55 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 r83-20020a1c4456000000b0030cfc00ca5fso2346706wma.2
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 06:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=QJq7O7Zs54F64OCT3CA3FpvLyJ3CpNnOZX4hwWKKcnY=;
 b=NVKbElAvY9nga92tyQMr6xJ8UH7cOHAtDtvGZo3vOoF/LIi+IIws+c2fymCvoqRxZM
 t0iLO0tHo7wxzUcpuzJ5GgeFYOf80JgFzJXJYAbOB4YXAvLLA4CYyRJ0MxExIWDgCHvk
 8J6iS1SO3UmBlOKA65JdpWS/hDCoEzQ4Nufv6+0MIEOpmyIYesu7XS+wPfikXgtSKMGD
 FeYULR/ngacTiz/LJ0dOrI0cP+r1oUxWu2CCGWlhZ/hELt1gdsM99DcMVAXHokOyuly9
 UT/1t5+olkdqjz5BzPTzc0zhmqbmBM/fm0YdbO/ifnZmCRTjZDlTZ0G4Dn1YB6j5ekW/
 d6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=QJq7O7Zs54F64OCT3CA3FpvLyJ3CpNnOZX4hwWKKcnY=;
 b=WBMWbQCMlq0bktFW82eLRIImEFEp6m3ud9/Z+ARwzuBs7ZpkjWe76qhgycSf4vuQUp
 VKX0URU8h5T5QDSzFXfK/5re8or124Wnpgy38YQyxpFkxJ3Yc9DauIHMeBq2TT/KTEp5
 XDEbnTLNffzRK1kHu25LJK364DinNCrC0rL3mHhNf3vteG2aSCDO3S2uq29+EqQaw5lt
 EbDp5PusJkNvbuxC+ENHizrzxbpJ/7rjBYtlV5gMerCeghB6bR85jsWFWQUAPRwv+2/q
 wBPDR8IlY7/uyj5UL6Uu/YHJ5JE9f0TiCKdqjuyLi3hRnYy7ZAHRnXE9ov5JhRU8er1r
 VuRw==
X-Gm-Message-State: AOAM530s86JzgJYNYQs+O7nu0+GdkZifCZw7EttdRRiny6Y0xw4a7Tac
 tpOzXBhWKbGv2KcO5/0LNncbRw==
X-Google-Smtp-Source: ABdhPJzTdfAWMgPTakegVnbp9oTBRG3Uyz6fzbQ0a7E+UMPthHwUwSz7AMS7c66i+3bkfrEjAd1Xlg==
X-Received: by 2002:a7b:c194:: with SMTP id y20mr4794399wmi.37.1632836811749; 
 Tue, 28 Sep 2021 06:46:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b15sm1918760wru.9.2021.09.28.06.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 06:46:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 179BE1FF96;
 Tue, 28 Sep 2021 14:46:50 +0100 (BST)
References: <cover.1629982046.git.qemu_oss@crudebyte.com>
 <2431106.PTX978RE0L@silver> <20210927125940.3ef12485@bahia.huguette>
 <1811981.VuayHpH01O@silver>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v3 0/5] introduce QArray
Date: Tue, 28 Sep 2021 14:37:45 +0100
In-reply-to: <1811981.VuayHpH01O@silver>
Message-ID: <87v92k7qyd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Christian Schoenebeck <qemu_oss@crudebyte.com> writes:

> On Montag, 27. September 2021 12:59:40 CEST Greg Kurz wrote:
>> On Mon, 27 Sep 2021 12:35:16 +0200
>>=20
>> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
>> > On Dienstag, 31. August 2021 14:25:04 CEST Christian Schoenebeck wrote:
>> > > On Dienstag, 31. August 2021 13:58:02 CEST Greg Kurz wrote:
>> > > > On Thu, 26 Aug 2021 14:47:26 +0200
>> > > >=20
>> > > > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
>> > > > > Patches 1 and 2 introduce include/qemu/qarray.h which implements=
 a
>> > > > > deep
>> > > > > auto free mechanism for arrays. See commit log of patch 1 for a
>> > > > > detailed
>> > > > > explanation and motivation for introducing QArray.
>> > > > >=20
>> > > > > Patches 3..5 are provided (e.g. as example) for 9p being the fir=
st
>> > > > > user
>> > > > > of
>> > > > > this new QArray API. These particular patches 3..5 are rebased o=
n my
>> > > > > current 9p queue:
>> > > > > https://github.com/cschoenebeck/qemu/commits/9p.next
>> > > >=20
>> > > > > which are basically just the following two queued patches:
>> > > > This looks nice indeed but I have the impression the same could be
>> > > > achieved using glib's g_autoptr framework with less code being add=
ed
>> > > > to QEMU (at the cost of being less generic maybe).
>> > >=20
>> > > I haven't seen a way doing this with glib, except of GArray which has
>> > > some
>> > > disadvantages. But who knows, maybe I was missing something.
>> >=20
>> > Ping
>> >=20
>> > Let's do this?
>>=20
>> Hi Christian,
>>=20
>> Sorry I don't have enough bandwidth to review or to look for an alternate
>> way... :-\ So I suggest you just go forward with this series. Hopefully
>> you can get some reviews from Markus and/or Richard.
>
> Ok, then I wait for few more days, and if there are no repsonses, nor vet=
os=20
> then I'll queue these patches anyway.

As far as I can make out the main argument for introducing a QEMU
specific array handler is to avoid needing to use g_array_index() to
reference the elements of the array. This in itself doesn't seem enough
justification to me.

I also see you handle deep frees which I admit is not something I've
really done with GArray as usually I'm using it when I want to have
everything local to each other.

>
> Best regards,
> Christian Schoenebeck


--=20
Alex Benn=C3=A9e

