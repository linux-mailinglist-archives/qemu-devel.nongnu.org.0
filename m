Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F03A25760F7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 13:58:18 +0200 (CEST)
Received: from localhost ([::1]:55380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCJxZ-0006vH-LZ
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 07:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oCJvT-00047q-Nv
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 07:56:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oCJvP-0005Lk-1g
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 07:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657886160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Zf9yZVRe2YmeXvhQU8Y0kVJ3QKDVBUG2rxD2+py63U=;
 b=IUbsCmNjanROjy/wNLO9MFIvAb+xGPemcOGk94DmzGhQIVobtZpOthayZo0YR9KKN+zxdR
 6AQZQ1FeIXzwuNd+JfUSkujoyAz6pa+R938Zq21QFOKhQHfiLhpD7K2T7n7vluuKMbJPNZ
 3f7bBe5vUTL4UeKXs7o1MCuu8ThlzEE=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-33TST-L4MCG2O9CECAM5vw-1; Fri, 15 Jul 2022 07:55:59 -0400
X-MC-Unique: 33TST-L4MCG2O9CECAM5vw-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-10c27e22190so2714324fac.2
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 04:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6Zf9yZVRe2YmeXvhQU8Y0kVJ3QKDVBUG2rxD2+py63U=;
 b=tP2m+nxCKXl8Wc9qbVuDyUqsHJj8clygqVhUaS5RULvxMTun+z9dtNBFJeZdi5EQSV
 WtAjoZOcgECJWb6prRcfi7XZ//nQhQ7COdelQiQvLlKyeOKF6dcAmhAQbVBQyoAVXcWt
 jxq1C/y2Y988wRqmBm0KtRIzJuYqXY79QLEUg5v3w8+MUUhZCVQy4BSUsdd0BughODaS
 yocZxzY8Zr9JY0JWv691F4UX8Zdl41IKNaPiWtbvM/vVakVSMmk/yE2PJRb0xnZw4v9A
 6GJhzp4CFoGH9xK/HNi+uO4+s7cw0R0efpq3s16OGHNyDNZqm+R1OyMSYh6kBcYmANzR
 a3vQ==
X-Gm-Message-State: AJIora/ndNisddZhI0poRB2WIQcl5UaFbsAWwiESr8BQkwqkYdIQgwig
 bGW4/7Z8axqyj5979CaX2TfROhZh40T0fB51br1mO6dJ5YzlJPv75W2hwPerahqdfjTvxm95Fh9
 SIuWEhVmbjFze7NpouIX9LStNhca5shw=
X-Received: by 2002:a05:6870:c1c1:b0:ee:5c83:7be7 with SMTP id
 i1-20020a056870c1c100b000ee5c837be7mr7275951oad.53.1657886158833; 
 Fri, 15 Jul 2022 04:55:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ul5eHUpAx+KkmGSHyVEtYfbe+VHVxVKAOQtzprxvi+oITPcuNTgVCP7Or/ky+iVsovhH6bVeD/HtPkMn4QiZA=
X-Received: by 2002:a05:6870:c1c1:b0:ee:5c83:7be7 with SMTP id
 i1-20020a056870c1c100b000ee5c837be7mr7275943oad.53.1657886158564; Fri, 15 Jul
 2022 04:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
 <20220712093528.4144184-11-marcandre.lureau@redhat.com>
 <CANCZdfpuq4YgrmcuyqJCfpXwguGbVJqBOa2vT==Hkr2bLSYRrw@mail.gmail.com>
In-Reply-To: <CANCZdfpuq4YgrmcuyqJCfpXwguGbVJqBOa2vT==Hkr2bLSYRrw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 15 Jul 2022 15:55:47 +0400
Message-ID: <CAMxuvawC6T-QrsJ911tMwP_y4UrumRoutqyV6j5dec7soYAfDA@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] qemu-common: introduce a common subproject
To: Warner Losh <imp@bsdimp.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Xie Yongji <xieyongji@bytedance.com>, 
 Kyle Evans <kevans@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <laurent@vivier.eu>, 
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Tue, Jul 12, 2022 at 6:58 PM Warner Losh <imp@bsdimp.com> wrote:
>
>
>
> On Tue, Jul 12, 2022 at 3:36 AM <marcandre.lureau@redhat.com> wrote:
>>
>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> Add a new meson subproject to provide common code and scripts for QEMU
>> and tools. Initially, it will offer QAPI/QMP code generation and
>> common utilities.
>>
>> libvhost-user & libvduse will make use of the subproject to avoid having
>> include/ links to common headers.
>>
>> The other targeted user is qemu-ga, which will also be converted to a
>> subproject (so it can be built, moved, released etc independent from QEM=
U).
>>
>> Other projects such as qemu-storage-daemon could be built standalone
>> eventually in the future.
>>
>> Note that with meson subprojects are "global". Projects will share
>> subprojects (https://mesonbuild.com/Subprojects.html#subprojects-dependi=
ng-on-other-subprojects).
>> We will add extra subprojects/ links to allow standalone subproject
>> compilation though.
>>
>> This initial commit simply set the stage to build and link against it.
>>
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> ---
>>  meson.build                                              | 9 ++++++++-
>>  .../qemu-common/include}/qemu/help-texts.h               | 0
>>  linux-user/meson.build                                   | 4 ++--
>>  subprojects/libvduse/meson.build                         | 2 ++
>>  subprojects/libvduse/subprojects/qemu-common             | 1 +
>>  subprojects/libvhost-user/meson.build                    | 2 ++
>>  subprojects/libvhost-user/subprojects/qemu-common        | 1 +
>>  subprojects/qemu-common/meson.build                      | 8 ++++++++
>>  8 files changed, 24 insertions(+), 3 deletions(-)
>>  rename {include =3D> subprojects/qemu-common/include}/qemu/help-texts.h=
 (100%)
>>  create mode 120000 subprojects/libvduse/subprojects/qemu-common
>>  create mode 120000 subprojects/libvhost-user/subprojects/qemu-common
>>  create mode 100644 subprojects/qemu-common/meson.build
>>
>> diff --git a/meson.build b/meson.build
>> index bc5569ace159..254eb1263a66 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -167,6 +167,10 @@ if 'dtrace' in get_option('trace_backends')
>>    endif
>>  endif
>>
>> +add_project_arguments('-I' + meson.current_source_dir() / 'subprojects/=
qemu-common/include',
>> +  language: ['c', 'cpp', 'objc'],
>> +)
>> +
>>  if get_option('iasl') =3D=3D ''
>>    iasl =3D find_program('iasl', required: false)
>>  else
>> @@ -1577,6 +1581,9 @@ if libbpf.found() and not cc.links('''
>>    endif
>>  endif
>>
>> +qemu_common =3D subproject('qemu-common')
>> +qemu_common =3D qemu_common.get_variable('qemu_common_dep')
>> +
>>  #################
>>  # config-host.h #
>>  #################
>> @@ -3052,7 +3059,7 @@ util_ss.add_all(trace_ss)
>>  util_ss =3D util_ss.apply(config_all, strict: false)
>>  libqemuutil =3D static_library('qemuutil',
>>                               sources: util_ss.sources() + stub_ss.sourc=
es() + genh,
>> -                             dependencies: [util_ss.dependencies(), lib=
m, threads, glib, socket, malloc, pixman])
>> +                             dependencies: [util_ss.dependencies(), lib=
m, threads, glib, socket, malloc, pixman, qemu_common])
>>  qemuutil =3D declare_dependency(link_with: libqemuutil,
>>                                sources: genh + version_res,
>>                                dependencies: [event_loop_base])
>> diff --git a/include/qemu/help-texts.h b/subprojects/qemu-common/include=
/qemu/help-texts.h
>> similarity index 100%
>> rename from include/qemu/help-texts.h
>> rename to subprojects/qemu-common/include/qemu/help-texts.h
>> diff --git a/linux-user/meson.build b/linux-user/meson.build
>> index de4320af053c..fc6cdb55d657 100644
>> --- a/linux-user/meson.build
>> +++ b/linux-user/meson.build
>> @@ -7,7 +7,7 @@ linux_user_ss =3D ss.source_set()
>>  common_user_inc +=3D include_directories('include/host/' / host_arch)
>>  common_user_inc +=3D include_directories('include')
>>
>> -linux_user_ss.add(files(
>> +linux_user_ss.add([files(
>>    'elfload.c',
>>    'exit.c',
>>    'fd-trans.c',
>> @@ -20,7 +20,7 @@ linux_user_ss.add(files(
>>    'thunk.c',
>>    'uaccess.c',
>>    'uname.c',
>> -))
>> +), qemu_common])
>
>
> Question: Why does linux-user need these, but bsd-user does not?
>

Indeed, it's not needed anymore, thanks!


