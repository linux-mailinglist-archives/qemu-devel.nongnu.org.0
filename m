Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE404566E0
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 01:19:01 +0100 (CET)
Received: from localhost ([::1]:51348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnrcK-0007FM-HH
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 19:19:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1mnrbR-0006b6-TP
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 19:18:05 -0500
Received: from [2607:f938:3000:8::2] (port=37623 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1mnrbQ-0001Qi-Fa
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 19:18:05 -0500
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4HwHLf1Jbgz8PbN;
 Thu, 18 Nov 2021 19:18:02 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=cRe2QRjfI
 CrKa2ro2gSfUFz31No=; b=CUjExnavZ6YIbHmjvJI8BS1vnskKQ8q95PqVp2g+O
 N2axz2KWFHsgCN9Bdn6seat/DPU04u3/9QQUDppQpl2uOkgF+JpGKoJOR2LWMaUF
 8kgIu/AeKuWJkW8MkUxHUQYR/IGlqpkiXaDqvTX+j7mJx5+uLarpkBhMlPQV31y/
 Bk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=dlD
 BcqC69kWCK3XOzH3Azk3a4KzLPqur2BuHxZVA3+COcSJGc363oUww4oYszXwLcyi
 CwBCykUXfBOV24M9P+A/C2besvgYgzBUIFQ3rNjomQzxig9ynnL2fiiJKJSo+kFA
 ZyR5/eQO8CxxZ+TT5bK9BQUnUIxjS3yYpA9kA+F0=
Received: from [IPV6:2001:470:b0db:180::1001] (unknown
 [IPv6:2001:470:b0db:180::1001])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4HwHLf0JtNz8PbK;
 Thu, 18 Nov 2021 19:18:02 -0500 (EST)
Message-ID: <c4a28907-b075-3601-3cf9-e54941dcb6f8@comstyle.com>
Date: Thu, 18 Nov 2021 19:18:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 for-6.2] meson.build: Support ncurses on MacOS and
 OpenBSD
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211117205355.1392292-1-sw@weilnetz.de>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <20211117205355.1392292-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f938:3000:8::2
 (failed)
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.084,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/2021 3:53 PM, Stefan Weil wrote:

> MacOS provides header files for curses 5.7 with support
> for wide characters, but requires _XOPEN_SOURCE_EXTENDED=3D1
> to activate that.
>
> By default those old header files are used even if there
> is a newer Homebrew installation of ncurses 6.2 available.
>
> Change also the old macro definition of NCURSES_WIDECHAR
> and set it to 1 like it is done in newer versions of
> curses.h when _XOPEN_SOURCE_EXTENDED=3D1 is defined.
>
> OpenBSD has the same version of ncurses and needs the same fix.
>
> Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> v2:
> - Only define _XOPEN_SOURCE_EXTENDED when curses.h is used.
> - Extended to fix OpenBSD, too (untested!)
>
>   meson.build | 5 ++++-
>   ui/curses.c | 4 ++++
>   2 files changed, 8 insertions(+), 1 deletion(-)

Tested-by: Brad Smith <brad@comstyle.com>

