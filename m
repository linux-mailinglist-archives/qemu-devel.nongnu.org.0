Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6A72C0A7E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 14:43:03 +0100 (CET)
Received: from localhost ([::1]:48826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khC7S-0005kF-HT
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 08:43:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1khC5z-0004SE-0O
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 08:41:31 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1khC5x-0004DT-1W
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 08:41:30 -0500
Received: by mail-wm1-x344.google.com with SMTP id h21so17277378wmb.2
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 05:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=mg2m9HJZmdXoZhR9tiJfaObCumBHX5u/hxwKqu3wUw0=;
 b=JA3QyKNHkYe3AqoumFhv+/730yYKJ6h/B7U5NJ8WelYKBebRzf+OAtdaKYpUAmf731
 5ULutvsAyYIgWelmYKmx2+Cimt42Lnj9qQLHRFRAUA0zlSNHPJP2xgLAnFd6FBfGws9H
 jet2VNbffoe0Wc8e4WcuGDycpmRWA68gvnURnBPMrc7rTc2y9JFLQc+7s6IrQ5z7Vzjk
 gle4nuuA7WzZLTrtR1ppFLArnWM+XzUsuHZnu6DSVWwiWmeuSY7/DdPSvTOYkPWvrwKH
 +IV6k1L4taGvvF3/jm36XYi1RQnFmnqMtpOb4/YaTfGcl0jT46xs1h6ylluc0KAhpZ1u
 CVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=mg2m9HJZmdXoZhR9tiJfaObCumBHX5u/hxwKqu3wUw0=;
 b=pw6Ul4sBodIam72UjuoHCFmQhpDaIrl0RuqADMhpSXNB/75fgdaRpMfXeiSDXG16hJ
 8jfVd8h7aISk7pAA8TrCv8l6vj/0K7Mg0p4N64kr0BMTl7BUD98Hxk1Wfjp5BeipSzbW
 HTwYRc7T7dShsuDvUkNfzjBTh2US+dUFM+8sTqcnQqExFJMrv/QWgku4vS/ywhcGDY8a
 GCVyf5lUe8Iy/ht3C2weU4Geq5UkeuxKaM5V38fPIKbDo+SvvG7jkVm+VPw6P6I96Dpc
 kH3ynOxL66kGVMKu/0Bwlmugvs9rFW7aSKWm+4PDgBMwPy8OdvY497cRNwbVurzXb9dq
 uCoA==
X-Gm-Message-State: AOAM530TGX7yVo92DXnMJV8y3QxVSoxAJQwti4q1/vYq66+wViPZdZTh
 Ri28af6kmr2WlJsotZOZJiMBBQ==
X-Google-Smtp-Source: ABdhPJzXl+7bcyLVmSd1B4gCCKlU6O72cm8AqNT1AezOaZFH18NBgXebzeTNImXeUNdBhRPTsI31Ew==
X-Received: by 2002:a1c:81d7:: with SMTP id
 c206mr23312311wmd.140.1606138887242; 
 Mon, 23 Nov 2020 05:41:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j8sm19448061wrx.11.2020.11.23.05.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 05:41:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 05AD61FF7E;
 Mon, 23 Nov 2020 13:41:25 +0000 (GMT)
References: <20201121210342.10089-1-peter.maydell@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] gdbstub: Correct misparsing of vCont C/S requests
In-reply-to: <20201121210342.10089-1-peter.maydell@linaro.org>
Date: Mon, 23 Nov 2020 13:41:24 +0000
Message-ID: <87im9wnqbf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x344.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> In the vCont packet, two of the command actions (C and S) take an
> argument specifying the signal to be sent to the process/thread, which is
> sent as an ASCII string of two hex digits which immediately follow the
> 'C' or 'S' character.
>
> Our code for parsing this packet accidentally skipped the first of the
> two bytes of the signal value, because it started parsing the hex string
> at 'p + 1' when the preceding code had already moved past the 'C' or
> 'S' with "cur_action =3D *p++".
>
> This meant that we would only do the right thing for signals below
> 10, and would misinterpret the rest.  For instance, when the debugger
> wants to send the process a SIGPROF (27 on x86-64) we mangle this into
> a SIGSEGV (11).
>
> Remove the accidental double increment.
>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1773743
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

LGTM

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
> Haven't really given this enough testing to want to put it into 5.2,
> I think (though it does fix the repro in the bug report).
> The bug has been present since commit 544177ad1cfd78 from 2017.

I'd be happy including it. I don't have any gdbstub patches queued at
the moment but I could put together one if you want or you could just
include it directly if you are now happy to.

>
>  gdbstub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index f19f98ab1ab..d99bc0bf2ea 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1243,7 +1243,7 @@ static int gdb_handle_vcont(const char *p)
>          cur_action =3D *p++;
>          if (cur_action =3D=3D 'C' || cur_action =3D=3D 'S') {
>              cur_action =3D qemu_tolower(cur_action);
> -            res =3D qemu_strtoul(p + 1, &p, 16, &tmp);
> +            res =3D qemu_strtoul(p, &p, 16, &tmp);
>              if (res) {
>                  goto out;
>              }


--=20
Alex Benn=C3=A9e

