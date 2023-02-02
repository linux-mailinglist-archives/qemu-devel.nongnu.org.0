Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DBF687652
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 08:21:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNTtW-0005tu-Vr; Thu, 02 Feb 2023 02:20:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pNTtU-0005s4-IX
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:20:28 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pNTtS-000717-DQ
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:20:28 -0500
Received: by mail-lf1-x134.google.com with SMTP id cf42so1691859lfb.1
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 23:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iveh3JL1g4AsB5h3fIbuvFaKClrvEvU5APxF958f2h8=;
 b=TYYZDus61JzsyPSlBJmOj64dGRGM/zxHqNkY3VWpjaqMLWUiJvuYtl/SnIuAikKzvf
 HedE56keEwb77/QGvCCEEipMdGEqDZ2s3WfY7er+7yJGxdooKZDSM/SNruC+MwSZr0Kl
 0wq9QLTgoIPWHthq3Hn+LRFbK00BG8wMuFbGn1EfbSRn8mUFkYSEmch7fOlcakKS+kBv
 pZegI9JpzPEbJ7zU8AvZBt7FFCSF1TnM8VunKcv1/N2a0M1oEWA9agf2OHP4gHNhSppC
 bpFRj7O6OUinDZFOVYd5it6enMPDG5f9JucvUmqqYsvl84rlD9zgqblGN52XFRDg3Ta+
 FjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iveh3JL1g4AsB5h3fIbuvFaKClrvEvU5APxF958f2h8=;
 b=nqgGJlKMNEgd/CWL9MRkQQGYhyqqYJAQZzYcDbgbF+dQFfpnTTFWhwyy3a2oVTnfQG
 tvQYWSCKIjnHQQQ9VfUmwMeuoT26xvsxWoZH/sLy+koGyczFeiRwUiBJSuFpxpCiHBoT
 59IgBpWSsq9X9Q8vLohXrO/GOnRAtF2JH4M30AUI2V2L5H1TH+7hjqa+/z92V/aeiEW7
 OQYcgRTKDc15sEHCKYzelk5gL/zivz/BypCMGg0j25qrcks8i/rFYO7v8LnSBBqoqMUY
 hBd7KRVXlpo5PpJqBb0QRr0TjA51tHGgI47pX1lQcR1EFo5WFEjuXcM8+MU+U67yCMcL
 bURg==
X-Gm-Message-State: AO0yUKUjb8Xxc8+7aQyLpMOcM4CsdscPDdmbvVv8mV/N/B3uL9NE2/w5
 XjumpwfLauVUdKM60monJpTX1s7wcnhgz7b1ICo=
X-Google-Smtp-Source: AK7set8js/dCezbpl9ADdSUzWTCAEJK8VDgQS97HY9KLdcAHll5DOkVG3vcTTVAgDEP31vFd0w9QBOBneIEIo1F3Rwc=
X-Received: by 2002:a05:6512:b01:b0:4cc:8686:8c87 with SMTP id
 w1-20020a0565120b0100b004cc86868c87mr683131lfu.188.1675322423892; Wed, 01 Feb
 2023 23:20:23 -0800 (PST)
MIME-Version: 1.0
References: <20230130095202.2773186-1-bin.meng@windriver.com>
 <CAMxuvayW7mzQcVLrB8v-adoKXVKgq-pGCf6uT-cURcmDW51bFQ@mail.gmail.com>
 <Y9koH+ElplpptxWp@redhat.com>
 <CAMxuvazwG372R9TtFLZLzDx_Zm8kzQRu9-guizfwegFvA=9gCg@mail.gmail.com>
 <MN2PR11MB41732681AABAD7BA573E1E9DEFD19@MN2PR11MB4173.namprd11.prod.outlook.com>
In-Reply-To: <MN2PR11MB41732681AABAD7BA573E1E9DEFD19@MN2PR11MB4173.namprd11.prod.outlook.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 2 Feb 2023 11:20:12 +0400
Message-ID: <CAJ+F1CJK4n7b0hb8-HNk0J_SZjYYrCdCj9RCUQpOVPw0Oq57iA@mail.gmail.com>
Subject: Re: [PATCH v4 00/16] hw/9pfs: Add 9pfs support for Windows
To: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Meng, Bin" <Bin.Meng@windriver.com>, Greg Kurz <groug@kaod.org>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi

On Wed, Feb 1, 2023 at 5:05 PM Shi, Guohuai <Guohuai.Shi@windriver.com> wro=
te:
>
>
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Sent: Tuesday, January 31, 2023 23:07
> > To: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > Cc: Meng, Bin <Bin.Meng@windriver.com>; Greg Kurz <groug@kaod.org>; Chr=
istian Schoenebeck <qemu_oss@crudebyte.com>; qemu-devel@nongnu.org; Shi, Gu=
ohuai <Guohuai.Shi@windriver.com>; Laurent > Vivier <lvivier@redhat.com>; P=
aolo Bonzini <pbonzini@redhat.com>; Philippe Mathieu-Daud=C3=A9 <philmd@lin=
aro.org>; Thomas Huth <thuth@redhat.com>
> > Subject: Re: [PATCH v4 00/16] hw/9pfs: Add 9pfs support for Windows
> >
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> > Hi
> >
> > On Tue, Jan 31, 2023 at 6:39 PM Daniel P. Berrang=C3=A9 <mailto:berrang=
e@redhat.com> wrote:
> > On Tue, Jan 31, 2023 at 06:31:39PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > > Hi
> > >
> > > On Mon, Jan 30, 2023 at 1:52 PM Bin Meng <mailto:bin.meng@windriver.c=
om> wrote:
> > >
> > > > At present there is no Windows support for 9p file system.
> > > > This series adds initial Windows support for 9p file system.
> > > >
> > > > 'local' file system backend driver is supported on Windows,
> > > > including open, read, write, close, rename, remove, etc.
> > > > All security models are supported. The mapped (mapped-xattr)
> > > > security model is implemented using NTFS Alternate Data Stream
> > > > (ADS) so the 9p export path shall be on an NTFS partition.
> > > >
> > > > 'synth' driver is adapted for Windows too so that we can now
> > > > run qtests on Windows for 9p related regression testing.
> > > >
> > > > Example command line to test:
> > > >
> > > >   "-fsdev local,path=3Dc:\msys64,security_model=3Dmapped,id=3Dp9 -d=
evice
> > > > virtio-9p-pci,fsdev=3Dp9,mount_tag=3Dp9fs"
> > > >
> > > > Base-commit: 13356edb87506c148b163b8c7eb0695647d00c2a
> > > >
> > > > Changes in v4:
> > > > - Fixed 9pfs mounted as read-only issue on Windows host, adding a
> > > >   win32_error_to_posix() to translate Windows native API error to
> > > >   POSIX one.
> > > > - Fixed errors of handling symbolic links
> > > > - Added forward declaration to avoid using 'void *'
> > > > - Implemented Windows specific xxxdir() APIs for safe directory acc=
ess
> > > >
> > > >
> > > Sorry to look a bit late at this series, I don't know what was discus=
sed
> > > previously.
> > >
> > > My general feeling is that a lot of this FS portability work would be
> > > better handled by using GIO (even though this may add some extra
> > > dependency). GIO lacks some features on win32 (for example xattribute=
s on
> > > win32), but they could have been proposed there too and benefiting ot=
her
> > > apps.
>
> GIO function is actually same as MinGW APIs, which is not safety as MinGW=
 (discussed in previous versions).
>
> https://gitlab.gnome.org/GNOME/glib/-/blob/main/glib/dirent/dirent.c#L61
> https://github.com/Alexpux/mingw-w64/blob/master/mingw-w64-crt/misc/diren=
t.c#L42
>
> GIO function also does not handle symbolic links on Windows host, this ma=
y cause security issues.
> GIO functions also use Windows POSIX APIs without extra security checks (=
does not provide NO_FOLLOW flags):
> https://gitlab.gnome.org/GNOME/glib/-/blob/main/glib/gstdio.c#L1050
>
> 9pfs need functions like openat() to make sure that the sub-sequence oper=
ation is working in the expected parent.
>
> So using GIO will still have security issues.

Fair enough, it's a bit of a shame it's not easy to sandbox a process
and not have to worry about those links..

