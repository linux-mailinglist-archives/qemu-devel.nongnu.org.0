Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9C27C452
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 16:05:06 +0200 (CEST)
Received: from localhost ([::1]:41096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hspE0-0000aL-Tt
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 10:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60303)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hspDV-00009q-Sb
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:04:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hspDU-00065I-U3
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:04:33 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:42328)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hspDU-000631-Bn
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:04:32 -0400
Received: by mail-wr1-x444.google.com with SMTP id x1so19930106wrr.9
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 07:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=KZQDQTJoJmsn4bk38zyEP41eB5Y35J+w6Y7mqvRnCkE=;
 b=KZmQFklRHzyAOjTXV7EoYaXNHNDMkrA0FkGChq/9hbN58RblUm/gjP+6kUWrEM7LTM
 0WTwSuejWijPV4i8knbFfvsXbzGWckmyucUiimWJqW+9a0+OPMDv9b88oG+nFzSrTowF
 jf1yiLDUgWNhzI7Anwu6uZCWHozZWWVXczDBG27xi10KX04uyuSIo4MTkTed+odj1+MS
 QqqNLofmlffbuHzpLsvFnfSOFTysn1OpkkdltLD5vw3eQHqx+WokMcQYJz0bg8tMI8bq
 NB/Lvwxa+xLPf5oOzPXQFVyCQYjguLEFEseashMjzlLoT9+K0RikouU/qNgDvjRWzy/O
 CiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=KZQDQTJoJmsn4bk38zyEP41eB5Y35J+w6Y7mqvRnCkE=;
 b=MNKLmRqHi4mUOSSNEsLO/iCND2fwGVwSZDfR3zKkMmN4qgyK/fqor54wx+Sxa9u+Pe
 SSWj3tf4STOdpzi+TAvRsJZ9gpGDta/vMIgV+9pbHLhGbxYIk0gt3IXa+bFYWpIJd6/h
 UkgNMtlsM0TsjT4PxtELQtPbADxeuRAALS7sfuqASGwlirK4fj1/AO4ng4lbYVbD4oIZ
 k2trRzc2Zf7lrYy6fVrkHGgK81CkyDuDLjnE7xEr4sYDQVKIUZL1w3S8vPeOxbu53OW9
 xHtDcTSStQd99kEqnOhDNzjpohgNyPYt7pUTmTkLUMITjHQks96TDgJziErn3zNlQw4S
 /PZg==
X-Gm-Message-State: APjAAAWXCLKOxyDVs+w789hPlDHx6aVvEC1O3eQIbe7IufmtqTDf5dKT
 vcAtN37P/h7oBW/SDqvY4KmA+9aft4M=
X-Google-Smtp-Source: APXvYqwY4xkyXmwhuWianznY7D/EGlj4iLUqsFDQrj+qrtBlW8uHE8qmD7vUEDatFuYA+jc9TqpkFw==
X-Received: by 2002:adf:eb51:: with SMTP id u17mr2490360wrn.257.1564581870038; 
 Wed, 31 Jul 2019 07:04:30 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id l8sm138045623wrg.40.2019.07.31.07.04.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 07:04:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0D2321FF87;
 Wed, 31 Jul 2019 15:04:29 +0100 (BST)
References: <20190725084341.8287-1-berrange@redhat.com>
User-agent: mu4e 1.3.3; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
In-reply-to: <20190725084341.8287-1-berrange@redhat.com>
Date: Wed, 31 Jul 2019 15:04:29 +0100
Message-ID: <87a7cui9le.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-devel] [PATCH v2 0/3] require newer glib2 to enable
 autofree'ing of stack variables exiting scope
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
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> Both GCC and CLang support a C extension attribute((cleanup)) which
> allows you to define a function that is invoked when a stack variable
> exits scope. This typically used to free the memory allocated to it,
> though you're not restricted to this. For example it could be used to
> unlock a mutex.
<snip>
>
>     GOOD:
>         g_autofree char *wibble =3D g_strdup("wibble")
> 	...
> 	return g_steal_pointer(wibble);
>
>     g_steal_pointer is an inline function which simply copies
>     the pointer to a new variable, and sets the original variable
>     to NULL, thus avoiding cleanup.

Surely this is a particular use case where you wouldn't use g_autofree
to declare the variable as you intending to return it to the outer scope?

--
Alex Benn=C3=A9e

