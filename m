Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A512145C12
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 19:57:56 +0100 (CET)
Received: from localhost ([::1]:45806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuLCN-0001c0-Ln
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 13:57:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38407)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iuLBM-0001Bv-N5
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 13:56:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iuLBL-0006rI-FV
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 13:56:52 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:33776)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iuLBL-0006qs-86
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 13:56:51 -0500
Received: by mail-wr1-x444.google.com with SMTP id b6so278040wrq.0
 for <qemu-devel@nongnu.org>; Wed, 22 Jan 2020 10:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=polKHGu3b1LQF/4dRiimdY9P7jsmcLxTdAMFoQjWUhw=;
 b=ZK0ACg17V0rymBZrnVOOM2bKOjKDRqWVvwMTq3fVspkCYKJYKmCMxEO+Q9jP/fCMOz
 qP8pLMk+i1L9JwXlyR0SaH9FlFds9IBi4dYzMGgENeo91WvajZa197FE9ST3WoFu9fUn
 HhX7MOQ7KQrrd/l1qWdOfbcIAnga/dG4CPBhcQuzladlBzJaHksTIKfjdUUsaZsHaK5q
 hZfejpJKIGs33h4RXoALO0daBgMXQZ8H/Kx8YOJ0mr0diOligtbz6+uCGfDiAWqTNZha
 QRPcPW/hmP1gnb8FpJNWKKKORqBVQdRZ7HewBxVfCGYSc5LDjCOEdCYK9kX6ieXPLUb8
 v+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=polKHGu3b1LQF/4dRiimdY9P7jsmcLxTdAMFoQjWUhw=;
 b=OPbf4AiQOv9sLwDCPiDHFWWH2BQi+uYtA2/bnlFmSXb68k9K7/qZxBhRoV65M+kgSF
 BL9gy8ovYy+XScrSiq6dCC8LfNqJXYZCafamab7HnojYDVYDnKn5AUeC3GGGydau7z+C
 XIJKHwjspPBRuV2huiUaLImwvSaACwyxKjPOqTTplWro/ZrrWm5zEU9bMIGTGhLR9nnd
 7LH9KSnlZI1TFawzvFWWolTy1prjTZnilsUUEfA3Ue0uXUB2oniiFcwKrE1TiHYHASgX
 aJquURIGIZVJjCiSB2RVgOl6x5SEWt6ce2hAYW50HkONbCFmcWGHd4c5nUgKnaVo4CLc
 KHWQ==
X-Gm-Message-State: APjAAAWmG9R8Mm5I8r1TLtyo204JVwEgFfWdd4MF6BCz8V4pL5kd+Ljz
 rDj4qSGf1jzc4u87JwMP/2n9XA==
X-Google-Smtp-Source: APXvYqz7DNQhisfbOK1YGfas4ZgrFf71VNXSZI3m1WFGh+bZ3VGWDr24FMgLJPh+ygdEprUIugrLRA==
X-Received: by 2002:adf:f58a:: with SMTP id f10mr13541779wro.105.1579719409657; 
 Wed, 22 Jan 2020 10:56:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y7sm5779507wmd.1.2020.01.22.10.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 10:56:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C7DDC1FF87;
 Wed, 22 Jan 2020 18:56:47 +0000 (GMT)
References: <CAJSP0QX22cYJvnpb+zDDXLaYg0yY4CV3Jn5QY+ExxJyFcmQ3Gw@mail.gmail.com>
 <87v9p3znas.fsf@linaro.org>
 <9ac75d71-731d-a9d8-4ba6-f394077c4d96@redhat.com>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: Maintainers, please add Message-Id: when merging patches
In-reply-to: <9ac75d71-731d-a9d8-4ba6-f394077c4d96@redhat.com>
Date: Wed, 22 Jan 2020 18:56:47 +0000
Message-ID: <87k15jz5e8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Laszlo Ersek <lersek@redhat.com> writes:

> On 01/22/20 13:30, Alex Benn=C3=A9e wrote:
>>=20
>> Stefan Hajnoczi <stefanha@gmail.com> writes:
>>=20
>>> Around 66% of qemu.git commits since v4.1.0 include a Message-Id: tag. =
 Hooray!
>>>
>>> Message-Id: references the patch email that a commit was merged from.
>>> This information is helpful to anyone wishing to refer back to email
>>> discussions and patch series.
>>=20
>> So I guess the ones that don't are maintainer originated patches unless
>> you actively rebuild your trees from a posted series?
>
> I *think* this should not be a huge problem process wise:
>
> Assuming that a maintainer does not include their own patches in a PULL
> request for Peter until the same patches receive R-b/A-b/T-b feedback
> from other list subscribers, the maintainer will want to rebase the
> patches at least once anyway, in order to pick up those lines.

Oh I always do a re-base as I apply the r-b/t-b tags. But that is
working off my tree and a bunch of references to the emails with the
appropriate tags in them.

So which Message-Id should I use. The first time the patch was posted to
the list or the last time it was?

> And, in the process, the maintainer might as well add in their own
> Message-Id's from the list.
>
> ... I realize though, that could be more burden in practice than just
> running git-am against the same (known) base commit... One could always
> run git-range-diff in the end, to compare the "re-pick" versus the
> original local branch.

I'm obviously missing out by not using patches but my own Emacs based
tooling. I guess I shall have to see if I can extend it.

>
> Thanks
> Laszlo


--=20
Alex Benn=C3=A9e

