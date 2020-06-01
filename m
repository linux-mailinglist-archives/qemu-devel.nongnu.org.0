Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FA91EA450
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jun 2020 14:59:30 +0200 (CEST)
Received: from localhost ([::1]:39056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfk2L-0002EA-Ak
	for lists+qemu-devel@lfdr.de; Mon, 01 Jun 2020 08:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jfk1K-0001l9-BC
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 08:58:26 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:46052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jfk1J-0007ri-5i
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 08:58:25 -0400
Received: by mail-lf1-x142.google.com with SMTP id d7so3830700lfi.12
 for <qemu-devel@nongnu.org>; Mon, 01 Jun 2020 05:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F4sEGZD2MWtB0UajP0WFZuOx/bxgRYbdJaRSrhHx824=;
 b=icosGr2KHtz6V/Z5hhSDyABvEYcvZF3an1fohazThw7JyofG2++0h5gljcilynoYs5
 4GkAR8Jg5nY4qUARsMZpXFrOd/sFq42XeLtmbPfIbY5/Oxag6kZEBp+E+miwgw3shhVS
 K8LLnMlFRAkhNpvlkVMIj07vwudYT80qlSUxMZtNecjE4JpnCSM212RA1meUb1wVWJKu
 MCFWisiUFp7aue7TABzCZmeFKq3dE7DyqhpZg06JcmRDyu6TK2prGNB8/pW92xYApSbM
 Q+CJ8Hlyfj+Gm4sfyKyKW4G/r8k/TJEJAZCj47qlYqDpGG4Ie9A3KnBiw2TV3L8wQpzK
 n1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F4sEGZD2MWtB0UajP0WFZuOx/bxgRYbdJaRSrhHx824=;
 b=BrsOHtVJT6ZE981FzoeY0xo9N0d9koKHOJ2IKwLv0o7FB7lEkTkNTr4cbqLmrU72cY
 RXNGwcgud3P45P6eEotjNlX8R1evOOOFYfsrs/oIbO+PJoDbnXBXar7kH9XR3QCcqovz
 Tz/sB7tEpHy0868yxBjSNd9G2zM0VierIWGx950Wa3wglh/IRQuCDMAorVyEBnyrI2xA
 YWNIhGbXXtiCmfNTAbwm/bR5Csnt93ElvUG0fSglNw9DJoxIelE+YMgkhrq2esS7nsi6
 JLvdjk/zxyAyY3gUw3aTCNqR95wdPl2be7sWqN8tsaXkXJTYoc6vnZyapbXzuCB1390N
 dVgA==
X-Gm-Message-State: AOAM533oKvrPnwv0Z6mfrh8YzveDmObr2aHEskjb9Xyuw8uGdoDybwNW
 O2aRTLQDgmt4DdW1ZERZ0sJ4prxaX5WWARBIoMfqSA==
X-Google-Smtp-Source: ABdhPJyb3Djr+dwaoK45je16yews60ON9o1sGXW6ecZsiZGZrzUPm80TCB9qZY2o/beofNnWI8CdbDTuKPKElr7MEMU=
X-Received: by 2002:ac2:4119:: with SMTP id b25mr11110118lfi.208.1591016303195; 
 Mon, 01 Jun 2020 05:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200529203458.1038-1-robert.foley@linaro.org>
 <20200529203458.1038-13-robert.foley@linaro.org>
 <235ec2d4-f8ee-5192-9da5-4e29b2599525@redhat.com>
In-Reply-To: <235ec2d4-f8ee-5192-9da5-4e29b2599525@redhat.com>
From: Robert Foley <robert.foley@linaro.org>
Date: Mon, 1 Jun 2020 08:58:21 -0400
Message-ID: <CAEyhzFt8wNGGsC6VWPAai-UGFPVQt=tNrR+5Q5OdTY7VGXv5rg@mail.gmail.com>
Subject: Re: [PATCH v8 12/12] tests/vm: Add workaround to consume console
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=robert.foley@linaro.org; helo=mail-lf1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Fam Zheng <fam@euphon.net>, Peter Puhov <peter.puhov@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 31 May 2020 at 07:27, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 5/29/20 10:34 PM, Robert Foley wrote:
<snip>
> > @@ -271,7 +276,9 @@ class BaseVM(object):
> >          args +=3D self._data_args + extra_args + self._config['extra_a=
rgs']
> >          logging.debug("QEMU args: %s", " ".join(args))
> >          qemu_path =3D get_qemu_path(self.arch, self._build_path)
> > -        guest =3D QEMUMachine(binary=3Dqemu_path, args=3Dargs)
> > +        guest =3D QEMUMachine(binary=3Dqemu_path, args=3Dargs,
> > +                            console_log=3Dself._console_log_path,
> > +                            drain_console=3DTrue)
>
> Are you sure you need to set drain_console here? Isn't it implied by
> self._console_log_path?

Good point.  Yes, drain_console is implied by self._console_log_path.
Will fix it.

Thanks & Regards,
-Rob
>
> >          guest.set_machine(self._config['machine'])
> >          guest.set_console()
> >          try:
> > @@ -285,6 +292,8 @@ class BaseVM(object):
> >              raise
> >          atexit.register(self.shutdown)
> >          self._guest =3D guest
> > +        # Init console so we can start consuming the chars.
> > +        self.console_init()
> >          usernet_info =3D guest.qmp("human-monitor-command",
> >                                   command_line=3D"info usernet")
> >          self.ssh_port =3D None
> > @@ -296,7 +305,9 @@ class BaseVM(object):
> >              raise Exception("Cannot find ssh port from 'info usernet':=
\n%s" % \
> >                              usernet_info)
> >
> > -    def console_init(self, timeout =3D 120):
> > +    def console_init(self, timeout =3D None):
> > +        if timeout =3D=3D None:
> > +            timeout =3D self.socket_timeout
> >          vm =3D self._guest
> >          vm.console_socket.settimeout(timeout)
> >          self.console_raw_path =3D os.path.join(vm._temp_dir,
> > @@ -578,6 +589,8 @@ def parse_args(vmcls):
> >      parser.add_option("--efi-aarch64",
> >                        default=3D"/usr/share/qemu-efi-aarch64/QEMU_EFI.=
fd",
> >                        help=3D"Path to efi image for aarch64 VMs.")
> > +    parser.add_option("--log-console", action=3D"store_true",
> > +                      help=3D"Log console to file.")
> >      parser.disable_interspersed_args()
> >      return parser.parse_args()
> >
> >
>

