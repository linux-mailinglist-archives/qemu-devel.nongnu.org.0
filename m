Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE186A9DE9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:42:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY9Q9-00008t-3l; Fri, 03 Mar 2023 12:42:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hshan@google.com>) id 1pY9Q6-00007o-DQ
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:42:15 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hshan@google.com>) id 1pY9Q3-0003Ft-Tf
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:42:13 -0500
Received: by mail-pg1-x531.google.com with SMTP id p6so1994692pga.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1677865330;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3feuUO6tpNUTBTgDyRaLf/2H8gxZlh4jtIHenCBPWGc=;
 b=mOAL/fxqfbDDBeED25MMyVkzF52c6wBfckngAfjuha16sxBfKW33djVCeLrz3knTbl
 bJ/0Ms3dFQu0HSI3o69AfFVQj0ViLHqdEMzg3VwKNI5qBPr1GoT5UzoMNrmHpBCt+/jZ
 HS2ajWWPt0AlgfBDiXzs4m3UG74cEZVENcqyYCQUpUzdVOgr+Ijn50q+wIbeWXpT8/TX
 x1C+jZBV1mrDleyjCJSes2w4KAdDRh2oP6Zn9h6OPrcM6PZ4QR7uvINTsyHN7ocUCX8e
 VIUt/OnR0IA5znZj56a+Wuy40IcZfcsRygcJ3zEx9/GMW6H6CxtSP2jtqHbJ0KyMSuc0
 wH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677865330;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3feuUO6tpNUTBTgDyRaLf/2H8gxZlh4jtIHenCBPWGc=;
 b=6eI5lB7MjBTiVq2ycptXSUTuc4wsweICclZ3KF8GPWdQcMF52Sa/W8el7SJYoo4tO1
 E7KSqjW3M9WjUwEs9OVn09JY/3Vf8xH0Mfpo2UFvmVoIZB2UPGF8k2OGGBDl5wgEiaw3
 T2WNQiQP+PVXrIin3C9gY0bVc/rxSdoF4uLZkK9aL//fkuHL0hEXs7xRuMLTFsAKk90L
 zZaDfKA1coKAIk/i0qaytjNcn/IMM1woIwyY7iR7omIJaKjQ1nhT/2yEn2kYvxVGv6rl
 ifcZI06aDnUaTJezUU7pZXvcvRw4YPgVTHuPzfnyPv2XrjeMfPV7cmJnHkAhmgCQ1MPQ
 Co6g==
X-Gm-Message-State: AO0yUKU58vLKupe6QAY9ZoJ1USV4C5FUxwh3UJUMus1V9T/+XIG5RaDF
 HROHiC7DEiWxvxIXU2R1iKLTut9u31H44rv7nf2zUg==
X-Google-Smtp-Source: AK7set/QT+3t3GXyQMNFuRNyuD97PO5pXL24QEYgotsqWsKrferb0sSM1o4EnqqGsl1esUgssyAzB0eiFitVlKIcbOc=
X-Received: by 2002:a05:6a00:1d9f:b0:5a8:aaa1:6c05 with SMTP id
 z31-20020a056a001d9f00b005a8aaa16c05mr2979400pfw.2.1677865330102; Fri, 03 Mar
 2023 09:42:10 -0800 (PST)
MIME-Version: 1.0
References: <20230303022618.4098825-1-hshan@google.com>
 <20230303023013-mutt-send-email-mst@kernel.org>
 <aeac5ad3-6672-10b1-283d-10d950688697@linaro.org>
 <CAGD3tSw+_qiNpSX51vGb7-XMKPFQuFKxBj072BegL_A4krn3Ag@mail.gmail.com>
 <ZAIua0vjgvWljLo4@redhat.com>
In-Reply-To: <ZAIua0vjgvWljLo4@redhat.com>
From: Haitao Shan <hshan@google.com>
Date: Fri, 3 Mar 2023 09:41:59 -0800
Message-ID: <CAGD3tSya5f99VOj6qASMwsk42jCtmOhwPf5biopeOF1ds6ZvVg@mail.gmail.com>
Subject: Re: [PATCH 1/6] Add the Android Emulator hypervisor driver (AEHD)
 accelerator.
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=hshan@google.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Fri, Mar 3, 2023 at 9:29=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Fri, Mar 03, 2023 at 09:24:16AM -0800, Haitao Shan wrote:
> > On Fri, Mar 3, 2023 at 2:19=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <phi=
lmd@linaro.org> wrote:
> > >
> > > On 3/3/23 08:33, Michael S. Tsirkin wrote:
> > > > On Thu, Mar 02, 2023 at 06:26:12PM -0800, Haitao Shan wrote:
> > > >> Add the configure support for the Android Emulator hypervisor driv=
er
> > > >> accelerator. The Android Emulator hypervisor driver is a Windows
> > > >> driver made by porting the KVM from kernel 4.9-rc7.
> > > >>
> > > >> Signed-off-by: Haitao Shan <hshan@google.com>
> > > >
> > > > Replying on patch 1 but it applies to the whole patchset.
> > >
> > > Indeed this series lacks a cover letter, which would show
> > > this huge diffstat:
> > Sorry. I think I made a mistake and I know being new to
> > the community is not an excuse. I will correct it in future.
> > I don't know if "git sendmail" can have a cover letter. So the
> > cover letter was written separately. Again, I am sorry for
> > that.
>
> FWIW, I can recommend using the 'git-publish'[1] tool instead
> of git sendemail.  git-publish helps to just "do the right
> thing" without you needing to know the details. It will prompt
> for a cover letter to be entered, include the diffstat, and
> CC any maintainers related to files your patch touches. It
> figures this all our from the .gitpublish file that is in the
> root of the QEMU git repo.
>
> If you want test send some mails, then just tell git-publsh to
> send to yourself instead of qemu-devel.
Got it. Thank you very much for your advice. I am going to do
the experiment now.

>
> With regards,
> Daniel
>
> [1] https://github.com/stefanha/git-publish
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


--=20
Haitao @Google

