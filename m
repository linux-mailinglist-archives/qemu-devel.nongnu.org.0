Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB3C222122
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jul 2020 13:09:07 +0200 (CEST)
Received: from localhost ([::1]:52100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jw1lC-0000Sp-01
	for lists+qemu-devel@lfdr.de; Thu, 16 Jul 2020 07:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jw1k1-0008Tu-QJ
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 07:07:53 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:43588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jw1jz-0002oA-UG
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 07:07:53 -0400
Received: by mail-wr1-x442.google.com with SMTP id j4so6587327wrp.10
 for <qemu-devel@nongnu.org>; Thu, 16 Jul 2020 04:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=C6E9vtOzgEj4Th0XxIOdPTDswZ88/ro+PVZBO7uaB/Q=;
 b=tQuv6PbZUV7LDx+qyUoUsOYA+0MYYMb+IZ2qCiYH0TrE3AKEhFREbRNAjs5Y4GhM+m
 WsCOjk9N+uonn1TyLrGEq//1iC6hmnSgI5vSGLQo1R+czsDOVhNNPDIHwJ+QIRpoihXc
 wUe3fLBecZi4qDRLF4yJE+qYdQjOkGr9LHoJ4YHqiKiVY+hVoSWnfyd0J4+xejZ8ME3j
 kR5f/lFPgeLthDH+PBpbzZnFCVtiprJbVzX8zRRCeWz95XrNhA6p/UMaZ5nbjxI9V0Gl
 DTOeYlNpdRkv361d3M90e6j9Uvh4Ak84PZn9uNl2zi3M9qCtxx10ub4RGFw3qWGrsEVh
 PuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=C6E9vtOzgEj4Th0XxIOdPTDswZ88/ro+PVZBO7uaB/Q=;
 b=jay5y9QT7wxhU3YkuDHp0OAof4iIg66qwXbA5Ux/rFu2e910PHEkfJQkYEuYTD8Im4
 /HjXOENAJA8iNYKll81DplOy79oqCAM2ksOyuIhM2bwGoA1UFMJLz6cdBefoWWNWjjvt
 JA51dZr3RPYenzZdaRtxbeU8cqJex2b0h79+a/gAXV8Asoatfu3QNPvZhxxHiubcwgk9
 umoXcCNFQyZbeyhn8+YBc5c/hebTtt/3oTZyE/F0INT4n8psN3wnZFiBA65VXAhMRwQ3
 SmHzEV6cgn6x0jwf2Fg3McEUYISpCP4crxAbD2yv1q3+o+McUeX2alt8ZuIy+B0TZcHy
 el0A==
X-Gm-Message-State: AOAM532ocfBICMqZk4bJy/lOWNzWxVk79cf/AjYEWscw7FTtqkOxXxUJ
 vbQkPPnAe3Yvuj3becw32DcUrA==
X-Google-Smtp-Source: ABdhPJyPTtekJ/1teqMDY4w1GVUR0VnUCuI10c5RagIppvRcakphayU9KrC3j0RSR3pmWB6GKgBWUg==
X-Received: by 2002:adf:fe4b:: with SMTP id m11mr4498375wrs.36.1594897670028; 
 Thu, 16 Jul 2020 04:07:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x185sm8061889wmg.41.2020.07.16.04.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 04:07:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 280021FF7E;
 Thu, 16 Jul 2020 12:07:48 +0100 (BST)
References: <20200715204814.2630-1-robert.foley@linaro.org>
 <20200715204814.2630-2-robert.foley@linaro.org>
User-agent: mu4e 1.5.4; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Robert Foley <robert.foley@linaro.org>
Subject: Re: [PATCH 1/2] python/qemu: Cleanup changes to ConsoleSocket
In-reply-to: <20200715204814.2630-2-robert.foley@linaro.org>
Date: Thu, 16 Jul 2020 12:07:47 +0100
Message-ID: <87blkfwwe4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: peter.puhov@linaro.org, Cleber Rosa <crosa@redhat.com>, jsnow@redhat.com,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Robert Foley <robert.foley@linaro.org> writes:

> The changes to console_socket.py and machine.py are to
> cleanup for pylint and flake8.
>
> Signed-off-by: Robert Foley <robert.foley@linaro.org>
> ---
>  python/qemu/console_socket.py | 58 +++++++++++++++++------------------
>  python/qemu/machine.py        |  7 +++--
>  python/qemu/pylintrc          |  2 +-
>  3 files changed, 34 insertions(+), 33 deletions(-)
>
> diff --git a/python/qemu/console_socket.py b/python/qemu/console_socket.py
> index 830cb7c628..6a746c1dbf 100644
> --- a/python/qemu/console_socket.py
> +++ b/python/qemu/console_socket.py
> @@ -1,12 +1,9 @@
<snip>
> @@ -103,7 +104,6 @@ class ConsoleSocket(asyncore.dispatcher):
>=20=20
>      def set_blocking(self):
>          """Maintain compatibility with socket API"""
> -        pass

Hmm shouldn't this be with the change in 2/2 because I thought you
needed a "pass" for an empty function in python?

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

