Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F152ED01B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 13:44:05 +0100 (CET)
Received: from localhost ([::1]:34378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxUe4-0002MG-1B
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 07:44:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxUcC-0001Tv-3E
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 07:42:08 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:36175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxUc3-00051b-P4
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 07:42:04 -0500
Received: by mail-wm1-x336.google.com with SMTP id y23so5426389wmi.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 04:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=hm+TDULvTFm3BkCp3PJC0miDRY8RW3QNcnYoyhla4jY=;
 b=hJWpumI++WGCpq0hprJQxeqfOCSRhsRMIc6/3ekzogLj803W7/sRiQsiy6fTKT91Kq
 Lord8noTup0g+dZoSLmvs0Dr/dtdxArlrqZIw7pGaBDollwu/iqisbbGQiNcsPm+C5sp
 gQdNop+/iM5rIrKZcjME/T65ST/eb3GtrlM2oUQ6zPJsQouzFPWYfL9HjA6h10ORhlg6
 M0bixPOGt2LXgs9HCf4/vz9Ey5eqk5irzSX+3iAb1KGt0NqyXl3kO/hoL+fW3BBj9S8S
 yg+vnGQ4f9ym7eP67qy/wBLqi2lGWm1446qXWlCvl05pqk+1WR20I0KRVZMydZDXv72l
 UVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=hm+TDULvTFm3BkCp3PJC0miDRY8RW3QNcnYoyhla4jY=;
 b=hrwnA34qIZNSVDdSJCPGEglCoFq4ptDL2MKBdRDXnebaRUMbbhwameBlVxpFQniiz8
 fPg7Cv9fFPss/V3y65mJzSkhP5FImyUWgIVRwCoB0jNupvDCtamTilY1VAeoIfqMuasv
 urhppf+aOsVg+AST84wOT1EmJkFcWtK2Uu7qN3wedBFZ/HEKM8dbLtmNAz4VYT3l7BT6
 NpoIQvh/osZ/dJ3RLEs/Gnwtjw5OSR7b0XqJl19VombBZ1IjBhe/SU9a+8sFmY+RxiMa
 ReYF5CHQJHsJyNLr09ENKmRYADfQexdiVtE+LMuRnhFz5KU11W2Ixu68wMp96zblFb5A
 JazQ==
X-Gm-Message-State: AOAM530g0njfDmYdYPzmhKHmD9uoUOjFhUD94dfi30+XnqQqZ2Msf/IV
 6G9zwIqJ568b71tT4fgB0dD2mtbwG/DMSw==
X-Google-Smtp-Source: ABdhPJzr+j8hK51Baz9iG94nYUTGdQD/4b8m5gQ/SG1ugZ2+xv6d7KBvs3s5Wh/waX+bb6YHRZQHUQ==
X-Received: by 2002:a05:600c:d8:: with SMTP id
 u24mr7834463wmm.103.1610023317274; 
 Thu, 07 Jan 2021 04:41:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o125sm7401568wmo.30.2021.01.07.04.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 04:41:56 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AF2BE1FF7E;
 Thu,  7 Jan 2021 12:41:55 +0000 (GMT)
References: <1609963815-417989-1-git-send-email-steven.sistare@oracle.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V1] gdbstub: suspended state support
Date: Thu, 07 Jan 2021 12:40:44 +0000
In-reply-to: <1609963815-417989-1-git-send-email-steven.sistare@oracle.com>
Message-ID: <87h7ns2a24.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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


Steve Sistare <steven.sistare@oracle.com> writes:

> Modify the gdb server so a continue command appears to resume execution
> when in RUN_STATE_SUSPENDED.  Do not print the next gdb prompt, but do not
> actually resume instruction fetch.  While in this "fake" running mode, a
> ctrl-C returns the user to the gdb prompt.

What exactly is the purpose of this? To hide the details of the runstate
as controlled by the user? I wouldn't expect someone using gdb debugging
not to also have control of the HMP/QMP interface.

>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  gdbstub.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index f3a318c..2f0d9ff 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -461,7 +461,9 @@ static inline void gdb_continue(void)
>  #else
>      if (!runstate_needs_reset()) {
>          trace_gdbstub_op_continue();
> -        vm_start();
> +        if (!runstate_check(RUN_STATE_SUSPENDED)) {
> +            vm_start();
> +        }
>      }
>  #endif
>  }
> @@ -490,7 +492,7 @@ static int gdb_continue_partial(char *newstates)
>      int flag =3D 0;
>=20=20
>      if (!runstate_needs_reset()) {
> -        if (vm_prepare_start()) {
> +        if (!runstate_check(RUN_STATE_SUSPENDED) && vm_prepare_start()) {
>              return 0;
>          }
>=20=20
> @@ -2835,6 +2837,9 @@ static void gdb_read_byte(uint8_t ch)
>          /* when the CPU is running, we cannot do anything except stop
>             it when receiving a char */
>          vm_stop(RUN_STATE_PAUSED);
> +    } else if (runstate_check(RUN_STATE_SUSPENDED) && ch =3D=3D 3) {
> +        /* Received ctrl-c from gdb */
> +        gdb_vm_state_change(0, 0, RUN_STATE_PAUSED);
>      } else
>  #endif
>      {
> @@ -3282,6 +3287,8 @@ static void gdb_sigterm_handler(int signal)
>  {
>      if (runstate_is_running()) {
>          vm_stop(RUN_STATE_PAUSED);
> +    } else if (runstate_check(RUN_STATE_SUSPENDED)) {
> +        gdb_vm_state_change(0, 0, RUN_STATE_PAUSED);
>      }
>  }
>  #endif


--=20
Alex Benn=C3=A9e

