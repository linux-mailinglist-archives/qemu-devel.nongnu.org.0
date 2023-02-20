Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AB469D208
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 18:18:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU9n9-0002Cd-OS; Mon, 20 Feb 2023 12:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU9n6-0002Bj-3s
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:17:28 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU9n3-0005OP-MV
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:17:27 -0500
Received: by mail-pl1-x632.google.com with SMTP id t14so2557967plo.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 09:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fkC7UnCrKkGdnlbxD8Pis7vQ5G3MpoLUMew+lWAA7Y4=;
 b=QoYnBQZlBKXTTDnqPcGlyb5/tAQTWZKZmPVCk9b/zaLWhVFCYtsCbUApJf5ReM+vrK
 QBn75MHY/iZR9d2UdwlhvBv+YxHImCPIHpUUEVjCC1FgQiXZQYI3i5GfkyRhiuqZE2f/
 /l9jbD/eTDQgP/PVkTXCzf14SUTdT+DtI25DYQkWYuAnt+F+N1+nS4nBzGyd52TUMY9E
 zrl4fNp0sallPR4N99E0iST6Zxi9PoiQZIRR7qIOLA9nT2QYHOw5aVx1JMxRC0XL6QAj
 4yALIr8LE0TJUNLaWKfSmgHmXqtE3vEF+DlPpggamH7ubJB0Z80os2wICPQzYQZe6BVS
 +P+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fkC7UnCrKkGdnlbxD8Pis7vQ5G3MpoLUMew+lWAA7Y4=;
 b=Kq7jvjSYWI5KNSroD2SX9FxM9wX4L1apsj2CmOpyFbLGZdTV26aUSW7W+39la7ZD2D
 y5Xqbzw7or5OBTGluOtdoz1M0VuA1uQljFzVBqIAZTIk3mANDl/1w+XSt3biZxJSvnFe
 HR0fIM9cwZcK2P1VpLeOYXmK7gzoRPT8cWvF358HHq7kUMYxDP32/usiOuLaiVdG1mI+
 Nu/6LhJFaq/CbID/qwzSI5JfP2u9qwDshdG7HlH0XvP2VbglcKOiGZZz3/JooZLzOy1C
 lsHBws0Nxgdrx76G01RoDVTVNsKth+9xFRmpU1AJ3aN3V/oip99VHC7cIFGXJGABSwB3
 uxwA==
X-Gm-Message-State: AO0yUKVWFnB74YlghsOYfqLlRDWO+laG2ZjxmFMF1IKsEuQxvDLNqzSS
 XZuH6Xzfn2ZE+1Ei+FJoNeY+qVqPV9Rt98Nps3nMQw==
X-Google-Smtp-Source: AK7set+lVeb/ZwwI/RS2HIX1VS8cY3mixE6fcB1cfH5qpaxRm3t9pH+QYG0c4puPfdXTzmLT/L25T/fXNjXdDPcviuU=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1039321pjb.92.1676913442330; Mon, 20
 Feb 2023 09:17:22 -0800 (PST)
MIME-Version: 1.0
References: <20230217204007.371525-1-dinahbaum123@gmail.com>
In-Reply-To: <20230217204007.371525-1-dinahbaum123@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 17:17:11 +0000
Message-ID: <CAFEAcA8UJA0k75tAdwvGCqxHecyudFO-jCs2VaCKhTJgkx+j=g@mail.gmail.com>
Subject: Re: [PATCH v3] configure: Add 'mkdir build' check
To: Dinah Baum <dinahbaum123@gmail.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 17 Feb 2023 at 20:41, Dinah Baum <dinahbaum123@gmail.com> wrote:
>
> QEMU configure script goes into an infinite error printing loop
> when in read only directory due to 'build' dir never being created.
>
> Checking if 'mkdir dir' succeeds prevents this error.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/321
> Signed-off-by: Dinah Baum <dinahbaum123@gmail.com>
> ---
> Changes since v2:
> Updated error message
> Reverted changes to 'help' command
>
>  configure | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index 00415f0b48..784f9d18a5 100755
> --- a/configure
> +++ b/configure
> @@ -31,7 +31,12 @@ then
>          fi
>      fi
>
> -    mkdir build
> +    if ! mkdir build || ! touch $MARKER
> +    then
> +        echo "ERROR: Could not create ./build directory. Check the permissions on
> +            your source directory, or try doing an out-of-tree build."

This works, but the second line ends up a bit oddly indented in
the output (because the indent in the source file at the start
of the second line gets output verbatim). Using a second 'echo'
command for the second line is the easiest way to fix that.

If you fix that and resend this patch, then you can put

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

in the commit message under your signed-off-by line.

thanks
-- PMM

