Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7F5145465
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 13:32:07 +0100 (CET)
Received: from localhost ([::1]:41064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuFB0-0004zo-1t
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 07:32:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45165)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iuF96-0004JN-08
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 07:30:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iuF94-00035K-KA
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 07:30:07 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:55309)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iuF94-00034D-AU
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 07:30:06 -0500
Received: by mail-wm1-x332.google.com with SMTP id q9so6613652wmj.5
 for <qemu-devel@nongnu.org>; Wed, 22 Jan 2020 04:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=FOV2DLtLaLh3KDYA7Sdzq9wbiRygDtRaiJSQkBXjlqY=;
 b=lFoOAB4fD1CV/cUI5pwDpB/NYdjrW9DfUyHRVbQAPuSb3h/916btbMXZTY+MeewWSJ
 VZijuuybFeyUbIIIeJW48j1jIWv/tkcQ8P2IL0k7tBNbAMbFwRSebvje7l5hSSwqTdh3
 i9QWl+k7zdNek0HeaPD1o0OLN6BAOFe8Nb/aqPQ8Jb1S/ePBXbQur2tryWJfKETFRhJq
 fhJKbYcJcq0B76Hx3fyTiCkXFJw6lPsgp9D4OYvRp4yUxf7mC6KzIDYD3KJ4ZZeqT8cy
 mVMOXRAYhqagwBvx5Pd4qzPpuMp0mNBQDdopK7MSGSizyp56p1Ysy+xapoJ2Dq9Di9gz
 TSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=FOV2DLtLaLh3KDYA7Sdzq9wbiRygDtRaiJSQkBXjlqY=;
 b=Q8dWFRjvtdXdVJjAgyfEMDXbWZJ2RXrpqfBeG3WAzwRouQiYahw5ER4eay/L+29lGj
 w3sK89bXiGocwtLqhYz8QHG1boBQqSjIlb3J5vaeZqnVdI96PUOsXsnr/OTyeiR/ORlS
 NyW25dPaEAcuLMI9ZKXJYjnlyvRm4JE+H/WtctBnLuPQuBTW+aqUJu+8i38Bye5yyGDy
 BSQ5AyL9l6qDMx5WTEJuDpXUdeQ34sApP3LsPQoH4bXSdQ55cOsbi4t6UOaYD2L3ae23
 kIa1mRki74uSaHOs5PWyiXbA6A2bLJgQplh6x8WwPXTcYca+b/gZIZIJY0vGz0/HfESO
 vTEA==
X-Gm-Message-State: APjAAAXon4wmKjfEbmgKP9EfuPRjAGofZfpe89Ozl2TcYz7qCLIl0eEG
 4yxCRJ+312WnhyzB8EoXd0SawA==
X-Google-Smtp-Source: APXvYqwaXBB84gn/T/YtjB/17Bzig5t1sliMPvGyTEhwTLYklixdceodqzys1ps7PakLMsIQ4wI6MQ==
X-Received: by 2002:a1c:b603:: with SMTP id g3mr2930831wmf.133.1579696204821; 
 Wed, 22 Jan 2020 04:30:04 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l7sm56564710wrq.61.2020.01.22.04.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 04:30:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1F8D91FF87;
 Wed, 22 Jan 2020 12:30:03 +0000 (GMT)
References: <CAJSP0QX22cYJvnpb+zDDXLaYg0yY4CV3Jn5QY+ExxJyFcmQ3Gw@mail.gmail.com>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: Maintainers, please add Message-Id: when merging patches
In-reply-to: <CAJSP0QX22cYJvnpb+zDDXLaYg0yY4CV3Jn5QY+ExxJyFcmQ3Gw@mail.gmail.com>
Date: Wed, 22 Jan 2020 12:30:03 +0000
Message-ID: <87v9p3znas.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::332
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


Stefan Hajnoczi <stefanha@gmail.com> writes:

> Around 66% of qemu.git commits since v4.1.0 include a Message-Id: tag.  H=
ooray!
>
> Message-Id: references the patch email that a commit was merged from.
> This information is helpful to anyone wishing to refer back to email
> discussions and patch series.

So I guess the ones that don't are maintainer originated patches unless
you actively rebuild your trees from a posted series?

>
> Please use git-am(1) -m/--message-id or set am.messageid in your git-conf=
ig(1).
>
> If you use the patches tool (https://github.com/stefanha/patches) then
> Message-Id: is added automatically.
>
> Thanks,
> Stefan


--=20
Alex Benn=C3=A9e

