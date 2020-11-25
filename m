Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5682C3C55
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 10:42:12 +0100 (CET)
Received: from localhost ([::1]:44896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khrJT-0002FQ-SK
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 04:42:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1khrH7-0000rn-9N
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 04:39:45 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:36251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1khrH5-000144-FS
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 04:39:44 -0500
Received: by mail-wr1-x442.google.com with SMTP id z7so1219296wrn.3
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 01:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=IY2luaYMrS+qN2scWteeR60Sxrl2ejY7whx8EcVBpLY=;
 b=dsv4V4ZFMR/8ag7B5VifyCIrUt82x62mIziwRPf7LLC2M24khE9t7rIi6G2XN3HR3m
 NAe0tl+LKZoeDuwrt/1V6KTomAjjBGbO1lUoVOPmPSoBHdd+TtMRA9h+//OS9fPnlIdl
 PJrTC1AYUIG83YwDR4+3uXAdSk5aAf9mjTjOfMHtoJZQApYHI3RDGfhdsEBPbd3K1And
 7FMRh5H6YGZpBk3rhxwT3I/W2gFXLL5cYbV0y8PQA3FhR+V8KR+kqbCHr2ZUZSC+C8+F
 rpebIqhg3iL9ELCfFrG/6g83MR3v3wL+lf5+cB6btqEpDONz35K05+hZtRoMj03E90B3
 9+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=IY2luaYMrS+qN2scWteeR60Sxrl2ejY7whx8EcVBpLY=;
 b=sgJ6cI1VhPOZ163aB40e24N+cUqrPWeWdVwzQ5z+LdFXBTWsIw6mXHzBX8nikB4tTf
 ofhPZbKzyLeJszLbb2k3X9g6nVlRgYQIrn5dbXPdqYqkt89MHTP+rUkBtH88VlI9veMb
 BmOJmvy9bimbihQS6oZp+aYbkgqIr82wugJBpt/TunOnMw648GQhd3necuNdBGGp3sFv
 EKKLVb9ESJsCKz7mAaUcU11t8T5DiR4YRrAqptHKFCSlLHV72j4Lsa8vkzBzmjDlvxn5
 4yTodZlrxWGLg2Tz/jFxSaQvcEj13EQBpIP8+ZEGWc2uR7UF4EgcjArOeHOYaIvSaj2Z
 M4sA==
X-Gm-Message-State: AOAM530YWC9QWHhB00kS1rgk3Q7XrK/Qr0SeR6NUKjuHiXYGg+3L9kK4
 tTYLL5GU34daJvnCnaNnWpPM7A==
X-Google-Smtp-Source: ABdhPJzX1oGq1AnA5oCbtngk9hgzHQTUsMu4/VAwJuHm9nvc+4+n/hLeN53i7GTXyRoJ0QzdijiQ+w==
X-Received: by 2002:a5d:6452:: with SMTP id d18mr3196347wrw.200.1606297181063; 
 Wed, 25 Nov 2020 01:39:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x4sm3755779wrv.81.2020.11.25.01.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 01:39:38 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2F31E1FF7E;
 Wed, 25 Nov 2020 09:39:38 +0000 (GMT)
References: <20201118165206.2826-1-steplong@quicinc.com>
 <20201124184754.247-1-steplong@quicinc.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stephen Long <steplong@quicinc.com>
Subject: Re: [PATCH] linux-user/elfload: Fix handling of pure BSS segments
In-reply-to: <20201124184754.247-1-steplong@quicinc.com>
Date: Wed, 25 Nov 2020 09:39:38 +0000
Message-ID: <874kldixlx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x442.google.com
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, mjt@tls.msk.ru,
 laurent@vivier.eu, qemu-devel@nongnu.org, philippe.mathieu.daude@gmail.com,
 ben@decadent.org.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stephen Long <steplong@quicinc.com> writes:

> Hi Peter,=20
>
>> (a) what does "fails to load" mean here? In the sample binary
>> I had, we got a SIGSEGV in zero_bss() when it tried to memset()
>> memory that hadn't been mmap()ed. Is that the only failure mode,
>> or can this manifest in other ways too?
>
> Apologies for the unclear commit msg. I was also seeing a SIGSEGV in
> zero_bss() with the binaries I was generating. I was using LLD to generate
> the binaries. The binaries all had LOAD segments with a file size of
> 0.

How hairy is the generation of these binaries? If it's all doable with
standard gcc/ldd command lines it would be useful to add them as a
tcg/multiarch test case.

>
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D919921 was the thread=
 that
> Philippe pointed me to with the requested change that solved my issue.
>
>> (b) The comment immediately before this change says:
>>    * Some segments may be completely empty without any backing file
>>    * segment, in that case just let zero_bss allocate an empty buffer
>>    * for it.
>> which is justifying why it was looking at p_filesz and not vaddr_len.
>> With this change to the code, the comment becomes stale and needs
>> updating.
>
> I'll update the comment and the commit msg if this change makes sense to
> everybody.
>
>> (c) After this change, are there still cases where zero_bss()
>> needs to do its mmap()/page_set_flags(), or does that become
>> unnecessary ?
>
> Maybe someone else can speak to this. But, you might be right. I don't see
> this being necessary anymore.
>
> Thanks,
> Stephen


--=20
Alex Benn=C3=A9e

