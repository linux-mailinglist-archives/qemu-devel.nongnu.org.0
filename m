Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824C5480BB
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 13:33:00 +0200 (CEST)
Received: from localhost ([::1]:46220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcpsh-0007UM-0n
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 07:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53037)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hcpqM-0006ms-Gj
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 07:30:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hcpqL-0000TO-85
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 07:30:34 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40064)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hcpqK-0000R3-Iv
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 07:30:32 -0400
Received: by mail-wr1-x441.google.com with SMTP id p11so9549440wre.7
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 04:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=cW0LliCMMwAeh3F4KyCwlJSY2xLQO9AR4xx6vY2pCws=;
 b=ARg8T78V7lBz1pHYnLblbinn/FGVHRoeUCi8y5zpGXdKquucCoQj2rmmMmlSGN55ma
 3VMqBQm5MoYBPWUm8mcXCKIUiHvKmV1Cb4/Ou5/tki3W+4psB0ltlJ7qgxn2xq6tAECt
 /JYpKAGEy1kC30RvtDs/A8CCqhv/Z2rrQFOFV4yQ+NiKsGkeuWtEiTs0yEybC29kDoDL
 8CXph19C18wVcloegI7LCfpliGW0/Gw3iydzCMFL7wGAWZwFC6ZNMO+7pSrR9dH4rapW
 1YRkivO8Dlwn5IbIyVpsKI6Oy71fYtaO50gDFt6HWfI3MaLgKu2vYDpcsr5f30Kivwed
 6ZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=cW0LliCMMwAeh3F4KyCwlJSY2xLQO9AR4xx6vY2pCws=;
 b=Kt3b8IzHgk46t7Jgs77WSUUhxNnNoHLJHyZ/yqiCvOWYLlOU0/Pfs3JKEBaAhk2ZrR
 fKWOq70L4TgTB1RLAJ2y5fqGnhfdaqXKkjBNXxqL/Osb6j0zwlSW4AeFvuonv/RdasIK
 3wdPjceZ3NR6JCrRm44CpD94kawS2VdoQfRB4WHWn7EzcStuN4WX1dCtuN1s5lOZ7uHA
 QdFvW/0uLlCU3sSTS6D4KrqGS42UV9E7OGniKFAmH0EMDqyUKJ/7XNInT59qkuX7+/6m
 xLyY5Xmca913VdIpUA2L6DlQJqq5KCm1KdU2CPsfV5b3IjY05sB0pDNmyVc4RrlIhtRF
 Qq/Q==
X-Gm-Message-State: APjAAAWphZOjHAzRcxES2S2vc0bdZ+toz79vy9jtejVRJX75W2TQu+Wl
 fqrKPB9lFIGSYjWEd87KoEd+xg==
X-Google-Smtp-Source: APXvYqyKhh8OQ7RTtu42yKYSP/MWt8cvFV3NVQxZa7EtUdjM2zkeDjQ/1tgWNHJW07oTFXlwc9nK2g==
X-Received: by 2002:a5d:528d:: with SMTP id c13mr17725176wrv.247.1560771030880; 
 Mon, 17 Jun 2019 04:30:30 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id o185sm12575166wmo.45.2019.06.17.04.30.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 04:30:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D5CC21FF87;
 Mon, 17 Jun 2019 12:30:29 +0100 (BST)
References: <20190614135332.12777-1-vandersonmr2@gmail.com>
 <20190614135332.12777-4-vandersonmr2@gmail.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
In-reply-to: <20190614135332.12777-4-vandersonmr2@gmail.com>
Date: Mon, 17 Jun 2019 12:30:29 +0100
Message-ID: <87ef3sbga2.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-devel] [Qemu-Devel][PATCH 3/3] Adding command line option
 to linux-user.
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
Cc: Riku Voipio <riku.voipio@iki.fi>, vandersonmr <vandersonmr2@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


[added Markus to Cc for his view on options]

vandersonmr <vandersonmr2@gmail.com> writes:

> Added -execfreq to enable execution frequency counting and dump
> all the TB's addresses and their execution frequency at the end
> of the execution.
>
> Signed-off-by: vandersonmr <vandersonmr2@gmail.com>

This works well enough but we are going to need a way to enable this for
softmmu as well. The preference for that is to add a option group to
qemu-options.hx which will allow a number of related options to be
grouped together.

The last thing that was added was the thread=3Dmulti flag to -accel
tcg,thread=3Dmulti but unfortunately the -accel option is very much a
softmmu only option group.

Maybe it's time to add a -tcg option for all the various options so we
can have (and are likely to add)?:


  -tcg tbcount=3Dtrue
  -tcg tbcount=3Dtrue,tbstats=3Dfile,file=3Doutput.txt
  -tcg tbcount=3Dtrue,tbstats=3Dchardev,id=3Dstatschar

There are going to future enhancements we might consider:

  -tcg jitperf=3D/tmp/perf.map

A long time in the future we may even have:

  -tcg multiexitblocks=3Dtrue

until it defaults to true and the knob is just there to turn it off.

The closest example of an option group shared between linux-user and
softmmu is the trace code. Both builds do a:

   qemu_add_opts(&qemu_trace_opts);

(why can't this be done by module init code?)

And then they can call the general qemu_opts parser on the top level
option:

  trace_opt_parse(arg);

So maybe we need to bite the bullet and create tcg/tcg-options.c and put
our tweaking machinery in there (and the real location of
enable_freq_count)?

Markus do you have a view?


> ---
>  linux-user/exit.c | 5 +++++
>  linux-user/main.c | 7 +++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/linux-user/exit.c b/linux-user/exit.c
> index bdda720553..0c6a2f2d5b 100644
> --- a/linux-user/exit.c
> +++ b/linux-user/exit.c
> @@ -26,8 +26,13 @@
>  extern void __gcov_dump(void);
>  #endif
>
> +extern bool enable_freq_count;
> +
>  void preexit_cleanup(CPUArchState *env, int code)
>  {
> +    if (enable_freq_count) {
> +        tb_dump_all_exec_freq();
> +    }
>  #ifdef TARGET_GPROF
>          _mcleanup();
>  #endif
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 1bf7155670..ece2d8bd8b 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -388,6 +388,11 @@ static void handle_arg_trace(const char *arg)
>      trace_file =3D trace_opt_parse(arg);
>  }
>
> +static void handle_arg_execfreq(const char *arg)
> +{
> +    enable_freq_count =3D true;
> +}
> +
>  struct qemu_argument {
>      const char *argv;
>      const char *env;
> @@ -439,6 +444,8 @@ static const struct qemu_argument arg_table[] =3D {
>       "",           "Seed for pseudo-random number generator"},
>      {"trace",      "QEMU_TRACE",       true,  handle_arg_trace,
>       "",           "[[enable=3D]<pattern>][,events=3D<file>][,file=3D<fi=
le>]"},
> +    {"execfreq",   "QEMU_EXEC_FREQ",   false,  handle_arg_execfreq,
> +     "",           "enable and dump TB's execution frequency counting"},
>      {"version",    "QEMU_VERSION",     false, handle_arg_version,
>       "",           "display version information and exit"},
>      {NULL, NULL, false, NULL, NULL, NULL}


--
Alex Benn=C3=A9e

