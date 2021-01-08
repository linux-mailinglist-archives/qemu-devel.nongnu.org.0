Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35952EF56C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 17:05:41 +0100 (CET)
Received: from localhost ([::1]:33436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxuGi-0007q2-QB
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 11:05:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtqY-00074W-4W
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:38:38 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:44572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtqW-0003VS-Ax
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:38:37 -0500
Received: by mail-ej1-x62c.google.com with SMTP id w1so14953510ejf.11
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rPxolWVqn2Qs6yPoRuT6Y3s1WuQyH1tjwMCY8QGOUI0=;
 b=VKSbSwzW8/QRkItfq647k1gW9Ug2wgSk3YRHgHfCiEyCuqXFuP4nsdPRgwJzImokpL
 0Nz7oia1274MVKnAeDVZuf/tTlziPkV+Nbpa7FDnam0I6qqAysdycBQnYdU/VF2+gBok
 fSTFGVxtDxrRf2C+9pSx4tCvwkqyCJbGIeDJNV/clsFDfDk8zEkt+20EIGlpWLskZOoR
 kON3eSGCEJ5mKkVeSiyC4yTvdGEXLsFr/F+ylyGiZxm3PtHez/XVaNt59yZbIsKZV2KN
 pyu5qLcJz/rFm25kYbaZ2xuzOm2JEOUgTKnryDodlMy/dNh4b0k6L2zX3auN0SgDZuiv
 p3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rPxolWVqn2Qs6yPoRuT6Y3s1WuQyH1tjwMCY8QGOUI0=;
 b=gNnKIIrGeDOGmef93uqzxx9ELMsoiNN2cOkq5RCzUY6ecwJTTpKZsVDIRYzrD+0Z3a
 /nKsmC89LBv7Oo9krpBtOJhAMAMc8ruK6Nn+442ER6c2YAVdZ+wh8137Ini0dXTXwXjx
 Q2K2+noyL+h0vaUd5rgOQUL/EwKR7L7vfVNlJD2M5wtwmoA8jEMO0v2HtBlNMVcb/bIA
 L2i3Fv3uovlTdDRBNUWoISlLbzgxRV4jwFSCtjgmBPchpj5cbryqdoB35lrDFGIlTnDM
 0xBDAKnXeFjvlCHKBByb82cgxFQBcs5C4vPNCnALq49EFlggqMGHNEWQWjgMk8h1Xt7v
 BL/A==
X-Gm-Message-State: AOAM532fYHq03y3SGbQhR8kBZsB4xWRrEkw3lTuyuUmdVED0V6lXKiWp
 uDt+A3CkWQMa+Uv0spOx8GGLQiMhhqG4T9xvA84JSw==
X-Google-Smtp-Source: ABdhPJxes9ERz61aVWYIqGB6bdKrP4JxS0mpH0vxSJ+MvTz91l23MpQwD28ka+RmWuP7AMm21BdH9jxNe0K5AbEUuPE=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr2933356ejf.407.1610120314932; 
 Fri, 08 Jan 2021 07:38:34 -0800 (PST)
MIME-Version: 1.0
References: <20210108151632.277015-1-f4bug@amsat.org>
In-Reply-To: <20210108151632.277015-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 15:38:23 +0000
Message-ID: <CAFEAcA_5YzU7sGhbVtzP7-=PsaJoe3wMxkCPnO=qdY8q6Bf7rw@mail.gmail.com>
Subject: Re: [PATCH] decodetree: Open files with encoding='utf-8'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Jan 2021 at 15:16, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> When decodetree.py was added in commit 568ae7efae7, QEMU was
> using Python 2 which happily reads UTF-8 files in text mode.
> Python 3 requires either UTF-8 locale or an explicit encoding
> passed to open(). Now that Python 3 is required, explicit
> UTF-8 encoding for decodetree sources.
>
> This fixes:
>
>   $ /usr/bin/python3 scripts/decodetree.py test.decode
>   Traceback (most recent call last):
>     File "scripts/decodetree.py", line 1397, in <module>
>       main()
>     File "scripts/decodetree.py", line 1308, in main
>       parse_file(f, toppat)
>     File "scripts/decodetree.py", line 994, in parse_file
>       for line in f:
>     File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
>       return codecs.ascii_decode(input, self.errors)[0]
>   UnicodeDecodeError: 'ascii' codec can't decode byte 0xc3 in position 80=
:
>   ordinal not in range(128)
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  scripts/decodetree.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> index 47aa9caf6d1..fa40903cff1 100644
> --- a/scripts/decodetree.py
> +++ b/scripts/decodetree.py
> @@ -1304,7 +1304,7 @@ def main():
>
>      for filename in args:
>          input_file =3D filename
> -        f =3D open(filename, 'r')
> +        f =3D open(filename, 'r', encoding=3D'utf-8')
>          parse_file(f, toppat)
>          f.close()

Should we also be opening the output file explicitly as
utf-8 ? (How do we say "write to sys.stdout as utf-8" for
the case where we're doing that?)

thanks
-- PMM

