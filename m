Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9796B2D365C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:41:03 +0100 (CET)
Received: from localhost ([::1]:38202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlfK-0005RT-MJ
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmlaN-0001M6-La
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:35:56 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:39448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmlaL-0005Nt-KY
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:35:55 -0500
Received: by mail-wm1-x335.google.com with SMTP id 3so3722603wmg.4
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 14:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ehFoE7E4FyMh9LcvwasZL8ddbZgH7U7L9M/iN6pmoBA=;
 b=D+EkW2vl9H0rKoFpj7AtRGnBRboafOlj90C53ONqhR0ENAKd7UOtZzxGBANWS1NuB4
 qhuuWuZPB2DvDy0bpTn9m0rft91kWvd2W3r6GIKj1vzr9yMaS49e5zmB9uFhRfsDUkue
 TTRYrzYkbdrl+pROCXEQzun+HRtXLULwGd+e3ZqN5RMQQazRk0BuYSZhgGZOZSyYqqen
 rpbweZ7Snct16jktL05T9W/T0JrFFS/lLtujOJIFkOhL9rKUieodnWe6QWrCNl1ki8+g
 3F2iC6egaHQSO4MwDYOX2d2bV4/mQcWrdGFFafC8Q75DXiwdPONpDP/49r87KUhQVHOP
 oH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ehFoE7E4FyMh9LcvwasZL8ddbZgH7U7L9M/iN6pmoBA=;
 b=rQLO02D+gkmEhhxdM8LqxbwxeJnG7QgjeB/5XS1GXTKjEtzx35qhEtEiX9fkSJsxNP
 0VVxe1YdH0bAr2xktlCRAV2mDoAaYvEaGcw5EaitIgwg+vgJVtUAn4Qz2UO5U7h3Y/S2
 AiBWMhrxJnWUujvgxe3d7HWgqsRTPQrKBnFmzafs9M6io9X7TjOsyUvnRO6oFe1zcd68
 VowBMZoi8ot9eeGCy33yBrDkKUUcs5oLpGaV6N95VXTC/qkWMoprFjDug6vNQogv47K1
 WHzVFJDmwrGcMVY23+Az/jW5TPT7+GuXg8K2p+UK6ixSrpqHCNOtYFGUG3ENYzW4FYNu
 GDzA==
X-Gm-Message-State: AOAM532OWvrEK6CrHHzgacvfd8FHbBSFUtmLei1O2ugtlTOuDcSujYdo
 sU3hbJxCC274IEK4k81kpPaQEw==
X-Google-Smtp-Source: ABdhPJzTG4R7z8jiUiFN2J8tUayecb6JPd1lKE/zKoDTzooxjZrDrwD3WsjsGVWTTzra2Tnf4I3eeA==
X-Received: by 2002:a1c:2316:: with SMTP id j22mr19446wmj.82.1607466951593;
 Tue, 08 Dec 2020 14:35:51 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r13sm464531wrm.25.2020.12.08.14.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 14:35:49 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1C5101FF7E;
 Tue,  8 Dec 2020 22:35:48 +0000 (GMT)
References: <X86YnHhHMpQBr2/G@strawberry.localdomain>
 <87a6uoh2fp.fsf@linaro.org> <X8+R05CCriFWT6G+@strawberry.localdomain>
 <871rg0gogo.fsf@linaro.org> <X8/Y2suga/zfc2G/@strawberry.localdomain>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: Plugin Register Accesses
Date: Tue, 08 Dec 2020 22:34:06 +0000
In-reply-to: <X8/Y2suga/zfc2G/@strawberry.localdomain>
Message-ID: <87y2i8exiz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: cota@braap.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> On Dec 08 17:56, Alex Benn=C3=A9e wrote:
>> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
>> > On Dec 08 12:17, Alex Benn=C3=A9e wrote:
>> >>   For registers I think there needs to be some re-factoring of QEMU's
>> >>   internals to do it cleanly. Currently we have each front-end provid=
ing
>> >>   hooks to the gdbstub as well as building up their own regid and xml=
 to
>> >>   be consumed by it. We probably want a architectural neutral central
>> >>   repository that the front ends can register their registers (sic) a=
nd
>> >>   helpers with. This would then provide hooks for gdbstub to cleanly
>> >>   generate XML as well as an interface point for the plugin infrastru=
cture
>> >>   (and probably whatever the HMP uses as well).
>> >
>> > In a previous incarnation, I was proxying calls to the plugin API
>> > directly through to gdb_read_register() in gdbstub.c and therefore usi=
ng
>> > gdb as the point of commonality. I'm not saying it's ideal but... it
>> > works? One downside is that you have to know 'out-of-band' which integ=
er
>> > value corresponds to the register you want to query for your
>> > architecture, though it hasn't been a significant issue for me.
>>=20
>> Certainly workable for a private branch but I don't want to merge
>> anything like that upstream.
>
> Sure - I was more commenting on what I've done in case it's useful than
> pushing for it to be upstreamed!
>
>> As far as I can see there are a number of
>> consumers of register information:
>>=20
>>   - plugins
>>   - gdbstub
>>   - monitor (info registers)
>>   - -d LOG_CPU logging
>>=20
>> so rather than have them all have their hooks into every front-end I can
>> see a case for consolidation.
>>=20
>> For the plugin case providing an introspection helper to get a handle on
>> the register makes sense and would be less painful than teachning
>> plugins about gdb regids which can and do move around with new system
>> registers.
>>=20
>>   qemu_plugin_reg_t *handle =3D qemu_plugin_find_register("x2")
>>=20
>> if we document the handle as usable across calls this can be done on
>> start-up. Then it would be:
>>=20
>>   uint64_t val =3D qemu_plugin_read_register(cpu_index, handle);
>
> I recognize this is pseudocode, but I'm wondering "out loud" if this
> would need to be variable-width instead of a uint64_t to allow for wider
> registers in an actual implementation.

Yeah probably. The current internal interface for gdb uses GByteArray's
so that may be something you pass into the read function.

>
> -Aaron


--=20
Alex Benn=C3=A9e

