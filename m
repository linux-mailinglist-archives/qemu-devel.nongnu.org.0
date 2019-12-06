Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFB6115511
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 17:23:44 +0100 (CET)
Received: from localhost ([::1]:40775 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idGOM-0001DY-LP
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 11:23:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60423)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1idEyt-0000FW-TV
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:53:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1idEys-0005gZ-Q4
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:53:19 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40913)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1idEys-0005eO-IG
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:53:18 -0500
Received: by mail-wm1-x344.google.com with SMTP id t14so7604685wmi.5
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 06:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=gMIAeVAhQnvfU6oBZoSTFxIjczft5EtT5+HIXiu9QZI=;
 b=aUrDqqAPVvlCCENFDPUImD8blVexBwRl7lulCMy2I+hhW5sgPqtcWz9Iu2ULtB3U4V
 /A6OpnuYQiSvfHGa2zyJ0n6ba+HmBKRhiIDLLDiFNvFx63E/xnIGOqjrr9TOfMx1M/Ah
 nJoUaH9oeiyzi+msEUKC9GnSTof1alx2WqDnyvxIV2KGrq22TsCtDVAuf3d00/Wz/S8W
 LRdCMjwUuvFQup3t0Q2Ci9i24Ie9DGovKUoe/tlsMpFmv/txGqBI6HabylepLLxnrRDo
 V2gOs8JtLZZJrvMquaNpA37ZnU3DqO5o8d/VhkBJ9X5ZzwTr2gJXWIz9C+3pwzJ0FCsf
 qxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=gMIAeVAhQnvfU6oBZoSTFxIjczft5EtT5+HIXiu9QZI=;
 b=CdqNY+xtGp0ymvoJXxPE09mb+xcFV3eXMcA50TZyKtyxqNR/VCESLhthlgHngDFaGx
 s7mYoGbPnQN0IOdhNhXDLn/pdv+T38aUKxSzLARIuouYQyIFX1h4lpBF8ZBDmp0fM6uv
 eMB+DSJebNGkE1LsoSADZNL5+R1hVK+Cw+7JI744r+USR9bVQR+uG0aqtd0DlkeELetp
 LYTYkLrTDnlvbFlgXSSZ6nTyPtWctVAwE8td5Me4g+vRZ5nwD0BzlPYp7ztp2qy4/pI+
 SVf2bgX3+zgxVW4cMLxfmiY9wEcS0q7glnrZSbjKgYNnNPYTOjzKwFc70PsL3y74oJkf
 ge/g==
X-Gm-Message-State: APjAAAXdTwQMZNf26apYnPsKwVQpqE05XJ0Kx23nfZE2GI+e/KZkVmtY
 5EyBBR1kTZfq3FqtBH9ZRt0koQvBGlA=
X-Google-Smtp-Source: APXvYqzKlcTlbb7TvBXhcAQ7bl9ozgPfC6ZvVjekAFfrli448mCdXbUyWEvktLa8LwE38eLw8xqVmQ==
X-Received: by 2002:a05:600c:2318:: with SMTP id
 24mr8336506wmo.48.1575633543772; 
 Fri, 06 Dec 2019 03:59:03 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c4sm3200192wml.7.2019.12.06.03.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2019 03:59:02 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C21661FF87;
 Fri,  6 Dec 2019 11:59:01 +0000 (GMT)
References: <20191205122518.10010-1-alex.bennee@linaro.org>
 <20191205122518.10010-7-alex.bennee@linaro.org>
 <20191206110354.GA775461@stefanha-x1.localdomain>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH  v2 6/6] trace: replace hand-crafted pattern_glob with
 g_pattern_match_simple
In-reply-to: <20191206110354.GA775461@stefanha-x1.localdomain>
Date: Fri, 06 Dec 2019 11:59:01 +0000
Message-ID: <87immt7ji2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Hajnoczi <stefanha@redhat.com> writes:

> On Thu, Dec 05, 2019 at 12:25:17PM +0000, Alex Benn=C3=A9e wrote:
>> We already use g_pattern_match elsewhere so remove the duplication.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  trace/control.c | 35 +----------------------------------
>>  1 file changed, 1 insertion(+), 34 deletions(-)
>
> Is g_pattern_match() a superset of pattern_glob()?  Existing patterns
> should continue to work.

Yes - it supports more than pattern_glob and a bit less than the system
glob():

  The g_pattern_match* functions match a string against a pattern
  containing '*' and '?' wildcards with similar semantics as the standard
  glob() function: '*' matches an arbitrary, possibly empty, string, '?'
  matches an arbitrary character.

  Note that in contrast to glob(), the '/' character can be matched by the
  wildcards, there are no '[...]' character ranges and '*' and '?' can not
  be escaped to include them literally in a pattern.

If you give me some example existing pattern forms we can add them to
test-logging. I manually tested both single and double * patterns while
working on the rest of the series.

>
> Stefan


--
Alex Benn=C3=A9e

