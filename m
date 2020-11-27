Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDC02C63A2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 12:14:05 +0100 (CET)
Received: from localhost ([::1]:42848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kibhU-0007Yp-4N
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 06:14:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kibgZ-00078k-FV
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 06:13:07 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:38481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kibgX-0001QY-IB
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 06:13:07 -0500
Received: by mail-ej1-x641.google.com with SMTP id a16so7075660ejj.5
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 03:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=a9ApZLyCXh4ogAgUVLS6dglSSLtAuu2hr7/gPWGZjOA=;
 b=IXtpWKRZuNdYWdkh5PNlT83MBDaHSxOPvQmTa+d4k95p3KI6zMl1HB35Ku7vmSkXoW
 XE5zfpk42shgm2S9RUNHp4NH7IyoWIDW956kjS2FTuxBiBDJLjZWqJzaCXYphi4XfS23
 EY51lMoghiWn0ejQy3YIiDVYlfucD21Xfeii8isw4l7cK46SfVvV23P3gma3d1EorKt+
 c4zvR0ckjWVs2yPu+P3Ln2S1cElogTclT67V5CRUI9k7cHFoz+OSCcHD2MkuLBC+yv7g
 gj17Xv+D7e3Hq2F4VNO6rs2RDrAcyClGPqselSH+fh0n53jowQOwgleSlbB/1kI96VMP
 WrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a9ApZLyCXh4ogAgUVLS6dglSSLtAuu2hr7/gPWGZjOA=;
 b=cq+j0fH+X4TkD+6PQrsCYLZOVvMAHbbZ9gdx+8pS4F/JKmKtvMmrAKfAr4UKjZRsWA
 vHjHWGgxBAwDDjns9RhHNk+USMXnO9vmDzDvjukqtJ0aldOrYMsJ14QAzVDmVxDdcOVw
 rc7pY7bVAf+iMmj16grZ0zRaFed0jeGxZk2K/t2hiD1KcLI/TDNs/vDFmVuEwui5eEOR
 7N/3JlteasgHfsisyyX5Ry6tGXuTapn1PwaQWlhO6QgvepuI6vOm4Jv1bV9ZeCb/9l3P
 0AOfPH+TKZB455woJPUArdkr+oRKU8d/wf8tN4eVx15fMp9JHFuqRA39NhgNAqzzVgSj
 kMwA==
X-Gm-Message-State: AOAM533x5+49TsawkYfkgV36f9dba8L9T+byVjRsqM/kZlGMvJ6Q9Eu5
 x4be/4sYL05i0kRojEInIYL2kSh1nc85/JV03cf+XQ==
X-Google-Smtp-Source: ABdhPJxKr22kwnPZk4ZJ73AAdU8JYxe/JsBY57tKLm3d7fzGsdRbYh9q6KIeiJHN4SgsygGKTN7+D+ZQmP88ufeXmlk=
X-Received: by 2002:a17:906:d8a9:: with SMTP id
 qc9mr7057419ejb.482.1606475582403; 
 Fri, 27 Nov 2020 03:13:02 -0800 (PST)
MIME-Version: 1.0
References: <20201127103314.1782200-1-berrange@redhat.com>
In-Reply-To: <20201127103314.1782200-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Nov 2020 11:12:50 +0000
Message-ID: <CAFEAcA8KXnkRqvw9d9-sRjhzCvscjY+N+cLVcOrUqMV6zDFeTQ@mail.gmail.com>
Subject: Re: [qemu PATCH] docs: fix missing backslash in certtool shell example
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Nov 2020 at 10:34, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  docs/system/tls.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/system/tls.rst b/docs/system/tls.rst
> index dc2b94257f..b0973afe1b 100644
> --- a/docs/system/tls.rst
> +++ b/docs/system/tls.rst
> @@ -64,7 +64,7 @@ interactive prompts from certtool::
>     cert_signing_key
>     EOF
>     # certtool --generate-self-signed \
> -              --load-privkey ca-key.pem
> +              --load-privkey ca-key.pem \
>                --template ca.info \
>                --outfile ca-cert.pem
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

