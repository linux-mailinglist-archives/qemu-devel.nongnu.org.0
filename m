Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB6F2DC35D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:44:41 +0100 (CET)
Received: from localhost ([::1]:58514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYym-0005ks-SM
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:44:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpYij-000814-JO
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:28:06 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpYiD-0007am-AE
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:28:05 -0500
Received: by mail-wr1-x434.google.com with SMTP id 91so23565585wrj.7
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 07:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=jcpaazG62LhQ90cdc3PWPJ6Zl4x4OBS9o2V4NArgulI=;
 b=uz2Rd/o8dwsF0TUUCOj7JPXiyWsM3F60BLCOAB5+FGKm4+OxDuMIYlFyV4R5YdKvT0
 m/wqVoemVr2iScPSkC+smv6L7Fr8MGMK4OMr+b8HxC9S5ZcyiqOEu2Uz1FAvA1+Zw0ob
 xmNZOmzLlWdJgGGjdhQRbYX9GIWSwOVw2RhhE/vzymKNyuapNpAwD64eCozzDvO3BUQ8
 t0pYN6CNlnxoLIhT9X3O/xclH98UdFooKV/a4h+HYJTSwh3rucaE+/yFJWA+O86Xns8U
 kd5RZRJoasN3H0NqmJf5y4ZGbAxG3Sfyq3lNYbtno/TasFzikw3PwAL1a9ipuqg4gyeW
 IRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=jcpaazG62LhQ90cdc3PWPJ6Zl4x4OBS9o2V4NArgulI=;
 b=Jee1a1YB4brs8lewjS4IWV8xAuOWXoGGjinARCX3ZjkE833zx92taIn3sX5fXEjyXq
 kjG5jNZbGndUgk7wJNCV7yDFMxNdYsCJkqTRkgxfkmxvmUG1/orwszrchQgsDRevU/cv
 tw+D3N+3KLSc46hBMBT37cvS2Ot4bFhl3RgqNxQCDtLb1DMGVRwYO4qE6bJrW7odDaLw
 JmlhJB/Q6SkfWHpn/83YFQny7dC/MRUESQC5tUxXVdvyb0ntMr3r5v+InQnlQicp37JK
 iyRUNCs08a0Z9kfFxADlR7l250W6cqZJ+lU2nQVmZcqSATgJxQMTbOB1HRhafwN6IlBA
 MFHQ==
X-Gm-Message-State: AOAM533HC1VbnKPU8IarZg3Rhw0l2Adl0bZ4bpOJXq1GLyY4755PRoLr
 o6SLnwvqcTlMOjHrNpf0Bjl11A==
X-Google-Smtp-Source: ABdhPJx4mYwBzSd81LhdVCscxMuHjFFPlFl6PrJz3lfpywgJtJFNawpWmJEMaKUutDp/06/GypNVyw==
X-Received: by 2002:adf:fbc5:: with SMTP id d5mr7461696wrs.82.1608132450811;
 Wed, 16 Dec 2020 07:27:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c4sm3863794wrw.72.2020.12.16.07.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 07:27:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AE79F1FF7E;
 Wed, 16 Dec 2020 15:27:28 +0000 (GMT)
References: <20201210190417.31673-1-alex.bennee@linaro.org>
 <20201210190417.31673-4-alex.bennee@linaro.org>
 <873605u92a.fsf@linaro.org>
 <ca2f983f-0b67-37d6-c853-a239105c7e40@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 3/8] configure: move gettext detection to meson.build
Date: Wed, 16 Dec 2020 15:27:02 +0000
In-reply-to: <ca2f983f-0b67-37d6-c853-a239105c7e40@redhat.com>
Message-ID: <87zh2dsrdr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 cota@braap.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 16/12/20 15:19, Alex Benn=C3=A9e wrote:
>>=20
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>=20
>>> This will allow meson to honour -Dauto_features=3Ddisabled later.
>>>
>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>=20
>> ping Paolo, are you happy with this bit?
>
> Yes, I'm so happy with this and the --with-default-features parts that I=
=20
> was going to include it in my next pull request. :)

I'm putting together an testing one now (as there is a testing update as
well).

>
> Series
>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>
> Paolo
>
>>> ---
>>>   configure         | 19 +++----------------
>>>   meson_options.txt |  2 +-
>>>   po/meson.build    |  2 +-
>>>   3 files changed, 5 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/configure b/configure
>>> index 8f2095a2db..46fdea88c7 100755
>>> --- a/configure
>>> +++ b/configure
>>> @@ -448,7 +448,7 @@ libdaxctl=3D""
>>>   meson=3D""
>>>   ninja=3D""
>>>   skip_meson=3Dno
>>> -gettext=3D""
>>> +gettext=3D"auto"
>>>=20=20=20
>>>   bogus_os=3D"no"
>>>   malloc_trim=3D"auto"
>>> @@ -1014,9 +1014,9 @@ for opt do
>>>     ;;
>>>     --enable-vnc) vnc=3D"enabled"
>>>     ;;
>>> -  --disable-gettext) gettext=3D"false"
>>> +  --disable-gettext) gettext=3D"disabled"
>>>     ;;
>>> -  --enable-gettext) gettext=3D"true"
>>> +  --enable-gettext) gettext=3D"enabled"
>>>     ;;
>>>     --oss-lib=3D*) oss_lib=3D"$optarg"
>>>     ;;
>>> @@ -2839,19 +2839,6 @@ if test "$xen_pci_passthrough" !=3D "disabled"; =
then
>>>     fi
>>>   fi
>>>=20=20=20
>>> -##########################################
>>> -# gettext probe
>>> -if test "$gettext" !=3D "false" ; then
>>> -  if has xgettext; then
>>> -    gettext=3Dtrue
>>> -  else
>>> -    if test "$gettext" =3D "true" ; then
>>> -      feature_not_found "gettext" "Install xgettext binary"
>>> -    fi
>>> -    gettext=3Dfalse
>>> -  fi
>>> -fi
>>> -
>>>   ##########################################
>>>   # X11 probe
>>>   if $pkg_config --exists "x11"; then
>>> diff --git a/meson_options.txt b/meson_options.txt
>>> index f6f64785fe..191e848600 100644
>>> --- a/meson_options.txt
>>> +++ b/meson_options.txt
>>> @@ -9,7 +9,7 @@ option('sphinx_build', type : 'string', value : '',
>>>=20=20=20
>>>   option('docs', type : 'feature', value : 'auto',
>>>          description: 'Documentations build support')
>>> -option('gettext', type : 'boolean', value : true,
>>> +option('gettext', type : 'feature', value : 'auto',
>>>          description: 'Localization of the GTK+ user interface')
>>>   option('install_blobs', type : 'boolean', value : true,
>>>          description: 'install provided firmware blobs')
>>> diff --git a/po/meson.build b/po/meson.build
>>> index 1387fd979a..a863f0575f 100644
>>> --- a/po/meson.build
>>> +++ b/po/meson.build
>>> @@ -1,6 +1,6 @@
>>>   i18n =3D import('i18n')
>>>=20=20=20
>>> -if get_option('gettext')
>>> +if find_program('xgettext', required: get_option('gettext')).found()
>>>     i18n.gettext(meson.project_name(),
>>>                  args: '--msgid-bugs-address=3Dqemu-devel@nongnu.org',
>>>                  preset: 'glib')
>>=20
>>=20


--=20
Alex Benn=C3=A9e

